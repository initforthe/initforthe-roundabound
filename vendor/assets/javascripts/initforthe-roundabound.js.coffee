class InitfortheCarousel
  constructor: (carousel) ->
    @carousel = $(carousel)
    @setup()

  setup: ->
    return if @carousel.data('initforthe-carousel')
    @options = {}
    @options.interval = @carousel.data('interval') if @carousel.data('interval')
    @options.pause = @carousel.data('pause') if @carousel.data('pause')
    @$playButton = @carousel.find('[data-slide-play="1"]')
    @$pauseButton = @carousel.find('[data-slide-play="0"]')
    @$items = @carousel.find('.item')
    @highlight()
    @carousel.carousel(@options)
    @carousel.data('initforthe-carousel', true)
    
    # Hide play button
    play = @carousel.find('[data-slide-play]')
    play.hide() if play.data('slide-play') == 1

    @carousel
      .on 'click', '[data-slide],.carousel [data-slide-play="0"]', (e) =>
        e.preventDefault()
        @pause()
      .on 'click', '[data-slide-play="1"]', (e) =>
        e.preventDefault()
        @resume()
      .on 'click', '[data-slide-to]', (e) =>
        e.preventDefault()
        @slide(e.target)
      .on 'slid', @highlight

  pause: (e) =>
    # can come from:
    # * next/prev buttons
    # * pause button
    @carousel.carousel('pause')
    @$pauseButton.hide()
    @$playButton.show()
 
  resume: (e) =>
    # can only come from play button
    @carousel.carousel('cycle')
    @$playButton.hide()
    @$pauseButton.show()

  slide: (element) =>
    # can only come from slide indicator
    @carousel.carousel('pause')
    # first pause, then select
    @select $(element).data('slide-to')

  select: (position) =>
    @carousel.carousel(position)

  highlight: =>
    which = $.inArray(@$items.filter('.active')[0], @$items)

    dataSlideTo = @carousel.find('[data-slide-to]')

    dataSlideTo.removeClass('selected')
    $(dataSlideTo[which]).addClass('selected')

window.InitfortheCarousel = InitfortheCarousel

$(document).ready ->
  $('.carousel').each ->
    new InitfortheCarousel(this)
