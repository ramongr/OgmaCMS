jQuery ->
  # Ajax search on submit
  $('#items_search').submit( ->
    $.get(this.action, $(this).serialize(), null, 'script')
    false
  )
  # Ajax search on keyup
  $('#items_search input').keyup( ->
    $.get($("#items_search").attr("action"), $("#items_search").serialize(), null, 'script')
    false
  )

  return