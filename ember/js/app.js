App = Ember.Application.create();
App.ApplicationAdapter = DS.FixtureAdapter.extend();

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

App.Player.FIXTURES = [
  {
    id: 1,
    name: 'Peyton Manning',
    team: 'Den',
    position: 'QB',
    portrait: 'http://a.espncdn.com/combiner/i?img=/i/headshots/nfl/players/full/1428.png&w=35&h=48&scale=crop&background=0xcccccc&transparent=false'
  },
  {
    id: 2,
    name: 'Matt Forte',
    team: 'Chi',
    position: 'RB',
    portrait: 'http://a.espncdn.com/combiner/i?img=/i/headshots/nfl/players/full/11278.png&w=35&h=48&scale=crop&background=0xcccccc&transparent=false'
  },
  {
    id: 3,
    name: 'Adrian Peterson',
    team: 'Min',
    position: 'RB',
    portrait: 'http://a.espncdn.com/combiner/i?img=/i/headshots/nfl/players/full/10452.png&w=35&h=48&scale=crop&background=0xcccccc&transparent=false'
  },
  {
    id: 4,
    name: 'Calvin Johnson',
    team: 'Det',
    position: 'WR',
    portrait: 'http://a.espncdn.com/combiner/i?img=/i/headshots/nfl/players/full/10447.png&w=35&h=48&scale=crop&background=0xcccccc&transparent=false'
  }
]
