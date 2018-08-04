/*
 * @Author: thanhnm
 * @Date:   2017-08-16 20:59:46
 * @Last Modified by:   thanhnm
 * @Last Modified time: 2017-08-30 00:21:17
 */

var WBClass = function() {
	this.init();
};
WBClass.prototype = {
	// Public methods
	init: function() {
		this.activeMenu();
	},
	activeMenu: function() {
		var url = window.location.pathname,
			urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
		$('.navigation-main a').each(function() {
			if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
				$(this).parent('li').addClass('active');
			}
		});

	},
};

var WB = new WBClass();

var removeArrayItem = function (array, value) {
	if (array.constructor !== Array ) {
		return array;
	}

	let index = array.indexOf(value);

	if (index > -1) {
		array.splice(index, 1);
	}

	return array;
};

var currencyFormat = function (value) {
	if (isNaN(value)) {
		return 0;
	} else {
		return String(value).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
	}
};

$(document).on('click', 'a.remove_item', function (e) {
    var url_remove = $(this).attr('href');
    var row = $(this).parents('tr:first');
    var data = $(this).data();
    data._token = _token;
    swal({
        showLoaderOnConfirm: true,
        closeOnConfirm: false,
        title: "Bạn có chắc thực hiện thao tác xóa không ?",
        text: "Bạn sẽ không thể lấy lại được dữ liệu này !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#FF7043",
        cancelButtonText: "Không",
        confirmButtonText: "Có"
    }, function () {
        $.ajax({
            url: url_remove,
            type: 'DELETE',
            dataType: 'json',
            data: data,
            success: function (response) {
                swal.close();
                if(data.redirect){
                    window.location = data.redirect;
                }else if(response.redirect){
                    window.location = response.redirect;
                }else if(response.reload){
                    WBDatatables.reloadData();
                }else{
                    row.remove();
                }
            },
            error: function () {
                swal.close();
            }
        });
    });
    return false;
});
$(document).on('click', 'span.remove_thumb', function (e) {
    $(this).parent().children('input').val('');
    $(this).parent().children('img').attr("src",'http://placehold.it/50x50');
    return false;
});

