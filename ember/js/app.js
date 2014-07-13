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
    var completions = this.get('passingCompletions');
    var interceptions = this.get('interceptions')
    var passingYards = this.get('passingYards');
    var passingTds = this.get('passingTds');
    var rushingYards = this.get('rushingYards');
    var receivingYards = this.get('receivingYards')
    var touchdowns = this.get('rushingTds') + this.get('receivingTds');
    var receptions = this.get('receivingReceptions');
    var fumbles = this.get('fumbles');

    var total = (completions * 0.25) + (passingYards / 25) + (interceptions * -2) +
                (rushingYards / 10) + (receivingYards / 10) + (touchdowns * 6) +
                (receptions * 0.5) + (passingTds * 4) + (fumbles * -2)

    return (Math.round(total*100)/100);
  }.property()
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
