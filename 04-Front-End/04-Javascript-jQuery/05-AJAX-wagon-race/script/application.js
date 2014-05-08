var createStartButton = function(div) {
  $('<button name="button" type="submit">Start a Game</button>').appendTo($(div)).addClass('startButton');
};

var playerFormCreator = function(div) {
  $('<form role="form">').appendTo('body').addClass('player_form');

  $('<div>').appendTo($('form'))
                              .append("<label for='player_one'>Player 1</label>")
                              .append($('<input type="text" class="form-control" name="name" id="player_one" placeholder="player_one">'))
  $('<div>').appendTo($('form'))
                              .append("<label for='player_two'>Player 2</label>")
                              .append($('<input type="text" class="form-control" name="name" id="player_two" placeholder="player_two">'))
};

var createRestartButton = function(div) {
  $('<button name="button">Restart</button>').appendTo($(div)).addClass('restartButton');
  $('.restartButton').click(function(){
    $('.active').removeClass('active');
    $("#player1_race td:eq("+0+")").addClass('active');
    $("#player2_race td:eq("+0+")").addClass('active');
    $('<button>').fadeOut();
    $('div.wrapper').fadeOut().remove();
    theGame()
  })
};

var theGame = function(session) {
  var winner;
  var game = true;
  var time_start = jQuery.now();
  $(document).on('keyup', function(event) {
    // Detect which key was pressed and call the appropriate function
    // Google "jquery keyup what key was pressed" if you don't know how
    var code = event.keyCode;

    if (code == 81 && game) {
      var $player = $('#player1_race td.active');
      var position = $('#player1_race td.active').index() + 1;
      $player.removeClass('active');
      $("#player1_race td:eq("+position+")").addClass('active').fadeIn();
    }
    else if (code == 65 && game) {
      var $player = $('#player2_race td.active');
      var position = $('#player2_race td.active').index() + 1;
      $player.removeClass('active');
      $("#player2_race td:eq("+position+")").addClass('active').fadeIn();
    };

    if ($('#player1_race td.finish_line.active').length == 1) {
      $('<div>').appendTo($('body')).addClass("wrapper");
      $('.wrapper').addClass("hulkHogan");
      $('<div>').appendTo($('.hulkHogan')).addClass('message_wrapper');
      $('<h1>Player 1 wins!!!</h1>').appendTo($('.message_wrapper'));
      createRestartButton($('.message_wrapper'));
      game = false
      winner = 1;
      var time_end = jQuery.now();

    }
    else if ($('#player2_race td.finish_line.active').length == 1) {
      $('<div>').appendTo($('body')).addClass("wrapper");
      $('.wrapper').addClass("hulkHogan");
      $('<div>').appendTo($('.hulkHogan')).addClass('message_wrapper');
      $('<h1>Player 2 wins!!!</h1>').appendTo($('.message_wrapper'));
      createRestartButton($('.message_wrapper'));
      game = false
      winner = 2;
      var time_end = jQuery.now();
    }

    if (winner > 0) {
      var elapsedTime = (Math.floor(time_end - time_start))/60;
      var winner_object = {"game": {"elapsed_time": elapsedTime, "status":"finished", "winner": winner}}
      console.log(winner_object);

      $.ajax({
        url: "http://wagon-race-api.herokuapp.com/game/session/"+session+"/new",
        type: "POST",
        data: JSON.stringify(winner_object),
        contentType:"application/json",
        success: function(data) {
            $('form').remove().fadeOut(2000);
            $('h2').remove().fadeOut(2000);
            theGame();},
        fail: function() {
            ( "error" );}
      })
      .done( function(data){
        console.log(data);
      });
    }
  });
};

$(document).ready(function() {
  var session = 0
  $.get( "http://wagon-race-api.herokuapp.com/game/session/new", function( data ) {
    $( "h2" ).text("The session number is " + data.session_id);
    session = data.session_id;
    playerFormCreator('body');
    createStartButton('form');
  });

  $(document).on('submit', 'form', function (event) {
    event.preventDefault();
    var players = $(this).serializeArray();
    var players_names = {"players": [ {"name": players[0].value}, {"name": players[1].value}]};
    $.ajax({
      url: "http://wagon-race-api.herokuapp.com/game/session/"+session+"/new",
      type: "POST",
      data: JSON.stringify(players_names),
      contentType:"application/json",
      success: function(data) {
          $('form').remove().fadeOut(2000);
          $('h2').remove().fadeOut(2000);
          theGame(session);},
      fail: function() {
          ( "error" );}
    })
    .done( function(data){
      console.log(data);
    });
  });
});