$(document).ready ->
  $('.carousel').each ->
    options = {}
    options.interval = $(this).data('interval') if $(this).data('interval')
    options.pause = $(this).data('pause') if $(this).data('pause')
    $(this).carousel(options)
  
  play = $('.carousel').find('[data-slide-play="1"]')
  play.hide()

  $('.carousel [data-slide-play]').on
    click: (e) ->
      e.preventDefault()
      if $(this).attr('data-slide-play') is '0'
        pause(this)
      else
        resume(this)

  $('.carousel [data-slide]').on
    click: (e) ->
      pause(this)

  $('.carousel [data-slide-to]').on
    click: (e) ->
      e.preventDefault()
      pause(this)
      select(this)

  $('.carousel').on
    slid: (e) ->
      highlight($(e.target))

pause = (target) ->
  carousel = $($(target).attr('href'))
  carousel.carousel('pause')
  carousel.find('[data-slide-play="1"]').show() # play
  carousel.find('[data-slide-play="0"]').hide() # pause

resume = (target) ->
  carousel = $($(target).attr('href'))
  carousel.carousel('cycle')
  carousel.find('[data-slide-play="1"]').hide() # play
  carousel.find('[data-slide-play="0"]').show() # pause

select = (target) ->
  carousel = $($(target).attr('href'))
  pos = $(target).data('slide-to')
  carousel.carousel(pos)
  
highlight = (carousel) ->
  items = carousel.find('.item')
  item = carousel.find('.item.active')[0]
  which = $.inArray(item, items)

  carousel.find('[data-slide-to]').removeClass('selected')
  $(carousel.find('[data-slide-to]')[which]).addClass('selected')
