#Datepicker

datepicker = ->
  $("[id=datepicker]").fdatepicker format: "yyyy/mm/dd"
  return true

$(document).ready(datepicker)
$(document).on('page:load', datepicker)