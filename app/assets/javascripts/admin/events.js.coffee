events = ->
  $("#toggle_time[type=checkbox]").change ->
    $('#event-end-time').toggleClass('end-time-hide')

  #Datepicker
  $("#dp-start input").fdatepicker format: "yyyy/mm/dd"
  $("#dp-end input").fdatepicker format: "yyyy/mm/dd"
  return

$(document).ready(events)
$(document).on('page:load', events)

# Ordering columns
$(document).on "click", "#admin_events_index th a", ->
  $.getScript @href
  return false

# Advanced search Show/Hide
$(document).on "click", "#toggle_asearch", ->
  $('#advanced_search').toggle()
  return

# Ajax search on submit
$("#events_search").submit ->
  $.get @action, $(this).serialize(), null, "script"
  false

# Ajax search on keyup
$('#events_search #search_query').change ->
  $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, 'script')
  false

$('#events_search #search_startdate').change ->
  $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, 'script')
  false

$('#events_search #search_enddate').change ->
  $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, 'script')
  false

$('#events_search #search_created_by').change ->
  $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, 'script')
  false

$('#events_search #search_updated_by').change ->
  $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, 'script')
  false
