$("#contact_form").submit(function(event) {
        var self = this;
        var valid = true;
        $(this)
            .find(".edit_message")
            .remove();
        $(this)
            .find(":input[type=text]")
            .each(function() {
                var input = $(this);
                var type = input.data("type");
                var msg = input.data("message");
                switch (type) {
                    case "email":
                        if (!validateEmail(input.val())) {
                            $("<span class='edit_message'/>")
                                .text(msg)
                                .insertAfter(input);
                            valid = false;
                        }
                        break;
                    case "phone":
                        if (!validatePhone(input.val())) {
                            $("<span class='edit_message'/>")
                                .text(msg)
                                .insertAfter(input);
                            valid = false;
                        }
                        break;
                    default:
                        if (!input.val()) {
                            $("<span class='edit_message'/>")
                                .text(msg)
                                .insertAfter(input);
                            valid = false;
                        }
                        break;
                        return valid;
                }
            });
        if (valid == false) {
            return false;
        }
    });
