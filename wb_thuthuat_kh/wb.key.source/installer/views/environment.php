<?php
	$installer = new Installer;
	$env = $installer->environment();
?>

<?php if(!empty($_SESSION['database'])){ 
	$dblog = $installer->migrate();
?>
	<?php if(!empty($dblog['message'])){ ?>
		<p class="alert text-center">
	        <strong>
	            <?php echo $dblog['message'] ?>
	        </strong>
	    </p>
    <?php } ?>
    <div class="buttons">
    	<?php if(empty($dblog['status'])){ ?>
    		<a href="" class="button">
			    Thử lại
			</a>
    	<?php } else{ ?>
			<a href="<?php $installer->nextUrl(); ?>" class="button">
			    <?php $installer->nextText(); ?>
			    <i class="fa fa-angle-right fa-fw" aria-hidden="true"></i>
			</a>
		<?php } ?>
	</div>
	<?php
    	unset($_SESSION['database']);
	?>
<?php } else { ?>
	<?php if(empty($env['data']) && empty($env['status'])){ ?>
		<form method="post" action="/installer/index.php?step=environment" class="tabs-wrap">
			<div class="tab" id="tab1content">
		        <div class="form-group">
		            <label for="database_connection">Database</label>
		            <input type="text" name="database_connection" id="database_connection" value="mysql" disabled="disabled" />
		        </div>
		        <div class="form-group">
		            <label for="database_hostname">Database Host</label>
		            <input type="text" name="database_hostname" id="database_hostname" value="localhost" required="required" placeholder="Database Host" />
		        </div>
		        <div class="form-group">
		            <label for="database_port">Database Port</label>
		            <input type="number" name="database_port" id="database_port" value="3306" required="required" placeholder="Database Port" />
		        </div>
		        <div class="form-group">
		            <label for="database_name">Tên Database</label>
		            <input type="text" name="database_name" id="database_name" value="" required="required" placeholder="Tên Database" />
		        </div>
		        <div class="form-group">
		            <label for="database_username">Tên truy cập Database</label>
		            <input type="text" name="database_username" id="database_username" value="" required="required" placeholder="Tên truy cập Database" />
		        </div>
		        <div class="form-group">
		            <label for="database_password">Mật khẩu truy cập Database</label>
		            <input type="password" name="database_password" id="database_password" value="" required="required" placeholder="Mật khẩu truy cập Database" />
		        </div>
		        <div class="buttons">
		            <button class="button" type="submit">
		                Cài đặt
		                <i class="fa fa-angle-right fa-fw" aria-hidden="true"></i>
		            </button>
		        </div>
			</div>
		</form>
	<?php }else{ ?>
			<p class="alert text-center">
		        <strong>
		            <?php echo $env['message'] ?>
		        </strong>
		    </p>
		    
		    <form method="post" action="/installer/index.php?step=environment" class="tabs-wrap">
		    	<?php if(empty($env['status'])) { ?>
					<textarea class="textarea" name="envContent"><?php echo $env['data']; ?></textarea>
				<?php } ?>
				<div class="buttons">
					<a href="<?php $installer->nextUrl(); ?>" class="button">
					    <?php $installer->nextText(); ?>
					    <i class="fa fa-angle-right fa-fw" aria-hidden="true"></i>
					 </a>
				</div>
			</form>
	<?php } ?>
<?php } ?>