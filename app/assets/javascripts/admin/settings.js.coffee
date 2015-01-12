setting = ->
  if $('#settings-container').length > 0
    
    $('img#images').on 'click', ->
      # This handles the image selection
      if $('#logo-container > img').length == 0
        $(this).clone().appendTo('#logo-container')
        $('#site-logo-id').val($(this).attr('data-id'))
      else
        $('#logo-container > img').remove()
        $(this).clone().appendTo('#logo-container')
        $('#site-logo-id').val($(this).attr('data-id'))
      # This helps keep track of which image was selected
      $('.selected').removeClass('selected')
      $(this).parent().addClass('selected')
  return 

$(document).ready(setting)
$(document).on('page:load',setting)