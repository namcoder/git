$(".subcribe_mail").click(function(event) {
    event.preventDefault();
    let form = $(this).closest('.wb-email-form');
    let obj = {
        name : form.find('input[name=subcribe_name]').val() || "",
        email : form.find('input[name=subcribe_mail]').val() || "",
        phone : form.find('input[name=subcribe_phone]').val() || ""
    };
    $.ajax({
        url: '/api/subscribe',
        type: 'POST',
        data: obj,
    })
    .done(function(data) {
        if(data.success){
            alert(data.message);
        } else {
            alert(data.message);
        }
        $('input[name=subcribe_name]').val('');
        $('input[name=subcribe_mail]').val('');
        $('input[name=subcribe_phone]').val('');
    })
    .fail(function(data) {
        alert(data.responseJSON.email);
    })
    .alway()
    return false;
});
