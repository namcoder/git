let updateQueryStringParameter = function(uri, key, value) {
    let re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    let separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        return uri.replace(re, '$1' + key + "=" + value + '$2');
    } else {
        return uri + separator + key + "=" + value;
    }
};

let removeQueryStringParameter = function (uri, param) {
    let urlParts = uri.split('?');
    let params = new URLSearchParams(urlParts[1]);
    params.delete(param);
    return urlParts[0] + '?' + params.toString(); 
};