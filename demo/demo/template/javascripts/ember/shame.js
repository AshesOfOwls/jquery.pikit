Em.View.reopen({
  templateForName: function(name, type) {
    if (!name) { return; }

    var templates = Em.get(this, 'templates'),
        template = Em.get(templates, name);

    if (!template) {
      $.ajax({
        url: 'template/javascripts/ember/templates/%@.handlebars'.fmt(name),
        async: false
      }).success(function(data) {
        template = Ember.Handlebars.compile(data);
      });
    }

    if (!template) {
      throw new Em.Error('%@ - Unable to find %@ "%@".'.fmt(this, type, name));
    }

    return template;
  }
});
