// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  //smart row
  $('.smart_row').hover(function(){
    $(this).addClass('smart_row_over');
  },function(){
    $(this).removeClass('smart_row_over');
  });
  $('.smart_row').click(function(){
    $(this).toggleClass('smart_row_click');
  });
});