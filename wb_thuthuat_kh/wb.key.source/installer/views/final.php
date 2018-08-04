<?php
	$installer = new Installer;
	$message = $installer->finish();
?>
<?php if (!empty($message['finalStatusMessage'])) { ?>
<p class="alert text-center">
    <strong>
	    <?php echo $message['finalStatusMessage']; ?>
	</strong>
</p>
<?php } ?>

<div class="buttons">
    <a href="<?php $installer->nextUrl(); ?>" class="button"><?php $installer->nextText(); ?></a>
</div>