$(function() {

  // Listen for the submit form

  $('#new_review').on('submit', function(e) {
    e.preventDefault();

    $.ajax({
      method:$(this).attr('method'),
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'html'

    }).done(function(data){
      $("#reviewoutput").prepend(data);
    $('#review_comment').val('');

      console.log('submit was successful');
      console.log(data);

    }).fail(function(data){
        console.log('submit failed');
    }).always(function(){

    }).error(function(){
      
    });

  });



});
