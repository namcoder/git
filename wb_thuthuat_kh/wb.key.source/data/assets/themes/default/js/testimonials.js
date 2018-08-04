function slick_control(){
    $('.slick-slider').each(function(){
        $(this).find('.slick-prev').html($('.slick-active').prev().find('.wb-client-thumb a').html());
        $(this).find('.slick-next').html($('.slick-active').next().find('.wb-client-thumb a').html());
    });
}

$(document).ready(function() {
    if($('.wb-client-slider .slick').length>0){
        $('.wb-client-slider .slick').each(function(){
            $(this).slick({
                fade: true,
                infinite: true,
                initialSlide:1,
                slidesToShow: 1,
                prevArrow:'<div class="slick-prev slick-nav"></div>',
                nextArrow:'<div class="slick-next slick-nav"></div>',
            });
            slick_control();
            $('.slick').on('afterChange', function(event){
                slick_control();
            });
        });
    }
});