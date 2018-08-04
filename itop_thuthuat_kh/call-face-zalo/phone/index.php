
$arr['hotline_call']= isset($_POST["hotline_call"])?$_POST["hotline_call"]:'';
<div class="formRow">
	<label>Số hotline</label>
    <div class="formRight">
		<input type="text" name="hotline_call" class="tipS" value="<?=$info["hotline_call"]?>" />
		<span class="formNote">Nút call trên giao diện mobile.</span>
	</div>
	<div class="clear"></div>
</div>
