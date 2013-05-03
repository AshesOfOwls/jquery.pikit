#  Project: jQuery.Picholder
#  Description: Generate placement image for your website through many different placeholder services.
#  Author: Scott Elwood
#  Maintained By: We the Media, inc.
#  License: MIT

(($, window, document) ->
  pluginName = "picholder"
  defaults =
    service: 'placeboxes'

    # Formatting
    height: 200
    width: 400
    format: 'jpg'
    sizeKeyword: null

    # Colors
    greyscale: false
    backColor: null
    foreColor: null

    # Customize
    customText: null

    # Specify
    category: null
    variant: null

  class Plugin
    constructor: (@element, options) ->
      @options = $.extend {}, defaults, options
      @$container = $(element)

      @services =
        dummyimage: 
          url: 'dummyimage.com/g/widthxheight/backColor/foreColor.format&text=customText'
          greyscale: '/g'
          sizeKeyword: '/widthxheight'
          backColor: '/backColor'
          foreColor: '/foreColor'
          format: '.format'
          customText: '&text=customText'

        fpoimg:
          url: 'fpoimg.com/widthxheight?&bg_color=backColor&text_color=foreColor&text=customText'
          backColor: '&bg_color=backColor'
          foreColor: '&text_color=foreColor'
          customText: '&text=customText'

        instasrc:
          url: 'instasrc.com/width/height/category/greyscale'
          category: '/category'
          greyscale: '/greyscale'

        lorempixel: 
          url: 'lorempixel.com/g/width/height/category/variant'
          category: '/category'
          greyscale: '/g'
          variant: '/variant'

        nosrc:
          url: 'nosrc.net/widthxheight'

        placeboxes: 
          url: 'placebox.es/width/height/backColor/foreColor/customText'
          backColor: '/backColor'
          foreColor: '/foreColor'
          customText: '/customText'

        placedog: 
          url: 'placedog.com/g/width/height'
          greyscale: '/g'

        placeholdit: 
          url: 'placehold.it/widthxheight/backColor/foreColor.format&text=customText'
          backColor: '/backColor'
          foreColor: '/foreColor'
          format: '.format'
          customText: '&text=customText'

        placekitten: 
          url: 'placekitten.com/g/width/height'
          greyscale: '/g'

        placesheen: 
          url: 'placesheen.com/width/height'

        placezombies: 
          url: 'placezombies.com/g/widthxheight'
          greyscale: '/g'

        placepuppy: 
          url: 'placepuppy.it/width/height'

        nicenicejpg: 
          url: 'nicenicejpg.com/width/height'

      @parseOptions()
      @create()

    parseOptions: ->
      service = @options.service
      height = @options.height
      width = @options.width

      unless height >= 1
        @options.height = @$container.height()
      unless width >= 1
        @options.width = @$container.width()


    create: ->
      url = @generateUrl()
      $img = $('<img src="'+url+'" />')
      @$container.append($img)

    generateUrl: ->
      # Get the current placeholder service
      service = @options.service
      service_data = @services[service]

      # initialize the url
      url = 'http://' + service_data.url

      # Set dimensions
      if @options.sizeKeyword and service_data.sizeKeyword
        url = url.replace(/width[x,\/]height/, @options.sizeKeyword)
      else
        url = url.replace('height', @options.height)
        url = url.replace('width', @options.width)

      # Grayscale
      if service_data.greyscale
        if !@options.greyscale
          url = url.replace(service_data.greyscale, '')


      # Go over replacable attributes that have custom data
      replacable_attrs = ['backColor', 'foreColor', 'format',
                          'customText', 'category', 'variant']

      for i in [0...replacable_attrs.length]
        attribute = replacable_attrs[i]

        if service_data[attribute]
          if @options[attribute]
            url = url.replace(attribute, @options[attribute])
          else
            url = url.replace(service_data[attribute], '')

      return url 


  $.fn[pluginName] = (options) ->
    @each ->
      $.data(@, "plugin_#{pluginName}", new Plugin(@, options))

)(jQuery, window, document)