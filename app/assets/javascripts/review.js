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
        comment = $('<li>').prependTo('.reviews'),
        commenter = $('<li>').prependTo('.reviews'),
        rate = $('<li>').prependTo( '.reviews'),
        newDate = new Date(),
        date = formatDate(newDate);
        $(comment).html('<p> Comment: ' + review.comment + '</p>');
        $(commenter).html('<p> By '+ '<span class = review_maker>' + data.reviewer + '</span>' + ' on ' + date);
        $('.review_maker').css('color', '#337ab7');
        for(i = 0;  i <data.review.rating; i++){
          var star =  $('<span class = glyphicon>');
          $(star).addClass('glyphicon-star');
          $(star).addClass('single_star');
          $(star).appendTo(rate);
          $(' ').appendTo(rate);
          location.reload(true);
        }
        $('#review_comment').val('');


      }
      console.log('submit was successful');

    }).fail(function(data) {
      console.log('submit failed');

    }).always(function() {

    }).error(function()   {

    });
  });



  function formatDate(date) {
  var monthNames = [
    "January", "February", "March",
    "April", "May", "June", "July",
    "August", "September", "October",
    "November", "December"
  ];

  var day = date.getDate();
  var monthIndex = date.getMonth();
  var year = date.getFullYear();

  return  monthNames[monthIndex] + ' ' + day + ', ' + year;
}
});
