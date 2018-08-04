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

$(document).ready(function() {
	$("#product-detail-gallery .image-zoom").elevateZoom({
		gallery: "product-detail-gallery",
		cursor: "pointer",
		galleryActiveClass: "active",
		easing: true,
		responsive:true,
			zoomWindowFadeIn: 500,
			zoomWindowFadeOut: 500,
			lensFadeIn: 500,
			lensFadeOut: 500
	});
	//pass the images to Fancybox
	$("#product-detail-gallery .image-zoom").bind("click", function(e) {
		var ez = $(".image-zoom").data("elevateZoom");
		$.fancybox(ez.getGalleryList());
		return false;
	});

});

if($(".slider-range")){
    $(".slider-range").slider({
        range: true,
        min: 0,
        max: $("input[name='filter_max_price']").val(),
        values: [ $("input[name='price_from']").val(), $("input[name='price_to']").val() ],
        slide: function( event, ui ) {
            $( ".amount" ).val( "$" + $("input[name='price_from']").val() + " - $" + $("input[name='price_to']").val() );
        },
        change: function( event, ui ) {
            $("input[name='price_from']").val( $( "#slider-range" ).slider( "values", 0 ) );
            $("input[name='price_to']").val( $( "#slider-range" ).slider( "values", 1 ) );
            $( "#amount" ).val( "$" + $("input[name='price_from']").val() + " - $" + $("input[name='price_to']").val() );
        }
    });
    $( "#amount" ).val( "$" + $("input[name='price_from']").val() + " - $" + $("input[name='price_to']").val() );
}




