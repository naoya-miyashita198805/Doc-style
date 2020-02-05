$(function(){
  $('.footer-btn').click(function(e) {
    // $('#icon').('&#171;');
    // $('.footer-btn').prop('disabled', true);
    e.preventDefault();
    $('.footer-content').slideToggle(300);
  })
})