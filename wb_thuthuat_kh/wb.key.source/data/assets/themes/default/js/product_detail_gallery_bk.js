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
