$(function(){
  $(".btn-like").click(function(){
    if($('.heart').hasClass('current')){
      $('.heart').css('display','inline-block');
      $('.heart_on').css('display','none');
      $('.heart').removeClass('current');
    } else {
      $('.heart').css('display','none');
      $('.heart_on').css('display','inline-block');
      $('.heart').addClass('current');
    }
  });
});
