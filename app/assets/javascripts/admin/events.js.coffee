events = ->
  $("#event_all_day").change ->
    $("select#time_select").toggle()
    return
  return

$(document).ready(events)
$(document).on('page:load', events)