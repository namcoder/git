localStorage.clear();
$(document).ready(function () {
    $.ajax({
        url: $('#data_js').data('route_order_email_new'),
        type: 'POST',
        data: {
            '_token': _token,
        }
    });
});