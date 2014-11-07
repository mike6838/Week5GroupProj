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

    $(document).on('click', '.submit', function(event){
      event.preventDefault();
      $question_str = $('input[name=question_str]').val()
      $choice_str1 = $('input[name=choice_str1]').val()

      $('#question_list').append('<p>' + $question_str + '</p>');
      $('#question_list').append('<p>' + $choice_str1 + '</p>');
      $('#question_list').append('<p>' + $choice_str2 + '</p>');
      $('#question_list').append('<p>' + $choice_str3 + '</p>');
      $('#question_list').append('<p>' + $choice_str4 + '</p>');
      $('#question_list').append('<p>' + $choice_str5 + '</p>');
      $('#question_str').hide();
      $('#new_question_button').show();
      $('input:text').val('');
  });
});