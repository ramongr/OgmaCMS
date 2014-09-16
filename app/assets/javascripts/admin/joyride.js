$(document).ready(function(){
  var username = $.cookie('user_name');
  var page_id = $('body').attr('id');
  var cookie_id = username +'_'+ page_id;
  
  if($.cookie(cookie_id) === null)
  { 
    //Expires in 10000 days
    $.cookie(cookie_id, '1', { expires: 10000 });
  }
  else
  {
  	$('#joyride-content').remove();
  }
});


