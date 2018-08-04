<?php
	global $FullUrl, $prefix_url, $lg, $product;
	
	$relateProducts = $product->getRelate();
	$customfields = $product->getCustomField();
	$showcomment = Info::getInfoField('showcomment');
	$dieuhuong = Info::getInfoField("pro_footer_$lg");
?>
<div class="container-sub-div product-detail">
	<?php 
		$name = $product->getName();
		$code = $product->getCode();
		$price = $product->getPriceSale();
		$id = $product->getID();
		$content = $product->getContent();
		$tags = $product->getTag();
		$img = $FullUrl."/".$product->getImageNoThumb();
    ?>
    <div class="pro_info_right">
    	<h1><?=$name?></h1>
        <p><?=$product->getShort()?></p>
    </div>
    <div class="pro_info_left">
		<a href="<?=$img?>" id="this_map"><img src="<?=$product->getImage(500)?>" title="<?=$name?>" alt="<?=$name?>" /></a>
    </div>
    <p class="cl"></p>
    <ul class="product-infos">
	<?php if ($code) { ?>
        <li><span><?=PRO_CODE?>:</span><?=$code?></li>
    <?php } ?>
    <?php if ($customfields) { 
            foreach ($customfields as $field) {
                if ($field["alias"] == "sizepro") {
                    $sizes = explode(',', $field["value_$lg"]);
    ?>
        <?php if ($sizes) { ?>
        <li><span><?=$field["name_$lg"]?>:</span>
        <select id="prosize" style="display:inline-block;">
            <?php foreach ($sizes as $size) { ?>
            <option value="<?=trim($size)?>"><?=trim($size)?></option>
            <?php } ?>
        </select>
        </li>
        <?php } ?>
    <?php } else { ?>
        <li><span><?=$field["name_$lg"]?>:</span><?=$field["value_$lg"]?></li>
    <?php }}} ?>
        <?php if ($product->isSaleOff()) { ?>
        <li><span><?=PRO_ORIGINAL_PRICE?>:</span><span class="original_price"><?=echoPrice(formatPrice($product->getPrice()))?></span></li>
        <?php } ?>
        <li>
        	<span><?=PRO_PRICE?>:</span><span class="price"><?=echoPrice(formatPrice($price))?></span>
			<input type="button" onclick="location.href='<?=$FullUrl?>/index.php?do=cart&amp;act=add&amp;id=<?=$id?>&amp;lg=<?=$lg?>&amp;sl=1&amp;size='+ $('#prosize').val();" value="<?=PRO_BUY?>" class="buy-btn" />
        </li>
    </ul>
    <?php if ($content) { ?>
    <div class="description">
    	<?=$content?>
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
<?php if ($showcomment) Template::UserControl('Comment') ?>
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
    });
</script>