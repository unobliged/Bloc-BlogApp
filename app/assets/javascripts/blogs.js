$(document).ready(function(){
  $('.blogs button').click(function(){
    $('#new_post').toggle();
    $(this).text(function(index, text){
      return text === "Create New Post" ? "Hide Post Form" : "Create New Post";
    })
  });
});
