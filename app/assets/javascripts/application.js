// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//
//= require rails-ujs
//= require activestorage
//= require_tree .

// $(document).on('turbolinks:load', function() {
//   $("#images").skippr({
//     // スライドショーの変化 ("fade" or "slide")
//     transition : 'fade',
//     // 変化に係る時間(ミリ秒)
//     speed : 2000,
//     // easingの種類
//     easing : 'easeOutQuart',
//     // ナビゲーションの形("block" or "bubble")
//     navType : 'block',
//     // 子要素の種類("div" or "img")
//     childrenElementType : 'div',
//     // ナビゲーション矢印の表示(trueで表示)
//     arrows : true,
//     // スライドショーの自動再生(falseで自動再生なし)
//     autoPlay : true,
//     // 自動再生時のスライド切替間隔(ミリ秒)
//     autoPlayDuration : 4000,
//     // キーボードの矢印キーによるスライド送りの設定(trueで有効)
//     keyboardOnAlways : true,
//     // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
//     hidePrevious : false
//   });
// });
$(function() {
  $('.top-slider').slick({
		fade:true,//切り替えをフェードで行う。初期値はfalse。
		autoplay: true,//自動的に動き出すか。初期値はfalse。
		autoplaySpeed: 3000,//次のスライドに切り替わる待ち時間
		speed:500,//スライドの動きのスピード。初期値は300。
		infinite: true,//スライドをループさせるかどうか。初期値はtrue。
		slidesToShow: 1,//スライドを画面に3枚見せる
		slidesToScroll: 1,//1回のスクロールで3枚の写真を移動して見せる
		arrows: false,//左右の矢印なし
        pauseOnFocus: false,//フォーカスで一時停止を無効
        pauseOnHover: false,//マウスホバーで一時停止を無効
        pauseOnDotsHover: false,//ドットナビゲーションをマウスホバーで一時停止を無効
  });
// });

//スマホ用：スライダーをタッチしても止めずにスライドをさせたい場合
  $('.top-slider').on('touchmove', function(event, slick, currentSlide, nextSlide){
      $('.top-slider').slick('slickPlay');
  });

// $(function() {
  $('.slider').slick({
    autoplay: true,//自動的に動き出すか。初期値はfalse。
    infinite: true,//スライドをループさせるかどうか。初期値はtrue。
    speed: 500,//スライドのスピード。初期値は300。
    slidesToShow: 3,//スライドを画面に3枚見せる
    slidesToScroll: 1,//1回のスクロールで1枚の写真を移動して見せる
    prevArrow: '<div class="slick-prev"></div>',//矢印部分PreviewのHTMLを変更
    nextArrow: '<div class="slick-next"></div>',//矢印部分NextのHTMLを変更
    centerMode: true,//要素を中央ぞろえにする
    variableWidth: true,//幅の違う画像の高さを揃えて表示
    dots: true,//下部ドットナビゲーションの表示
  });
});


  // $('.slider').slick({
  //   autoplay: true,
  //   infinite: true,
  //   speed: 400,
  //   slidesToShow: 4,
  //   slidesToScroll: 1,
  //   prevArrow: '<div class="slick-prev"></div>',
  //   nextArrow: '<div class="slick-next"></div>',
  //   centerMode: true,
  //   variableWidth: true,
  //   dots: true,
  // })
