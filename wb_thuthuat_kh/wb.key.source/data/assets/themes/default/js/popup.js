var flag = false;
jQuery(document).ready(function() {
    if(flag == false){
        startInterval();
        flag = true;
    }
});

function startInterval(){
    time = $("input[name=popup_time]").val() * 1000;
    timer = setInterval(showPopup, time);
}

function showPopup(){
    $("#show_popup").click();
    $("#fancybox-overlay").unbind();
    clearInterval(timer);
}

jQuery(document).ready(function() {
    $("#show_popup").fancybox({
        'titleShow'     : 'false',
        'transitionIn'      : 'none',
        'transitionOut'     : 'none',
        'hideOnOverlayClick':false,
        'hideOnContentClick':false,
        'enableEscapeButton' : false,
        'overlayShow'   : true
    });

});


// fancybox 1.3.4
// fancybox 2.1.5
// jquery sticktome 1.6.1