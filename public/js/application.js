$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

    $("#new_comment_button").on('click', function() {
    // $('form').show();
    $('form').toggle();
    $('#new_comment_button').hide();

    });

    $(document).on('click', '.submit', function(event){
      event.preventDefault();
      $content = $('input[name=content]').val()
      $name = $('input[name=name]').val()
      $('#comment_list').append('<li> <span class = "author">' + $content + '<br>' + $name + '<span> </li>');
      $('form').hide();
      $('#new_comment_button').show();
      $('input:text').val('');
  });
});