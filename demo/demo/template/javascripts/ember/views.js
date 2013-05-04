Demo.ApplicationView = Ember.View.extend({
  templateName: 'layouts/application'
});

Demo.SimpleView = Ember.View.extend({
  templateName: 'examples/simple/index',
  didInsertElement: function() {
    $(".pikit-container").children().pikit({
      service: 'random',
      height: 100,
      width: 100
    });
  }
});
