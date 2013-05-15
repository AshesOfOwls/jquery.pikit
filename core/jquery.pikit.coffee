#  Project: jQuery.pikit
#  Description: Generate placement image for your website through many different placeholder services.
#  Author: Scott Elwood
#  Maintained By: We the Media, inc.
#  License: MIT

(($, window, document) ->
  pluginName = "pikit"
  defaults =
    service: 'random'

    # Formatting
    height: null
    width: null
    format: null
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

        dummyimages: 
          url: 'dummyimages.com/widthxheight/backColor/foreColor.format&text=customText'
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

        ipsumimage:
          url: 'ipsumimage.com/widthxheight?&l=customText&f=foreColor&b=backColor&t=format'
          customText: '&l=customText'
          backColor: '&b=backColor'
          foreColor: '&f=foreColor'
          format: '&f=format'

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

        placeholdus: 
          url: 'placehold.it/widthxheight'

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
      # Determine Service
      if @options.service is 'random'
        services = Object.keys(@services)
        @options.service = services[Math.floor(Math.random()*services.length)]

      # Height Dimensions
      if $.isArray(@options.height)
        # Random height between two values
        random_height = Math.floor(Math.random() * (@options.height[0] - @options.height[1] + 1)) + @options.height[1]
        @options.height = random_height
      else if @options.height is null
        # Inherit height
        @options.height = @$container.height()

      # Width Dimensions
      if $.isArray(@options.width)
        # Random height between two values
        random_width = Math.floor(Math.random() * (@options.width[0] - @options.width[1] + 1)) + @options.width[1]
        @options.width = random_width
      else if @options.width is null
        # Inherit width
        @options.width = @$container.width()

      # Colors
      if $.inArray(@options.backColor, ['random', 'pastel', 'dark']) >= 0
        @options.backColor = @randomHex(@options.backColor)
      if $.inArray(@options.foreColor, ['random', 'pastel', 'dark']) >= 0
        @options.foreColor = @randomHex(@options.foreColor)

    create: ->
      # Remove old instances
      @$container.find("img.pikit").remove()

      # Create new pikit
      $img = $('<img class="pikit" src="'+@generateUrl()+'" />')  
      @$container.height(@options.height).width(@options.width)
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

    randomHex: (type) ->
      if type is 'pastel'
        letters = 'ABCDE'.split('')
      else if type is 'dark'
        letters = '1234567'.split('')
      else
        letters = '0123456789ABCDEF'.split('')

      color = ''
      for i in [0...6]
        color += letters[Math.floor(Math.random() * letters.length)]
      color

  $.fn[pluginName] = (options) ->
    @each ->
      $.data(@, "plugin_#{pluginName}", new Plugin(@, options))

)(jQuery, window, document)