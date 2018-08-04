<? 
	global $size; 
	$temp = Info::getInfoField('showlanguage');
	$showEnglish = $temp==1?'':'style="display:none;"';
?>

<form name="supplier" id="validate" class="form" action="admin.php?do=quanlysizes&act=<?=$_GET['act']=='add'?'addsm':'editsm'?>" method="post" enctype="multipart/form-data">
	<div class="widget">
		<div class="title"><img src="./images/admin/icons/dark/list.png" alt="" class="titleIcon" />
			<h6>Nhập dữ liệu</h6>
		</div>
		<div class="formRow">
			<label>Tên</label>
			<div class="formRight">
                <input type="text" name="name" id="name_vn" class="tipS validate[required]" value="<?=htmlspecialchars($size['name'])?>" />
			</div>
			<div class="clear"></div>
		</div>
        <div class="formRow">
          <label>Tùy chọn:</label>
          <div class="formRight">
            <p class="one_third_checkbox">
                <input type="checkbox" name="active" id="active" value="1" <?=($size['active']==1 || $_GET['act']=='add')?'checked="checked"':''?> />
                <label for="active">Hiển thị</label>
            </p>
          </div>
          <div class="clear"></div>
        </div>
		<div class="formRow">
			<div class="formRight">
            	<input type="hidden" name="id" value="<?=$size['id']?>" />
            	<input type="submit" class="blueB" value="Hoàn tất" />
			</div>
			<div class="clear"></div>
		</div>
	</div>
</form>