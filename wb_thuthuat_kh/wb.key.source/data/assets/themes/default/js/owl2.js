function animated(){
	$('.wb-slider .owl-item').each(function(){
		var check = $(this).hasClass('active');
		if(check==true){
			$(this).find('.animated').each(function(){
				var anime = $(this).attr('data-animated');
				$(this).addClass(anime);
			});
		}else{
			$(this).find('.animated').each(function(){
				var anime = $(this).attr('data-animated');
				$(this).removeClass(anime);
			});
		}
	});
}
function slick_animated(){
	$('.wb-slider .item-slider').each(function(){
		var check = $(this).hasClass('slick-active');
		if(check==true){
			$(this).find('.animated').each(function(){
				var anime = $(this).attr('data-animated');
				$(this).addClass(anime);
			});
		}else{
			$(this).find('.animated').each(function(){
				var anime = $(this).attr('data-animated');
				$(this).removeClass(anime);
			});
		}
	});
}
var fixOwl = function(){
    var $stage = $('.owl-stage'),
        stageW = $stage.width(),
        $el = $('.owl-item'),
        elW = 0;
    $el.each(function() {
        elW += $(this).width()+ +($(this).css("margin-right").slice(0, -2))
    });
    if ( elW > stageW ) {
        $stage.width( elW );
    };
}

function initOwl() {
	if($('.wb-owl').length>0){
		var owl = $('.wb-owl').each(function(){
			var data = $(this).data();
			$(this).owlCarousel({
				stagePadding: data.stagepadding,
				center: data.center,
				loop:data.loop,
				autoplayHoverPause:true,
				lazyLoad:true,
				items:data.itemscustom,
				responsive:data.responsive,
				autoplay:data.autoplay,
				autoplayTimeout:data.autoplaytimeout,
				animateIn:data.animatein,
				animateOut:data.animateout,
				dots:data.pagination,
				dotsEach:data.dotseach,
				nav:data.navigation,
				smartSpeed:data.smartspeed,
				navText:data.navtext,
				onDragged:animated,
				onInitialized: fixOwl,
        		onRefreshed: fixOwl
			});
		});

		$( '.owl-nav' ).on( 'click', function() {
			animated();
		});

		$( '.owl-dots' ).on( 'click', function() {
			animated();
		});

		$(".wb-owl").trigger("refresh.owl.carousel");
	}
}

$(document).ready(function() {
	initOwl();
});

$('.widget_product_body ul li a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  	initOwl();
});