post = ->
  if $('#posts-form').length > 0 
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