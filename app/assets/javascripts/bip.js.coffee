bip = ->
  if $('#best-in-place-container').length > 0
    $(".best_in_place").best_in_place()
    $('span[data-bip-attribute]').each ->
      $(this).attr('title', $(this).attr('data-title'))
      return
  return

$(document).ready(bip)
$(document).on('page:load', bip)