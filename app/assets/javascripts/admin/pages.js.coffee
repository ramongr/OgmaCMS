page = ->
  if $('#pages-form').length > 0 
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