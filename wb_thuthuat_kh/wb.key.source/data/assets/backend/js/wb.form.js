/*
 * @Author: thanhnm
 * @Date:   2017-08-16 20:59:46
 * @Last Modified by:   thanhnm
 * @Last Modified time: 2018-01-16 17:20:52
 */

var WBFormClass = function() {
	this.init();
};
WBFormClass.prototype = {
	// Public methods
	init: function() {
		this.singleDatePicker();
		this.multiSelect();
		this.selectize();
		this.ckeditor();
		this.initGallery();
		this.uniform();
		this.switch();
	},
	singleDatePicker: function() {
		$('input[bs-type="singleDatePicker"]').each(function() {
			if($(this).val() != ''){
			$(this).val(moment($(this).val()).format('DD-MM-YYYY HH:mm:ss'));
			}
		});
		$('input[bs-type="singleDatePicker"]').daterangepicker({
            "opens": "left",
            timePicker: true,
            timePickerIncrement: 30,
            singleDatePicker: true,
            showDropdowns: true,
            "timePicker24Hour": true,
            locale: {
                format: 'DD-MM-YYYY HH:mm'
            },
        });
        $('.remmove_published_datetime').on('click', function(event) {
        	event.preventDefault();
        	$(this).closest('#published_datetime').find('input').val(moment().format('DD-MM-YYYY 00:00'));
        });
	},

	initCkeditor: function(id,type='basic') {
		CKEDITOR.replace(id,{customConfig: cke_conf_path + '/config_full.js'});
	},

	ckeditor: function() {
		$('.ckeditor-full').each(function(){
			CKEDITOR.replace($(this).attr('id'),{customConfig: cke_conf_path + '/config_full.js'});
		});
		$('.ckeditor-basic').each(function(){
			CKEDITOR.replace($(this).attr('id'),{customConfig: cke_conf_path + '/config_min.js'});
		});
	},

	initGallery: function() {
		$('.media-container').on('mouseover', '.media-item', function() {
			$(this).find('.close').show();
		})
		$('.media-container').on('mouseleave', '.media-item', function() {
			$(this).find('.close').hide();
		})

		var target_preview = $('.media-container');
		var target_input = $('.wrap-media').find('input');
		if (target_input.val()) {
			$.each(target_input.val().split(','), function(index, val) {
				target_preview.append('<div class="media-item"><img class="img-thumbnail" src="' + val + '""><span class="close"><i class="fa fa-remove"></i></span></div>');
			});
		}
		var self = this;
		$('.media-container').on('click', '.close', function(event) {
			var target_media=$(this).closest('.wrap-media');
			$(this).parent().remove();
			self.updateValueGallery(target_media);
		});
	},
	updateValueGallery: function(target_media) {
		var data_images = [];
		$.each(target_media.find('.media-container img'), function() {
			data_images.push($(this).attr("src"));
		});
		target_media.find('input').val(data_images);
	},

	multiSelect: function() {
		$('select[bs-type=multiSelect]').selectize({
			plugins: ['remove_button'],
			persist: false,
			maxItems: null,
			create: false
		});
	},
	selectize: function() {
		$('select[bs-type=selectize]').selectize({
			create: true
		});
	},
	uniform: function() {
		$('input[bs-type=checkbox]').uniform({
			radioClass: 'choice'
		});
		$('input[bs-type=radio]').uniform({
			radioClass: 'choice'
		});
        $("input[bs-type=file]").uniform({
            fileButtonClass: 'action btn bg-pink-400'
        });
	},
	switch: function() {
		$("input[bs-type=switch]").bootstrapSwitch();
	},
	showError: function(formSubmit, data) {
		$.each(data.responseJSON, function(key, value) {
			var input = formSubmit.find('input[name=' + key + ']').closest('.form-group').addClass('has-error');
			input.find('.help-block').html(value);
		});
		var error_count = Object.keys(data.responseJSON).length;
		formSubmit.find('.alert-danger').parent().remove();
		formSubmit.prepend('<div class="col-xs-12"><div class="alert alert-danger alert-styled-left alert-bordered"><button type="button" class="close" data-dismiss="alert"><span>×</span><span class="sr-only">Close</span></button>Có ' + error_count + ' lỗi xảy ra trên trang</div></div>');
	},
	// showSuccess: function(formSubmit) {
	// 	formSubmit.prepend('<div class="col-xs-12"><div class="alert alert-success alert-styled-left alert-arrow-left alert-bordered"><button type="button" class="close" data-dismiss="alert"><span>×</span><span class="sr-only">Close</span></button>Cập nhật thành công. Xem chúng ở website hoặc tạo mới</div></div>');
	// },

	// Private methods

	_empty: function() {

	},
};

var WBForm = new WBFormClass();