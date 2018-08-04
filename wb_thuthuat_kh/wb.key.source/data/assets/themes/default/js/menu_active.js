$(document).ready(function () {
    var current_url = window.location.href;
    var is_homepage = current_url.split("/")[3]?false:true;

    $(".wb-header-menu-item>a").each(function () {
        var menu_url = $(this).prop('href');
        var menu_url_is_homepage = menu_url.split("/")[3]?false:true;
        if((is_homepage && menu_url_is_homepage) || (current_url.search(menu_url) > -1 && !menu_url_is_homepage)){
            $(this).closest('.wb-header-menu-item').addClass('active current-menu-item');
            $(this).addClass('active');
        }
    });
});