newsletter = ->
  if $('#newsletter-form').length > 0 
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