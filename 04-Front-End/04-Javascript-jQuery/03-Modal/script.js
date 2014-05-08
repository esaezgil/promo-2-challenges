$( document ).ready(function(){

  $('img').click(function(){
   if ($(this).hasClass("img-small")) {
      if ($('body').find(".modal").length == 0) {
        $('body').append($("<div>", {class: "modal"}));
      }
      var $clone = $(this).clone();
      $(this).fadeOut;
      $('.modal').append($clone.removeClass("img-small").addClass("img-big"));
    }
    if ($('body').find(".backboard").length == 0) {
        $('body').append($("<div>", {class: "backboard"}));
      }
    $('.modal').on('click',function() {
        $('.modal').fadeOut().remove();
        $(this).fadeOut().remove();
        $('.backboard').remove();
    });
  });


});