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

if history and history.pushState
  $ ->
    $("#events_search").submit ->
      history.pushState(null, "", $("#events_search").attr("action") + "?" + $("#events_search").serialize());
      return

    $("#events_pagination").submit ->
      history.pushState(null, "", $("#events_pagination").attr("action") + "?" + $("#events_pagination").serialize());
      return

    $(document).on "click", "#admin_events_index th a", ->
      history.pushState(null, "", this.href)
      return

    $(window).bind "popstate", ->
      $.getScript location.href
      return

    return