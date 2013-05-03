#  Project: jQuery.Picholder
#  Description: Generate placement image for your website through many different placeholder services.
#  Author: Scott Elwood
#  Maintained By: We the Media, inc.
#  License: MIT

(($, window, document) ->
  pluginName = "picholder"
  defaults =
    service: 'fpoimg'

    height: 200
    width: 400
    image_size_keyword: null 

    greyscale: false
    image_format: 'jpg'
    text: null
    text_color: null
    background_color: null
    category: null
    variant: 1

  class Plugin
    constructor: (@element, options) ->
      @options = $.extend {}, defaults, options
      @$container = $(element)

      @parseOptions()
      @init()

    parseOptions: ->
      height = @options.height
      width = @options.width

      unless height >= 1
        @options.height = @$container.height()
      unless width >= 1
        @options.width = @$container.width()

    init: ->
      url = @generateUrl()
      $img = $('<img src="'+url+'" />')
      @$container.append($img)

    generateUrl: ->
      service = @options.service
      height = @options.height
      width = @options.width

      greyscale = @options.greyscale
      category = @options.category
      image_format = @options.image_format
      text = @options.text
      text_color = @options.text_color
      background_color = @options.background_color
      variant = @options.variant
      image_size_keyword = @options.image_size_keyword

      url = 'http://www.'

      switch service
        when 'placehold.it'
          url += 'placehold.it/'+width+'x'+height

          if background_color then url += '/' + background_color
          if text_color then url += '/' + text_color
          url += image_format
          if text then url += '&text='+text

        when 'placekitten'
          url += 'placekitten.com/'

          if greyscale then url += 'g/'
          url += width+'/'+height

        when 'placesheen'
          url += 'placesheen.com/'+width+'/'+height

        when 'lorempixel'
          url += 'lorempixel.com/'

          if greyscale then url += 'g/'
          url += width+'/'+height
          if category then url += '/' + category
          if variant then url += '/' + variant
          if text then url += '/'+text

        when 'placedog'
          url += 'placedog.com/'

          if greyscale then url += 'g/'
          url += width+'/'+height

        when 'dummyimage'
          url += 'dummyimage.com/'

          if image_size_keyword
            url += image_size_keyword
          else
            url += width+'x'+height
          if background_color then url += '/' + background_color
          if text_color then url += '/' + text_color
          url += image_format
          if text then url += '&text='+text

        when 'instasrc'
          url += 'instasrc.com/'
          url += width+'/'+height
          if category then url += '/' + category
          if greyscale then url += '/greyscale'

        when 'nosrc'
          url += 'nosrc.net/'
          url += width+'x'+height

        when 'fpoimg'
          url += 'fpoimg.com/'
          url += width+'x'+height+'?'
          if text then url += '&text='+text
          if background_color then url += '&bg_color=' + background_color
          if text_color then url += '&text_color=' + text_color

      return url 


  $.fn[pluginName] = (options) ->
    @each ->
      $.data(@, "plugin_#{pluginName}", new Plugin(@, options))

)(jQuery, window, document)