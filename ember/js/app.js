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
  projections: DS.hasMany('projection'),
});

App.Projection = DS.Model.extend({
  player: DS.belongsTo('player'),
  passingCompletions: DS.attr('number'),
  passingAttempts: DS.attr('number'),
  passingYards: DS.attr('number'),
  passingTds: DS.attr('number'),
  interceptions: DS.attr('number'),
  rushingAttempts: DS.attr('number'),
  rushingYards: DS.attr('number'),
  rushingTds: DS.attr('number'),
  receivingYards: DS.attr('number'),
  receivingReceptions: DS.attr('number'),
  receivingTds: DS.attr('number'),
  fumbles: DS.attr('number')
});

App.PlayersRoute = Ember.Route.extend({
  model: function() {
    return this.store.findAll('player');
  }
});

App.PlayersController = Ember.ArrayController.extend({
  itemController: 'player'
});

App.PlayerController = Ember.ObjectController.extend({
  rushingYards: function(){
    debugger;
  }.property('projections.@each')
});
