post = ->
  if $('#posts-form').length > 0 

    # Selects the first non-null tab from attachments
    $('#modal-tab').addClass('active')
    # Selects corresponding div
    $('#modal-tab-container > div#'+$('#modal-tab').attr('data-id')).addClass('active')
    
    lang = $('li#lang-tab').filter('.active').attr('data-lang')
    dataAssigner(lang)
    $('li#lang-tab').on 'click', ->

      dataAssigner($(this).attr('data-lang'))
      return

dataAssigner = (lang) ->
  $('#joyride-defs > li').each ->
    $(this).attr 'data-id', 'post-' + $(this).attr('id') + '-' + lang
    return
  return

$(document).ready(post)
$(document).on('page:load',post)