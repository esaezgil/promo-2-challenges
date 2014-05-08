var createButton = function(div) {
  $('<button name="button">Restart</button>').appendTo($(div)).addClass('restartButton');
  $('.restartButton').click(function(){
    $('.active').removeClass('active');
    $("#player1_race td:eq("+0+")").addClass('active');
    $("#player2_race td:eq("+0+")").addClass('active');
    $('<button>').fadeOut();
    $('div.wrapper').fadeOut().remove();

  })
};

$(document).ready(function() {

  $(document).on('keyup', function(event) {
    // Detect which key was pressed and call the appropriate function
    // Google "jquery keyup what key was pressed" if you don't know how
    var code = event.keyCode;
    console.log(code);
    if (code == 81) {
      var $player = $('#player1_race td.active');
      var position = $('#player1_race td.active').index() + 1;
      console.log('position');
      $player.removeClass('active');
      $("#player1_race td:eq("+position+")").addClass('active').fadeIn();
    }
    else if (code == 65) {
      var $player = $('#player2_race td.active');
      var position = $('#player2_race td.active').index() + 1;
      console.log('position');
      $player.removeClass('active');
      $("#player2_race td:eq("+position+")").addClass('active').fadeIn();
    };

    if ($('#player1_race td.finish_line.active').length == 1) {
      $('<div>').appendTo($('body')).addClass("wrapper");
      $('.wrapper').addClass("hulkHogan");
      $('<div>').appendTo($('.hulkHogan')).addClass('message_wrapper');
      $('<h1>Player 1 wins!!!</h1>').appendTo($('.message_wrapper'));
      createButton($('.message_wrapper'));

    }
    else if ($('#player2_race td.finish_line.active').length == 1) {
      $('<div>').appendTo($('body')).addClass("wrapper");
      $('.wrapper').addClass("hulkHogan");
      $('<div>').appendTo($('.hulkHogan')).addClass('message_wrapper');
      $('<h1>Player 2 wins!!!</h1>').appendTo($('.message_wrapper'));
      createButton($('.message_wrapper'));
    }

  });
});