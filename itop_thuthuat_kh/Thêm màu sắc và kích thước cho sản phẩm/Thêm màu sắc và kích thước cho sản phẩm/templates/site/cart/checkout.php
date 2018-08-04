<?php 
	global $FullUrl, $prefix_url, $lg, $payments, $banklist; 
    $num = cart::getQuantity();
	$emailrequire = Info::getInfoField('emailrequire');
?>
<link href="<?php echo $FullUrl; ?>/css/jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css" />
<link href="<?php echo $FullUrl; ?>/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
<script src="<?=$FullUrl?>/fancybox/jquery.fancybox-1.3.4.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		$("#this_map").fancybox({
			openEffect  : 'none',
			closeEffect	: 'none',
	
			helpers : {
				title : {
					type : 'over'
				}
			}
		});
    	$( "#tabsmethod" ).tabs();
    });
</script>
 <form action="" id="formOrder" class="webForm" enctype="multipart/form-data" style="width:100%">
<h3 class="title-h3 cart-title"><?=TITLE_CHECK_OUT?></h3>
<div class="cart-container">
	<?php if ($num>0) { ?>
   
        <div class="left">
            <table style="float:left;">
                <tr>
                    <td>
                        <label><?=LABEL_NAME?> <span class="required">*</span></label>
                        <input id="orderName" type="text" value="<?=isset($_SESSION['member_name'])?$_SESSION['member_name']:''?>" class="validate[required]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><?=LABEL_PHONE?> <span class="required">*</span></label>
                        <input id="orderPhone" type="text" value="<?=isset($_SESSION['member_phone'])?$_SESSION['member_phone']:''?>" class="validate[required]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><?=LABEL_ADDRESS?> <span class="required">*</span></label>
                        <input id="orderAddress" type="text" value="<?=isset($_SESSION['member_address'])?$_SESSION['member_address']:''?>" class="validate[required]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><?=LABEL_EMAIL?> <?=$emailrequire?'<span class="required">*</span>':'('.NOT_REQUIRE.')'?></label>
                        <input id="orderEmail" type="text" value="<?=isset($_SESSION['member_email'])?$_SESSION['member_email']:''?>" class="validate[<?=$emailrequire?'required,':''?>custom[email]]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><?=SITE_NOTE?> (<?=NOT_REQUIRE?>)</label>
                        <textarea id="orderMessage" cols="5" rows="5" style="height:70px;"></textarea>
                        <input type="hidden" id="lgorder" value="<?=$lg?>" />
                    </td>
                </tr>
            </table>
        </div>
        <?/* <p class="cl"></p> */?>
        <div class="left" style="">
            <p class="checkoutTitle" style="text-align:center;"><?=PLEASE_CHOOSE_PAYMENT?></p>
           <?/*  <p><img src="<?=$FullUrl?>/images/payment-arrow.gif" alt="" width="100"/></p> */?>
         <? /*   <div id="tabsmethod" style="text-align:center;">
                <ul>
                <?php foreach ($payments as $i=>$payment) { ?>
                    <li><a href="#tabs-<?=$i?>"><?=$payment["name_$lg"]?></a></li>
                <?php } ?>
                </ul>
				<?php foreach ($payments as $i=>$payment) { 
					$alias = $payment['alias'];
					$name = $payment["name_$lg"];
					$content = $payment["content_$lg"];
				?>
                	<div id="tabs-<?=$i?>">
                    	<?php if ($alias=='Bank') { 
							if ($banklist) {
						?>
                        <ul class="list_bank">
                          <?php foreach($banklist as $num=>$bank){ 
						  	$id = $bank["id"];
							$bankname = $bank["bank_$lg"];
						  ?>
                          <li>
                            <label for="bank<?=$id?>"> <img src="<?=$FullUrl."/".$bank["img"]?>" title="<?=$bankname?>" alt="<?=$bankname?>" /> </label>
                            <input type="radio" <?=($num==0)?'checked="checked"':''?> name="<?=$alias?>" id="bank<?=$id?>" value="<?=$id?>" class="bank_radi" />
                          </li>
                          <?php } ?>
                        </ul>
                        <?php } ?>
                        <?php } else if ($alias=='Tructiep') { ?>
							<?php if (file_exists($payment["img"])) { ?>
                            <a href="<?=$FullUrl.'/'.$payment["img"]?>" id="this_map"><img src="<?=$FullUrl.'/'.$payment["img"]?>" title="<?=$name?>" alt="<?=$name?>"  /></a>
                            <?php } ?>
                        <?php } else if ($alias=='Nganluong') { ?>
                        <div><img src="<?=$FullUrl?>/images/site/nganluong.jpg" alt="Nganluong" /></div>
                        <?php } else if ($alias=='Baokim') { ?>
                        <div><img src="<?=$FullUrl?>/images/site/baokim.jpg" alt="Baokim" /></div>
                        <?php } else if ($alias=='Paypal') { ?>
                        <div><img src="<?=$FullUrl?>/images/site/paypal.jpg" alt="Paypal" /></div>
                        <?php } ?>
                        <div><?=$content?></div>
                        <?php if (($alias!="Nganluong" && $alias!="Baokim" && $alias!="Paypal")) { ?>
                        <input style="background:#FF4500; font-size:20px; font-family:Tahoma, Geneva, sans-serif;" type="submit" value="<?=CHOOSE_THIS_METHOD?>" onclick="return checkoutSubmit('<?=$alias?>')" />
                        <?php } ?>
                        <?php if (($alias=="Nganluong" || $alias=="Baokim" || $alias=="Paypal") && $payment["email"]) { ?>
                        <input type="submit" value="<?=PRO_BUY?>" onclick="return checkoutSubmit('<?=$alias?>')" />
                        <?php } ?>
                    </div>
                  <?php } ?>
            </div> */?>
			  <div id="tabsmethod1" style="text-align:center;">
                
				<?php foreach ($payments as $i=>$payment) { 
					$alias = $payment['alias'];
					$name = $payment["name_$lg"];
					$content = $payment["content_$lg"];
				?>
					<div class="tong">
					<input type="radio" name="Bank" id="bank<?=$i?>" value="<?=$alias?>" class="bank_radi" />
					<p <?/* href="#tabs-<?=$i?>" */?> class="a"><label for="bank<?=$i?>"><?=$payment["name_$lg"]?></label></p>
                	<div id="tabs-<?=$i?>">
                    	<?php if ($alias=='Bank') { 
							if ($banklist) {
						?>
                        <ul class="list_bank">
                          <?php foreach($banklist as $num=>$bank){ 
						  	$id = $bank["id"];
							$bankname = $bank["bank_$lg"];
						  ?>
                         <?/*  <li>
                            <label for="bank<?=$id?>"> <img src="<?=$FullUrl."/".$bank["img"]?>" title="<?=$bankname?>" alt="<?=$bankname?>" /> </label>
                            <input type="radio" <?=($num==0)?'checked="checked"':''?> name="<?=$alias?>" id="bank<?=$id?>" value="<?=$id?>" class="bank_radi" />
                          </li> */?>
                          <?php } ?>
                        </ul>
                        <?php } ?>
                        <?php } else if ($alias=='Tructiep') { ?>
							<?php if (file_exists($payment["img"])) { ?>
                            <a href="<?=$FullUrl.'/'.$payment["img"]?>" id="this_map"><img src="<?=$FullUrl.'/'.$payment["img"]?>" title="<?=$name?>" alt="<?=$name?>"  /></a>
                            <?php } ?>
                        <?php } else if ($alias=='Nganluong') { ?>
                        <div><img src="<?=$FullUrl?>/images/site/nganluong.jpg" alt="Nganluong" /></div>
                        <?php } else if ($alias=='Baokim') { ?>
                        <div><img src="<?=$FullUrl?>/images/site/baokim.jpg" alt="Baokim" /></div>
                        <?php } else if ($alias=='Paypal') { ?>
                        <div><img src="<?=$FullUrl?>/images/site/paypal.jpg" alt="Paypal" /></div>
                        <?php } ?>
                        <div><?=$content?></div>
                        <?php /*  if (($alias!="Nganluong" && $alias!="Baokim" && $alias!="Paypal")) { ?>
                        <input style="background:#FF4500; font-size:20px; font-family:Tahoma, Geneva, sans-serif;" type="submit" value="<?=CHOOSE_THIS_METHOD?>" onclick="return checkoutSubmit('<?=$alias?>')" />
                        <?php } */ ?>
                       
                    </div>
					</div>
                  <?php } ?>
            </div>
        </div>
    
    <?php } ?>
    <p class="cl"></p>
    <table class="gio-hang" style="margin-top:10px; border-collapse:collapse;">
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
			$num = cart::getQuantity();
            if ($num>0 && $carts)
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
                    </td>
                    <td><?=$item['soluong']?></td>
                    <td><?=echoPrice(formatPrice($item['price']))?></td>
                    <td ><strong style="color:#FF0000;"><?=echoPrice(formatPrice($item['thanhtien']))?></strong></td>
                </tr>
                <?php }  ?>
                <tr class="cart-header">
                    <td colspan="5" style="text-align:right;"><?=TOTAL?></td>
                    <td>
                        <span style="color:#FF0000;"><?=echoPrice(formatPrice($total))?></span>
                    </td>
                </tr>
				<tr class="cart-header">
                    <td colspan="6" style="text-align:right;">
						<input style="background:#FF4500; font-size:20px; font-family:Tahoma, Geneva, sans-serif;" type="submit" value="ĐẶT HÀNG" onclick="return checkoutSubmit()" />
					</td>
                </tr>
            <?php } else { ?>
                <tr class="cart-header">
                    <td colspan="6" style="text-align:center;"><?=DESC_CART?></td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align:center;"><a class="mua-sp" style="float:none; margin:auto; display:block;" href='<?=isset($_SESSION['CONTINUE_SHOPPING_URL'])?$_SESSION['CONTINUE_SHOPPING_URL']:$FullUrl.$prefix_url?>'><?=BACK?></a></td>
                </tr>
            <?php } ?>
    </table>
</div>
</form>