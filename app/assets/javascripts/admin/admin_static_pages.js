$(document).ready(function(){

  if ($('#static_pages').length) {

    var dialog, editorLangSelected, image_data;
 
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
 

    $('[id^=insert-attachment]').on( "click", function() {
      dialog.dialog( "open" );
      var myId = $(this).attr("id");
      editorLangSelected = myId.split("-")[2];
      return false;
    });

    $( "#selectable" ).selectable({
      stop: function() {
        $( ".ui-selected", this ).each(function() {

          var attachment_name = ( $(this).text());
          var attachment_link = ( $(this).data("attachment-link"));
          var attachment_type = ( $(this).data("attachment-type"));

          var html_string;

          if(attachment_type.indexOf("image") > -1)
          {
            html_string = '<img alt="default" src='+attachment_link+'>';
          }
          else
          {
            html_string = '<a href='+attachment_link+'>'+attachment_name+'</a>';
          }

          CKEDITOR.instances["static_page_body_"+editorLangSelected].insertHtml(html_string);

          dialog.dialog( "close" );
        });
      }
    });
  }
});


