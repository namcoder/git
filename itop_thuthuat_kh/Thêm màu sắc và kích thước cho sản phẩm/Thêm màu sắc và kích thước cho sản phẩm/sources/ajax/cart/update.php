<?php
    $qtty = SafeFormValue('qty');
    $kichthuoc = SafeFormValue('proKichthuoc');
    $mausac = SafeFormValue('proMausac');
    $price = SafeFormValue('proPri');
	$id = SafeFormValue('id');
	
	cart::setQuantity($id, $qtty, $kichthuoc, $mausac);
	$arr['id'] = $id;
	$arr['qtt'] = $qtty;
    $arr['total'] = echoPrice(formatPrice($qtty*$price));
    $arr['totalAll'] = echoPrice(formatPrice(cart::getTotalMoney()));

    echo json_encode($arr);
?>

