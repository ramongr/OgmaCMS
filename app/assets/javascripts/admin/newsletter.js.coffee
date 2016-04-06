newsletter = ->
  if $('#newsletter-form').length > 0
    # Selects the first non-null tab from attachments
    $('#modal-tab').addClass('active')
    # Selects corresponding div
    $('#modal-tab-container > div#'+$('#modal-tab').attr('data-id')).addClass('active')
    
    lang = $('li#lang-tab').filter('.active').attr('data-lang') || $('#newsletter-container').attr('data-lang')
    dataAssigner(lang)
    $('li#lang-tab').on 'click', ->
      dataAssigner($(this).attr('data-lang'))
      return

dataAssigner = (lang) ->
  if $('#newsletter-form').length > 0 
    $('#joyride-defs > li').each ->
      unless $(this).attr('data-id')
        $(this).attr 'data-id', $(this).attr('id') + '-' + lang
      return
    return

$(document).ready(newsletter)
$(document).on('page:load',newsletter)