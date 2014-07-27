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
  points: points,
  fumblesValue: Ember.computed.alias('points.fumbles'),
  totalPoints: function() {
    var fumblesValue = this.get('points.fumbles');
    var passingCompletionsValue = this.get('points.passingCompletions');
    var passingYardsValue = this.get('points.passingYards');
    var interceptionsValue = this.get('points.interceptions');
    var rushingYardsValue = this.get('points.rushingYards');
    var receivingYardsValue = this.get('points.receivingYards');
    var rushingTdsValue = this.get('points.rushingTds');
    var receivingTdsValue = this.get('points.receivingTds');
    var receptionsValue = this.get('points.receptions');
    var passingTdsValue = this.get('points.passingTds');

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
  }.property('points.fumbles','points.passingCompletions', 'points.passingYards', 'points.interceptions',
    'points.rushingYards', 'points.receivingYards', 'points.rushingTds', 'points.receivingTds', 'points.receptions',
    'points.passingTds','passingCompletions', 'interceptions', 'passingYards', 'passingTds',
    'rushingYards', 'receivingYards', 'rushingTds', 'receivingTds', 'receivingReceptions', 'fumbles')

});

App.PlayersRoute = Ember.Route.extend({
  model: function() {
    return this.store.findAll('player');
  }
});

App.PlayersController = Ember.ArrayController.extend({
  sortAscending: false,

  sortProperties: ['totalPoints'],

  itemController: 'player'
});

App.PlayerController = Ember.ObjectController.extend({

});
