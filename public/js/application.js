$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

    $("#new_question_button").on('click', function() {
    // $('form').show();
    $('#question_str').show();
    $('#new_question_button').hide();

    });

    $("#new_question_button").on('click', '.submit', function(event){
      event.preventDefault();
      $question_str = $('input[name=question_str]').val()

      $('#question_list').append('<p>' + $question_str + '</p>');
      $('#question_str').hide();
      $('#new_question_button').show();
      $('input:text').val('');
  });
});