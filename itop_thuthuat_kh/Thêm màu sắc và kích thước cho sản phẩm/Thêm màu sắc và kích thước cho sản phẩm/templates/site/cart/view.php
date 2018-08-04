<?php
	global $lg, $FullUrl, $prefix_url;
    $num = cart::getQuantity();
?>
<h3 class="title-h3 cart-title"><?=CAT_CART?> [<?=$num?>]</h3>
<div class="cart-container">
    <table class="gio-hang" style="border-collapse:collapse;">
        <tr class="cart-header">
            <td><?=NO?></td>
            <td><?=CART_IMG?></td>
            <td><?=NAME_PRODUCT?></td>
            <td><?=QUANTITY?></td>
            <td><?=PRO_PRICE?></td>
            <td><?=MONEY?></td>
        </tr>
        <?php  
            $carts = cart::getCart();      
            if ($num > 0 && $carts)
            {
                $total = cart::getTotalMoney();
                for($i=0; $i<$num; $i++){
                    $item = $carts[$i];
                    $elementId = "qtt$i";
                ?>
                <tr>
                    <td><?=$i+1?></td>
                    <td><img src="<?=$item["img"]?>" alt="<?=$item["name"]?>" /></td>
                    <td>
                        <p><?=$item["name"]?></p>
                        <?php if ($item["code"]) { ?> <p><strong><?=PRO_CODE?>:</strong> <?=$item["code"]?></p><?php } ?>
                       <?php if($item["namekichthuoc"]){ ?><span><strong>Size:</strong> <?=$item["namekichthuoc"]?></span><br/><?php } ?>
					   <?php if($item["namemausac"]){ ?><span><strong>Màu sắc:</strong> <?=$item["namemausac"]?></span> <?php } ?>
                        <p style="margin-top:15px;"><a title="<?=DEL_PRODUCT?>" href="<?=$FullUrl?>/index.php?do=cart&act=del&id=<?=$item['id']?>&idkichthuoc=<?=$item['idkichthuoc']?>&idmausac=<?=$item['idmausac'] ?>" style="color:#999; font-weight:normal;" onclick="return confirm('<?=MESS_CONFIRM_DEL?>')"><img src="<?=$FullUrl?>/images/site/xoasanpham.png"><?=DEL_PRODUCT?></a></p>
                    </td>
                    <td id="<?=$elementId?>">
                        <input type="text" onkeypress="return OnlyNumber(event)" value="<?=$item['soluong']?>" name="qt[]" onchange="return ValidateQty('<?=$elementId?>', <?=$i?>)" style="width:30px; text-align:center;" />
                        <input type="hidden" class="proId" value="<?=$item['id']?>">						
						<input type="hidden" class="proMausac" value="<?=$item['idmausac']?>">           						
						<input type="hidden" class="proKichthuoc" value="<?=$item['idkichthuoc']?>">
                        <input type="hidden" class="proPri" value="<?=$item['price']?>">
                    </td>
                    <td><?=echoPrice(formatPrice($item['price']))?></td>
                    <td ><strong id="subtotal<?=$i?>" style="color:#FF0000;"><?=echoPrice(formatPrice($item['thanhtien']))?></strong></td>
                </tr>
                <?php }  ?>
                <tr class="cart-header">
                    <td colspan="5" style="text-align:right;"><?=TOTAL?></td>
                    <td>
                        <span id="totalMoney" style="color:#FF0000;"><?=echoPrice(formatPrice($total))?></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="right" >
                        <div> <a style="margin-left:10px;" class="chitiet-sp fr" href='<?=$FullUrl.$prefix_url.($lg=='vn'?'thanh-toan.html':'checkout.html')?>'><?=ORDER?></a><a class="chitiet-sp fr" href="<?=isset($_SESSION['CONTINUE_SHOPPING_URL'])?$_SESSION['CONTINUE_SHOPPING_URL']:$FullUrl.$prefix_url?>"><?=CONTINUEXX?></a>
                        </div>
                    </td>
                </tr>
            <?php } else { ?>
                <tr class="cart-header">
                    <td colspan="6" style="text-align:center;"><?=DESC_CART?></td>
                </tr>
                <tr>
                    <td colspan="6"><a class="chitiet-sp" style="float:none; margin:auto; display:block; width:80px; text-align:center;" href='<?=isset($_SESSION['CONTINUE_SHOPPING_URL'])?$_SESSION['CONTINUE_SHOPPING_URL']:$FullUrl.$prefix_url?>'><?=BACK?></a></td>
                </tr>
            <?php } ?>
    </table>
</div>