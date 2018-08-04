<? global $stips, $plpage; ?>

<script language="javascript">
	function CheckDelete(l){
		if(confirm('Bạn có chắc muốn xoá?'))
		{
			location.href = l;	
		}
	}
	
	function ChangeAction(str){
		if(confirm("Bạn có chắc chắn?"))
		{
			document.f.action = str;
			document.f.submit();
		}
	}
</script>

<form name="f" id="f" method="post">
<div class="control_frm" style="margin-top:0">
  	<div style="float:left;">
    	<input type="button" class="blueB" value="Thêm" onclick="location.href='admin.php?do=quanlymaus&act=add'" />
        <input type="button" class="blueB" value="Xoá" onclick="ChangeAction('admin.php?do=quanlymaus&act=dellist');return false;" />
    </div>
</div>

<? if(isset($_SESSION['mess'])){ ?>
<div class="nNote nSuccess hideit" style="margin:20px 0 -22px; clear:both;">
    <p><strong><?=$_SESSION['mess']?></strong></p>
</div>
<? }; unset($_SESSION['mess']); ?>

<? if(isset($_SESSION['error'])){ ?>
<div class="nNote nFailure hideit" style="margin:20px 0 -22px; clear:both;">
    <p><strong><?=$_SESSION['error']?></strong></p>
</div>
<? }; unset($_SESSION['error']); ?>

<div class="widget">
  <div class="title"><span class="titleIcon">
    <input type="checkbox" id="titleCheck" name="titleCheck" />
    </span>
    <h6>Màu sắc sản phẩm</h6>
  </div>
  <table cellpadding="0" cellspacing="0" width="100%" class="sTable withCheck mTable" id="checkAll">
    <thead>
      <tr>
        <td></td>
        <td class="tb_data_small"><a href="#" class="tipS" style="margin: 5px;">STT</a></td>
        <td class="">Hình đại diện</td>
        <td class="">Tên màu</td>
		<td class="tb_data_small">Hiện</td>
        <td width="100">Thao tác</td>
      </tr>
    </thead>
    <tfoot>
      <tr>
        <td colspan="5"><?=$plpage?></td>
      </tr>
    </tfoot>
    <tbody>
    <? 
		if ($stips) {
		for ($i=0; $i<count($stips); $i++) { ?>
      <tr>
        <td>
            <input type="checkbox" name="iddel[]" value="<?=$stips[$i]["id"]?>" id="check<?=$i?>" />
        </td>
        <td align="center"><?=$i+1?></td>
		 <td align="center">
        <?php if (file_exists($stips[$i]["img"])) { ?>
        <img src="<?=getTimThumb($stips[$i]["img"], 30)?>" alt="" />
        <? } ?>
        </td>
        <td class="">
            <a href="admin.php?do=quanlymaus&act=edit&id=<?=$stips[$i]["id"]?>" class="tipS SC_bold"><?=$stips[$i]["name"]?></a>
        </td>
		 <td align="center">
            <a href="admin.php?do=quanlymaus&act=change_active<?=isset($_GET['cid'])?'&cid='.$_GET['cid']:''?>&id=<?=$stips[$i]["id"]?>&current=<?=$stips[$i]["active"]?><?=isset($_GET['page'])?"&page=".$_GET['page']:''?>" title="" class="smallButton tipS" original-title="<?=$stips[$i]['active']?'Click để ẩn':'Click để hiện'?>"><img src="./images/admin/icons/color/<?=$stips[$i]['active']?'tick':'hide'?>.png" alt=""></a>
        </td>
        <td class="actBtns">
            <a href="admin.php?do=quanlymaus&act=edit&id=<?=$stips[$i]["id"]?>" title="" class="smallButton tipS" original-title="Sửa"><img src="./images/admin/icons/dark/pencil.png" alt=""></a>
            <a href="" onclick="CheckDelete('admin.php?do=quanlymaus&act=del&id=<?=$stips[$i]["id"]?>'); return false;" title="" class="smallButton tipS" original-title="Xóa"><img src="./images/admin/icons/dark/close.png" alt=""></a>
        </td>
      </tr>
      <? } ?>
      <? } else { ?>
      <tr>
        <td colspan="5" align="center">Không có dữ liệu nào</td>
      </tr>
      <? } ?>
    </tbody>
  </table>
</div>
</form>