<?php

namespace App\Http\Controllers\Backend\Setting;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Backend\WbOption;
use PHPMailer;
use App\Repositories\Contracts\OptionRepositoryInterface;

class EmailController extends Controller
{
    /**
     * View variable for email blade template
     */
    private $view;

    /**
     * Option repository
     */
    protected $website_option;

    public function __construct(OptionRepositoryInterface $option_repository)
    {
        $this->middleware('admin');
        $this->view = [
            'title' => 'Cấu hình website - Admin Panel',
        ];
        $this->website_option = $option_repository;
    }

    public function emails(Request $request)
    {
        $views = array();
        if (WbOption::getValue('email_system') == null) {
            $email_system = array();
            $email_system['email_name'] = '';
            $email_system['email_account'] = '';
            $email_system['email_password'] = '';
            $email_system['email_type'] = '';
            $email_system['email_host'] = '';
            $email_system['email_port'] = '';
            $email_system['email_protocol'] = '';
            WbOption::insertValue('email_system', json_encode($email_system));
        }
        if (WbOption::getValue('email_receive_notice') == null) {
            $email_receive_notice = array();
            WbOption::insertValue('email_receive_notice', json_encode($email_receive_notice));
        }
        if ($request->isMethod('get')) {
            $email_system = json_decode(WbOption::getValue('email_system')->option_value);
            $email_receive_notice = json_decode(WbOption::getValue('email_receive_notice')->option_value);
            $views['email_system'] = $email_system;
            $views['email_receive_notice'] = $email_receive_notice;
            $views['errors'] = array();
            $views['success'] = array();

            return view('backend.setting.email', $views);
        } elseif ($request->isMethod('post')) {
            $email_receive_notice = array_diff(array_unique($request->email_receive_notice), [""]);
            if (!WbOption::updateValue('email_receive_notice', json_encode($email_receive_notice))) {
                $views['errors'] = array('Lỗi không truy cập được database');
                goto error;
            }
            $views['email_receive_notice'] = $email_receive_notice;

            $email_system = array();
            $email_system['email_name'] = $request->email_name;
            $views['email_name'] = $request->email_name;

            $email_system['email_account'] = $request->email_account;
            $views['email_account'] = $request->email_account;

            $email_system['email_password'] = $request->email_password;
            $views['email_password'] = $request->email_password;

            $email_system['email_type'] = $request->email_type;
            $views['email_type'] = $request->email_type;

            $email_system['email_host'] = $request->email_host;
            $views['email_host'] = $request->email_host;

            $email_system['email_port'] = $request->email_port;
            $views['email_port'] = $request->email_port;

            $email_system['email_protocol'] = $request->email_protocol;
            $views['email_protocol'] = $request->email_protocol;

            if (!WbOption::updateValue('email_system', json_encode($email_system))) {
                $views['errors'] = array('Lỗi không truy cập được database');
                goto error;
            }

            $views['success'] = array('Bạn đã cập nhật thành công');
            return view('backend.setting.email', $views);
        }
        error : {
            DB::rollback();
            $email_system = json_decode(WbOption::getValue('email_system')->option_value);
            $email_receive_notice = json_decode(WbOption::getValue('email_receive_notice')->option_value);
            $views['email_name'] = $email_system->email_name;
            $views['email_account'] = $email_system->email_account;
            $views['email_password'] = $email_system->email_password;
            $views['email_type'] = $email_system->email_type;
            $views['email_host'] = $email_system->email_host;
            $views['email_port'] = $email_system->email_port;
            $views['email_protocol'] = $email_system->email_protocol;
            $views['email_receive_notice'] = $email_receive_notice;
            $views['success'] = array();
            return view('backend.setting.email', $views);
        }
    }

