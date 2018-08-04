<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Mail\OrderNotificationToAdmin;
use App\Mail\OrderStatusNotification;
use App\Models\Frontend\WbOption;
use App\Models\Frontend\WbOrders;
use App\Models\Frontend\WbOrdersDetails;
use App\Models\Frontend\WbOrderSettingLangs;
use App\Models\Frontend\WbOrderSettings;
use App\Models\Frontend\WbPayments;
use App\Models\Frontend\WbProducts;
use App\Plugins\NL_CheckOutV3;
use App\Repositories\Contracts\OptionRepositoryInterface;
use App\Repositories\Contracts\OrderRepositoryInterface;
use Illuminate\Http\Request;
use Mail;
use Session;
use Cookie;
use App\Plugins\Local;

define('URL_API', 'https://www.nganluong.vn/checkout.api.nganluong.post.php'); // Đường dẫn gọi api

class CartController extends Controller {

//

    private $theme;
    protected $optionRepository;
    protected $orderRepository;

    public function __construct(OptionRepositoryInterface $option, OrderRepositoryInterface $order) {
        $this->optionRepository = $option;
        $this->orderRepository = $order;
        $this->theme = config('app.theme');
    }

    public function addCart(Request $request) {
        
    }

    public function indexCart(Request $request) {
//
        $views = array();
        $views['website_phone'] = (WbOption::getOption('website_phone') != null) ? json_decode(WbOption::getValue('website_phone')) : [];
        $views['website_address'] = (WbOption::getOption('website_address') != null) ? json_decode(WbOption::getValue('website_address')) : [];
        $views['website_name'] = (WbOption::getOption('website_name') != null) ? json_decode(WbOption::getValue('website_name')) : [];

        if(session()->exists('website_language')){
            $language = session()->get('website_language');
        }else{
            try{
                $language = WbOption::getValue('lang_default');
            }catch (\Exception $e){
                $language = 'vi';
            }
        }

        if ($request->has('act')) {
            if ($request->act == 'del') {
                $carts = json_decode($request->cookie('carts'));
                $product_id = $request->id;
                foreach ($carts as $index => $cart) {
                    if ($cart->product_id == $product_id) {
                        unset($carts[$index]);
                    } else {
                        $product = WbProducts::getProductByProductId($cart->product_id, $language);
                        if ($product->product_lang_sale_price > 0) {
                            $cart->price = $product->product_lang_sale_price;
                        } elseif ($product->product_lang_original_price > 0) {
                            $cart->price = $product->product_lang_original_price;
                        } else {
                            $cart->price = $product->product_lang_note_price;
                        }
                    }
                }
                $carts = array_values($carts);
                $views['carts'] = array();
                if ($carts != null) {
                    foreach ($carts as $cart) {
                        $product = WbProducts::getProductByProductId($cart->product_id, $language);
                        if ($product->product_lang_sale_price > 0) {
                            $price = $product->product_lang_sale_price;
                        } elseif ($product->product_lang_original_price > 0) {
                            $price = $product->product_lang_original_price;
                        } else {
                            $price = $product->product_lang_note_price;
                        }
                        array_push($views['carts'], [
                            'product' => $product,
                            'num' => $cart->num,
                            'price' => $price,
                        ]);
                        $cart->price = $price;
                    }
                }
                if (app()->getLocale() == 'vi') {
                    return redirect('/gio-hang.html')->withCookie(cookie('carts', json_encode($carts), 2880));
                } elseif (app()->getLocale() == 'en') {
                    return redirect('/cart.html')->withCookie(cookie('carts', json_encode($carts), 2880));
                }
                //return response(view('theme.' . $this->theme . '.cart', $views))->withCookie(cookie('carts', json_encode($carts), 2880));
            }
            elseif ($request->act == 'update') {
                $carts = json_decode($request->cookie('carts'));
                $product_id = $request->id;
                $num = $request->qty;
                foreach ($carts as $cart) {
                    if ($cart->product_id == $product_id) {
                        $cart->num = $num;
                    }
                    $product = WbProducts::getProductByProductId($cart->product_id, WbOption::getValue('lang_default'));
                    if ($product->product_lang_sale_price > 0) {
                        $cart->price = $product->product_lang_sale_price;
                    } elseif ($product->product_lang_original_price > 0) {
                        $cart->price = $product->product_lang_original_price;
                    } else {
                        $cart->price = $product->product_lang_note_price;
                    }
                }

                return response($carts)->withCookie(cookie('carts', json_encode($carts), 2880));
            }
            elseif ($request->act == 'add') {
                if ($request->cookie('carts') != null) {
                    $carts = json_decode($request->cookie('carts'));
                    foreach ($carts as $c) {
                        try {
                            $product = WbProducts::getProductByProductId($c->product_id, $language);
                            if ($product->product_lang_sale_price > 0) {
                                $price = $product->product_lang_sale_price;
                            } elseif ($product->product_lang_original_price > 0) {
                                $price = $product->product_lang_original_price;
                            } else {
                                $price = $product->product_lang_note_price;
                            }
                            array_push($data_return, [
                                'product' => $product,
                                'num' => $c->num,
                                'price' => $price,
                            ]);
                            $c->price = $price;
                        } catch (\Exception $e) {

                        }
                    }
                    foreach ($carts as $cart) {
                        if ($cart->product_id == $request->id) {
                            if ($request->has('qty')) {
                                $cart->num += $request->qty;
                            } else {
                                $cart->num += 1;
                            }
                            $data_return = array();

                            if ($request->has('link') && $request->link == true) {
                                if ($language == 'en') {
                                    return redirect('/cart.html')->withCookie(cookie('carts', json_encode($carts), 2880));
                                } else {
                                    return redirect('/gio-hang.html')->withCookie(cookie('carts', json_encode($carts), 2880));
                                }
                            }

                            return response($data_return)->withCookie(cookie('carts', json_encode($carts), 2880));
                        }
                    }
                    try {
                        $product = WbProducts::getProductByProductId($request->id, $language);
                        if ($product->product_lang_sale_price > 0) {
                            $price = $product->product_lang_sale_price;
                        } elseif ($product->product_lang_original_price > 0) {
                            $price = $product->product_lang_original_price;
                        } else {
                            $price = $product->product_lang_note_price;
                        }
                        if ($request->has('qty')) {
                            array_push($carts, [
                                'product_id' => $request->id,
                                'num' => $request->qty,
                                'price' => $price,
                            ]);
                        } else {
                            array_push($carts, [
                                'product_id' => $request->id,
                                'num' => 1,
                                'price' => $price,
                            ]);
                        }
                    } catch (\Exception $e) {

                    }

                    if ($request->has('link') && $request->link == true) {
                        if (app()->getLocale() == 'en') {
                            return redirect('/cart.html')->withCookie(cookie('carts', json_encode($carts), 2880));
                        } else {
                            return redirect('/gio-hang.html')->withCookie(cookie('carts', json_encode($carts), 2880));
                        }
                    }

                    $carts = json_decode(json_encode($carts));
                    $data_return = array();
                    foreach ($carts as $c) {
                        try {
                            $product = WbProducts::getProductByProductId($c->product_id);
                            if ($product->product_lang_sale_price > 0) {
                                $price = $product->product_lang_sale_price;
                            } elseif ($product->product_lang_original_price > 0) {
                                $price = $product->product_lang_original_price;
                            } else {
                                $price = $product->product_lang_note_price;
                            }
                            array_push($data_return, [
                                'product' => $product,
                                'num' => $c->num,
                                'price' => $price,
                            ]);
                        } catch (\Exception $e) {

                        }
                    }

                    return response($data_return)->withCookie(cookie('carts', json_encode($carts), 2880));
                }
                else {
                    try {
                        $product = WbProducts::getProductByProductId($request->id, $language);
                        if ($product->product_lang_sale_price > 0) {
                            $price = $product->product_lang_sale_price;
                        } elseif ($product->product_lang_original_price > 0) {
                            $price = $product->product_lang_original_price;
                        } else {
                            $price = $product->product_lang_note_price;
                        }
                        if ($request->has('qty')) {
                            $carts = array([
                                'product_id' => $request->id,
                                'num' => $request->qty,
                                'price' => $price,
                            ]);
                        } else {
                            $carts = array([
                                'product_id' => $request->id,
                                'num' => 1,
                                'price' => $price,
                            ]);
                        }
                    } catch (\Exception $e) {

                    }

                    if ($request->has('link') && $request->link == true) {
                        if (app()->getLocale() == 'en') {
                            return redirect('/cart.html')->withCookie(cookie('carts', json_encode($carts), 2880));
                        } else {
                            return redirect('/gio-hang.html')->withCookie(cookie('carts', json_encode($carts), 2880));
                        }
                    }

                    $data_return = array();
                    foreach ($carts as $c) {
                        try {
                            $product = WbProducts::getProductByProductId($c['product_id']);
                            if ($product->product_lang_sale_price > 0) {
                                $price = $product->product_lang_sale_price;
                            } elseif ($product->product_lang_original_price > 0) {
                                $price = $product->product_lang_original_price;
                            } else {
                                $price = $product->product_lang_note_price;
                            }
                            array_push($data_return, [
                                'product' => $product,
                                'num' => $c['num'],
                                'price' => $price,
                            ]);
                        } catch (\Exception $e) {

                        }
                    }

                    return response($data_return)->withCookie(cookie('carts', json_encode($carts), 2880));
                }
                return false;
            }
        }

        if ($request->isMethod('get')) {

            $views['carts'] = array();
            $carts = array();
            if ($request->cookie('carts') != null) {
                $carts = json_decode($request->cookie('carts'));
                foreach ($carts as $index => $cart) {
                    try {
                        $product = WbProducts::getProductByProductId($cart->product_id, $language);
                        if ($product->product_lang_sale_price > 0) {
                            $price = $product->product_lang_sale_price;
                        } elseif ($product->product_lang_original_price > 0) {
                            $price = $product->product_lang_original_price;
                        } else {
                            $price = $product->product_lang_note_price;
                        }
                        array_push($views['carts'], [
                            'product' => $product,
                            'num' => $cart->num,
                            'price' => $price,
                        ]);
                        $cart->price = $price;
                    } catch (\Exception $e) {
                        unset($carts[$index]);
                    }
                }
                $carts = array_values($carts);
            }
            
            return response(view('cart.cart', $views))->withCookie(cookie('carts', json_encode($carts), 2880));
        } elseif ($request->isMethod('post')) {
            
        }
    }
    
