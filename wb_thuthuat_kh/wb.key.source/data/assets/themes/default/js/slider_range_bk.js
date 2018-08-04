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