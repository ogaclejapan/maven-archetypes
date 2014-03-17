/*
__/__/__/__/__/__/__/__/__/__/
__/ tutorial.js
__/__/__/__/__/__/__/__/__/__/

チュートリアルのJavaScript処理を定義する。

*/


/**
@namespace tutorialjs
**/
this.tutorialjs = this.tutorialjs || {};

/**
Step3の実行結果を表示する

@method step3
@param text {String} 入力したテキスト文字列
**/
tutorialjs.step3 = function(text) {
  $.ajax({
    type: 'post',
    url: appjs.path('/tutorial/step3'),
    data: { 'text' : text } 
  }).done(function(json) {
    appjs.notices(json, function() {
      $('#step3').find('.step-done').show();
    });
  }).fail(function(result) {
    appjs.debug(function() {
      console.error('Failed to request. text=' + text);
    });
  });
};


;(function($, window) { 

  var document = window.document;
  $(document).ready(function() { 

    $('.js_submit').on('click', function() {
      var text = $('#step3').find('input').val();
      if (text) {
        tutorialjs.step3(text);
      }
    });

  });

}(jQuery, window));
