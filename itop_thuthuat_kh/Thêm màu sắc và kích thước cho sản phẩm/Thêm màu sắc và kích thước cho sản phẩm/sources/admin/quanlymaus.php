<?php
include("ckeditor_config.php");
switch($act){
	case "add":
		$title_page = "CMS - Thêm màu sắc";
		$tpl="edit";
		break;

	case "del":
		Del();
		break;

	case "dellist":
		DelList();
		break;
		
	case "edit":
		Edit();
		$title_page = "CMS - Chỉnh sửa màu sắc";
		$tpl="edit";
		break;

	case "addsm":
	case "editsm":
		Editsm();
		break;

	case "show":
		setActive('active');
		break;
		
	case "delete_img":
		Delete_img();
		break;
		
	case "hide":
		inActive('active');
		break;
	
	case "change_active":
		changeStatus('active');
		break;

	default:
		ShowList();
		$title_page = "CMS - Quản lý màu sắc";
		$tpl="list";
}

function Delete($id)
{
	global $db;

	$sql="delete from quanlymaus where id=".$id;
	$db->query($sql);
}

function Del()
{
	$id=$_GET["id"];
	Delete($id);

	$_SESSION['mess'] = "Xoá thành công!";
	$page="admin.php?do=quanlymaus";
	page_transfer2($page);
}

function DelList()
{
	$id = $_POST["iddel"];
	for($i=0; $i<count($id); $i++)
		Delete($id[$i]);

	$_SESSION['mess'] = "Xoá thành công!";
	$page = "admin.php?do=quanlymaus";
	page_transfer2($page);
}

function Edit()
{
	global $db, $size;

	$id=$_GET["id"];
	$sql = "select * from quanlymaus where id=$id";
	$size = $db->getRow($sql);
}

function Editsm()
{
	global $db, $act;
	
	$arr['name']= SafeFormValue('name');
	$arr['active'] = isset($_POST["active"])?1:0;
	$page="admin.php?do=quanlymaus";
	if(isset($_FILES["img"]['name'] ) && $_FILES["img"]['size']>0){		
		//them hinh moi
		$img = $_FILES["img"]['name'];
		$start = strpos(strrev($img), ".");	// lay dau . sau cung
		$type = substr($img, strlen($img)-($start+1), $start+1);
		if (!checkUploadImages($type))
		{
			$_SESSION['error'] = "Ảnh sản phẩm không đúng định dạng!";
		}
		else
		{
			$filename = "mau-sac";
			if ($act == "editsm") {
				//kiem tra va xoa hinh cu
				$id=$_POST['id'];
				$sqlstmt="select img from quanlymaus where id=$id";
				$r = $db->getRow($sqlstmt);
				if(file_exists($r["img"])) unlink($r["img"]);
			}
			
			if(file_exists( "./upload/images/" . $filename . $type)){
				$filename = $filename . '-' . time() . $type;
			}
			else
			{
				$filename = $filename . $type;
			}
			
			copy($_FILES["img"]['tmp_name'], "./upload/images/" . $filename) ;
			$arr["img"] = "upload/images/" . $filename;
		}
	}
	if ($act=="addsm")
	{
		vaInsert('quanlymaus', $arr);
		$msg="Thêm thành công!";
	}
	else
	{
		$id=$_POST['id'];
		vaUpdate('quanlymaus', $arr, ' id='.$id);
		$msg="Sửa thành công!";
	}

	$_SESSION['mess'] = $msg;
	page_transfer2($page);
}

function changeStatus($field)	// dao trang thai cua $field
{
	global $db;
	$id=$_GET["id"];
	
	$status = $_GET['current']==1?0:1;
	$sql="update quanlymaus set $field='$status' where id=$id";
	$db->query($sql);	

	$_SESSION['mess'] = "Sửa thành công";
	$page="admin.php?do=quanlymaus";
	page_transfer2($page);
}

function setActive($field)	// set $field = 1
{
	global $db;
	$id=$_POST["iddel"];
	for($i=0;$i<count($id);$i++){
		$sql="update quanlymaus set $field=1 where id=".$id[$i];
		$db->query($sql);		
	}

	$_SESSION['mess'] = "Sửa thành công";
	$page="admin.php?do=quanlymaus";
	page_transfer2($page);
}

function inActive($field)	// set $field = 0
{
	global $db;
	$id=$_POST["iddel"];
	for($i=0;$i<count($id);$i++){
		$sql="update quanlymaus set $field=0 where id=".$id[$i];
		$db->query($sql);		
	}

	$_SESSION['mess'] = "Sửa thành công";
	$page="admin.php?do=quanlymaus";
	page_transfer2($page);
}

function ShowList()
{
	global $db, $stips;
		
	$sql = "select * from quanlymaus order by id desc";
	$stips = $db->getAll($sql);
}
function Delete_img()
{
	global $db;
	$id = $_GET['id'];
	$img = $_GET['img_del'];
	$page = "admin.php?do=quanlymaus&act=edit&id=$id". (isset($_GET['cid'])?'&cid='.$_GET['cid']:'') . (isset($_GET['page'])?'&page='.$_GET['page']:'');
	
	$sql = "select * from quanlymaus where id=$id";
	$result = $db->getRow($sql);
	
	if (file_exists($result["$img"]))
	{
		unlink($result["$img"]);
		$arr["$img"] = "";
		vaUpdate('quanlymaus',$arr,' id='.$id);
	}
		
	page_transfer2($page);
}
?>