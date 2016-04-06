calendar = ->
  #
  # Event handler for the webpage
  #
  if $('#calendar-container').length > 0
    $('#event-end-time').hide()

    $('#event-toggle-time').on 'click', ->
      $('#event-end-time').toggle(250)
      return

  #
  # Auxiliary functions for FullCalendar js
  #
  updateEvent = (event, delta) ->
    # The _d method gets the full DateTime value of the date
    start = event.start._d
    end = event.start._d
    end = event.end._d  if event.end
    eventData = undefined
    eventData =
      title: event.title
      start: start
      end: end
    #
    # Ajax call to store event in DB
    #
    deferred = $.ajax(
      url: "admin/events/" + event.id
      type: "PUT"
      data:
        event:
          start_time: start
          end_time: end

      dataType: "json"
    )
    $("#calendar-content").fullCalendar "unselect"
    return

  if $('#calendar-container').length > 0
    if $('#event-modal-container').length > 0
      $('#calendar-content').fullCalendar
        lang: $('#calendar-content').attr('data-lang')
        theme: false
        titleFormat: {
          month: 'MMMM YYYY'
        }
        header:
          left: 'prev,next today'
          center: 'title'
          right: 'month'
        allDaySlot: true
        selectable: true
        selectHelper: true
        editable: true
        droppable: true
        firstDay: 0
        timeFormat: 'HH:mm'
        events: 'admin/events.json'
        select: (start, end) ->
          $('#event-start-time > select:eq(0)').val(start.date())
          $('#event-start-time > select:eq(1)').val(start.month()+1)
          $('#event-start-time > select:eq(2)').val(start.year())
          $('#event-modal-container').foundation('reveal', 'open')
          return
        eventDrop: (event, delta, revertFunc) ->
          unless confirm("Do you really want this?")
            revertFunc()
          else
            updateEvent event, delta
          return
        eventResize: (event, delta, revertFunc) ->
          unless confirm("Do you really want this?")
            revertFunc()
          else
            updateEvent event, delta
          return
    else
      $('#calendar-content').fullCalendar
        lang: $('#calendar-content').attr('data-lang')
        theme: false
        titleFormat: {
          month: 'MMMM YYYY'
        }
        header:
          left: 'prev,next today'
          center: 'title'
          right: 'month,agendaWeek,agendaDay'
        selectable: true
        selectHelper: true
        editable: true
        droppable: true
        firstDay: 0
        timeFormat: 'HH:mm'
        events: 'admin/events.json'
        eventClick: (object)->
          event.preventDefault()
          deferred = $.ajax(
            url: "events/" + object.id
            type: "GET"
            dataType: "script"
          )
          return
  return

$(document).ready(calendar)
$(document).on('page:load', calendar)