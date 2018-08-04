<?php
	global $FullUrl, $prefix_url, $lg, $product;
	
	$relateProducts = $product->getRelate();
	$customfields = $product->getCustomField();
	$showcomment = Info::getInfoField('showcomment');	
	$thuonghieu = $product->getThuonghieu();
	$showbuybtn = Info::getInfoField('showbuybtn');
	$showcontact = Info::getInfoField('showcontact');
	$dieuhuong = Info::getInfoField("pro_footer_$lg");		
	$mausac = $product->getMausac();
	$sql = "select * from quanlymaus where id in (".$mausac.")";	
	$maus = $db->getAll($sql);		
	$kichthuocs = $product->getKichthuoc();
	$sql = "select * from quanlysizes where id in (".$kichthuocs.")";	
	$kichthuoc = $db->getAll($sql);	
	$sql = "select * from images where cid=$id and type=2 and active=1 order by num asc, id desc";	
	$imageList = $db->getAll($sql);
	$hinhanh = count($imageList[0]);
?>
<div class="container-sub-div product-detail">
	<?php 
		$name = $product->getName();
		$code = $product->getCode();
		$price = $product->getPriceSale();
		$id = $product->getID();
		$id_sp = $product->getID();
		$content = $product->getContent();
		$percent = $product->getPercent();
		$isSaleoff = $product->isSaleOff();
		$tags = $product->getTag();
		$img = $FullUrl."/".$product->getImageNoThumb();
    ?>
    <div class="pro_info_right">
    	<h1><?=$name?></h1>
        <p><?=$product->getShort()?>
		</p>	
		
		<ul class="product-infos">	
		 <?php if ($isSaleoff) { ?>
        <div class="saleoff_icon1" style="background-position: 0px -1077px !important;"><?=$percent!=100&&$percent!=0?"-".$percent."%":"Sale"?></div>
        <?php } ?>
		<?php if ($product->isSaleOff()) { ?>			
		<li style="padding-top: 6px;"><span class="original_price"><?=formatPrice($product->getPrice())?> đ</span></li>	
		<?php } ?>			
		<li>		
			<?php if ($price || ($price==0 && $showcontact)) { ?>			
			<span class="price"><?=formatPrice($price)?> đ</span>				
			<?php } ?>		
		</li>		
		<?php if ($code) { ?>		
		<li style="clear:both;"><span><?=PRO_CODE?>:</span><?=$code?></li>	
		<?php } ?>	
		
		<?php if ($thuonghieu) { ?>		
		<li><span>Thương hiệu:</span> <?=$thuonghieu["name"]?></li>     
		<?php } ?>	
		<?php if ($customfields) { 			
		foreach ($customfields as $field) {	
		if ($field["alias"] == "sizepro") {			
		$sizes = explode(',', $field["value_$lg"]);		?>		
		<?php if ($sizes) { ?>		
		<li><span><?=$field["name_$lg"]?>:</span>		
		<select id="prosize" style="display:inline-block;">		
		<?php foreach ($sizes as $size) { ?>		
		<option value="<?=trim($size)?>"><?=trim($size)?></option>		
		<?php } ?>		
		</select>			</li>	
		<?php } ?>	
		<?php } else { ?>	
		<li><span><?=$field["name_$lg"]?>:</span><?=$field["value_$lg"]?></li>	
		<?php }}} ?>		
		<li class="soluong">
			<span style="top: -5px;position: relative;">Số lượng</span><input type="text" id="sl" value="1">
		</li>
		<?php if ($maus) { ?>			
		<script>	
		$(document).ready(function() {		
		$(".change_active1").click(function(){	
		$(".list_mausac li").removeClass("active");	
		$(this).addClass("active");		
		var giatri = $(this).attr("rel");		
		$("#idMausac").val(giatri);			
		});			
		});		
		</script>		
		<div class="">		
		<p class=""><span>Chọn màu sắc: </span></p>		
		<ul class="list_mausac">				
		<?php $i=0; foreach($maus as $mau){ ?>		
		<li rel="<?=$mau["id"]?>" class="change_active1"><img alt="<?=$mau["name"]?>" src="<?=getTimThumb($mau["img"], 30,30)?>" title="<?=$mau["name"]?>"/>					
		<div class="after"></div>						</li>		
		<?php $i++; } ?>			
		<div style="clear: both;"></div>				</ul>			  </div>	
		<?php } ?>		 
		<?php if ($kichthuoc) { ?>			
		<script>			
		$(document).ready(function() {			
			$(".change_active2").click(function(){		
				$(".list_kichthuoc li").removeClass("active");	
				$(this).addClass("active");					
				var giatri = $(this).attr("rel");		
				$("#idKichthuoc").val(giatri);			
			});			
		});			
		</script>		
		<div class="">		
		<p class=""><span>Chọn kích thước: </span></p>		
		<ul class="list_kichthuoc">					
		<?php $i=0; foreach($kichthuoc as $mau){ ?>		
		<li rel="<?=$mau["id"]?>" class="change_active2">	
		<?=$mau["name"]?>						<div class="after"></div>			
		</li>				
		<?php $i++; } ?>		
		<div style="clear: both;"></div>		
		</ul>			
		</div>	
		<?php } ?>	
		<input type="hidden" value="0" id="idKichthuoc" />		  
		<input type="hidden" value="0" id="idMausac" />	
		
		<?php if ($showbuybtn) { ?>		
		<a class="buy-btn" id="buy_product" href="#"><img src="/images/mua-ngay.png"></a>	
		<?php } ?>		
		</ul>
    </div>
    <div class="pro_info_left">
		<a href="<?=$img?>" id="this_map"><img src="<?=$product->getImage(500)?>" title="<?=$name?>" alt="<?=$name?>" /></a>
    </div>
    <p class="cl"></p>
	
    <?php if ($content) { ?>
    <div class="description">
    	<?=$content?>
		<div class="dau">
		<ul class="product-infos">	
		 <?php if ($isSaleoff) { ?>
        <div class="saleoff_icon1" style="background-position: 0px -1077px !important;"><?=$percent!=100&&$percent!=0?"-".$percent."%":"Sale"?></div>
        <?php } ?>
		<?php if ($product->isSaleOff()) { ?>			
		<li style="padding-top: 6px;"><span class="original_price"><?=formatPrice($product->getPrice())?> đ</span></li>	
		<?php } ?>			
		<li>		
			<?php if ($price || ($price==0 && $showcontact)) { ?>			
			<span class="price"><?=formatPrice($price)?> đ</span>				
			<?php } ?>		
		</li>		
		<?php if ($code) { ?>		
		<li style="clear:both;"><span><?=PRO_CODE?>:</span><?=$code?></li>	
		<?php } ?>	
		
		<?php if ($thuonghieu) { ?>		
		<li><span>Thương hiệu:</span> <?=$thuonghieu["name"]?></li>     
		<?php } ?>	
		<?php if ($customfields) { 			
		foreach ($customfields as $field) {	
		if ($field["alias"] == "sizepro") {			
		$sizes = explode(',', $field["value_$lg"]);		?>		
		<?php if ($sizes) { ?>		
		<li><span><?=$field["name_$lg"]?>:</span>		
		<select id="prosize" style="display:inline-block;">		
		<?php foreach ($sizes as $size) { ?>		
		<option value="<?=trim($size)?>"><?=trim($size)?></option>		
		<?php } ?>		
		</select>			</li>	
		<?php } ?>	
		<?php } else { ?>	
		<li><span><?=$field["name_$lg"]?>:</span><?=$field["value_$lg"]?></li>	
		<?php }}} ?>		
		<li class="soluong">
			<span style="top: -5px;position: relative;">Số lượng</span><input type="text" id="sl2" value="1">
		</li>
		
		
		<?php if ($showbuybtn) { ?>		
		<a class="buy-btn" id="buy_product2" href="#"><img src="/images/mua-ngay.png"></a>	
		<?php } ?>		
		</ul>
	</div>
        <div><?=$dieuhuong?></div>
    </div>
    <?php } ?>
    <?php if (strlen($tags) > 0) { ?>
    <div class="tabwords">  
    	<strong>Tag:</strong> <?=$tags?>
    </div>
    <?php } ?>
    <?php Template::UserControl('ShareSocials', $product) ?>
</div>
<?php if ($relateProducts) { ?>
<div class="container-sub-div">
    <h3 class="title-h3"><?=CAT_RELATE_PRO?></h3>
    <div class="ct-div-sub">
        <ul class="list-sp">
            <?php foreach ($relateProducts as $key=>$obj) {
                $pro_item = new products($obj);
				include(TPL_DIR.'products/item.php');
            } ?>
        </ul>
    </div>
</div>
<?php } ?>
<script type="text/javascript">
	$(document).ready(function(e) {
		$('#buy_product').click(function(e) {	
		if($('#idKichthuoc').val()>0){
			window.location = "<?=$FullUrl?>/index.php?do=cart&act=add&id=<?=$id_sp?>&lg=<?=$lg?>&sl="+$('#sl').val()+"&idkichthuoc="+ $('#idKichthuoc').val()+"&idmausac="+ $('#idMausac').val();		
		}else{
			alert("Vui lòng chọn kích thước");
		}
		return false;	
		}); 
	});
	</script>

<?php if ($showcomment) Template::UserControl('Comment') ?>