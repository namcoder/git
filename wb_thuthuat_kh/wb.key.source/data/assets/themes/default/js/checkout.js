$(document).ready(function () {
    if ($('input[name="page"]').val() == 'checkout') {

        $('#btn_checkout').text( $('input[name="btn-update-cart-val"]').val() );

        $("#btn_checkout").click(function(event) {
            event.preventDefault();
            $("#wb-modal-cart").modal("toggle");
            return false;
        });

        /* Thay đổi địa chỉ */
        function getProvince(url_api) {
            var data = {};
            $.ajax({
                type: "GET",
                url: url_api,
                data: data,
                success: function (response) {
                    $.each(response, function (index, value) {
                        var option = document.createElement("option");
                        option.text = value.name;
                        option.value = value.name;
                        $(option).attr('data-id', value.id);
                        $('#province').append(option);

                        var soption = document.createElement("option");
                        soption.text = value.name;
                        soption.value = value.name;
                        $(soption).attr('data-id', value.id);
                        $('#sprovince').append(soption);
                    });
                },
            });
        }

        function getDistrict(url_api, province_id, element) {
            var data = {province_id: province_id};
            $.ajax({
                type: "GET",
                url: url_api,
                data: data,
                success: function (response) {
                    var option = element.find('option').first();
                    element.html(option);
                    $.each(response, function (index, value) {
                        var option = document.createElement("option");
                        option.text = value.name;
                        option.value = value.name;
                        $(option).attr('data-id', value.id);
                        element.append(option);
                    });
                },
            });
        }

        getProvince($('#province').data('action'));
        $('#province').change(function () {
            $('#district').find('option:not(:first)').remove();
            $('#shipping_fee_val').empty();
            var option = $(this).find(":selected");
            getDistrict($('#district').data('action'), option.attr('data-id'), $('#district'));
        });
        $('#sprovince').change(function () {
            $('#sdistrict').find('option:not(:first)').remove();
            $('#shipping_fee_val').empty();
            var option = $(this).find(":selected");
            getDistrict($('#district').data('action'), option.attr('data-id'), $('#sdistrict'));
        });
        /* Hình thức thanh toán */
        $('input[type=radio][name=payment]').change(function () {
            $('.payment_description').hide();
            $('#payment_' + $(this).val()).show();
        });


        var list_products = JSON.parse($('input[name="products"]').val());
        var list_id_products = [];
        $.each(list_products, function (index, val) {
            list_id_products.push(val.id);
        });
        var order = {
            product_ids: list_id_products,
            price: parseInt($('.temporary_price').html().replace(/\D/g, '')),
            shipping_fee: 0,
            is_freeship: 0,
            applied_code: 0
        };

        /* Tính phí ship*/
        function noShippingfee(res) {
            $('.edit_shipping').css('display', 'none');
            $('ul.ship_methods').empty();
            $('.shipping_fee_val').empty();
            $('.shipping_message').html(res.message);
            $('.shipping_message_val').css('display', 'table-row');
            $('.shipping_fee').css('display', 'table-row');
            stotal = parseInt($('.temporary_price').html().replace(/\D/g, ''));
            $('#stotal-mini').html(stotal);
        }

        function calShippingfee(district_id, province_id, weight = null, amount = null) {
            $.ajax({
                url: '/api/v1/shipping-fee',
                type: 'POST',
                data: {
                    method: 'default',
                    order: {
                        receiver: {
                            provinceId: province_id,
                            districtId: district_id
                        },
                        weight: weight,
                        amount: amount
                    }
                },
            }).done(function (response) {
                if (response.error || response.success == false) {
                    noShippingfee(response);
                    formatCurrency("#stotal-mini");
                    if( $('#submit-order').is(':enabled') ) {
                        $('#submit-order').prop('disabled', true);
                    }
                    return false;
                }

                $('.edit_shipping').css('display', 'block');
                $('ul.ship_methods').empty();
                var checked = '';
                $.each(response.data, function (index, val) {
                    if (index == 0) {
                        checked = 'checked';
                    }
                    let html = "<li class='ship_method_bacs'>" +
                        "<input type='radio' name='ship' id='ship" + val['id'] + "' value='" + val['id'] + "' " + checked +
                        " data-val='" + val['fee'] + "'>" +
                        "<label for='ship" + val['id'] + "' class='wb-text15'>" + val['name'] +
                        "<span class='pull-right shipping_fee_val'>" + val['fee'] +
                        "</span></label></li>";
                    $('ul.ship_methods').append(html);
                    checked = '';
                });

                $('.shipping_message').empty();

                if( !$('#noti_coupon').hasClass('already_free_ship') ) {
                    order.shipping_fee = parseInt(response.data[0].fee);
                    let total = parseInt(order.price) + parseInt(order.shipping_fee);
                    $('#shipping_fee_val').empty().html(order.shipping_fee);
                    $('#stotal-mini').empty().html(total);
                    formatCurrency("#shipping_fee_val");
                    formatCurrency("#stotal-mini");
                } else{
                    $('#shipping_fee_val').empty().html( $('#noti_coupon').data("free_shipping") );
                }

                $('.shipping_fee').css('display', 'table-row');
                $('.shipping_message_val').css('display', 'none');
                formatCurrency(".shipping_fee_val");

                if( $('#submit-order').is(':disabled') ) {
                    $('#submit-order').prop('disabled', false);
                }

            }).fail(function (res) {
                if (res.code == 0) {
                    noShippingfee(res);
                    if( $('#submit-order').is(':enabled') ) {
                        $('#submit-order').prop('disabled', true);
                    }
                }
            });
        }

        $('#district').change(function () {
            if (!$('input[name=has_saddress]').is(':checked')) {
                var district_id = $(this).find('option:selected').data('id');
                var province_id = $('#province').find('option:selected').data('id');
                calShippingfee(district_id, province_id, 1, parseInt($('#stotal-mini').html().replace(/\D/g, '')));
            }
        });
        $('#sdistrict').change(function () {
            if ($('input[name=has_saddress]').is(':checked')) {
                var district_id = $(this).find('option:selected').data('id');
                var province_id = $('#sprovince').find('option:selected').data('id');
                calShippingfee(district_id, province_id, 1, parseInt($('#stotal-mini').html().replace(/\D/g, '')));
            }
        });

        /* Coupon */
        $(document).on('keyup blur', 'input#coupon_code', function (event) {
            if ($(this).val() != '') {
                if ($('input#check-coupon').hasClass('disabled')) {
                    $('input#check-coupon').prop('disabled', false);
                    $('input#check-coupon').removeClass('disabled');
                }
            } else {
                if (!$('input#check-coupon').hasClass('disabled')) {
                    $('input#check-coupon').addClass('disabled');
                    $('input#check-coupon').prop('disabled', true);
                }
            }
        });
        $('.ship_methods').change('input:radio[name=ship]', function () {
            order.price = parseInt( $('.temporary_price').html().replace(/\D/g, '') );
            if( !$('#noti_coupon').hasClass('already_free_ship') ) {
                order.shipping_fee = $('input:radio[name=ship]:checked').data('val');
                total = parseInt(order.price) + parseInt(order.shipping_fee);
                $('#shipping_fee_val').empty().html(order.shipping_fee);
                formatCurrency("#shipping_fee_val");
                $('#stotal-mini').empty().html(total);
            }
            formatCurrency(".shipping_fee_val");
            formatCurrency("#stotal-mini");
        });

        var coupon_log = [];

        $('#coupon_list').on('click', 'button.close', function () {
            var coupon = $(this).data('coupon');
            $.each(coupon_log, function (index, element) {
                if (coupon == element.code) {
                    if( ( element.type == 'free_shipping' ) && ( $('#noti_coupon').hasClass('already_free_ship') ) ) {
                        $('#noti_coupon').removeClass('already_free_ship');
                        if( $('.ship_methods').html() != '' ) {
                            order.shipping_fee = $('input:radio[name=ship]:checked').data('val');
                            $('#shipping_fee_val').html( order.shipping_fee );
                        }
                    }
                    order.price = parseFloat(order.price) + parseFloat(element.discount);
                    $('#stotal-mini').html(parseFloat(order.price) + parseFloat(order.shipping_fee));
                    coupon_log.splice(index, 1);
                }
            });
            formatCurrency("#shipping_fee_val");
            formatCurrency("#stotal-mini");
        });

        $("#check-coupon").click(function (event) {
            var coupon = $("#coupon_code").val().replace(/ /g, '');
            order.price = parseInt($('.temporary_price').html().replace(/\D/g, ''));
            if (coupon != '') {
                var coupon_list = [];
                $('input[name="coupon_code\[\]"]').each(function () {
                    coupon_list.push($(this).val());
                });
                if ($.inArray(coupon, coupon_list) < 0) {
                    $.ajax({
                        url: '/apply-coupon',
                        type: 'GET',
                        data: {
                            code: coupon,
                            order: order
                        }
                    }).done(function (response) {
                        $('#coupon_code').css({
                            'margin-bottom': '10px',
                        });
                        if (response.success) {
                            $('.wb_cart .woocommerce table.shop_table td .coupon').css('padding-bottom', '20px');
                            $('.noti_coupon').css({
                                display: 'none',
                            });
                            $('tr.discount_price').show();
                            $('.coupon_message').css({
                                display: 'table-row'
                            });
                            if (response.coupon.type == 'free_shipping') {
                                if( !$('#noti_coupon').hasClass('already_free_ship') ) {
                                    $('#noti_coupon').addClass('already_free_ship');
                                }
                                discount = $('#noti_coupon').data('free_shipping');
                                $('#shipping_fee_val').html( $('#noti_coupon').data('free_shipping') );
                            } else if (response.coupon.type == 'percent_bill') {
                                discount = response.coupon.value + '%';
                            } else {
                                discount = response.coupon.value;
                            }
                            var log = {};
                            log.discount = parseFloat(order.price) - parseFloat(response.order.price);
                            log.code = coupon;
                            log.type = response.coupon.type;
                            coupon_log.push(log);
                            order = response.order;

                            $('#stotal-mini').html(parseFloat(order.price) + parseFloat(order.shipping_fee));

                            var coupon_html = '<div class="alert alert-success alert-component">'
                                + '<p class="text-left"><i class="fa fa-check" aria-hidden="true"></i>' + coupon + '<button style="float:none;" type="button" data-coupon="' + coupon + '" class="close wb-ml-10" data-dismiss="alert"><span>×</span><span class="sr-only">Close</span></button>' + '<span style="float: right;" class="wb-textright discount_price" id="discount_price">' + discount + '</span></p>'
                                + '<input class="hide coupon_code_apply" name="coupon_code[]" value="' + coupon + '">'
                                + '</div>';
                            $('#coupon_list').append(coupon_html);
                            if (response.coupon.type == 'money_bill') {
                                formatCurrency('#discount_price');
                            }
                            formatCurrency("#stotal-mini");
                            $('#coupon_code').val('');
                        } else {
                            $('#noti_coupon').html('<span style="color: red;">' + $('#noti_coupon').data(response.message) + '</span>');
                            $('.noti_coupon').css('display', 'table-row');
                        }
                    });
                } else {
                    $('.wb_cart .woocommerce table.shop_table td .coupon').css('padding-bottom', '5px');
                    $('#noti_coupon').html('<span style="color: red;">' + $('#noti_coupon').data('coupon_used') + '</span>');
                }
            }
        });
    }
    else if ($('input[name="page"]').val() == 'checkout_thankyou') {
        function sendMailOrder() {
            $.ajax({
                url: $('#data_js').data('route_order_email_new'),
                type: 'POST',
                data: {
                    '_token': $('meta[name=csrf-token]').attr('content'),
                }
            });
        }
        sendMailOrder();
    }
});





