events = ->
  $("#toggle_time[type=checkbox]").change ->
    $('#event-end-time').toggleClass('end-time-hide')
  return

$(document).ready(events)
$(document).on('page:load', events)