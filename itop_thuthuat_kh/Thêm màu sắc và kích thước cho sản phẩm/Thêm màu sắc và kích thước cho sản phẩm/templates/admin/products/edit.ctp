<? global $product, $stips, $customfields, $tags; 
	$temp = Info::getInfoField('showlanguage');
	$showEnglish = $temp==1?'':'style="display:none;"';
?>

<script type="text/javascript">
	function TreeFilterChanged(value){
		xmlHttp=GetXmlHttpObject();
		if (xmlHttp==null)
		  {
		  alert ("Browser does not support HTTP Request");
		  return;
		  } 
		var url="ajax/checkComp.php";
		url=url+"?id="+value;
		url=url+"&sid="+Math.random();
		url=url+"&comp=2";
		xmlHttp.onreadystatechange=ReadyTreeFilterChanged;
		xmlHttp.open("GET",url,true);
		xmlHttp.send(null);
	}
	
	function ReadyTreeFilterChanged(){
		if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{ 	
			if(xmlHttp.responseText != "0"){		
				//location.href = "admin.php?do=products&act=add&cid="+xmlHttp.responseText;
			}
			else{
				alert('Danh mục này không thuộc thể loại sản phẩm!');
			}
		}
	}

	function TreeFilterChanged2(value){
		xmlHttp=GetXmlHttpObject();
		if (xmlHttp==null)
		  {
		  alert ("Browser does not support HTTP Request");
		  return;
		  }
		var url="ajax/checkComp.php";
		url=url+"?id="+value;
		url=url+"&sid="+Math.random();
		url=url+"&comp=2";
		xmlHttp.onreadystatechange=ReadyTreeFilterChanged2;
		xmlHttp.open("GET",url,true);
		xmlHttp.send(null);
	}
	
	function ReadyTreeFilterChanged2(){
		if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			if(xmlHttp.responseText != "0"){
				$('#validate').submit();
			}
			else{
				alert('Danh mục này không thuộc thể loại sản phẩm!');
			}
		}
	}
	
	function alertWarning(){
		if(confirm("Các thông tin trong phần 'Nội dung SEO' sẽ bị trở về trạng thái ban đầu!"))
		{
			return CreateTitleSEO();
		}
	}
</script>

