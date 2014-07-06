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
  position: DS.attr('string')
})

App.PlayersRoute = Ember.Route.extend({
  model: function() {
    return this.store.findAll('player');
  }
});
