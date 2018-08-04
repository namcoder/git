<?php
include("ckeditor_config.php");
switch($act){
	case "add":
		$title_page = "CMS - Thêm size";
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
		$title_page = "CMS - Chỉnh sửa size";
		$tpl="edit";
		break;

	case "addsm":
	case "editsm":
		Editsm();
		break;

	case "show":
		setActive('active');
		break;

	case "hide":
		inActive('active');
		break;
	
	case "change_active":
		changeStatus('active');
		break;

	default:
		ShowList();
		$title_page = "CMS - Quản lý size";
		$tpl="list";
}

function Delete($id)
{
	global $db;

	$sql="delete from quanlysizes where id=".$id;
	$db->query($sql);
}

function Del()
{
	$id=$_GET["id"];
	Delete($id);

	$_SESSION['mess'] = "Xoá thành công!";
	$page="admin.php?do=quanlysizes";
	page_transfer2($page);
}

function DelList()
{
	$id = $_POST["iddel"];
	for($i=0; $i<count($id); $i++)
		Delete($id[$i]);

	$_SESSION['mess'] = "Xoá thành công!";
	$page = "admin.php?do=quanlysizes";
	page_transfer2($page);
}

function Edit()
{
	global $db, $size;

	$id=$_GET["id"];
	$sql = "select * from quanlysizes where id=$id";
	$size = $db->getRow($sql);
}

function Editsm()
{
	global $db, $act;
	
	$arr['name']= SafeFormValue('name');
	$arr['active'] = isset($_POST["active"])?1:0;
	$page="admin.php?do=quanlysizes";

	if ($act=="addsm")
	{
		vaInsert('quanlysizes', $arr);
		$msg="Thêm thành công!";
	}
	else
	{
		$id=$_POST['id'];
		vaUpdate('quanlysizes', $arr, ' id='.$id);
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
	$sql="update quanlysizes set $field='$status' where id=$id";
	$db->query($sql);	

	$_SESSION['mess'] = "Sửa thành công";
	$page="admin.php?do=quanlysizes";
	page_transfer2($page);
}

function setActive($field)	// set $field = 1
{
	global $db;
	$id=$_POST["iddel"];
	for($i=0;$i<count($id);$i++){
		$sql="update quanlysizes set $field=1 where id=".$id[$i];
		$db->query($sql);		
	}

	$_SESSION['mess'] = "Sửa thành công";
	$page="admin.php?do=quanlysizes";
	page_transfer2($page);
}

function inActive($field)	// set $field = 0
{
	global $db;
	$id=$_POST["iddel"];
	for($i=0;$i<count($id);$i++){
		$sql="update quanlysizes set $field=0 where id=".$id[$i];
		$db->query($sql);		
	}

	$_SESSION['mess'] = "Sửa thành công";
	$page="admin.php?do=quanlysizes";
	page_transfer2($page);
}

function ShowList()
{
	global $db, $stips;
		
	$sql = "select * from quanlysizes order by id desc";
	$stips = $db->getAll($sql);
}
?>