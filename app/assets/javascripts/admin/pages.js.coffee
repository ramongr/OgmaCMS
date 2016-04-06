page = ->
  if $('#pages-form').length > 0
    $(".best_in_place").best_in_place()
    # Selects the first non-null tab from attachments
    $('#modal-tab').addClass('active')
    # Selects corresponding div
    $('#modal-tab-container > div#'+$('#modal-tab').attr('data-id')).addClass('active')
    
    lang = $('li#lang-tab').filter('.active').attr('data-lang') || $('#page-container').attr('data-lang')
    dataAssigner(lang)
    $('li#lang-tab').on 'click', ->
      dataAssigner($(this).attr('data-lang'))
      return

dataAssigner = (lang) ->
  if $('#pages-form').length > 0 
    $('#joyride-defs > li').each ->
      $(this).attr 'data-id', 'page-' + $(this).attr('id') + '-' + lang
      return
    return

$(document).ready(page)
$(document).on('page:load',page)