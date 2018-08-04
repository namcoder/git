/*
 * @Author: thanhnm
 * @Date:   2017-08-16 20:59:46
 * @Last Modified by:   thanhnm
 * @Last Modified time: 2017-11-28 17:01:26
 */
var WBDatatablesClass = function () {
    this.$table = null;
    this.cur_datatatable = null;
    this.moverBtns = null;
};

WBDatatablesClass.prototype = {
    // Public methods
    init: function (table, columnDatas, options) {
        this.cur_datatatable = this.datatables(table, columnDatas, options);
        this.clickInputCheckAll(table);
        this.clickInputCheckSingleRow(table);
        this.registerElement(table);
        this.actionEvent(table);
        this.registerEvents();
        return this.cur_datatatable;
    },

    reloadData: function () {
        this.cur_datatatable.ajax.reload(null, false);
    },

    registerElement: function (table) {
        this.$table = $(table);
    },
    registerEvents: function () {
        $(document).on("click", 'a.mover', $.proxy(this.clickMoverBtn, this));
        this.scrollPaginate();
    },

    clickMoverBtn: function (event) {
        let _this = this;
        let $target = $(event.target).parent();
        let url = $target.attr('href');

        jQuery.ajax({
            url: url,
            type: 'PUT',
            dataType: 'json',
            data: {
                _token: _token
            },
            complete: function (xhr, textStatus) {
                //called when complete
            },
            success: function (data, textStatus, xhr) {
                if (data.status === 'success') {
                    successNotice('Đã di chuyển, đang cập nhật lại thông tin...');
                    _this.cur_datatatable.ajax.reload();
                } else {
                    errorNotice('Lỗi, vui lòng kiểm tra kết nối mạng!');
                }
            },
            error: function (xhr, textStatus, errorThrown) {
                errorNotice('Lỗi, vui lòng kiểm tra kết nối mạng!');
            }
        });

    },

    clickInputCheckAll: function (table) {
        $(table).on('click', 'input#inputCheckAll', function (e) {
            $(table).find('input.check_single_row').prop('checked', $(this).is(":checked"));
            if ($(this).is(":checked")) {
                $(table).find('input.check_single_row').parents('tr').addClass('success');
            } else {
                $(table).find('input.check_single_row').parents('tr').removeClass('success');
            }
            $.uniform.update();
        });
    },

    clickInputCheckSingleRow: function (table) {
        $(table).on('click', 'input.check_single_row', function (e) {
            if ($(this).is(":checked")) {
                $(this).parents('tr').addClass('success');
            } else {
                $('input#inputCheckAll').prop('checked', false);
                $(this).parents('tr').removeClass('success');
            }
            $.uniform.update();
        });
    },

    deleteCheckedRows: function (checked_ids) {
        let _this = this;
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
                url: _this.$table.data('destroymulti'),
                type: 'DELETE',
                dataType: 'json',
                data: {
                    _token: _token,
                    ids: checked_ids
                },
                success: function () {
                    swal.close();
                    _this.cur_datatatable.ajax.reload(null, false);
                },
                error: function (xhr, textStatus, errorThrown) {
                    swal.close();
                }
            });
        });
        return false;
    },
    activeCheckedRows: function (checked_ids) {
        let _this = this;
        $.ajax({
            url: _this.$table.data('updatemulti'),
            type: 'PATCH',
            dataType: 'json',
            data: {
                _token: _token,
                ids: checked_ids,
                data: {is_published: 1}
            },
            success: function (response) {
                successNotice(response.message);
                _this.cur_datatatable.ajax.reload(null, false);
            },
            error: function (xhr, textStatus, errorThrown) {
            }
        });
        return false;
    },
    deActiveCheckedRows: function (checked_ids) {
        let _this = this;
        $.ajax({
            url: _this.$table.data('updatemulti'),
            type: 'PATCH',
            dataType: 'json',
            data: {
                _token: _token,
                ids: checked_ids,
                data: {is_published: 0}
            },
            success: function (response) {
                successNotice(response.message);
                _this.cur_datatatable.ajax.reload(null, false);
            },
            error: function (xhr, textStatus, errorThrown) {
            }
        });
        return false;
    },

    updateActive: function () {
        let self = this;
        $(document).on('click', '.update_field', function (e) {
            var url_update = $(this).data('action');
            var field = $(this).data('field');
            var value = $(this).data('value') ? 0 : 1;
            var data = {_token: _token};
            data[field] = value;
            $.ajax({
                url: url_update,
                type: 'PATCH',
                dataType: 'json',
                data: data,
                success: function (response) {
                    successNotice('Cập nhập thành công.');
                    self.cur_datatatable.ajax.reload(null, false);
                },
                error: function () {
                }
            });
            return false;
        });
    },
    updatePublisedDate: function () {
        var self = this;
        $('.published_at').daterangepicker({
            "opens": "left",
            timePicker: true,
            timePickerIncrement: 30,
            singleDatePicker: true,
            showDropdowns: true,
            "timePicker24Hour": true,
            locale: {
                format: 'DD-MM-YYYY HH:mm:ss'
            }
        }, function (start) {
            var url_update = $(this)[0].element.data('action');
            var data = {
                published_at: moment(start).format('YYYY-MM-DD HH:mm:ss'),
                _token: _token
            };
            $.ajax({
                url: url_update,
                type: 'PATCH',
                dataType: 'json',
                data: data,
                success: function (response) {
                    successNotice(response.message);
                    self.cur_datatatable.ajax.reload(null, false);
                },
                error: function () {
                }
            });
        });
        return false;
    },

    scrollPaginate: function () {
        $(document).on('click', 'a.paginate_button', function () {
            if (!$(this).hasClass('disabled')) {
                $('html, body').animate({
                    scrollTop: $("body").offset().top
                }, 1000);
            }
        });
    },

    datatables: function (table, columnDatas, options = []) {
        let _this = this;
        $.extend($.fn.dataTable.defaults, {
            autoWidth: false,
            serverSide: true,
            processing: true,
            dom: '<"datatable-header"<"datatable-header-left"><"datatable-header-right"f>><"datatable-scroll"t><"datatable-footer"<"datatable-footer-left col-md-3"i><"datatable-footer-center col-md-6"p><"datatable-footer-right col-md-3"l>>',
            language: {
                search: '_INPUT_',
                searchPlaceholder: 'Nhập từ khóa...',
                lengthMenu: '<span>Hiển thị</span> _MENU_',
                info: "Hiển thị _START_ đến _END_ trong _TOTAL_ mục",
                paginate: {
                    'first': 'First',
                    'last': 'Last',
                    'next': '&rarr;',
                    'previous': '&larr;'
                }
            },
        });
        var cur_options = {
            ajax: {
                url: $(table).data('source'),
                data: {}
            },
            columns: columnDatas,
            ordering: false,
            fnInitComplete: function (oSettings, json) {
            },
            fnDrawCallback: function () {
                WBForm.init();
                _this.updatePublisedDate();
                _this.hideSortBtnAtLastAndFirstRow();
            },
        };

        $.extend(cur_options, options);
        // $.fn.dataTable.ext.errMode = 'none';
        $.fn.dataTableExt.sErrMode = 'throw'
        return $(table).DataTable(cur_options);
    },

    showTitle: function (title, edit_link, is_published = 0, published_at = '', prefix_title = '') {
        var label_status = '';
        if (!title) {
            title = '(Chưa có tiêu đề)';
        }
        title = prefix_title + title;
        // if (published_at) {
        //     label_status = (is_published == 0) ? '<span class="label bg-grey-400">Ẩn</span>' : (moment().isBefore(published_at)) ? '<span class="label bg-success-400">Đang chờ hiện</span>' : '';
        // }
        return '<a href="' + edit_link + '">' + title + '</a>&nbsp;&nbsp;' + label_status;
    },

    showThumbnail: function (thumbnail) {
        if (!thumbnail) {
            thumbnail = '/resources/shared/assets/images/no-image.png';
        }
        return '<img class="thumbnail_datatable" src="' + thumbnail + '">';
    },

    showPublish: function (is_published, published_at, route_update) {
        var label_status = '';
        var checked = '';
        var published_status = {
            'inactive': '<span class="label bg-grey-400">Ẩn</span>',
            'active': '<span class="label bg-blue">Hiện</span>',
            'schedule': '<span class="label bg-success-400">Đã lên lịch</span>'
        };
        if (published_at) {
            checked = (is_published == 1) ? 'checked' : '';
            label_status = (is_published == 0) ? published_status.inactive : (moment().isBefore(published_at)) ? published_status.schedule : published_status.active;
        }
        return '<a data-field="is_published" data-value=' + is_published + ' class="update_field" data-action="' + route_update + '">' + label_status + '</a>' + '<div><a class="published_at text-muted text-size-small" data-field="published_at" data-action="' + route_update + '">' + published_at + '</a></div>';
    },

    showSelect: function (id) {
        return '<input class="check_single_row" type="checkbox" bs-type="checkbox" name="select_data" value="' + id + '" >';
    },

    showRemoveIcon: function (remove_link) {
        return '<a href="' + remove_link + '" class="remove_item text-danger-600"><i class="icon-trash"></i></a>';
    },

    showAction: function () {
        var html = '<div class="dataTables_action_item">' +
            '<select class="action_datatable form-control" name="option_apply">' +
            '<option value="">Chọn tác vụ</option>' +
            '<option value="delete_selected">Xóa chọn</option>' +
            '</select>' +
            '</div>' +
            '<div class="dataTables_action_item">' +
            '<button type="button" class="btn btn-default button_apply">Áp dụng</button>' +
            '</div>';
        $('div.datatable-header-left').append(html);
        return;
    },

    showActionActive: function () {
        var select = $('div.datatable-header').find('select[name=option_apply]:first');
        select.append('<option value="active_selected">Hiện lựa chọn</option><option value="deactive_selected">Ẩn lựa chọn</option>');
        return;
    },

    renderSortOrderColumn: function (routes = {}) {
        let default_routes = {
            up: null,
            down: null,
            top: null,
            bottom: null
        };

        let move_to = Object.assign(default_routes, routes);
        return '<div class="mover_td"><a href="' + move_to.top + '" class="mover move_up text-default" onclick="return false;"><i class="fa fa-angle-double-up" aria-hidden="true"></i></a><a href="' + move_to.up + '" class="mover move_up text-default" onclick="return false;"><i class="fa fa-angle-up" aria-hidden="true"></i></a><a href="' + move_to.down + '" class="mover move_down text-default" onclick="return false;"><i class="fa fa-angle-down" aria-hidden="true"></i></a><a href="' + move_to.bottom + '" class="mover move_down text-default" onclick="return false;"><i class="fa fa-angle-double-down" aria-hidden="true"></i></a></div>'
    },

    hideSortBtnAtLastAndFirstRow: function () {
        let current_page = this.cur_datatatable.page.info().page + 1;
        let last_page = this.cur_datatatable.page.info().pages;
        let first_page = 1;
        if (current_page == first_page) {
            this.$table.find('tbody tr:first').find('.move_up').remove();
        }

        if (current_page == last_page) {
            this.$table.find('tbody tr:last').find('.move_down').remove();
        }
    },

    addFilter: function (element, selector) {
        var self = this;
        var html = '<div class="dataTables_filter">' + element + '</div>';
        $('div#DataTables_Table_0_filter').before(html);

        $('body').on('change', selector, function () {
            var value = $('body').find(selector).val();
            var name = $('body').find(selector).attr('name');
            var url = self.cur_datatatable.ajax.url();
            if (url.indexOf('?') === -1) {
                url += '?' + name + '=' + value;
            } else {
                url += '&' + name + '=' + value;
            }
            self.cur_datatatable.ajax.url(url).load();
        });
    },

    actionEvent: function (table) {
        var self = this;
        $(document).on('click', 'a.button_apply, button.button_apply', function () {
            let checked_rows = $('input.check_single_row:checked');
            let checked_ids = [];
            checked_rows.each(function (index) {
                checked_ids.push($(this).val());
            });
            if (checked_ids.length) {
                var option = $(document).find('select[name=option_apply]').val();
                if (option == 'delete_selected') {
                    self.deleteCheckedRows(checked_ids);
                } else if (option == 'active_selected') {
                    self.activeCheckedRows(checked_ids);
                } else if (option == 'deactive_selected') {
                    self.deActiveCheckedRows(checked_ids);
                }
            }
        });
    },

};
var WBDatatables = new WBDatatablesClass();