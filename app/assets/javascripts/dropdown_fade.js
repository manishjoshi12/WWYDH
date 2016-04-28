$(function() {

  $('#user_dropdown').click(function() {
    $(this).next('.dropdown-menu').fadeToggle(250);
  });

  $('#user_dropdown').focusout(function() {
    $(this).next('.dropdown-menu').fadeToggle(250);
  });

});
