<?php
	$cat = new Categories(currentCat());
	$cat->countView();
	$showcomment = Info::getInfoField('showcomment');
    $id = $cat->getId();
 
?>
<ul class="post-list post-view">
    <li>
        <?=$cat->getContent()!=""?$cat->getContent():SITE_NO_NEWS ?>
    </li>
</ul>
<? if( $id  == 252 ) { ?>
    <?=Info::getInfoField("intro_vn")?>;
 <? } ?>
<?php Template::UserControl('ShareSocials'); ?>
<?php if ($showcomment) Template::UserControl('Comment'); ?>
