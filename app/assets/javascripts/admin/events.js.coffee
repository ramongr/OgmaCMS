#Hide the time if All Day is checked (useful for Events#edit when All Day is already checked)
$(document).ready ->
  $(".time_select").hide()  if $("#event_all_day").is(":checked")
  return

#Toggle time when All Day is checked/unchecked
$(document).ready ->
  $("#event_all_day").change ->
    $(".time_select").toggle()
    return
  return