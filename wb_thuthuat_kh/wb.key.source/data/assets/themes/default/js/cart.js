(function($) {
    $.Shop = function(element) {
        this.$element = $(element);
        this.init();
    };

    $.Shop.prototype = {
        init: function() {
            // Properties
            if ($('input[name="page"]').val() == 'checkout_thankyou'){
                localStorage.clear();
            }

            this.cartPrefix = "wb-"; // Prefix string to be prepended to the cart's name in the session storage
            this.cartName = this.cartPrefix + "cart"; // Cart name in the session storage
            this.total = this.cartPrefix + "total"; // Total key in the session storage
            this.storage = localStorage; // shortcut to the sessionStorage object

            // this.$formAddToCart = this.$element.find(".add-to-cart"); // Forms for adding items to the cart
            this.$formCart = this.$element.find("#shopping-cart"); // Shopping cart form
            this.$rules = this.$formCart.data('rules');
            this.$note_rules = this.$element.find("#note_rules");
            this.$btn_checkout = this.$element.find("#btn_checkout");
            this.$formCartMini = this.$element.find("#shopping-cart-mini"); // Shopping cart form
            this.$checkoutCart = this.$element.find("#checkout-cart"); // Checkout form cart
            this.$checkoutOrderForm = this.$element.find( "#checkout-order-form"); // Checkout user details form
            this.$shoppingCartActions = this.$element.find("#shopping-cart-actions"); // Cart actions links
            this.$productQty = this.$element.find(".product-qty");

            this.$btnAddToCart = this.$element.find(".addcart-link");

            this.createCart();
            this.handleAddToCartForm();
            this.handleCheckoutOrderForm();
            this.handleUpdateQty();
            this.displayCart();
            this.displayCartCheckout();
            this.displayCartValue();
            this.deleteProduct();
        },

        // Public methods

        // Creates the cart keys in the session storage

        createCart: function() {

            if (this.storage.getItem(this.cartName) == null) {
                var cart = {};
                cart.items = [];

                this.storage.setItem(this.cartName, this._toJSONString(cart));
                this.storage.setItem(this.total, "0");
            }
        },

        // Handles add items to cart

        handleAddToCartForm: function() {
            self = this;
            this.$btnAddToCart.click(function(event) {
                var price = self._convertString($(this).data("price"));
                var name = $(this).data("name");
                var image = $(this).data("img");
                var id = $(this).data("id");
                var qty = 1;
                if ( $(this).hasClass('wb-main-order') ) {
                    qty = self.$productQty.val() >= 1 ? parseInt( self.$productQty.val() ) : 1;
                }
                var remove_id = id;
                var product_attributes = {};
                var input_attributes = $(this).parents('.wb-shop').find(
                    ":input.edit_products_attribute:checked"
                );

                if(!id) {
                    return false;
                }

                $.each(input_attributes, function(index, val) {
                    remove_id += '_' + $(val).data('id');
                    product_attributes[index] = {
                        parent_name:
                            $(val).data('parent-name'),
                        id: $(val).data('id'),
                        name: $(val).data('name'),
                    };
                });

                //update total price
                self._addToCart({
                    product: name,
                    price: price,
                    qty: qty,
                    image: image,
                    id: id,
                    product_attributes: product_attributes,
                    remove_id: remove_id
                });

                self.displayCart();
                $("#wb-modal-cart").modal("toggle");
                return false;
            });

            $(".extend-addcart").click(function(event) {
                $(".is_product_detail_page .wb-shop").find(".addcart-link").click();
            });
            self._setTotalItems();
        },

        // Delete a product from the shopping cart

        deleteProduct: function() {
            var self = this;
            if (self.$formCart.length) {
                $(".shopping-cart").on("click", ".pdelete a", function(e) {
                    e.preventDefault();
                    var cart = self._toJSONObject(
                        self.storage.getItem(self.cartName)
                    );
                    var items = cart.items;
                    for (var i = 0; i < items.length; ++i) {
                        if(items[i].remove_id == $(this).data('remove-id')){
                            items.splice(i, 1);
                            break;
                        }
                    }
                    var updatedCart = {};
                    updatedCart.items = items;

                    self.storage.setItem( self.cartName, self._toJSONString(updatedCart) );
                    self._setTotalItems();
                    self.displayCart();
                    self.displayCartCheckout();
                });
            }
            formatCurrency("#stotal");
        },

        // Displays the shopping cart

        displayCart: function() {
            var self = this;
            if (this.$formCart.length) {
                var cart = this._toJSONObject(
                    this.storage.getItem(this.cartName)
                );
                var items = cart.items;
                var $tableCart = this.$formCart.find(".shopping-cart");
                var $tableCartBody = $tableCart.find("tbody");
                self._setTotalItems();

                $tableCartBody.html("");
                for (var i = 0; i < items.length; ++i) {
                    var item = items[i];
                    var remove_id = item.remove_id;
                    var product_attributes_html = "<p>";
                    var product_attributes_length = Object.keys(
                        item.product_attributes
                    ).length;
                    $.each(item.product_attributes, function(index, val) {
                        product_attributes_html +=
                            val.parent_name +
                            ": " +
                            val.name;
                        if (index < product_attributes_length - 1) {
                            product_attributes_html += ", ";
                        }
                    });
                    product_attributes_html += "</p>";
                    var sub_total = item.price * item.qty;
                    var html =
                        "<tr><td class='pdelete product-remove' style='padding: 15px 10px !important;'><a class='remove' href='' data-product='" +
                        item.product +
                        "' data-remove-id='" +
                        remove_id +
                        "'><i class='fa fa-times'></i></a></td><td class='pid' style='display:none;'>" +
                        item.id +
                        "</td><td class='pimg product-thumbnail'><img class='img' src='" +
                        item.image +
                        "' /></td><td class='pname product-name'><p>" +
                        item.product +
                        "</p>" +
                        product_attributes_html +
                        "</td>" +
                        "<td class='pprice'>" +
                        self._formatPrice(item.price) +
                        "</td>";
                    html +=
                        "<td class='pqty' style='padding: 15px 10px !important;'><input style='width:75px;' type='number'min='1' value='" +
                        item.qty +
                        "' class='qty detail-qty info-qty border radius6 text-center'/></td><td class='psub_total'>" +
                        self._formatPrice(sub_total) +
                        "</td></tr>";
                    $tableCartBody.html($tableCartBody.html() + html);
                }
                self._setTotalPrice();
            }
            formatCurrency(".pprice");
            formatCurrency(".psub_total");
        },

        // Displays the shopping cart in header

        displayCartCheckout: function() {
            var self = this;
            if (this.$formCartMini.length) {
                var cart = this._toJSONObject(
                    this.storage.getItem(this.cartName)
                );
                var items = cart.items;
                var $tableCart = this.$formCartMini.find(".shopping-cart-mini");
                var $tableCartBody = $tableCart.find("tbody");

                $tableCartBody.html("");
                for (var i = 0; i < items.length; ++i) {
                    var item = items[i];
                    var product_attributes_html = "<p class='wb-text13'>";
                    var product_attributes_length = Object.keys(
                        item.product_attributes
                    ).length;
                    $.each(item.product_attributes, function(index, val) {
                        product_attributes_html += val.parent_name + ": " + val.name;
                        if (index < product_attributes_length - 1) {
                            product_attributes_html += ", ";
                        }
                    });
                    product_attributes_html += "</p>";
                    var html =
                        "<tr class='cart_item'>" +
                        "</td>"+
                        "<td class='pname product-name text-left'>"+
                        "<p class='pimg-name wb-text13'><img class='pimg product-image wb-mr-20' src='"+ item.image +"' alt='"+ item.product +"'>"+
                        item.product + " <span class='pqty qty info-qty text-center wb-text13'>" + item.qty + "</span>" +
                        "</p>" +
                        product_attributes_html +
                        "</td>";
                    html += "<td class='pprice product-pprice wb-textright'><p class='pprice wb-text13'>" +
                        self._formatPrice(item.price) + "</p></td></tr>";
                    $tableCartBody.html($tableCartBody.html() + html);
                }
                self._setTotalPrice();
            }

            formatCurrency(".pprice");
            formatCurrency(".temporary_price");
        },

        // Displays the shopping cart in header

        displayCartValue: function() {
            if (this.$formCart.length) {
                var cart = this._toJSONObject(
                    this.storage.getItem(this.cartName)
                );
                var items = cart.items;
                items = JSON.stringify(items);
                $("#checkout-order-form").append(
                    "<input type='hidden' value='" +
                        items +
                        "' name='products' id='list_products'>"
                );
            } else if (this.$checkoutCart.length) {
                var checkoutCart = this._toJSONObject(
                    this.storage.getItem(this.cartName)
                );
                var cartItems = checkoutCart.items;
                cartItems = JSON.stringify(cartItems);
                var $cartBody = this.$checkoutCart.find("tbody");
                $("#checkout-order-form").append(
                    "<input type='hidden' value='" +
                        cartItems +
                        "' name='products' id='list_products'>"
                );
            }
        },



        // Handles the checkout form by adding a validation routine and saving user's info into the session storage

        handleCheckoutOrderForm: function() {
            var self = this;
            if (self.$checkoutOrderForm.length) {
                var $sameAsBilling = $("#same-as-billing");
                $sameAsBilling.on("change", function() {
                    var $check = $(this);
                    if ($check.prop("checked")) {
                        $("#fieldset-shipping").slideDown("normal");
                    } else {
                        $("#fieldset-shipping").slideUp("normal");
                    }
                });
            }
        },

        // Handles update qty of items

        handleUpdateQty: function() {
            var self = this;
            $('.shopping-cart').on('change','.qty', function (event) {
                var cart = self.storage.getItem(self.cartName);
                var cartObject = self._toJSONObject(cart);
                var exist = false;
                var qty = $(this).val();
                if (!isNaN(qty) || qty <= 0) {
                    qty = self._convertString(qty);
                    qty = parseInt(qty);
                    qty = Math.abs(qty);
                    if (qty <= 0) {
                        qty = qty + 1;
                    }
                    $(this).val(qty);
                }
                var id = parseInt( $(this).closest("tr").find(".pid").html() );
                var name = $(this).closest("tr").find(".pname").html();
                var price = self._convertString( self._extractPrice( $(this).closest("tr").find(".pprice") ) );
                var image = $(this).closest("tr").find(".pimg > .img").attr("src");
                var sub_total = $(this).closest("tr").find(".psub_total").html();
                var attributes = $(this).closest("tr").find(".pdelete .remove").data("attributes");
                var remove_id = $(this).closest("tr").find(".pdelete .remove").data("remove-id");
                if (self.$formCart.length) {
                    items = cartObject.items;
                    if (items.length > 0) {
                        for (var i = 0; i < items.length; ++i) {
                            var item = items[i];
                            if ( item.remove_id == remove_id ) {
                                exist = true;
                                break;
                            }
                        }
                    }
                    if (items.length > 0 && exist == true) {
                        var cartCopy = cartObject;
                        var items = cartCopy.items;
                        jQuery.each(items, function(key, val) {
                            if ( val.remove_id == remove_id ) {
                                val.qty = qty;
                                val.sub_total = val.qty * val.price;
                            }
                            var items = {
                                product: val.product,
                                price: val.price,
                                qty: val.qty,
                                image: val.image,
                                image_alt: val.image_alt,
                                id: val.id,
                                sub_total: val.sub_total
                            };
                        });
                        self.storage.setItem( self.cartName, self._toJSONString(cartCopy) );
                        self.displayCart();
                        self.displayCartCheckout();
                    }
                }
            });
        },

        // Private methods

        // Total Items

        _setTotalItems: function() {
            var self = this;
            if (self.$formCart.length) {
                var cart = self._toJSONObject(
                    self.storage.getItem(self.cartName)
                );
                $(".total_items").html(cart.items.length);
            }
        },

        // getTotalPrice

        _setTotalPrice: function() {
            var self = this;
            var total = 0;
            if (this.$formCart.length) {
                var cart = this._toJSONObject(
                    this.storage.getItem(this.cartName)
                );
                var items = cart.items;
                for (var i = 0; i < items.length; ++i) {
                    var item = items[i];
                    total += item.qty * item.price;
                }
            }
            if(this.$rules){
                if( this.$rules.minimum && (total - this.$rules.minimum < 0)){
                    this.$btn_checkout.addClass('disabled-link');
                    // this.$btn_checkout.attr('href','#');
                }else{
                    this.$btn_checkout.removeClass('disabled-link');
                    // this.$btn_checkout.on("click");
                }
                if(this.$rules.note){
                    this.$note_rules.html(this.$rules.note);
                }
            }

            $("#stotal").html( self._formatPrice(total) );
            if( $("#stotal-mini") ){
                $(".temporary_price").html( self._formatPrice(total) );

                if( $("#shipping_fee_val").text().trim() != '' && !$('#noti_coupon').hasClass('already_free_ship') ) {

                    total += parseInt( $("#shipping_fee_val").text().replace(/\D/g,'') );
                }
                $("#stotal-mini").html( self._formatPrice(total) );

                if(this.$rules && this.$rules.minimum){
                    if(total - this.$rules.minimum < 0){
                        $('#submit-order').attr('disabled', true);
                    }else{
                        $('#submit-order').attr('disabled', false);
                    }
                }

            }

            formatCurrency("#stotal");
            formatCurrency("#stotal-mini");
        },

        /* Format a number by decimal places
         * @param num Number the number to be formatted
         * @param places Number the decimal places
         * @returns n Number the formatted number
         */

        _formatNumber: function(num, places) {
            var n = num.toFixed(places);
            return n;
        },

        /* Extract the numeric portion from a string
         * @param element Object the jQuery element that contains the relevant string
         * @returns price String the numeric string
         */

        _extractPrice: function(element) {
            var self = this;
            var text = element.text();
            var price = text.replace(self.currencyString, "").replace(" ", "");
            return price;
        },

        /* Converts a numeric string into a number
         * @param numStr String the numeric string to be converted
         * @returns num Number the number
         */

        _convertString: function(numStr) {
            var num;
            if (/^[-+]?[0-9]+\.[0-9]+$/.test(numStr)) {
                num = parseFloat(numStr);
            } else if (/^\d+$/.test(numStr)) {
                num = parseInt(numStr, 10);
            } else {
                num = Number(numStr);
            }

            if (!isNaN(num)) {
                return num;
            } else {
                console.warn(numStr + " cannot be converted into a number");
                return false;
            }
        },

        /* Converts a number to a string
         * @param n Number the number to be converted
         * @returns str String the string returned
         */

        _convertNumber: function(n) {
            var str = n.toString();
            return str;
        },

        /* Converts a JSON string to a JavaScript object
         * @param str String the JSON string
         * @returns obj Object the JavaScript object
         */

        _toJSONObject: function(str) {
            var obj = JSON.parse(str);
            return obj;
        },

        /* Converts a JavaScript object to a JSON string
         * @param obj Object the JavaScript object
         * @returns str String the JSON string
         */

        _toJSONString: function(obj) {
            var str = JSON.stringify(obj);
            return str;
        },

        /* Add an object to the cart as a JSON string
         * @param values Object the object to be added to the cart
         * @returns void
         */

        _addToCart: function(values) {
            var cart = this.storage.getItem(this.cartName);
            var cartObject = this._toJSONObject(cart);
            var exist = false;
            var self = this;
            if (this.$formCart.length) {
                items = cartObject.items;
                if (items.length > 0) {
                    for (var i = 0; i < items.length; ++i) {
                        var item = items[i];
                        if(items[i].remove_id == values.remove_id){
                            exist = true;
                            break;
                        }
                    }
                }
                if (items.length > 0 && exist == true) {
                    var total = this.storage.getItem(this.total);

                    var updatedTotal = 0;
                    var totalQty = 0;
                    var cartCopy = cartObject;
                    var items = cartCopy.items;
                    jQuery.each(items, function(key, val) {
                        if(val.remove_id == values.remove_id){
                            val.qty = val.qty + values.qty;
                        }

                        var items = {
                            product: val.product,
                            price: val.price,
                            qty: val.qty,
                            image: val.image,
                            image_alt: val.image_alt,
                            id: val.id
                        };

                        self.storage.setItem( self.cartName, self._toJSONString(cartCopy) );
                    });
                } else {
                    var cartCopy = cartObject;
                    var items = cartCopy.items;
                    items.push(values);
                    this.storage.setItem( this.cartName, this._toJSONString(cartCopy) );
                }
            }
            return false;
        },

        _formatPrice: function(price) {
            // price = parseFloat(price)
            //     .toFixed(number_format)
            //     .replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
            // switch (prefix) {
            //     case 1:
            //         return unit + price;
            //         break;
            //     case 2:
            //         return price + unit;
            //         break;
            //     case 3:
            //         return unit + " " + price;
            //         break;
            //     case 4:
            //         return price + " " + unit;
            //         break;
            //     default:
            //         return price + " " + unit;
            //         break;
            // }
            return price;
        },
    };
    var shop = new $.Shop(".wb-shop");
})(jQuery);

$(".mini-cart-link").click(function(event) {
    var checkHeader = $("#shopping-cart .shop_table tbody tr").length;
    var checkBody = $("#shopping-cart-mini .shop_table tbody tr").length;
    if (checkHeader <= 0) {
        $("a.mini-cart-link").on("click", function(e) {
            $("a.mini-cart-link").attr("disabled", "disabled");
        });
    } else {
        $("#wb-modal-cart").modal("toggle");
    }
});



