/*
  *
  * TODO: add your code here!
  *
*/
$( document ).ready(function(){

  $('#message').hide();
  $('#message').delay(200).slideDown(200);
  //$('#message-wrapper').animate({top: "-45px"}, "fast");
  });

 $('#message-wrapper').click(function(){
    $("#message").slideUp(100);
  });

  $('#message-wrapper').mouseleave(function(){
        $("#message").fadeOut();
    });

  $('#message-wrapper').mouseenter(function(){
        $("#message").fadeIn();
  });
