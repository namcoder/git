<?php
	$installer = new Installer;
?>

<?php
	$data = $installer->requirements();
	$requirements = $data['requirements'];
	$phpSupportInfo = $data['phpSupportInfo'];
?>

<?php foreach ($requirements['requirements'] as $type => $requirement) { ?>
    <ul class="list">
        <li class="list__item list__title <?php echo $phpSupportInfo['supported'] ? 'success' : 'error'; ?>">
            <strong><?php echo ucfirst($type); ?></strong>
            <?php if($type == 'php'){ ?>
                <strong>
                    <small>
                        (phiên bản tối thiểu: <?php echo $phpSupportInfo['minimum']; ?>)
                    </small>
                </strong>
                <span class="float-right">
                    <strong>
                        <?php echo $phpSupportInfo['current']; ?>
                    </strong>
                    <i class="fa fa-fw fa-<?php echo $phpSupportInfo['supported'] ? 'check-circle-o' : 'exclamation-circle'; ?> row-icon" aria-hidden="true"></i>
                </span>
            <?php } ?>
        </li>
        <?php foreach ($requirements['requirements'][$type] as $extention => $enabled) { ?>
            <li class="list__item <?php echo $enabled ? 'success' : 'error'; ?>">
                <?php echo $extention; ?>
                <i class="fa fa-fw fa-<?php echo $enabled ? 'check-circle-o' : 'exclamation-circle'; ?> row-icon" aria-hidden="true"></i>
            </li>
        <?php } ?>
    </ul>
<?php } ?>

<?php if ( ! isset($requirements['errors']) && $phpSupportInfo['supported'] ) { ?>
    <div class="buttons">
        <a class="button" href="<?php $installer->nextUrl(); ?>">
            <?php $installer->nextText(); ?>
            <i class="fa fa-angle-right fa-fw" aria-hidden="true"></i>
        </a>
    </div>
<?php }else{ ?>
	<div class="buttons">
        <a class="button" href="">Kiểm tra lại</a>
    </div>
<?php } ?>