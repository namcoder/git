$(document).ready(function() {
    if($('.range-filter').length>0){
        $('.range-filter').each(function(){
            $(this).find( ".slider-range" ).slider({
                range: true,
                min: 0,
                max: 1000000,
                values: [ 0, 1000000 ],
                slide: function( event, ui ) {
                    $(this).parents('.range-filter').find( ".amount" ).html( '<span>' + 'Price: $' + ui.values[ 0 ] + '</span>' + '<span>' + ' - $' + ui.values[ 1 ] + '</span>' + '<input type="hidden" min="0" name="price_from" id="price_from" class="qty detail-qty info-qty border radius6 text-center" value="'+ ui.values[ 0 ] +'" /> <input type="hidden" min="0" name="price_to" id="price_to" class="qty detail-qty info-qty border radius6 text-center" value="'+ ui.values[ 1 ] +'" />');
                }
            });
            $(this).find( ".amount" ).html('<span>' + 'Price: $' + $(this).find( ".slider-range" ).slider( "values", 0 ) + '</span>' + '<span>'+ ' - $' + $(this).find( ".slider-range" ).slider( "values", 1 ) + '</span>' + '<input type="hidden" min="0" name="price_from" id="price_from" class="qty detail-qty info-qty border radius6 text-center" value="'+ $(this).find( ".slider-range" ).slider( "values", 0 ) +'" /> <input type="hidden" min="0" name="price_to" id="price_to" class="qty detail-qty info-qty border radius6 text-center" value="'+ $(this).find( ".slider-range" ).slider( "values", 1 ) +'" />');
        });
    }
});