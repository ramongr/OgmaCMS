$(document).ready(function(){

  if ($('body.galleries').length || $('body.sliders').length ) {
  
    $("#sortable").sortable();
    $("#sortable").disableSelection();

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


    function remove_image() {
      rem_photo_id = ( $(this).data("photo-id"));
      deferred = jQuery.post(
        "remove_photo"
        , 
        {
            photo_id: rem_photo_id                  
        } 
      ); 

      deferred.success(function (object) {
        alert(rem_photo_id)
        var id =("#"+rem_photo_id);
        $( ("#sortable > "+id) ).remove();
      });

      return false;
    }

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
            rem_button_id = ("remove-image"+object.id);

            var $button = $("<button>", {id: rem_button_id, text: 'Remove Image', class: "ui-state-default small"});
            $button.data('photo-id', object.id); //setter
            $button.click(remove_image);

            $( "#sortable" ).append( '<li class="ui-state-default" id='+object.id+'>'+html_img_string+'</li>');
            $( "#sortable > "+("#"+object.id) ).append($button);
  	      });
  	      
  	      deferred.error(function (object) {
  	        alert("Error Adding Photo");
  	      });

          dialog.dialog( "close" );
        });
      }
    });

    var rem_photo_id;
    $('[id^=remove-image]').button().on( "click", remove_image );

    $('form').submit(function() { 
      var itm_arr = $("#sortable").sortable('toArray');
      var pobj = {photos: itm_arr};
      $.post("reorder", pobj);
      return true;
    });

  }

  

});


