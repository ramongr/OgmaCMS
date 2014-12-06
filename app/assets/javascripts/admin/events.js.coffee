events = ->
  $("#toggle_time[type=checkbox]").change ->
    $('#event-end-time').toggleClass('end-time-hide')
  return

$(document).ready(events)
$(document).on('page:load', events)

# Order, Pagination
$(document).on "click", "#admin_events_index th a, #admin_events_index .pagination a", ->
  $.getScript @href
  return false