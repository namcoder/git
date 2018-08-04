
<?php $hotline_call = Info::getInfoField("hotline_call"); ?>

<link href="<?=$FullUrl?>/css/callmobile.css" rel="stylesheet" type="text/css" media="all" />
<div id="CallPhoneOnMobile">
	<div id="nova_phone_div" class="nova-phone nova-green nova-show nova-static" style="top: 300px; left: -45px; display: block;">
		<div class="nova-ph-circle"></div>
		<div class="nova-ph-circle-fill"></div>
		<div class="nova-ph-img-circle"></div>
	</div>
</div>
<script type='text/javascript'>
	!function (n) {
		n(function () {
			n('#nova_phone_div').bind('click', function (o) {
				var PhoneNumber = '<?=$hotline_call?>';
				PhoneNumber = PhoneNumber.replace('Phone:', '');
				window.location.href = 'tel:' + PhoneNumber;
			})
		})
	}(jQuery);
	jQuery(window).load(function () {
		var tid = setTimeout(Ring, 5000);
		var flag = false;
		function Ring() {
			if (flag) {
				flag = !flag;
				jQuery('#nova_phone_div').addClass('nova-static');
				tid = setTimeout(Ring, 10000);
			}
			else {
				flag = !flag;
				jQuery('#nova_phone_div').removeClass('nova-static');
				tid = setTimeout(Ring, 2000);
			}
		}
	});
</script>
