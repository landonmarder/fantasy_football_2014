// in order to see the app running inside the QUnit runner
App.rootElement = '#ember-testing';

// Common test setup
App.setupForTesting();
App.injectTestHelpers();

// common QUnit module declaration
module("Integration tests", {
  setup: function() {
    // before each test, ensure the application is ready to run.
    Ember.run(App, App.advanceReadiness);
  },

  teardown: function() {
    // reset the application state between each test
    App.reset();
  }
});

// QUnit test case
test("Player projections should be on the players page", function() {
  // async helper telling the application to go to the '/' route
  visit("/players");

  // helper waiting the application is idle before running the callback
  andThen(function() {
    equal(find("tbody tr").length, 4, "The four sample players are loaded");
  });
});

test("You can visit the about page", function() {
  visit('/');
  click('a:contains("About")')

  andThen(function(){
    equal(find('h2').text(), 'About', 'Navigate to about page from nav')
  })
})
