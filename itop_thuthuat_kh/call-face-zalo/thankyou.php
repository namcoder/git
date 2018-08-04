<?php 
	global $FullUrl, $lg;
	$thankyou = Info::getInfoField("thankyou_$lg");
?>
<div class="container" id="columns">
	<!-- row -->
	<div class="row">
		<!-- Center colunm-->
		<div class="center_column col-xs-12" id="center_column">
			<h2 class="page-heading"><span class="page-heading-title"><?=TITLE_FINISH_ORDER?></span></h2>
			<div class="page-content">
				<?=$thankyou?>
			</div>
		</div>
		<!-- ./ Center colunm -->
	</div>
	<!-- ./row-->
</div>