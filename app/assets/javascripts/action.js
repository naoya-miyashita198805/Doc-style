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

  $('.btn-1').click(function(e){
    e.preventDefault();    
    //そのままの順序で出力する
    $('.content-box').each(function(i){
      console.log($(this).text());
    });
 
    //逆順で出力する
    $($('.content-box').get().reverse()).each(function(){
      console.log($(this).text());
    });
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

  // ---画像添付---
  $('.file_field').on('change', function(e) {
    // 1枚だけ表示する
    var file = e.target.files[0];

    // ファイルのブラウザ上でのURLを取得する
    var blobUrl = window.URL.createObjectURL(file);

    // img要素に表示
    $('#file-preview').attr('src', blobUrl);
});

  // ---献立アプリのボタンアクション---

  $('.btn-0').on('click', function(e){
    e.preventDefault();
    $('.btn-box').fadeToggle(200);
  })

})