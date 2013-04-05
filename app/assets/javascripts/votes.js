$(document).ready(function(){
  $('.btn-vote').click(function (e) {
    e.preventDefault();
    console.log("hi");
    $(this).text("Unvote");
    // $(this).after("Thanks!");
    $(this).unbind('click');
    // $(this).tab('show');
  });
});