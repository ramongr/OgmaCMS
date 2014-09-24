$(document).ready(function(){
  var i = 0
  $('#start-time select, #end-time select').each(function(index, value){

    i = index % 5
    
    if( i < 3){
      $(this).addClass('small-4').addClass('columns')
    }else{
      $(this).addClass('small-6').addClass('columns')
    }
  })
})