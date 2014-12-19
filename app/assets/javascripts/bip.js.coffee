bip = ->
  if $('#best-in-place-container').length > 0
    $(".best_in_place").best_in_place()
    $('span[data-bip-attribute]').each ->
      $(this).attr('title', $(this).attr('data-title'))
      return
    $('#ckeditor-content').on 'click', ->
      $('#ckeditor-saver').show()
      return

    $('#ckeditor-saver').on 'click', ->
      console.log $(this)
      return
  return

$(document).ready(bip)
$(document).on('page:load', bip)