    //check 
    protected function addShip(Request $request){
        
        $data_re = $request->input();
        
        
        $city = Local::getCity($data_re['city']);
        $shop_address = WbOption::getValue('shop_local');
        $shop_city = null;
        $shop_district = null;
        if($shop_address!=null){
            $shop_address = json_decode($shop_address, true);
            if(count($shop_address)>0){
                foreach($shop_address as $value){
                    $shop_city = $value['city'];
                    $shop_district = $value['district'];
                }
                
            }else{
                return 0;
            }
            
        }
        
        
        
        $data = array(
            "pick_province" => $shop_city,
            "pick_district" => $shop_district,
            "province" => $city,
            "district" => $data_re['district'],
            "address" => $data_re['address'],
            "weight" => $data_re['total_weigh'],
            "value" => $data_re['total_price'],
        );
        
        //dd($data);
        
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://services.giaohangtietkiem.vn/services/shipment/fee?" . http_build_query($data),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_HTTPHEADER => array(
                "Token: 88d012F490fA6853eAfe7FDb3E1863EFD88ad46c",
            ),
        ));

        $response = curl_exec($curl);
        curl_close($curl);
        
        $value = json_decode($response, true);
        $json = array(
            'ship'  => $value['fee']['fee'],
            'address'=> $data_re['address'].','.$data_re['district'].','.$city
        );
        return $json;
    }

    public function cart(Request $request) {
        app()->setLocale('en');
        $request->session()->put('website_language', 'en');
        return $this->indexCart($request);
    }

    public function giohang(Request $request) {
        app()->setLocale('vi');
        $request->session()->put('website_language', 'vi');
        return $this->indexCart($request);
    }

    public function indexPayment(Request $request) {
        if(session()->exists('website_language')){
            $language = session()->get('website_language');
        }else{
            try{
                $language = Option::getValue('lang_default');
            }catch (\Exception $e){
                $language = 'vi';
            }
        }

        if (WbOrderSettings::getOrderSettingCustomer() == null) {
            $data_info_customer = WbOrderSettings::create([
                        'post_type' => 'info_customer',
                        'post_is_shows' => 1,
            ]);
            WbOrderSettingLangs::create([
                'post_lang_content' => json_encode([
                    ['name' => 'Họ tên', 'key' => 'ho_ten', 'type' => 'name', 'require' => true, 'isshow' => true],
                    ['name' => 'Số điện thoại', 'key' => 'so_dien_thoai', 'type' => 'phone', 'require' => true, 'isshow' => true],
                    ['name' => 'Địa chỉ', 'key' => 'dia_chi', 'type' => 'text', 'require' => true, 'isshow' => true],
                    ['name' => 'Ghi chú', 'key' => 'ghi_chu', 'type' => 'textarea', 'require' => false, 'isshow' => true],
                ]),
                'post_id' => $data_info_customer->id,
                'lang_code' => 'vi',
                'lang_name' => 'Tiếng việt',
            ]);
            WbOrderSettingLangs::create([
                'post_lang_content' => json_encode([
                    ['name' => 'Full name', 'key' => 'full_name', 'type' => 'name', 'require' => true, 'isshow' => true],
                    ['name' => 'Phone number', 'key' => 'phone_number', 'type' => 'phone', 'require' => true, 'isshow' => true],
                    ['name' => 'Address', 'key' => 'address', 'type' => 'text', 'require' => true, 'isshow' => true],
                    ['name' => 'Note', 'key' => 'note', 'type' => 'textarea', 'require' => false, 'isshow' => true],
                ]),
                'post_id' => $data_info_customer->id,
                'lang_code' => 'en',
                'lang_name' => 'English',
            ]);
        }

        $views = array();
        $local = Local::getLocal();
        $views['local'] = $local;
        $views['website_phone'] = (WbOption::getOption('website_phone') != null) ? json_decode(WbOption::getValue('website_phone')) : [];
        $views['website_address'] = (WbOption::getOption('website_address') != null) ? json_decode(WbOption::getValue('website_address')) : [];
        $views['website_name'] = (WbOption::getOption('website_name') != null) ? json_decode(WbOption::getValue('website_name')) : [];

        if ($request->cookie('carts') == null) {
            if (app()->getLocale() == 'en') {
                return redirect('/cart.html');
            } else {
                return redirect('/gio-hang.html');
            }
        }

        if ($request->isMethod('get')) {
            $views['carts'] = array();
            if ($request->cookie('carts') != null) {
                $carts = json_decode($request->cookie('carts'));
                foreach ($carts as $cart) {
                    try {
                        array_push($views['carts'], [
                                'product' => WbProducts::getProductByProductId($cart->product_id, $language),
                            'num' => $cart->num,
                        ]);
                    } catch (\Exception $e) {
                        
                    }
                }
            }
            $views['payments'] = WbPayments::getPayments(app()->getLocale());

            $customer_info = json_decode(WbOrderSettings::getOrderSettingLangCustomer(app()->getLocale())->post_lang_content); //WbCart::getInfoCustomerShow();
            foreach ($customer_info as $key => $value) {
                if (!$value->isshow) {
                    unset($customer_info[$key]);
                }
            }
            $views['customer_info'] = array_values($customer_info);
            
            $carts = json_decode(Cookie::get('carts'), true);

            
            $total_price = 0;
            $total_weigh = 0;
            if(count($carts)>0){
                foreach($carts as $value){
                    $value['price'] = (int)$value['price'];
                    $total_price += $value['num'] * $value['price'];
                    $product_weight = WbProducts::where('product_id', $value['product_id'])
                            ->first(array('product_weigh'));
                    if($product_weight->product_weigh!=null){
                        $total_weigh += $product_weight->product_weigh;
                    }
                }
            }

            $views['total_price'] = $total_price;
            $views['total_weigh'] = $total_weigh;
            
        
            
            return view('cart.checkout', $views);
            
        } elseif ($request->isMethod('post')) {
            $data = $request->input();

            try{
                $customer_address = $data['dia_chi'][2].'__'.$data['dia_chi'][1].'__'.Local::getCity($data['dia_chi'][0]);
            }catch (\Exception $e){
                $customer_address = '';
            }

            $info = json_decode(WbOrderSettings::getOrderSettingLangCustomer(app()->getLocale())->post_lang_content); //WbCart::getInfoCustomerShow();
            foreach ($info as $key => $value) {
                if($value->type == 'address'){
                    $dataEmail = array();
                    foreach ($request->input($value->key) as $item => $val){
                        if($item == 0){
                            array_push($dataEmail,Local::getCity($val));
                        }
                        else{
                            array_push($dataEmail,$val);
                        }
                    }
                    $value->value = implode(" ",array_reverse($dataEmail));
                }
                else{
                    $value->value = $request->input($value->key);
                }
                unset($value->require);
                unset($value->isshow);
            }
            $carts = json_decode($request->cookie('carts'));
            if ($request->cookie('carts') != null) {
                try {
                    if(json_encode($info) === 0){
                        $info = [];
                    }
                    $order = WbOrders::create([
                                'order_customer' => json_encode($info),
                                'order_payment' => $request->alias,
                                'order_status' => 'new',
                                'payment_address'   => $customer_address,
                                'shipping_fee'      => $data['total_ship'],
                                'final_amount'      => floatval(preg_replace('/,/s', '', $data['total_price']))
                                
                    ]);
                    $views['order'] = $order;
                    session()->flash('order_id', $order->id);
                    $carts = json_decode($request->cookie('carts'));

                    foreach ($carts as $cart) {
                        WbOrdersDetails::create([
                            'order_id' => $order->id,
                            'product_id' => $cart->product_id,
                            'number_product' => $cart->num,
                        ]);
                    }

                    $views['carts'] = array();
                    if ($carts != null) {
                        foreach ($carts as $cart) {
                            $product = WbProducts::getProductByProductId($cart->product_id, $language);
                            if ($product->product_lang_sale_price > 0) {
                                $price = $product->product_lang_sale_price;
                            } elseif ($product->product_lang_original_price > 0) {
                                $price = $product->product_lang_original_price;
                            } else {
                                $price = $product->product_lang_note_price;
                            }
                            array_push($views['carts'], [
                                'product' => $product,
                                'num' => $cart->num,
                                'price' => $price,
                            ]);
                            $cart->price = $price;
                        }
                    }
                    $views['message_payment_success'] = WbPayments::getPaymentSuccess(app()->getLocale());

                    foreach ($info as $value) {
                        $views['message_payment_success']->post_lang_content = str_replace('[[' . $value->key . ']]', '<strong>' . $value->value . '</strong>', $views['message_payment_success']->post_lang_content);
                    }

                    $payment_method = WbPayments::getPaymentByID($request->alias);
                    if ($payment_method->post_lang_title == 'Thanh toán qua Ngân Lượng') {
                        $account = json_decode($payment_method->post_lang_content);

                        $nlcheckout = new NL_CheckOutV3($account->MERCHANT_ID, $account->MERCHANT_PASS, $account->RECEIVER, URL_API);

                        $total_amount = 0;
                        foreach ($views['carts'] as $item) {
                            $total_amount += intval($item['num'], 10) * $item['price'];
                        }
                        $array_items = array();
                        $payment_method = $request->option_payment;
                        $bank_code = $request->bankcode;
                        $order_code = $order->id;
                        $payment_type = '';
                        $discount_amount = 0;
                        $order_description = '';
                        $tax_amount = 0;
                        $fee_shipping = $data['total_ship'];
                        $return_url = asset('/thanh-toan-online-thanh-cong.html');
                        $cancel_url = urlencode(asset('/payment-online-cancel.html?orderid=' . $order_code));
                        if (app()->getLocale() == 'en') {
                            $return_url = asset('/payment-online-success.html');
                            $cancel_url = urlencode(asset('/huy-thanh-toan-online.html?orderid=' . $order_code));
                        }


                        $buyer_fullname = '';
                        $buyer_email = 'sale@imgroup.com';
                        $buyer_mobile = '';
                        $buyer_address = '';
                        foreach ($info as $value) {
                            if ($value->type == 'name') {
                                $buyer_fullname = $value->value;
                            } else if ($value->type == 'email') {
                                $buyer_email = $value->value;
                            } else if ($value->type == 'phone') {
                                $buyer_mobile = $value->value;
                            } else if ($value->type == 'address') {
                                $buyer_address = $value->value;
                            }
                        }

                        if ($payment_method != '') {
                            if ($payment_method == "VISA") {
                                $nl_result = $nlcheckout->VisaCheckout($order_code, $total_amount, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items, $bank_code);
                            } elseif ($payment_method == "NL") {
                                $nl_result = $nlcheckout->NLCheckout($order_code, $total_amount, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
                            } elseif ($payment_method == "ATM_ONLINE" && $bank_code != '') {
                                $nl_result = $nlcheckout->BankCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
                            } elseif ($payment_method == "NH_OFFLINE") {
                                $nl_result = $nlcheckout->officeBankCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
                            } elseif ($payment_method == "ATM_OFFLINE") {
                                $nl_result = $nlcheckout->BankOfflineCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
                            } elseif ($payment_method == "IB_ONLINE") {
                                $nl_result = $nlcheckout->IBCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
                            } elseif ($payment_method == "CREDIT_CARD_PREPAID") {
                                $nl_result = $nlcheckout->PrepaidVisaCheckout($order_code, $total_amount, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items, $bank_code);
                            }
                            //var_dump($nl_result); die;
                            if ($nl_result->error_code == '00') {
                                //Cập nhât order với token  $nl_result->token để sử dụng check hoàn thành sau này

                                return redirect((string) $nl_result->checkout_url);
                            } else {
                                return $nl_result->error_message;
                            }
                        } else {
                            return "<h3> Bạn chưa nhập đủ thông tin khách hàng </h3>";
                        }
                    }
                    return response(view('cart.checkout_success', $views))->withCookie(\Cookie::forget('carts'));
                } catch (\Exception $e) {
                    session()->forget('order_id');
                    return redirect('/');
                }
            }
            return redirect('/');
        }
    }

    public function payment(Request $request) {
        app()->setLocale('en');
        $request->session()->put('website_language', 'en');
        return $this->indexPayment($request);
    }

    public function thanhtoan(Request $request) {
        app()->setLocale('vi');
        $request->session()->put('website_language', 'vi');
        return $this->indexPayment($request);
    }

    public function indexPaymentOnlineSuccess(Request $request) {
        if(session()->exists('website_language')){
            $language = session()->get('website_language');
        }else{
            try{
                $language = Option::getValue('lang_default');
            }catch (\Exception $e){
                $language = 'vi';
            }
        }

        $payment_method = WbPayments::getPaymentNganLuong();
        $account = json_decode($payment_method->post_lang_content);

        $nlcheckout = new NL_CheckOutV3($account->MERCHANT_ID, $account->MERCHANT_PASS, $account->RECEIVER, URL_API);
        $nl_result = $nlcheckout->GetTransactionDetail($request->token);
        $views = array();
        if ($nl_result) {
            $nl_errorcode = (string) $nl_result->error_code;
            $nl_transaction_status = (string) $nl_result->transaction_status;
            if ($nl_errorcode == '00') {
                if ($nl_transaction_status == '00') {
                    //trạng thái thanh toán thành công
                    try {
                        WbOrders::updateByID((int) $nl_result->order_code, [
                            'order_status' => 'new',
                            'payment_status' => true,
                        ]);
                    } catch (\Exception $e) {
                        
                    }

                    $carts = json_decode($request->cookie('carts'));

                    $views['carts'] = array();
                    if ($carts != null) {
                        foreach ($carts as $cart) {
                            $product = WbProducts::getProductByProductId($cart->product_id, $language);
                            if ($product->product_lang_sale_price > 0) {
                                $price = $product->product_lang_sale_price;
                            } elseif ($product->product_lang_original_price > 0) {
                                $price = $product->product_lang_original_price;
                            } else {
                                $price = $product->product_lang_note_price;
                            }
                            array_push($views['carts'], [
                                'product' => $product,
                                'num' => $cart->num,
                                'price' => $price,
                            ]);
                        }
                    }

                    $views['message_payment_success'] = WbPayments::getPaymentSuccess(app()->getLocale());
                    //dd($nl_result->order_code);
                    //dd(WbOrders::getOrderById($nl_result->order_code));
                    $info = json_decode(WbOrders::getOrderById($nl_result->order_code)->order_customer);
                    foreach ($info as $value) {
                        $views['message_payment_success']->post_lang_content = str_replace('[[' . $value->key . ']]', '<strong>' . $value->value . '</strong>', $views['message_payment_success']->post_lang_content);
                    }
                    session()->flash('order_id', $nl_result->order_code);

                    return response(view('cart.checkout_success', $views))->withCookie(\Cookie::forget('carts'));
                }
            } else {
                echo $nlcheckout->GetErrorMessage($nl_errorcode);
            }
        }
        dd((int) $nl_result->order_code);
    }

    public function paymentOnlineSuccess(Request $request) {
        app()->setLocale('en');
        $request->session()->put('website_language', 'en');
        return $this->indexPaymentOnlineSuccess($request);
    }

    public function thanhtoanonlinethanhcong(Request $request) {
        app()->setLocale('vi');
        $request->session()->put('website_language', 'vi');
        return $this->indexPaymentOnlineSuccess($request);
    }

    public function indexPaymentOnlineCancel(Request $request) {
        try {
            WbOrders::updateByID($request->orderid, ['order_status' => 'canceled']);
        } catch (\Exception $e) {
            
        }
        if (app()->getLocale() == 'en') {
            return redirect('/cart.html');
        }

        return redirect('/gio-hang.html');
    }

    public function paymentOnlineCancel(Request $request) {
        app()->setLocale('en');
        return $this->indexPaymentOnlineCancel($request);
    }

    public function huythanhtoanonline(Request $request) {
        app()->setLocale('vi');
        return $this->indexPaymentOnlineCancel($request);
    }

    public function sendNoticeEmail(Request $request) {
        session()->forget('order_status');
        session()->forget('order_id');
        $order = $this->orderRepository->find($request->order_id);
        $order_customer_info = json_decode($order->order_customer);
        $email_recieve_notice = $this->optionRepository->getValue('email_receive_notice');
        $email = array();
        try {
            $email_system = $this->optionRepository->findWhere(['option_key' => 'email_system'])->first();
            $email_system = json_decode($email_system->option_value);
            if ($email_system->email_account !== '') {
                \Config::set('mail.username', $email_system->email_account);
                \Config::set('mail.password', $email_system->email_password);
                \Config::set('mail.host', $email_system->email_host);
                \Config::set('mail.port', $email_system->email_port);
//                \Config::set('mail.encryption', $email_system->email_protocol);

                (new \Illuminate\Mail\MailServiceProvider(app()))->register();

            }
            Mail::to($email_recieve_notice)->send(new OrderNotificationToAdmin($order));
            array_push($email, $email_recieve_notice);
        } catch (\Exception $e) {
            
        }
        foreach ($order_customer_info as $key => $customer_info) {
            if ($customer_info->type == 'email') {
                Mail::to($customer_info->value)->send(new OrderStatusNotification($order));
                array_push($email, $customer_info->value);
            }
        }

        return $email;
    }

}
