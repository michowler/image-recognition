$(function(){
    var images_list = $('#images-list');

    images_list.on('ajax:error', function(e, xhr, status, error) {
        console.log('Error: %O', $(this).append(xhr.responseText));
    });

    images_list.on('ajax:success', function(e, data, status, xhr) {
        console.log('Data: %O', data);
        
    });

});

function move() {
  var elem = document.getElementById("myBar");   
  var width = 10;
  var id = setInterval(frame, 10);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
    } else {
      width++; 
      elem.style.width = width + '%'; 
      elem.innerHTML = width * 1  + '%';
    }
  }
}

$(document).ready(function(){

$(".bg").interactive_bg(); // function call
});

// change background size on window resize
$(window).resize(function() {
  $(".bg > .ibg-bg").css({
    width: $(window).outerWidth(),
    height: $(window).outerHeight()
  })
})

