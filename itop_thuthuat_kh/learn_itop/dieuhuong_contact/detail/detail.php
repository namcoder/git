<?php
	global $FullUrl, $prefix_url, $lg, $product;
	$name = $product->getName();
	$code = $product->getCode();
	$price = $product->getPriceSale();
	$id = $product->getID();
	$content = $product->getContent();
	$img = $FullUrl."/".$product->getImageNoThumb();
	$isSaleoff = $product->isSaleOff();
	$short = $product->getShort();
	$available = $product->isAvailable();
	$relateProducts = $product->getRelate();
	$showcomment = Info::getInfoField('showcomment');
	$oldPrice = $product->getPrice();
	$dieuhuong = Info::getInfoField("post_footer_$lg");
?>
<div class="clearfix" id="primary_block"> 
  <!-- right infos-->
  <div id="pb-right-column">
    <!-- product img-->
    <div id="image-block">
      <a class="prettyPhoto" href="<?=$img?>"><img src="<?=$product->getImage(470)?>" alt="<?=$name?>" /></a>
    </div>
  </div>
  <div id="pb-left-column">
    <div id="short_description_block">
      <h1><?=$name?></h1>
      <div class="rte align_justify" id="short_description_content">
        <p><?=$short?></p>
      </div>
		<?php if ($code) { ?>
        <div class="rte align_justify">
        	<span><?=PRO_CODE?>:</span> <?=$code?>
      	</div>
        <?php } ?>
      <?php if ($isSaleoff && $oldPrice>0) { ?>
      <div class="price">
        <p class="our_price_display old_price_display"><span><?=PRO_ORIGINAL_PRICE?>: </span><?=echoPrice(formatPrice($oldPrice))?></p>
      </div>
      <?php } ?>
      <div class="price">
        <p class="our_price_display"> <span id="our_price_display"><span><?=$isSaleoff?PROMOTION_PRICE:PRO_PRICE?>: </span><?=echoPrice(formatPrice($price))?></span> </p>
      </div>
    </div>
    <div class="actions">
        <a href="#" onclick="return false;" style="color:#fff;" class="btn-circle first-bg"><strong><?=$available?IN_STOCK:OUT_OF_STOCK?></strong></a>
    </div>
    <?php if ($available) { ?>
    <form method="post" action="controller=cart" id="buy_block">
      <div class="product_attributes">
        <div class="add-to-box"> 
          <div class="input-qty-box">
            <div class="input">
              <ul class="range">
                <li class="item minus"><a style=" cursor:pointer">-</a></li>
                <li>
                  <input type="text" value="1" class="input-text qty text" id="qty" name="qty">
                </li>
                <li class="item plus"><a style=" cursor:pointer">+</a></li>
              </ul>
            </div>
          </div>
          <button class="btn-icon btn" id="buy_product"><i class="icon-shopping-cart"></i> <?=ADD_TO_CART?></button>
        </div>
      </div>
    </form>
    <?php } ?>
  </div>
</div>
<div class="tabs">
  <ul class="i-tab">
    <li class="active first-bg-hover"><?=PRODUCT_DETAIL?></li>
  </ul>
  <ul class="product-content">
    <li class="content-li active" style="display: block;"><?=$content?><div><?=$dieuhuong?></div></li>
  </ul>
</div>
<?php Template::UserControl('ShareSocials'); ?>
<?php if ($showcomment) Template::UserControl('Comment'); ?>
<script type="text/javascript">
	$(document).ready(function(e) {
        $('#buy_product').click(function(e) {
			window.location = "<?=$FullUrl?>/index.php?do=cart&act=add&id=<?=$id?>&lg=<?=$lg?>&sl="+ $('#qty').val();
			return false;
		});
    });
</script>
<?php if ($relateProducts) { ?>
<div class="block-news block-relate-news">
    <div class="title-box">
        <h3 class="title-carousel first-brd"><?=CAT_RELATE_PRO?></h3>
    </div>
    <?php
		$total = count($relateProducts);
		$per_row = 3;
		$row = ceil($total/3);
	?>
	<?php for ($i=0; $i<$row; $i++) { ?>
	<ul class="products-grid">
		<?php for ($j=$i*$per_row; $j<($i+1)*$per_row && $j<$total; $j++) { 
			$pro_item = new products($relateProducts[$j]);
			include(TPL_DIR.'products/item.php');
		?>
		<?php } ?>
	</ul>
	<?php } ?>
</div>
<?php } ?>