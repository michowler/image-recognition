$(function(){
    var images_list = $('#images-list');

    images_list.on('ajax:error', function(e, xhr, status, error) {
        console.log('Error: %O', $(this).append(xhr.responseText));
    });

    images_list.on('ajax:success', function(e, data, status, xhr) {
        console.log('Data: %O', data);
        
    });

});

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

$.ajax({
url: path,
xhrFields: {
onprogress: function (e) {
if (e.lengthComputable) {
console.log(e.loaded / e.total * 100 + '%');
}
}
},
success: function (response) {
    console.log('Data: %O', data);

}
});