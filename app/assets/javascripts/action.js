$(function(){

  // ---アプリバーのアクション---

  $('.fa-bars').on('mouseenter', function(e){
    e.preventDefault();
    $('.bar-box').fadeIn(200);
  })

  $('.bar-box').on('mouseleave', function(e){
    e.preventDefault();
    $('.bar-box').fadeOut(200);
  })

  // ---献立アプリ起動---

  $('.btn-0').on('click', function(e){
    e.preventDefault();
    $(this).toggleClass('active');

    if($(this).hasClass('active')){
        var text = $(this).data('text-clicked');
    } else {
        var text = $(this).data('text-default');
    }

    $(this).html(text);
  });

  // ---フッターバーのアクション---

  $('.footer-btn').on('click', function(e) {
    e.preventDefault();
    $('.footer-content').slideToggle(300);
  })

  // ---呼び出し 引き出し---

  $('.footer-btn').on('click', function(e){
    e.preventDefault();
    $(this).toggleClass('active');

    if($(this).hasClass('active')){
        var text = $(this).data('text-clicked');
    } else {
        var text = $(this).data('text-default');
    }

    $(this).html(text);
  });

  // ---献立アプリのボタンアクション---

  $('.btn-0').on('click', function(e){
    e.preventDefault();
    $('.btn-box').fadeToggle(200);
  })

})