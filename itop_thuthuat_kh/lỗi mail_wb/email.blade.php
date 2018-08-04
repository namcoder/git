@extends('backend.layout.master')
@section('style')
@endsection

@section('scripts')
<script>
    $("#email_setting").addClass("active");
</script>

<script type="text/javascript">
    $(document).ready(function () {
        _token = $('meta[name=csrf-token]').attr('content');
        $(".config_email_type").change(function () {
            var value = $(this).val();
            if (value == 'gmail') {
                $('.email_host').val('smtp.gmail.com');
                $('.email_port').val('587');
                $('.email_protocol').val('tls');
                return false;
            }
            if (value == 'yahoo_mail') {
                $('.email_host').val('smtp.mail.yahoo.com');
                $('.email_port').val('587');
                $('.email_protocol').val('tls');
                return false;
            }
            if (value == 'hotmail') {
                $('.email_host').val('smtp.live.com');
                $('.email_port').val('587');
                $('.email_protocol').val('tls');
                return false;
            }
            if (value == 'zoho_mail') {
                $('.email_host').val('smtp.zoho.com');
                $('.email_port').val('587');
                $('.email_protocol').val('tls');
                return false;
            }
            if (value == 'other') {
                $('.email_host').val('');
                $('.email_port').val('');
                return false;
            }
        });

        $(".showpassword").each(function (index, input) {
            var $input = $(input);
            $("#btn_showpassword").click(function () {
                var change = "";
                if ($(this).html() === "Hiển thị") {
                    $(this).html("Ẩn đi")
                    change = "text";
                } else {
                    $(this).html("Hiển thị");
                    change = "password";
                }
                var rep = $("<input type='" + change + "' />")
                        .attr("id", $input.attr("id"))
                        .attr("name", $input.attr("name"))
                        .attr('class', $input.attr('class'))
                        .val($input.val())
                        .insertBefore($input);
                $input.remove();
                $input = rep;
            }).insertAfter($input);
        });

        $input = $(".addemail").last();
        $("#btn_addemail").click(function () {
            var rep = $("<input type='text' />")
                    .attr('class', $input.attr('class'))
                    .attr("name", $input.attr("name"))
                    .attr('placeholder', $input.attr('placeholder'))
                    .val('')
                    .insertAfter($input);
            $input = rep;
        }).insertAfter($input);
        /*
         * @return {status check send content to a email}
         * Function check send email form
         */
        var data_id = null;
        var data_url = null;
        //get data you need to action
        $('.btn_send_email').click(function () {
            data_url = $(this).attr('data-url');
            $('.send_email_to').val($(this).attr('data-email'));
            $('.send_email').val($(this).attr('data-email'));
            $('.send_email_notice_wait').hide();
            $('.send_email_notice').hide();
            $('.send_email_notice_error').hide();
        });
        $('.btn_send_email_proccess').click(function () {
            $('.btn_send_email_proccess').hide();
            $('.btn_send_email_proccess_wait').show();

            $('.send_email_notice_wait').show();
            $('.send_email_notice').hide();
            $('.send_email_notice_error').hide();

            var send_email = $('.send_email').val();
            var send_content = $('.send_content').val();

            $.post(data_url, {send_email: send_email, send_content: send_content, _token: _token}, function (g) {
                if (g.code == '1') {
                    $('.btn_send_email_proccess').show();
                    $('.btn_send_email_proccess_wait').hide();

                    $('.send_email_notice_wait').hide();
                    $('.send_email_notice').html(g.notice).show();
                } else {
                    $('.btn_send_email_proccess').show();
                    $('.btn_send_email_proccess_wait').hide();

                    $('.send_email_notice_wait').hide();
                    $('.send_email_notice_error').html(g.notice).show();
                }
            }, 'json');
            return false;
        });
    });
