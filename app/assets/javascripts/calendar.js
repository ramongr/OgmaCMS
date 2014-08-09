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
    
    var eventData;
    
    if(s_title)
    {
      eventData =
      {
        title: s_title,
        start: start,
        end: end,
        allDay: true
      };
      $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true

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
          "admin/events" // your url
          , 
          { // re-use event's data
            // { event: { title: title, body: "whatever", start_time: start, end_time end } },
            event:
            {
              title: s_title,
              body: s_body,
              start_time: sDateString,
              end_time: eDateString
            }
              
          }
            
      );

      deferred.success(function () {
          dialog.dialog( "close" );
      });

      deferred.error(function () {
          // Handle any errors here.
      });

    }
    else
    {
      $( "#alert-miss" ).text("- Title Required!");
    }

    $('#calendar').fullCalendar('unselect');


    return valid;
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
    selectable: true,
    selectHelper: true,
    editable: true,
    firstDay: 0,
    timeFormat: 'HH:mm', // uppercase H for 24-hour clock

    select: function(start, end, allDay) {

      // store start and end time to process after the dialog form
      sTime = start;
      eTime = end;

      dialog.dialog( "open" );

    },

    /*
    // To drag events if needed
    eventDrop: function(event, delta, revertFunc) {

        alert(event.title + " was dropped on " + event.start.format());

        if (!confirm("Are you sure about this change?")) {
            revertFunc();
        }

    },*/

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
    selectable: true,
    selectHelper: true,
    firstDay: 0,
    timeFormat: 'HH:mm', // uppercase H for 24-hour clock

    events: '/events.json'
  }
  );



});