<form name="supplier" id="validate" class="form" action="admin.php?do=products&act=<?=$_GET['act']=='add'?'addsm':'editsm'?><?=isset($_GET['cid'])?'&cid='.$_GET['cid']:''?><?=isset($_GET['page'])?'&page='.$_GET['page']:''?>" method="post" enctype="multipart/form-data">
	<div class="widget">
		<div class="title"><img src="./images/admin/icons/dark/list.png" alt="" class="titleIcon" />
			<h6>Nhập dữ liệu</h6>
		</div>
		<div class="formRow">
			<label>Danh mục SP</label>
			<div class="formRight">
            	<div class="selector">
					<?php
                        $c = new Categories();
                        $cid = $product['cid']?$product['cid']:'';
                        if(isset($_GET['cid']))
                            $cid = $_GET['cid'];
                        
                        $tree = $c->admin_tree_filter(1, $cid, 2);
                        echo $tree;
                    ?>
                </div>
                <div class="clear"></div>
            	<span class="formNote">Hãy chọn những danh mục thuộc thể loại sản phẩm (có màu xanh)</span>
			</div>
			<div class="clear"></div>
		</div>
        <div class="formRow">
			<label>Danh mục khác:</label>
			<div class="formRight">
				<?php 
					global $checked;
					
					$sql_cat = "select * from categories where comp = 2 and has_child=0 order by num asc, id desc";
					$result_cat = mysql_query($sql_cat);
					$i = 0;
					$array_catbranch = array();
					$array_catbranch = explode('-',$product['categoriebranch']);
					while($data = mysql_fetch_array($result_cat)){
						$checked = "";
						for($a=1; $a < count($array_catbranch); $a++){
							if($data["id"] == $array_catbranch[$a])
								{
									$checked = "checked";
								}
							} 
						
						?>
                        <p class="one_third_checkbox">
							<input type="checkbox" name="idcat[]" <?=$checked?> value="<?=$data["id"]?>" id="checkcat<?=$i?>" />
							<label for="check<?=$i?>"><?=$data["name_vn"]?></label>
                            </p>
						<?php 
						
							$i++;
						
					}
				?>
			</div>
			<div class="clear"></div>
        </div>
		<?php 
			$sql = "select * from quanlythuonghieus where active =1 order by name";
			$thuonghieus = $db->getAll($sql);
			if($thuonghieus){
		?>
			<div class="formRow">
				<label>Thương hiệu sản phẩm</label>
				<div class="formRight">
					<div class="selector">
						<select name="thuonghieu">
							<option value="0">Không hiển thị</option>
							<?php foreach($thuonghieus as $obj){ ?>
								<option value="<?=$obj["id"]?>" <?=$obj["id"]==$product["thuonghieu"]?"selected":""?>><?=$obj["name"]?></option>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		<?php } ?>
		<div class="formRow">
			<label>Tên sản phẩm VN</label>
			<div class="formRight">
                <input type="text" name="name_vn" id="name_vn" class="tipS validate[required]" value="<?=htmlspecialchars($product['name_vn'])?>" />
                <span class="formNote">Nhập tên sản phẩm sẽ hiển thị ở trang tiếng Việt</span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow" <?=$showEnglish?>>
			<label>Tên sản phẩm EN</label>
			<div class="formRight">
                <input type="text" name="name_en" class="tipS" value="<?=htmlspecialchars($product['name_en'])?>" />
                <span class="formNote">Nhập tên sản phẩm sẽ hiển thị ở trang tiếng Anh</span>
			</div>
			<div class="clear"></div>
		</div>
        <?php /*?><div class="formRow">
          <label for="tags">Tag sản phẩm:</label>
          <div class="formRight">
            <input type="text" id="tags" name="tags" class="tags" value="" />
            <span class="formNote">Nhập tag cho sản phẩm, mỗi tag cách nhau bằng phím enter hoặc dấu phẩy (,). <strong>Chú ý: không nên copy mà nên gõ tay vào để tránh bị các ký tự đặc biệt.</strong></span>
            <p>
            <?
				if ($tags) {
				foreach ($tags as $tag){	
			?>
            <span class="tag_on_ar"><span><?=$tag["name_tag"]?></span><a href="#" title="Xóa tag">x</a></span>
            <? }} ?>
            </p>
          </div>
          <div class="clear"></div>
        </div><?php */?>
        <div class="formRow">
            <label>Giá sản phẩm: </label>
            <div class="formRight">
                <input type="text" id="price" name="price" value="<?=$product['price']?>" class="tipS" style="width:150px;" /> vnđ
                <span class="formNote">Nếu không nhập giá thì sản phẩm sẽ hiện chữ Liên hệ</span>
            </div>
            <div class="clear"></div>
        </div>
        <div class="formRow">
            <label>Giá khuyến mãi:</label>
            <div class="formRight">
                <input type="text" id="price_sale" name="price_sale" value="<?=$product['price_sale']?>" class="tipS" style="width:150px;" /> vnđ
                <span class="formNote">Nếu không khuyến mãi thì để mặc định là 0.</span>
            </div>
            <div class="clear"></div>
        </div>
        <div class="formRow">
            <label>Mã sản phẩm:</label>
            <div class="formRight">
                <input type="text" id="code_pro" name="code" value="<?=htmlspecialchars($product['code'])?>" class="tipS smalltipS" />
            </div>
            <div class="clear"></div>
        </div>
		<div class="formRow">
			<label>Chọn màu sắc:</label>
			<div class="formRight">
				<?php 
					global $checked, $db;
					
					$sql_cat = "select * from quanlymaus where active = 1 order by name";
					$result_cat = $db->getAll($sql_cat);
						$checked = "";
						$arr = array();
						$arr = explode( ',', $product['mausac']);
						$i=0;
						foreach($result_cat as $obj){
						if(in_array($obj["id"], $arr))
							{
								$checked = "checked";
							}else{
								$checked = "";
							}
						?>
                        <p class="one_third_checkbox">
							<input type="checkbox" name="mausac[]" <?=$checked?> value="<?=$obj["id"]?>" id="mausac<?=$i?>" />
							<label for="mausac<?=$i?>"><img style="vertical-align: middle; width: 20px; margin-right: 5px;" src="../<?=$obj["img"]?>" alt="<?=$obj["name"]?>" /><?=$obj["name"]?></label>
                            </p>
						<?php 
						$i++;
						} 
				?>
			</div>
			<div class="clear"></div>
        </div>
		<div class="formRow">
			<label>Chọn kích thước:</label>
			<div class="formRight">
				<?php 
					global $checked, $db;
					
					$sql_cat = "select * from quanlysizes where active = 1 order by name";
					$result_cat = $db->getAll($sql_cat);
						$checked = "";
						$arr = array();
						$arr = explode( ',', $product['kichthuoc']);
						$i=0;
						foreach($result_cat as $obj){
						if(in_array($obj["id"], $arr))
							{
								$checked = "checked";
							}else{
								$checked = "";
							}
						?>
                        <p class="one_third_checkbox">
							<input type="checkbox" name="sizes[]" <?=$checked?> value="<?=$obj["id"]?>" id="size<?=$i?>" />
							<label for="size<?=$i?>"><?=$obj["name"]?></label>
                            </p>
						<?php 
						$i++;
						} 
				?>
			</div>
			<div class="clear"></div>
        </div>
		<div class="formRow">
			<label>Tải hình ảnh:</label>
			<div class="formRight">
            	<? if($_GET['act'] == 'edit' && file_exists($product["img"])) { ?>
            		<img src="<?=getTimThumb($product["img"], 100)?>" alt="" />
                    <a href="admin.php?do=products&act=delete_img&id=<?=$product['id']?>&img_del=img<?=isset($_GET['cid'])?'&cid='.$_GET['cid']:''?><?=isset($_GET['page'])?'&page='.$_GET['page']:''?>" title="Xoá ảnh">Xoá ảnh</a>
                    <br />
              	<? } ?>
				<input type="file" id="file" name="img" />
                <div class="clear"></div>
                <span class="formNote">Tải hình đại diện cho sản phẩm (ảnh đuôi JPEG, GIF , JPG , PNG). Kích thước chuẩn là 500x500 (px)</span>
			</div>
			<div class="clear"></div>
		</div>
        <div class="formRow">
			<label>Liên kết ngoài</label>
			<div class="formRight">
                <input type="text" name="ext_url" class="tipS" value="<?=$product['ext_url']?>" />
                <span class="formNote">Khi bấm vào sản phẩm sẽ chuyển đến trang liên kết này, mặc định bỏ trống. Link phải có <strong>http://</strong>, ví dụ: <strong>http://www.imgroup.vn</strong></span>
			</div>
			<div class="clear"></div>
		</div>
        <div class="formRow">
          <label>Tùy chọn:</label>
          <div class="formRight">
          	<div style="float:left;">
                <input type="checkbox" name="is_noindex" id="check2" <?=($product['is_noindex']==1)?'checked="checked"':''?> />
                <label for="check2">Noindex, nofollow <img src="./images/admin/question-button.png" alt="Upload hình" class="icon_que tipS" original-title="Check nếu bạn muốn Google không index sản phẩm này!" /></label>
                <input type="checkbox" name="active" id="check1" value="1" <?=($product['active']==1 || $_GET['act']=='add')?'checked="checked"':''?> />
                <label for="check1">Hiển thị</label>
                <input type="checkbox" name="bestseller" id="check3" value="1" <?=($product['bestseller']==1)?'checked="checked"':''?> />
                <label for="check3">Sản phẩm bán chạy <img src="./images/admin/question-button.png" alt="Upload hình" class="icon_que tipS" original-title="Check nếu bạn muốn sản phẩm được đánh dấu là sản phẩm bán chạy!" /></label>
                <input type="checkbox" name="not_in_widget" id="not_in_widget" value="1" <?=($product['not_in_widget']==1)?'checked="checked"':''?> />
                    <label for="not_in_widget">Không hiển thị trong widget<img src="./images/admin/question-button.png" alt="Tooltip" class="icon_que tipS" original-title="Check nếu bạn muốn sản phẩm này KHÔNG hiển thị trong các widget bạn tạo ra!"></label>
            </div>
            <div style="float:left;">
                <input type="checkbox" name="pin" id="pin" value="1" <?=($product['pin']==1)?'checked="checked"':''?> />
                <label for="pin">Nằm trên top</label>
                <input type="checkbox" name="new_tab" id="new_tab" value="1" <?=($product['new_tab']==1)?'checked="checked"':''?> />
                <label for="new_tab">Mở link ngoài ra tab mới</label>
            </div>
          </div>
          <div class="clear"></div>
        </div>
        <div class="formRow">
            <label>Số thứ tự: </label>
            <div class="formRight">
                <input type="text" class="tipS" value="<?=$_GET['act']=='add'?'0':$product['num']?>" name="num" style="width:20px; text-align:center;" onkeypress="return OnlyNumber(event)" />
                <span class="formNote">Số thứ tự hiển thị của sản phẩm, ưu tiên từ nhỏ đến lớn</span>
            </div>
            <div class="clear"></div>
        </div>
		<div class="formRow">
			<label>Mô tả ngắn VN:</label>
			<div class="formRight">
				<textarea rows="8" cols="" class="tipS validate[required]" name="short_vn" id="short_vn"><?=$product["short_vn"]?></textarea>
                <span class="formNote">Đoạn mô tả ngắn sản phẩm hiển thị ở trang tiếng Việt</span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow" <?=$showEnglish?>>
			<label>Mô tả ngắn EN:</label>
			<div class="formRight">
				<textarea rows="8" cols="" class="tipS" name="short_en"><?=$product["short_en"]?></textarea>
                <span class="formNote">Đoạn mô tả ngắn sản phẩm hiển thị ở trang tiếng Anh</span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<label>Nội dung chính VN: <img src="./images/admin/question-button.png" alt="Tooltip"  class="icon_que tipS" original-title="Viết nội dung chính của sản phẩm hiển thị ở trang tiếng Việt"> </label>
			<div class="formRight"><?php echo $CKEditor->editor("content_vn", $product['content_vn']);?></div>
			<div class="clear"></div>
		</div>
		<div class="formRow" <?=$showEnglish?>>
			<label>Nội dung chính EN: <img src="./images/admin/question-button.png" alt="Tooltip"  class="icon_que tipS" original-title="Viết nội dung chính của sản phẩm hiển thị ở trang tiếng Anh"> </label>
			<div class="formRight"><?php echo $CKEditor->editor("content_en", $product['content_en']);?></div>
			<div class="clear"></div>
		</div>
	</div>
    <?php /*?><div class="widget">
		<div class="title"><img src="./images/admin/icons/dark/record.png" alt="" class="titleIcon" />
			<h6>Custom Fields</h6><span class="mynotes">- Thêm các field tuỳ chỉnh</span>
		</div>
        <div>
        	<table cellpadding="0" cellspacing="0" width="100%" class="sTable withCheck mTable" id="checkAll">
                <thead>
                  <tr>
                  	<td style="width:50px !important;"><div>Thứ tự</div></td>
                    <td width="200"><div>Tên field VN</div></td>
                    <td width="300">Giá trị VN</td>
                    <td width="200">Tên field EN</td>
                    <td width="300">Giá trị EN</td>
                    <td width="100">Thao tác</td>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <td colspan="6"></td>
                  </tr>
                </tfoot>
                <tbody id="tableField">
                <? 
                    if ($stips) {
                    for ($i=0; $i<count($stips); $i++) { 
						$id = $stips[$i]['id'];
					?>
                  <tr id="row<?=$id?>">
                    <td>
                    	<input type="hidden" name="listField[]" value="<?=$id?>" />
                        <input type="text" value="<?=$stips[$i]["num"]?>" onkeypress="return OnlyNumber(event)" class="tipS smallText" original-title="Nhập stt" id="number<?=$id?>" onchange="return updateNumber('customfields', '<?=$id?>')" style="width:50%;" />
                    </td>
                    <td><input id="name_vn<?=$id?>" style="width:90%;" type="text" value="<?=$stips[$i]["name_vn"]?>" /></td>
                    <td align="center"><textarea style="width:90%; resize:none;" id="value_vn<?=$id?>"><?=$stips[$i]["value_vn"]?></textarea></td>
                    <td align="center"><input style="width:90%;" id="name_en<?=$id?>" type="text" value="<?=$stips[$i]["name_en"]?>" /></td>
                    <td align="center"><textarea style="width:90%; resize:none;" id="value_en<?=$id?>"><?=$stips[$i]["value_en"]?></textarea></td>
                    <td class="actBtns">
            			<a href="" onclick="updateField(<?=$id?>); return false;" title="" class="smallButton tipS" original-title="Cập nhật custom field"><img src="./images/admin/icons/dark/save.png" alt=""></a>
                        <a href="" onclick="deleteField(<?=$id?>, <?=$product['id']?>); return false;" title="" class="smallButton tipS" original-title="Xóa custom field"><img src="./images/admin/icons/dark/close.png" alt=""></a>
            			<div id="ajaxloader"><img class="numloader" id="ajaxloader<?=$id?>" src="images/site/loader.gif" alt="loader" /></div>
                    </td>
                  </tr>
                  <? } ?>
                  <? } else { ?>
                  <tr id="nofield">
                    <td colspan="6" align="center">Không có custom field nào</td>
                  </tr>
                  <? } ?>
                </tbody>
              </table>
        </div>
		<div class="formRow">
			<label>Chọn field:</label>
			<div class="formRight">
            	<div class="selector">
                    <select onchange="fillValue(this.value)">
                        <option>--- chọn 1 field có sẵn ---</option>
                        <? foreach ($customfields as $field) { ?>
                        <option><?=$field['name_vn']?></option>
                        <? } ?>
                    </select>
                    <input type="hidden" id="alias_custom" name="alias" value="" />
                </div>
                <div class="clear"></div>
            	<span class="formNote">Có thể chọn field mẫu có sẵn hoặc tự thêm field mới, chỉ cần nhập đầy đủ thông tin vào các ô bên dưới</span>
                <div class="ajaxloader"><img src="images/site/loader.gif" alt="loader" /></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<label>Tên field VN</label>
			<div class="formRight">
				<input type="text" value="" id="cname_vn" class="tipS" />
                <span class="formNote">Tên custom field hiển thị ở trang tiếng Việt</span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<label>Giá trị VN:</label>
			<div class="formRight">
				<textarea rows="8" cols="" class="tipS" id="cvalue_vn"></textarea>
                <span class="formNote">Giá trị của custom field hiển thị ở trang tiếng Việt</span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow" <?=$showEnglish?>>
			<label>Tên field EN</label>
			<div class="formRight">
				<input type="text" value="" id="cname_en" class="tipS" />
                <span class="formNote">Tên custom field hiển thị ở trang tiếng Anh</span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow" <?=$showEnglish?>>
			<label>Giá trị EN:</label>
			<div class="formRight">
				<textarea rows="8" cols="" class="tipS" id="cvalue_en"></textarea>
                <span class="formNote">Giá trị của custom field hiển thị ở trang tiếng Anh</span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<div class="formRight">
            	<input type="button" class="blueB" id="addField" value="Thêm custom field" />
			</div>
			<div class="clear"></div>
		</div>
	</div><?php */?>
	<div class="widget">
		<div class="title"><img src="./images/admin/icons/dark/record.png" alt="" class="titleIcon" />
			<h6>Nội dung SEO</h6><span class="mynotes">- Phần dành cho Google đọc</span>
		</div>
		<div class="formRow">
			<label>Tạo SEO</label>
			<div class="formRight">
            	<input type="button" class="blueB" onclick="<?=$_GET['act']=='add'?'CreateTitleSEO();':'alertWarning();'?>" value="Tạo SEO" />
                <span class="formNote"><?=CMS_CREATE_SEO?></span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<label>Link sản phẩm VN</label>
			<div class="formRight">
				<input type="text" value="<?=$product['unique_key_vn']?>" name="unique_key_vn" id="unique_key_vn" class="tipS validate[required]" />
                <span class="formNote"><?=CMS_LINK_VN?></span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow" <?=$showEnglish?>>
			<label>Link sản phẩm EN</label>
			<div class="formRight">
				<input type="text" value="<?=$product['unique_key_en']?>" name="unique_key_en" class="tipS" />
                <span class="formNote"><?=CMS_LINK_EN?></span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<label>Tiêu đề page</label>
			<div class="formRight">
				<input type="text" value="<?=htmlspecialchars($product['title_vn'])?>" name="title_vn" class="tipS" />
                <span class="formNote"><?=CMS_TITLE_VN?></span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow" <?=$showEnglish?>>
			<label>Tiêu đề page EN</label>
			<div class="formRight">
				<input type="text" value="<?=htmlspecialchars($product['title_en'])?>" name="title_en" class="tipS" />
                <span class="formNote"><?=CMS_TITLE_EN?></span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<label>Từ khóa VN</label>
			<div class="formRight">
				<input type="text" value="<?=htmlspecialchars($product['keyword_vn'])?>" name="keyword_vn" class="tipS" />
                <span class="formNote"><?=CMS_KEYWORD_VN?></span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow" <?=$showEnglish?>>
			<label>Từ khóa EN</label>
			<div class="formRight">
				<input type="text" value="<?=htmlspecialchars($product['keyword_en'])?>" name="keyword_en" class="tipS" />
                <span class="formNote"><?=CMS_KEYWORD_EN?></span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<label>Mô tả page</label>
			<div class="formRight">
				<textarea rows="8" cols="" class="tipS" name="des_vn"><?=$product['des_vn']?></textarea>
                <span class="formNote"><?=CMS_DESCRIPTION_VN?></span>
                <input readonly="readonly" type="text" style="width:25px; margin-top:10px; text-align:center;" name="des_vn_char" value="<?=$product['des_vn_char']?>" /> ký tự <b><?=CMS_SO_LUONG_GIOI_HAN?></b>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow" <?=$showEnglish?>>
			<label>Mô tả page EN:</label>
			<div class="formRight">
				<textarea rows="8" cols="" class="tipS" name="des_en"><?=$product['des_en']?></textarea>
                <span class="formNote"><?=CMS_DESCRIPTION_EN?></span>
                <input readonly="readonly" type="text" style="width:25px; margin-top:10px; text-align:center;" name="des_en_char" value="<?=$product['des_en_char']?>" /> ký tự <b><?=CMS_SO_LUONG_GIOI_HAN?></b>
			</div>
			<div class="clear"></div>
		</div>
		<div class="formRow">
			<div class="formRight">
                <input type="hidden" name="id" id="id_this_articles" value="<?=$product['id']?>" />
                <input type="hidden" id="type_of_tag" value="products" />
            	<input type="button" class="blueB" onclick="TreeFilterChanged2(document.getElementById('cat').value); return false;" value="Hoàn tất" />
			</div>
			<div class="clear"></div>
		</div>
	</div>
</form>