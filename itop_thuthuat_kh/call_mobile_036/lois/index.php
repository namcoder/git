<?php $hotline_call = Info::getInfoField("hotline_call"); ?>
<link href="<?=$FullUrl?>/css/callmobile.css" rel="stylesheet" type="text/css" media="all" />
		
<div id="CallPhoneOnMobile">
	<div id="nova_phone_div" class="nova-phone nova-green nova-show nova-static" style="top: 300px; left: -45px; display: block;">
		<div class="nova-ph-circle"></div>
		<div class="nova-ph-circle-fill"></div>
		<div class="nova-ph-img-circle"></div>
	</div>
</div>
<div class="hotline">
    <div id="phonering-alo-phoneIcon" class="phonering-alo-phone phonering-alo-green phonering-alo-show">
        <div class="phonering-alo-ph-circle"></div>
        <div class="phonering-alo-ph-circle-fill"></div>
        <div class="phonering-alo-ph-img-circle">
            <a class="pps-btn-img " title="Gọi ngay" href="tel:<?=$hotline_call?>"> <img src="/kcfinder/upload/images/CALLBUTTON-min.png" alt="Liên hệ" width="50" class="img-responsive"/> </a>
        </div>
    </div>
</div>