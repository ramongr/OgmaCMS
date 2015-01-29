events = ->
  $("#toggle_time[type=checkbox]").change ->
    $('#event-end-time').toggleClass('end-time-hide')

  $("#edpstart").fdatepicker(
      format: 'dd-mm-yyyy'
    ).on "changeDate", ->
    $("#start_date").val $("#edpstart").data("date")
    $("#edpstart").fdatepicker "hide"

  $("#edpend").fdatepicker(
      format: 'dd-mm-yyyy'
    ).on "changeDate", ->
    $("#end_date").val $("#edpend").data("date")
    $("#edpend").fdatepicker "hide"

  return

$(document).ready(events)
$(document).on('page:load', events)

# Advanced search show/hide
$(document).on "click", "#toggle_asearch", ->
  $('#advanced_search').toggle()
  if $(this).is(":visible")
    $('#advanced_search input').val('');
  return

# if history and history.pushState
#   $ ->
#     # Search history
#     $("#events_search").submit ->
#       history.pushState(null, "", $("#events_search").attr("action") + "?" + $("#events_search").serialize());
#       return

#     # Pagination history
#     $("#events_pagination").submit ->
#       history.pushState(null, "", $("#events_pagination").attr("action") + "?" + $("#events_pagination").serialize());
#       return

#     # Column ordering history
#     $(document).on "click", "#admin_events_index th a", ->
#       history.pushState(null, "", this.href)
#       return

#     $(window).bind "popstate", ->
#       $.getScript location.href
#       return

#     return