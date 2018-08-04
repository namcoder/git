function fb_show(t) {
    document.getElementById(t).style.display = "block";
}

function fb_hide(t) {
    document.getElementById(t).style.display = "none";
}

function chat_fb_close() {
    fb_hide("b-c-facebook"), fb_show("chat_f_b_smal");
}

function chat_fb_show() {
    fb_show("b-c-facebook"), fb_show("f-chat-conent"), fb_hide("chat_f_b_smal");
}

function fb_start() {
    fb_show("chat_f_b_smal"), fb_hide("b-c-facebook");
}