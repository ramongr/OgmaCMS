jQuery ->
  $('#items_search').submit ->
    $.get @action, $(this).serialize(), null, 'script'
    false
  $('#items_search input').keyup ->
    $.get $('#items_search').attr('action'), $('#items_search').serialize(), null, 'script'
    false
  return
