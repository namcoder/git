<? 
	global $size; 
	$temp = Info::getInfoField('showlanguage');
	$showEnglish = $temp==1?'':'style="display:none;"';
?>

<form name="supplier" id="validate" class="form" action="admin.php?do=quanlymaus&act=<?=$_GET['act']=='add'?'addsm':'editsm'?>" method="post" enctype="multipart/form-data">
	<div class="widget">
		<div class="title"><img src="./images/admin/icons/dark/list.png" alt="" class="titleIcon" />
			<h6>Nhập dữ liệu</h6>
		</div>
		<div class="formRow">
			<label>Tên màu</label>
			<div class="formRight">
                <input type="text" name="name" id="name_vn" class="tipS validate[required]" value="<?=htmlspecialchars($size['name'])?>" />
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<label>Tải hình đại diện:</label>
			<div class="formRight">
            	<? if($_GET['act'] == 'edit' && file_exists($size["img"])) { ?>
            		<img src="<?=getTimThumb($size["img"], 100)?>" alt="" />
                    <a href="admin.php?do=quanlymaus&act=delete_img&id=<?=$size['id']?>&img_del=img<?=isset($_GET['cid'])?'&cid='.$_GET['cid']:''?><?=isset($_GET['page'])?'&page='.$_GET['page']:''?>" title="Xoá ảnh">Xoá ảnh</a>
                    <br />
              	<? } ?>
				<input type="file" id="file" name="img" />
                <div class="clear"></div>
                <span class="formNote">Tải hình đại diện cho màu sắc</span>
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