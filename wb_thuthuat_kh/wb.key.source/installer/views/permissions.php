<?php
	$installer = new Installer;
	$permissions = $installer->permissions();
?>

<ul class="list">
    <?php foreach ($permissions['permissions'] as $permission) { ?>
    <li class="list__item list__item--permissions <?php echo $permission['isSet'] ? 'success' : 'error'; ?>">
        <?php echo $permission['folder']; ?>
        <span>
            <i class="fa fa-fw fa-<?php echo $permission['isSet'] ? 'check-circle-o' : 'exclamation-circle'; ?>"></i>
            <?php echo $permission['permission']; ?>
        </span>
    </li>
    <?php } ?>
</ul>

<?php if ( ! isset($permissions['errors'])) { ?>
    <div class="buttons">
        <a href="<?php $installer->nextUrl(); ?>" class="button">
		    <?php $installer->nextText(); ?>
		    <i class="fa fa-angle-right fa-fw" aria-hidden="true"></i>
		</a>
    </div>
<?php }else{ ?>
	<div class="buttons">
        <a class="button" href="">Kiểm tra lại</a>
    </div>
<?php } ?>