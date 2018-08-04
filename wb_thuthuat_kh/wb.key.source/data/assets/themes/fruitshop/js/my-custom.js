var $ = jQuery.noConflict();

$(document).ready(function() {
    setNavigation();
    $(".edit_quantity_left_minus").click(function(event) {
        quantity = parseInt( $(this).siblings('#quantity').val() ) - 1;
        $(this).siblings('#quantity').val(quantity);
    });
    $(".edit_quantity_right_plus").click(function(event) {
        quantity = parseInt( $(this).siblings('#quantity').val() ) + 1;
        $(this).siblings('#quantity').val(quantity);
    });
});

function setNavigation() {
    var path = window.location.pathname;
    path = path.replace(/\/$/, "");
    path = decodeURIComponent(path);

    var full_url = window.location.href;
    part_url = full_url.split("/")[3];

    $("#top_menu a").each(function () {
        var href = sec_part = $(this).attr('href');
        sec_part.indexOf(1);
        sec_part.toLowerCase();
        sec_part = sec_part.split("/")[1];
        if ((path === href)) {
            $(this).closest('li').addClass('current-menu-item');
            $(this).addClass('active');
            return false;
        }
    });
}


