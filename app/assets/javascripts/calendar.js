$(document).ready(function(){

  var dialog, form,
  title = $( "#title" ),
  body = $( "#body" ),
  sTime, eTime;



  dialog = $( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 300,
    width: 350,
    modal: true,
    buttons: {
      "Create Event": addEvent,
      Cancel: function() {
        dialog.dialog( "close" );
      }
    },
    close: function() {
      form[ 0 ].reset();
    }
  });
  form = dialog.find( "form" ).on( "submit", function( event ) {
    event.preventDefault();
    addEvent();
  });





  function addEvent() {
    var s_title = title.val();
    var s_body = body.val();
    var start = sTime;
    var end = eTime;
        
    if(s_title)
    {
      // if multiple days are selected, the end hour needs to be changed (default = 00h) or the full calendar won't include the last day
      var multipleDays = start.getDate() != end.getDate()

      // Format for rails compatibility
      //2014-08-07 22:17:18.530962
      var sDateString = '' + start.getFullYear() + '-' + (start.getMonth()+1) + '-' + start.getDate() + ' ' + start.getHours() + ':' + start.getMinutes() + ':' + start.getSeconds() + '.' + start.getMilliseconds();

      var eDateString = '' + end.getFullYear() + '-' + (end.getMonth()+1) + '-' + end.getDate() + ' ' + ( (multipleDays) ? end.getHours()+1 : end.getHours() ) + ':' + end.getMinutes() + ':' + end.getSeconds() + '.' + end.getMilliseconds();

      /**
       * ajax call to store event in DB
       */
      deferred = jQuery.post(
          "admin/events.json" // your url
          , 
          { // re-use event's data
            event:
            {
              title: s_title,
              body: s_body,
              start_time: sDateString,
              end_time: eDateString,
              all_day: e_all_day
            }
              
          } 
      );

      deferred.success(function (object) {
        dialog.dialog( "close" );
        var eventData =
        {
          id: object.id,
          title: s_title,
          start: start,
          end: end,
          allDay: e_all_day
        };
        $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
      });
      
      deferred.error(function (object) {
        dialog.dialog( "close" );
        alert("Error Adding Event");
      });

    }
    else
    {
      $( "#alert-miss" ).text("- Title Required!");
    }

    $('#calendar').fullCalendar('unselect');


  }


  function updateEvent(event, delta) {

    var start = event.start;
    var end = event.start;
    if(event.end)
    {
      end = event.end;
    }

    var eventData;    
    eventData =
    {
      title: event.title,
      start: start,
      end: end,
      allDay: event.allDay
    };

    // if multiple days are selected, the end hour needs to be changed (default = 00h) or the full calendar won't include the last day
    var multipleDays = start.getDate() != end.getDate()

    // Format for rails compatibility
    //2014-08-07 22:17:18.530962
    var sDateString = '' + start.getFullYear() + '-' + (start.getMonth()+1) + '-' + start.getDate() + ' ' + start.getHours() + ':' + start.getMinutes() + ':' + start.getSeconds() + '.' + start.getMilliseconds();

    var eDateString = '' + end.getFullYear() + '-' + (end.getMonth()+1) + '-' + end.getDate() + ' ' + ( (multipleDays) ? end.getHours()+1 : end.getHours() ) + ':' + end.getMinutes() + ':' + end.getSeconds() + '.' + end.getMilliseconds();

    /**
     * ajax call to store event in DB
     */
    deferred = $.ajax({
          url: "admin/events/"+event.id ,
          type: 'PUT',    
          data: {
          event:
          {
            start_time: sDateString,
            end_time: eDateString,
            all_day: event.allDay
          }    
        },
        dataType: 'json'
    });

    $('#calendar').fullCalendar('unselect');
  }
  


  // page is now ready, initialize the calendar...
  $('#calendar').fullCalendar(

  ($('#admin-flag').length) ?
  {
    theme: false,
    header: {
      left: 'prev,next today',
       center: 'title',
       right: 'month,agendaWeek,agendaDay'
    },
    allDaySlot: true,
    selectable: true,
    selectHelper: true,
    editable: true,
    droppable: true,
    firstDay: 0,
    timeFormat: 'HH:mm', // uppercase H for 24-hour clock

    select: function(start, end, allDay) {

      // store start and end time to process after the dialog form
      sTime = start;
      eTime = end;
      e_all_day = allDay;
      dialog.dialog( "open" );

    },

    
    // To drag events if needed
    eventDrop: function(event, delta, revertFunc) {
        if (!confirm("Are you sure about this change?")) {
            revertFunc();
        }
        else
        {
          updateEvent(event,delta);
        }
    },
    eventResize: function(event, delta, revertFunc) {
        if (!confirm("Are you sure about this change?")) {
            revertFunc();
        }
        else
        {
          updateEvent(event,delta);
        }
    },

    events: '/admin/events.json'
  }
  :
  {
    theme: false,
    header: {
      left: 'prev,next today',
       center: 'title',
       right: 'month,agendaWeek,agendaDay'
    },
    firstDay: 0,
    timeFormat: 'HH:mm', // uppercase H for 24-hour clock

    events: '/events.json'
  }
  );

});
