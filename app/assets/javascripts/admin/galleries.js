$(document).ready(function(){

  if ($('body.galleries').length ) {
  
    $("#sortable").sortable();
    $( "#sortable" ).disableSelection();

    var dialog;
 
    dialog = $( "#dialog" ).dialog({
      autoOpen: false,
      height: 300,
      width: 350,
      modal: true,
      buttons: {
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
      }
    });
 

    $( ".attachment-btn" ).button().on( "click", function() {
      dialog.dialog( "open" );
      return false;
    });

    $( "#selectable" ).selectable({
      stop: function() {
        $( ".ui-selected", this ).each(function() {

          var attachment_name = ( $(this).text());
          var attachment_link = ( $(this).data("attachment-link"));
          var attachment_id = ( $(this).data("attachment-id"));

          // Post new object to database
          deferred = jQuery.post(
              "add_photo"
              , 
              {
                  attachment_id: attachment_id                  
              } 
          );

          deferred.success(function (object) {
	        var html_string;
            html_img_string = '<img alt="default" src='+attachment_link+'>';
	        $( "#sortable" ).append( '<li class="ui-state-default">'+html_img_string+'</li>');
	      });
	      
	      deferred.error(function (object) {
	        alert("Error Adding Photo");
	      });

          dialog.dialog( "close" );
        });
      }
    });


    $('form').submit(function() { 
      var itm_arr = $("#sortable").sortable('toArray');
      var pobj = {photos: itm_arr};
      $.post("reorder", pobj);
      return true;
    });

  }

  

});


