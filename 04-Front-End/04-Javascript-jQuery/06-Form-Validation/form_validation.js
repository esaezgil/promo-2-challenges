// Your validation code will go in there.
// Write your validation functions, and bind events
// in a jQuery DOM ready callback
function testInput(form, regex) {
  $(form).focusout( function() {
    if (!regex.test($(this).val())) {
      $(this).parents('.form-group').removeClass('has-success').addClass('has-error');
    }
    else if (regex.test($(this).val())) {
      $(this).parents('.form-group').removeClass('has-error').addClass('has-success');
    }
  });
}

$(document).ready(function(){


  $('input, textarea').focusout( function() {
        if (($(this).val() == '')) {
          $(this).parents('.form-group').addClass('has-error');
        }
        else {
          $(this).parents('.form-group').removeClass('has-error').addClass('has-success');}
  });

  if ($('#checkBox').attr('checked')) alert ('You should tick the TOS');

  testInput('#zip_code', /^[0-9]{5}$/);
  testInput('#email', /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
  testInput('#mobile_phone', /^((\+|00)33\s?|0)[6-7](\s?\d{2}){4}$/);

$('input, textarea').on('focusout change', function() {
  if ($('.has-error').length == 0 && $('#tos').prop('checked')) {
      $('button').prop('disabled', false);;
      $('button').text('Submit');
    }
  else {
      $('button').prop('disabled', true);;
      $('button').text('Please fill all fields')
  }
});

});