$(function() {
  // limits the number of categories
  $('#descriptions').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
  });

  $('#descriptions').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

  check_to_hide_or_show_add_link();

  function check_to_hide_or_show_add_link() {
    if ($('#descriptions .nested-fields').length == 5) {
      $('.links a').hide();
    } else {
      $('.links a').show();
    }
  }

})
$(document).on('turbolinks:load', function(){
  var path = document.location.pathname;
  if(path.includes('users') && !path.includes('edit') && !path.includes('delete')){
    var beforeColor = $('input#color-picker').minicolors('rgbaString');
  }
  $('input#color-picker').minicolors({
    change: function() {
      var color = $(this).minicolors('rgbaString');
      $('.header h1, .profile-info h3, h3 span, .header ul li').css('color', color);
      $('.social-info, .address-info').css('background', color);
      if(beforeColor == color){
        $('.pdfbtn').removeClass('disabled');
      }else{
        $('.pdfbtn').addClass('disabled');
      }
    }
  });
});
