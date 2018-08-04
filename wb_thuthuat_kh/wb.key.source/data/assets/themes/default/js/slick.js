$(document).ready(function() {
    $('.wb-slick-slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.wb-slick-slider-nav'
    });
    $('.wb-slick-slider-nav').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        asNavFor: '.wb-slick-slider-for',
        focusOnSelect: true
    });
});
