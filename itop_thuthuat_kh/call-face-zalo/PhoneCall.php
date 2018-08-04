<?php
	$phone = Info::getInfoField('phone');
 ?>

<div class="phone">
	<p>
		<a href="tel:<?=$phone?>">
			<i class="fa fa-phone-square" aria-hidden="true"></i>
			<span>Giải ngân ngay<br/>
			<?=$phone?></span>
		</a>
	</p>
</div>
<style type="text/css">
	.phone{
		display: none;
	}
	@media screen and (max-width: 640px) {
		.phone{
			display: block;
			position: fixed;
			bottom: 2px;
			left: 30%;
			width: 200px;
			height: 50px;
			background: rgba(227, 135, 83, 0.80);
			border-top-left-radius: 5px;
			border-top-right-radius: 5px;
			padding-top: 5px;
			padding-left: 5px;

		}
		.phone p{
			position: relative;
		}
		.phone i{
			font-size: 40px;
			color: #Fff;
			margin-left: 3px;
		}
		.phone span{
			position: absolute;
			top: 0px;
			left: 45px;
			font-size: 15px;
			font-weight: bold;
			color: #FFF;

		}
		#cfacebook{
			display: none !important;
		}
		@media screen and (max-width: 420px) {
			.phone{
				left: 25%;
			}
		}
		
		@media screen and (max-width: 380px) {
			.phone{
				left: 23%;
			}
		}
		@media screen and (max-width: 320px) {
			.phone{
				left: 18%;
			}
		}

	}
</style>