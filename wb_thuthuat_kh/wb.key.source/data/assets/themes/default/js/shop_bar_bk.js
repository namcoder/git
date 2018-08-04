// sort product

$('.sort_products > option').each(function() {
    if( window.location.href.indexOf(this.value) != -1 ){
        selected = this.value;
        $(this).attr("selected","selected");
        return false;
    }
});

$('.sort_products').change(function(event) {
    var url = window.location.href;
    if(url.indexOf('keyword') != -1){
        var searchUrl = window.location.search;
        if( searchUrl.indexOf('&') != -1 ){
            searchUrl = searchUrl.substr(0, searchUrl.indexOf('&'));
        }
        var url = window.location.origin + window.location.pathname + searchUrl;
    } else{
        var url = window.location.origin + window.location.pathname;
    }
    if(url.indexOf('#') != -1){
        url = url.replace("#", "");
    }
    if(url.indexOf('?') != -1){
        url = url + "&" + $(this).val();
    } else{
        url = url + "?" + $(this).val();
    }
    window.location.href = url;
});


// change product view

if(!localStorage.getItem("product_view_type")){
    localStorage.setItem("product_view_type", "grid");
}

changeProductView();

$('a.product_view_type').click(function(event) {
    localStorage.setItem("product_view_type", $(this).attr("data-view"));
    changeProductView();
});

function changeProductView(){
    if(localStorage.getItem("product_view_type") == 'grid'){
        $(".product-grid-view").show();
        $(".product-list-view").hide();
        $(".grid-view").addClass("active custom_btn");
        $(".list-view").removeClass("active custom_btn");
    }else {
        $(".product-grid-view").hide();
        $(".product-list-view").show();
        $(".grid-view").removeClass("active custom_btn");
        $(".list-view").addClass("active custom_btn");
    }
}



