$(document).ready(function(){
  $("a.brand").hover(
    function(){
      $(this).toggleClass("moveUp");
    }
  );
});