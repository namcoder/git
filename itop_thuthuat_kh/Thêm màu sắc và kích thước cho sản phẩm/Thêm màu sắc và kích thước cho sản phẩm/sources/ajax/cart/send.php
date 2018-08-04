<?php
	if (isset($_SESSION['cart']))
	{
		global $db, $FullUrl, $prefix_url, $lg;

		$alias = SafeFormValue('alias');
		$stt = SafeFormValue('stt');
		// thong tin nguoi mua
		$name = SafeFormValue('name');
		$email = SafeFormValue('email');
		$phone = SafeFormValue('phone');
		$address = SafeFormValue('address');
		$note = SafeFormValue('note');
		// thong tin nguoi nhan
		$r_name = SafeFormValue('r_name');
		$r_email = SafeFormValue('r_email');
		$r_phone = SafeFormValue('r_phone');
		$r_address = SafeFormValue('r_address');

		$sql = "select * from payments where alias like '$alias'";
		$payment = $db->getRow($sql);
		// dien du lieu de chen vao bang orders
		if (isset($_SESSION['member_id'])) {
			$arr['odr_mem_id'] = $_SESSION['member_id'];
		}

		$arr['orderName'] = $name;
		$arr['orderPhone'] = $phone;
		$arr['orderEmail'] = $email;
		$arr['orderAddress'] = $address;
		$arr['odr_note'] = $note;
		$arr['receiveName'] = $r_name;
		$arr['receivePhone'] = $r_phone;
		$arr['receiveEmail'] = $r_email;
		$arr['receiveAddress'] = $r_address;
		$arr['paymentid'] = $payment['id'];
		$arr['paymenttype'] = $stt;
		$idorder = vaInsert('orders', $arr);
		
		$cart = cart::getCart();
		$tongsanpham = cart::getQuantity();
		$_SESSION["totalCart"] = $total = cart::getTotalMoney();
		$order_detail = "";
	
		for($i=0; $i<$tongsanpham; $i++){
			$r = $cart[$i];
			$img = "<img src='http://www.".GetFullDomain().'/'.$r["img"]."' alt='' width='100' />";
			$size = $r["namekichthuoc"]?"<br/>Size: ".$r["namekichthuoc"]:"";	
			$mausac = $r["namemausac"]?"<br/>Màu sắc: ".$r["namemausac"]:"";	
			$order_detail .= "<tr><td align='center'>".($i+1)."</td><td align='center'>".$r['code']."</td><td>".$img."</td><td align='center'>".$r["name"]."$size$mausac</td><td align='center'>".echoPrice(formatPrice($r['price']))."</td><td align='center'>".$r['soluong']."</td><td align='center'>".echoPrice(formatPrice($r['thanhtien']))."</td></tr>";
			// chen vao bang order_detail
			$arr_detail = array();
			$arr_detail['od_odr_id'] = $idorder;
			$arr_detail['od_pro_id'] = $r['id'];
			$arr_detail['od_pro_quantity'] = $r['soluong'];	
			$arr_detail['namekichthuoc'] = $r['namekichthuoc'];	
			$arr_detail['idkichthuoc'] = $r['idkichthuoc'];	
			$arr_detail['namemausac'] = $r['namemausac'];	
			$arr_detail['idmausac'] = $r['idmausac'];		
			$arr_detail['od_price'] = $r['price'];
			$arr_detail['od_size'] = $r['size'];
			vaInsert('order_detail', $arr_detail);
		}
		
		$sql = "select * from orders where odr_id=$idorder";
		$r = $db->getRow($sql);

		$arr['dated'] = $r['odr_insert_date'];
		$arr['idorder'] = $idorder;
		$arr['order_detail'] = $order_detail;
		$arr['total'] = echoPrice(formatPrice($total));
		$arr['website'] = GetFullDomain();
		
		if ($alias == "Bank") {
			$sql = "select * from banks where id=".$stt;
			$bank = $db->getRow($sql);
		}
		$arr['payment'] = $payment["name_$lg"].($bank?" - ".$bank["bank_$lg"]:'');
		
		$urltransfer = "";
		$returnurl = "http://www.".GetFullDomain().$prefix_url.($lg=='vn'?'hoan-tat-don-hang.html':'order-finish.html');
		$paymentlink = "http://www.".GetFullDomain().$prefix_url.($lg=='vn'?'huong-dan-thanh-toan.html':'payment-guide.html');
		$rate = Info::getInfoField('rate');

		switch ($alias) {
			case "Nganluong":
				$urltransfer = "https://www.nganluong.vn/button_payment.php?receiver=".$payment["email"]."&product_name=".$idorder."&price=".$total."&comments=".urlencode("Thanh toán đơn hàng, mã đơn hàng ".$idorder);
				break;
			case "Baokim":
				$urltransfer = 'https://www.baokim.vn/payment/customize_payment/product?business='.$payment["email"].'&product_name=Đơn hàng '.$idorder.'&product_price='.$total.'&product_quantity=1&total_amount='.$total;
				break;
			case "Paypal":
				$totalUSD = number_format($total/$rate, 2)+3;
				$url = "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&item_name=Order No ".$ordercode."&business=".$payment["email"]."&currency_code=USD&rm=2&amount=".$totalUSD;
				break;
		}

		$arr['guide'] = "<a href='$paymentlink'>".($lg=='vn'?"Xem hướng dẫn thanh toán":"View payments guide")."</a>";

		if (Email::sendEmailOrder($arr)) {
			$rel["error"] = 0;
			$rel["url"] = $urltransfer?$urltransfer:$returnurl;
		} else {
			$rel["error"] = 1;
			$message = Info::getInfoField("send_email_unsuccess_$lg");
			$rel['mess'] = $message;
			$rel["url"] = $FullUrl.$prefix_url;
		}
		echo json_encode($rel);
	}
?>