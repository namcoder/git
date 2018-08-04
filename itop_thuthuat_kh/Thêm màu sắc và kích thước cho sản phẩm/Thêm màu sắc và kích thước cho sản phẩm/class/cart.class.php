<?php
class cart{
	public static function addProduct($proid, $soluong, $kichthuoc, $mausac){
		if ($proid<1) return;
		if ($soluong<0) {
			$soluong = 1;
		}

		$carts = array();
		if (isset($_SESSION['cart'])){
			$carts = $_SESSION['cart'];
		}

		$hadproduct = 0;
		if ($carts[0]) {
			for ($i=0; $i<count($carts); $i++) {
				if (($carts[$i]['proid']==$proid && $carts[$i]['kichthuoc']==$kichthuoc && $carts[$i]['mausac']==$mausac )|| ($carts[$i]['proid']==$proid &&($carts[$i]['kichthuoc']==0 || $carts[$i]['kichthuoc']==NULL) && ($carts[$i]['mausac']==0 || $carts[$i]['mausac']==NULL))){	
					$hadproduct = 1;
					$carts[$i]['soluong'] += $soluong;
					$carts[$i]['mausac'] = $mausac;
					$carts[$i]['kichthuoc'] = $kichthuoc;
				}
			}
		}
		if ($hadproduct == 0)
		{
			if ($carts[0]) {
				$next = count($carts);
			} else {
				$next = 0;
			}
			
			$carts[$next]['proid'] = $proid;
			$carts[$next]['soluong'] = $soluong;
			$carts[$next]['kichthuoc'] = $kichthuoc;
			$carts[$next]['mausac'] = $mausac;
			
		}

		$_SESSION['cart'] = $carts;
	}
	
	public static function delProduct($proid, $kichthuoc, $mausac) {
		$carts = array();

		if (isset($_SESSION['cart'])) {
			$carts = $_SESSION['cart'];
		} else return;

		$newcart = array();
		$index = 0;
		foreach ($carts as $cart) {
			if ($cart['proid']!=$proid || ($cart['proid']==$proid && $cart['kichthuoc']!=$kichthuoc) || ($cart['proid']==$proid && $cart['mausac']!=$mausac)) {
				$newcart[$index] = $cart;
				$index++;
			}
		}	
		// dung de khoi tao index
		$_SESSION['cart'] = $newcart;
	}

	public static function getQuantity() {
		$soluong = 0;
		$carts = array();

		if (!isset($_SESSION['cart'])) {
			return 0;
		} else {
			$carts = $_SESSION['cart'];

			foreach ($carts as $cart) {
				if ($cart['proid'] > 0) {
					$soluong++;
				}
			}
		}
	
		return $soluong;
	}
	
	public static function setQuantity($proid, $quantity, $kichthuoc, $mausac){
		$carts = array();
		if (isset($_SESSION['cart'])) {
			$carts = $_SESSION['cart'];
		} else return;
		
		foreach ($carts as $i=>$cart) {
			if ($carts[$i]['proid']==$proid && $carts[$i]['kichthuoc']==$kichthuoc && $carts[$i]['mausac']==$mausac) {	
				$carts[$i]['soluong'] = $quantity;
			}
		}
		// dung de khoi tao index
		$_SESSION['cart'] = $carts;
	}
	// day la ham de hien thi cart
	public static function getCart() {
		global $lg, $db;

		$carts = array();
		if (isset($_SESSION['cart'])) {
			$carts = $_SESSION['cart'];
		}
		
		
		if ($carts) {
			$strwhere = '';
			foreach ($carts as $cart) {
				$strwhere .= ($strwhere == '')?( ' id = ' . $cart["proid"] ): ' or id = ' . $cart["proid"];
			}

			$sql = "select * from products where " . $strwhere;
			$products =  $db->getAll($sql);	

			$viewcart = array();
			if ($products) {
				foreach ($carts as $i=>$cart) {
					foreach ($products as $product) {
						$product = new products($product);
						if ($product->getID() == $cart['proid']) {
							$sql = "select * from quanlymaus where id=".$cart['mausac'];
							$mausac = $db->getRow($sql);
							$sql = "select * from quanlysizes where id=".$cart['kichthuoc'];
							$kichthuoc = $db->getRow($sql);
							$price = $product->getPriceSale();
							$viewcart[$i]['id'] = $product->getID();						
							$viewcart[$i]['name'] = $product->getName();
							$viewcart[$i]['price'] = $price;
							$viewcart[$i]["img"] = $product->getImage(100);
							$viewcart[$i]['soluong'] =$cart['soluong'];
							$viewcart[$i]['code'] =$product->getCode();
							$viewcart[$i]['namekichthuoc'] = $kichthuoc['name'];
							$viewcart[$i]['idkichthuoc'] = $cart['kichthuoc'];
							$viewcart[$i]['namemausac'] = $mausac['name'];
							$viewcart[$i]['idmausac'] = $cart['mausac'];
							$viewcart[$i]['thanhtien'] = $cart['soluong'] * $price;
							
							if ($cart['size'] != "undefined")
								$viewcart[$i]['size'] = $cart['size'];
							else
								$viewcart[$i]['size'] = "";
						}
					}
				}
			}			
			return $viewcart;
		} else return;
	}
	
	public static function getTotalMoney(){
		global $lg, $db;

		$carts = array();
		if (isset($_SESSION['cart'])) {
			$carts = $_SESSION['cart'];
		} else return 0;

		if ($carts) {
			$strwhere = '';
			foreach ($carts as $cart) {
				$strwhere .= ($strwhere == '')?( ' id = ' . $cart["proid"] ): ' or id = ' . $cart["proid"];
			}

			$sql = "select * from products where " . $strwhere;
			$products = $db->getAll($sql);	
			$total = 0;
			
			if ($products) {
				foreach ($carts as $cart) {
					foreach ($products as $product) {
						$product = new products($product);
						if ($product->getID() == $cart['proid']) {
							$price = $product->getPriceSale();
							$total += $cart['soluong']*$price;
						}
					}
				}
			}
		
			return $total;
		} else return 0;
	}
}
?>