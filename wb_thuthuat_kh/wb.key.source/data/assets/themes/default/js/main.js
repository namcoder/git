 var autoNumericOptions = {
        decimalPlaces: 0,
        currencySymbol: "\u202fđ",
        currencySymbolPlacement:
            AutoNumeric.options.currencySymbolPlacement.suffix
    };
$(document).ready(function() {
    $("#loading").fadeOut();
    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
        }
    });
    initCurrency();
});

function initCurrency() {
    formatCurrency(".price .new");
    formatCurrency(".price .old");
}

function formatCurrency(element){
 if ($(element).length) {
        new AutoNumeric.multiple(element, autoNumericOptions);
    }
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validatePhone(phone) {
    var re = /^[0-9-+]+$/;
    return re.test(phone);
}

(function(d, s, id) {
    var js,
        fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.10";
    fjs.parentNode.insertBefore(js, fjs);
})(document, "script", "facebook-jssdk");
