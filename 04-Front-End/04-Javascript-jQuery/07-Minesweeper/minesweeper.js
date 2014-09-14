// Good luck!
function constructTable(id, choice) {

  if (choice == "easy") {
      ROWS = COLUMNS = 9
      MINES = 20
    }
    else if (choice == "medium") {
      ROWS = COLUMNS = 11
      MINES = 40
    }

    else if (choice == "hard") {
      ROWS = COLUMNS = 16
      MINES = 70
    }

    $('.game-wrapper').append('<table id='+id+'>');
  var $table = $('#'+id);
  for (i = 0; i < ROWS; i++) {
    $table.append('<tr>')
  }

  $('tr').each( function() {
    for (i=0; i < COLUMNS; i++){
     $('<td>').appendTo($(this)).addClass('unopened');
    }
  })
  mineIt(MINES);
  $('.pregame-wrapper').fadeOut(1000, function (){$('.pregame-wrapper').remove();});
};

function mineIt(mines) {
  var i = 1
  var mines_left = mines
  while (mines_left >= 0) {
    $('tr').each(function(){
      $(this).children().each(function(index){
        $(this).attr('id',i);
        i++
        if (Math.floor((Math.random() * 5) + 1) == 1) {
          $(this).addClass('mine');
          mines_left -= 1;
        }
      })
    })
  }
};

function oneMoreMine(cell_row, cell_column, k, j) {
  $this = $('tr:eq('+cell_row+') td:eq('+cell_column+')')
  for (var i=1; i < 9; i++){
    //console.log($('#'+id).hasClass('mine-neighbour-'+i));
   if ($this.hasClass('mine-neighbour-'+i)) {
       $this.removeClass('mine-neighbour-'+i).addClass('mine-neighbour-'+(i+1));
       break;
   }
   else {
    $this.addClass('mine-neighbour-1');
    break;
   }
 };
}


function checkNeighbour(cell_row, cell_column, x_offSet, y_offSet) {
  var cell_row = cell_row + y_offSet
  var cell_column = cell_column + x_offSet
  $this = $('tr:eq('+cell_row+') td:eq('+cell_column+')')

   if ($this.hasClass('mine')) {
   }
   else if($this.hasClass('unopened') && !$this.hasClass('opened')) {
       $this.removeClass("unopened");
  }
  else if ($this.hasClass('unopened') && $this.hasClass('opened')){
      $this.removeClass('unopened');
      lookDeeper(cell_row, cell_column, 'unopened', checkNeighbour);
  };
}


function lookDeeper(cell_row, cell_column, className, addCallback) {
  var mine = 0;
  for (var j=-1; j < 2; j++) {
    for (var k =-1; k <2; k++) {
      if (cell_row + j >= 0
        && cell_row + j < ROWS
        && cell_column + k >= 0
        && cell_column + k < COLUMNS
        && !(j !=0 && k!= 0)
        && $('tr:eq('+(cell_row+j)+') td:eq('+(cell_column + k)+')').hasClass(className)) {
          addCallback(cell_row, cell_column, k, j);
          mine ++
        }
      }
    }
  if (mine == 0 )  $('tr:eq('+cell_row+') td:eq('+cell_column+')').addClass('opened');
}

function findMine() {

  $('td').each(function(){

    var cell = $(this).closest('td');
    var cell_column = cell[0].cellIndex;

    var row = cell.closest('tr');
    var cell_row = row[0].rowIndex;


    //Add "mine-neighbour class"
    if (!$(this).hasClass('mine')) lookDeeper(cell_row, cell_column, 'mine', oneMoreMine);
  });
}

function openTile() {
  $('td').click(function() {

    var cell = $(this).closest('td');
    var cell_column = cell[0].cellIndex;

    var row = cell.closest('tr');
    var cell_row = row[0].rowIndex;

    if ($(this).hasClass('mine')) {
      $('td').removeClass('unopened');
      alert('Game Over');
    }
    else if (($(this).hasClass('opened') && !$(this).hasClass('unopened')) || $(this).hasClass('flagged')) {
    }
    else if ($(this).hasClass('unopened') && !$(this).hasClass('opened'))
    {
      $(this).removeClass('unopened');
    }
    else {
      $(this).removeClass('unopened');
      lookDeeper(cell_row, cell_column, 'unopened', checkNeighbour);
    }
  })
}

function addFlag() {

  $( "td" ).mousedown(function(event) {

    if (event.which ==3) {
      if(!$(this).hasClass('unopened, opened') && !$(this).hasClass('flagged')){
        $(this).addClass('flagged').removeClass('unopened')
      }
      else if ($(this).hasClass('flagged')) {
        $(this).removeClass('flagged').addClass('question')
      }
    }
  });
}

$(document).ready(function(){


  $('button').click(function() {


    var $selected = $('input[name="optionsRadios"]:checked', 'form');
    var choice = $selected.val();

    constructTable('minesweeper', choice);

    $('table').bind('contextmenu', function(){

    // Handle right-click event.
      return false;
     });

    //Add numbers of mines around tiles
    findMine()

    //openTile
    openTile()

    //addFlag to tiles
    addFlag()
 })
});