</script>
@endsection

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="x_panel">
            <div class="">
                <h2>Cấu hình</h2>
            </div>
            <div class="x_content">
                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    @include('backend.setting.setting_tap')
                    <div id="myTabContent" class="tab-content">
                        @if(count($errors)>0)
                        <p class="text-left text-danger">
                            @foreach($errors as $error)
                            <i class="fa fa-fw fa-exclamation-triangle"></i> {{ $error }} <br/>
                            @endforeach
                        </p>
                        @endif
                        @if(count($success)>0)
                        <p class="text-left" id="status">
                            @foreach($success as $suc)
                            <span style="color: green"><i class="fa fa-fw fa-check"></i> {{$suc}}</span>
                            @endforeach
                        </p>
                        @endif
                        <form class="form-horizontal" id="form-add-product-category" enctype="multipart/form-data" method="post" autocomplete="off">
                            {{ csrf_field() }}
                            <div class="form-group">
                                <label class="control-label col-sm-2 text-left">Tên</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="email_name" value="{{@$email_system->email_name}}" placeholder="Tên email hiển thị " required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2 text-left">Email</label>
                                <div class="col-sm-4">
                                    <input type="email" class="form-control"  name="email_account" value="{{@$email_system->email_account}}" placeholder="name@example.com" required />
                                </div>
                                <label class="control-label col-sm-2 text-left">Mật khẩu email</label>
                                <div class="col-sm-4">
                                    <input  type="password"  class="form-control showpassword" name="email_password" value="{{@$email_system->email_password}}" placeholder="Email password" required>
                                    <button type="button" id="btn_showpassword" class="btn btn-default " style="margin-top:-34px;float:right;">Hiển thị</button>
        
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2 text-left">Loại email</label>
                                <div class="col-sm-4">
                                    <select class="form-control select2 config_email_type" name="email_type">
                                        <option value="0">Chọn loại email</option>
                                        <option value="gmail" <?php echo @$email_system->email_type == 'gmail' ? 'selected' : '' ?> >Gmail</option>
                                        <option value="yahoo_mail" <?php echo @$email_system->email_type == 'yahoo_mail' ? 'selected' : '' ?>  >Yahoo mail</option>
                                        <option value="hotmail" <?php echo @$email_system->email_type == 'hotmail' ? 'selected' : '' ?>>Hotmail</option>
                                        <option value="zoho_mail" <?php echo @$email_system->email_type == 'zoho_mail' ? 'selected' : '' ?> >Zoho mail</option>
                                        <option value="other" <?php echo @$email_system->email_type == 'other' ? 'selected' : '' ?>>Khác</option>
                                    </select>
                                </div>
                                <label class="control-label col-sm-2 text-left">Địa chỉ Host</label>
                                <div class="col-sm-4">
                                    <input class="form-control email_host" name="email_host" value="{{@$email_system->email_host}}" placeholder="smtp.example.com" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2 text-left">Port</label>
                                <div class="col-sm-4">
                                    <input class="form-control email_port" name="email_port" value="{{@$email_system->email_port}}" placeholder="587" required />
                                </div>
                                <label class="control-label col-sm-2 text-left">Giao thức</label>
                                <div class="col-sm-4">
                                    <input class="form-control email_protocol" name="email_protocol" value="{{@$email_system->email_protocol?$email_system->email_protocol:'tls'}}" placeholder="tls" required />
                                </div>
                            </div>
                            
                            <hr>
                            <div class="form-group">
                                <h2 class="title_seo">Email nhận thông tin từ hệ thống</h2>
                                <label class="control-label col-sm-2 text-left">Email</label>
                                <div class="col-sm-10 website_email">
                                    <input  type="email"  class="form-control addemail" name="email_receive_notice" value="{{@$email_receive_notice}}" placeholder="gmail@gmail.com">
                                    <!--<button type="button" id="btn_addemail" class="btn btn-default " style="margin-top:-34px;float:right;"><span class="glyphicon glyphicon-plus"></span>Thêm</button>-->
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="text-center">
                                    <a href="" class="btn btn-default">Quay lại</a>
                                    <button type="submit" class="btn btn-success">Cập nhật</button>
                                </div>
                            </div>
                        </form>
<!--                        <div class="title_left">
                            <button class="btn btn-success btn_send_email" 
                                    data-email="{{$email_account or ''}}"
                                    data-url="/admin/setting/email/send"
                                    data-toggle="modal" data-target="#myModalSendMail"><i class="fa fa-check"></i> Gửi email thử
                            </button>
                        </div>-->
                    </div>
                </div>

            </div>

            <div class="modal fade" id="myModalSendMail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Kiểm tra gửi email</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="control-label col-sm-3 text-left">Từ email</label>
                                    <div class="col-sm-9" style="margin-bottom: 8px;">
                                        <input class="form-control send_email_to" placeholder="name@example.com" disabled="disabled"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label class="control-label col-sm-3 text-left">Gửi đến email</label>
                                    <div class="col-sm-9" style="margin-bottom: 8px;">
                                        <input class="form-control send_email" placeholder="name@example.com" required />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label class="control-label col-sm-3 text-left">Với nội dung </label>
                                    <div class="col-sm-9" style="margin-bottom: 8px;">
                                        <textarea class="form-control send_content" placeholder="Nội dung bạn muốn gửi"></textarea>

                                    </div>
                                </div>
                            </div>
                            <span class="label label-info send_email_notice_wait" style="display: none;">Đang kiểm tra...</span>
                            <div class="alert alert-success send_email_notice" style="display: none;"></div>
                            <div class="alert alert-danger send_email_notice_error" style="display: none;"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-success btn_send_email_proccess" >Đồng ý</button>
                            <button type="button" class="btn btn-success btn_send_email_proccess_wait" disabled="disabled" style="display: none;">Đợi...</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection