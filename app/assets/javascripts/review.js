$(function() {

  $('#new_review').on('submit', function(e) {
    e.preventDefault();
    $.ajax({
      method:$(this).attr('method'),
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'json'
    }).done(function(data) {
      if(data.errors.length !== 0){
        var error = $('<span>').appendTo('.comment_box')
        $(error).html('<p>' + data.errors[0]+'</p>')
      }else{
      var review = data['review'],
          rate = $('<li>').prependTo(".modal ul");
          comment = $('<li>').prependTo(".modal ul");
      $(comment).html('<p> Comment: ' + review.comment + '</p>');
        for(i = 0;  i <data.review.rating; i++){
          var star =  $('<span class = glyphicon>');
          $(star).addClass('glyphicon-star');
          $(star).appendTo(rate);
        }
        $('.modal').fadeIn();
        $('button.close').on('click', function(){
            $('.modal').fadeOut('slow');
            window.location.reload(true);
        });
      }
      console.log('submit was successful');

    }).fail(function(data) {
      console.log('submit failed');

    }).always(function() {

    }).error(function()   {

    });
  });
});