    public function sendEmailTest(Request $request)
    {
        if ($request->isMethod('get')) {
        } elseif ($request->isMethod('post')) {
            $code = 0;
            $notice = null;
            $email_send = $request->input();
            if (WbOption::getValue('email_system') == null) {
                $code = '0';
                $notice = 'Email gửi chưa có, vui lòng thêm mới <a href="">tại đây</a>';
                goto notice;
            }
            $email_system = json_decode(WbOption::getValue('email_system')->option_value);
            if ($email_system->email_account == '') {
                $code = '0';
                $notice = 'Email gửi chưa có, vui lòng thêm mới <a href="">tại đây</a>';
                goto notice;
            }

            date_default_timezone_set('Etc/UTC');

            //Create a new PHPMailer instance
            $mail = new PHPMailer;

            //Tell PHPMailer to use SMTP
            $mail->isSMTP();
            $mail->CharSet = 'UTF-8';
            //Set the hostname of the mail server
            $mail->Host = $email_system->email_host;
            // use
            // $mail->Host = gethostbyname('smtp.gmail.com');
            // if your network does not support SMTP over IPv6
            //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
            $mail->Port = $email_system->email_port;

            //Set the encryption system to use - ssl (deprecated) or tls
            $mail->SMTPSecure = $email_system->email_protocol;

            //Whether to use SMTP authentication
            $mail->SMTPAuth = true;

            //Username to use for SMTP authentication - use full email address for gmail
            $mail->Username = $email_system->email_account;

            //Password to use for SMTP authentication
            $mail->Password = $email_system->email_password;

            //Set who the message is to be sent from
            $mail->setFrom($email_system->email_account, $email_system->email_name);

            //Set who the message is to be sent to
            $mail->addAddress($email_send['send_email'], 'Your name');

            //Set the subject line
            $mail->Subject = env('APP_NAME') . 'Nội dung kiểm tra email (code-' . uniqid() . ')';

            //Read an HTML message body from an external file, convert referenced images to embedded,
            //convert HTML into a basic plain-text alternative body
            $mail->msgHTML($email_send['send_content']);

            //Replace the plain text body with one created manually
            $mail->AltBody = 'Đây là nội dung kiểm tra gửi email';


            //send the message, check for errors
            if (!$mail->send()) {
                $code = '0';
                $notice = 'Có lỗi: ' . $mail->ErrorInfo;
                goto notice;
            } else {
                $code = '1';
                $notice = 'Thành công, vui lòng kiểm tra email "' . $email_send['send_email'] . '" nội dung mail có thể đến chậm nhất là 5 phút sau.';
                goto notice;
            }
            notice: {
                return response()->json(array(
                            'code' => $code,
                            'notice' => $notice
                ));
            }
        }
    }

    public function create()
    {
        $views = array();
        $email_system = $this->website_option->getValue('email_system');
        if ($email_system == null) {
            $key = 'email_system';
            $value =    '{
                            "email_name":"",
                            "email_account":"",
                            "email_password":"",
                            "email_type":"",
                            "email_host":"",
                            "email_port":"",
                            "email_protocol":""
                        }';
            $this->website_option->create(['option_key' => $key, 'option_value' => $value]);
            $email_system = $value;
        }
        if ($this->website_option->exists('option_key', 'email_receive_notice')  == false) {
            $this->website_option->create([
                    'option_key'   => 'email_receive_notice',
                    'option_value' => ''
                ]);
        }
        $email_receive_notice = $this->website_option->getValue('email_receive_notice');
            
        $email_system = json_decode($email_system);
        $views['email_system'] = $email_system;
        $views['email_receive_notice'] = $email_receive_notice;
        $views['errors'] = array();
        $views['success'] = array();
        return view('backend.setting.email', $views);
    }

    public function update(Request $request)
    {
        $data = $request->except('_token');
        $email_system_value = json_encode(array_only($data, ['email_name', 'email_account', 'email_password', 'email_type', 'email_host', 'email_port', 'email_protocol']));

        $this->website_option->updateOrCreate(
            ['option_key' => 'email_system'],
            ['option_value' => $email_system_value]
        );

        $this->website_option->updateOrCreate(
            ['option_key' => 'email_receive_notice'],
            ['option_value' => $data['email_receive_notice']]
        );

        return redirect()->back();
    }
}
