App = Ember.Application.create();

App.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api',
  host: 'http://fantasy-football-aggregator.herokuapp.com'
});

App.Router.map(function() {
  this.route('about');
  this.resource('players', function(){
    this.route('show', { path: ':player_id' } )
  })
});

var points = Ember.Object.create({
  passingCompletions: 0.25,
  fumbles: -2,
  passingYards: 0.04,
  interceptions: -2,
  rushingYards: 0.1,
  receivingYards: 0.1,
  rushingTds: 6,
  receivingTds: 6,
  passingTds: 4,
  receptions: 0.5,
  passingTds: 4
});

App.Player = DS.Model.extend({
  name: DS.attr('string'),
  team: DS.attr('string'),
  position: DS.attr('string'),
  passingCompletions: DS.attr('number'),
  passingAttempts: DS.attr('number'),
  passingYards: DS.attr('number'),
  passingTds: DS.attr('number'),
  interceptions: DS.attr('number'),
  rushingYards: DS.attr('number'),
  rushingTds: DS.attr('number'),
  receivingYards: DS.attr('number'),
  receivingReceptions: DS.attr('number'),
  receivingTds: DS.attr('number'),
  fumbles: DS.attr('number'),
  totalPoints: function() {
    debugger;
    var fumblesValue = points.get('fumbles');
    var passingCompletionsValue = points.get('passingCompletions');
    var passingYardsValue = points.get('passingYards');
    var interceptionsValue = points.get('interceptions');
    var rushingYardsValue = points.get('rushingYards');
    var receivingYardsValue = points.get('receivingYards');
    var rushingTdsValue = points.get('rushingTds');
    var receivingTdsValue = points.get('receivingTds');
    var receptionsValue = points.get('receptions');
    var passingTdsValue = points.get('passingTds');

    var completions = this.get('passingCompletions');
    var interceptions = this.get('interceptions')
    var passingYards = this.get('passingYards');
    var passingTds = this.get('passingTds');
    var rushingYards = this.get('rushingYards');
    var receivingYards = this.get('receivingYards')
    var rushingTds = this.get('rushingTds');
    var receivingTds = this.get('receivingTds');
    var receptions = this.get('receivingReceptions');
    var fumbles = this.get('fumbles');

    var total = (completions * passingCompletionsValue) + (passingYards * passingYardsValue) +
                (interceptions * interceptionsValue) + (rushingYards * rushingYardsValue) +
                (receivingYards * receivingYardsValue) + (rushingTds * rushingTdsValue) +
                (receptions * receptionsValue) + (passingTds * passingTdsValue) +
                (fumbles * fumblesValue) + (receivingTds * receivingTdsValue);

    return (Math.round(total*100)/100);
  }.property('passingCompletions', 'interceptions', 'passingYards', 'passingTds', 'rushingYards', 'receivingYards', 'rushingTds', 'receivingTds', 'receivingReceptions', 'fumbles')

});

App.PlayersRoute = Ember.Route.extend({
  model: function() {
    return this.store.findAll('player');
  }
});

App.PlayersController = Ember.ArrayController.extend({
  sortAscending: false,

  sortProperties: ['totalPoints'],

  itemController: 'player',

  offset:0,

  limit: 1,

  arrangedContent: function() {
    var offset = this.get('offset');
    var limit = this.get('limit');

    return this.get('model').slice(offset, offset + limit);
  }.property('model', 'offset', 'limit'),

  hasPreviousPage: function() {
    return this.get('offset') !== 0;
  }.property('offset'),

  hasNextPage: function() {
    var offset = this.get('offset');
    var limit = this.get('limit');
    var length = this.get('model.length');

    return (offset + limit) < length;

  }.property('offset', 'limit', 'model.length'),

  actions: {
    previousPage: function() {
      var limit = this.get('limit');
      this.decrementProperty('offset', limit)
    },

    nextPage: function() {
      var limit = this.get('limit');
      this.incrementProperty('offset', limit)
    }
  }
});

App.PlayerController = Ember.ObjectController.extend({

});
