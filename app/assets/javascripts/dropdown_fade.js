$(function() {
  $('a.dropdown').click(function() {
    $(this).next('.dropdown-menu').fadeToggle(250);
  });
});
