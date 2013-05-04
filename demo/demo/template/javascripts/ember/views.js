Demo.ApplicationView = Ember.View.extend({
  templateName: 'layouts/application'
});

Demo.SimpleView = Ember.View.extend({
  templateName: 'examples/simple/index',
  didInsertElement: function() {
    $(".container").children().pikit();
  }
});
