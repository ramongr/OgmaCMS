events = ->
  $("#toggle_time[type=checkbox]").change ->
    $('#event-end-time').toggleClass('end-time-hide')
  return

$(document).ready(events)
$(document).on('page:load', events)

# Ordering columns
$(document).on "click", "#admin_events_index th a", ->
  $.getScript @href
  return false

# Advanced search show/hide
$(document).on "click", "#toggle_asearch", ->
  $('#advanced_search').toggle()
  if $(this).is(":visible")
    $('#advanced_search input').val('');
  return

# Ajax search on submit
$("#events_search").submit ->
  $.get @action, $(this).serialize(), null, "script"
  false