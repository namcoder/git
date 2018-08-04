$(document).ready(function(){
	var setCookie = function (name, value) {
            var date = new Date(),
                expires = 'expires=';
            date.setTime(date.getTime() + 1000 * 60 * 60 * 24 * 1);
            expires += date.toGMTString();
            document.cookie = name + '=' + value + '; ' + expires + '; path=/';
        }
        var getCookie = function (name) {
            var allCookies = document.cookie.split(';'),
                cookieCounter = 0,
                currentCookie = '';
            for (cookieCounter = 0; cookieCounter < allCookies.length; cookieCounter++) {
                currentCookie = allCookies[cookieCounter];
                while (currentCookie.charAt(0) === ' ') {
                    currentCookie = currentCookie.substring(1, currentCookie.length);
                }
                if (currentCookie.indexOf(name + '=') === 0) {
                    return currentCookie.substring(name.length + 1, currentCookie.length);
                }
            }
            return false;
        }
     if(!getCookie('wb_sticktome')){
     	$.stickToMe({
        layer: '#stickLayer'
    });
     	setCookie('wb_sticktome',true)
     }

});