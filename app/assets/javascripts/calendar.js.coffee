$(document).ready ->
  $('#event-end-time').hide()

  $('#event-all-day').on 'click', ->
    $('#event-end-time').toggle(250)
    return

  if $('#calendar-container').length > 0
    if $('#event-modal-container').length > 0
      $('#calendar-content').fullCalendar
        theme: false
        header:
          left: 'prev,next today'
          center: 'title'
          right: 'month,agendaWeek,agendaDay'
        allDaySlot: true
        selectable: true
        selectHelper: true
        editable: true
        droppable: true
        firstDay: 0
        timeFormat: 'HH:mm'
        events: 'admin/events.json'
        select: (start, end, allDay) ->
          $('#event-start-time > select:eq(0)').val(start.date())
          $('#event-start-time > select:eq(1)').val(start.month()+1)
          $('#event-start-time > select:eq(2)').val(start.year())
          $('#event-modal-container').foundation('reveal', 'open')
          return
        eventDrop: (event, delta, revertFunc) ->
          return
        eventResize: (event, delta, revertFunc) ->
          return
    else
      $('#calendar-content').fullCalendar
        theme: false
        header:
          left: 'prev,next today'
          center: 'title'
          right: 'month,agendaWeek,agendaDay'
        allDaySlot: true
        selectable: true
        selectHelper: true
        editable: true
        droppable: true
        firstDay: 0
        timeFormat: 'HH:mm'
        events: 'admin/events.json'
  return

