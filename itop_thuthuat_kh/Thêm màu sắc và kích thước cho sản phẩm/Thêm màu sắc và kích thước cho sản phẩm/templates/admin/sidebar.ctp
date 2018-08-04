<?php
	$do = SafeQueryString('do');
	$act = SafeQueryString('act');
	$cid = SafeQueryString('cid');
	
	switch($do){
		case "categories":	
			$showAdmin = 2;
			break;

		case "articles":	
			$showAdmin = 3;
			break;

		case "products":	
			$showAdmin = 4;
			break;
		case "quanlymaus":	
			$showAdmin = 4;
			break;
		case "quanlysizes":	
			$showAdmin = 4;
			break;
		case "quanlythuonghieus":	
			$showAdmin = 4;
			break;

		case "orders":	
			$showAdmin = 5;
			break;
		case "payments":
			$showAdmin = 5;
			break;
		case "banks":
			$showAdmin = 5;
			break;
		case "thankyou":	
			$showAdmin = 5;
			break;

		case "admin_groups":
			$showAdmin = 6;
			break;
		case "userlog":
			$showAdmin = 6;
			break;
		case "users":
			$showAdmin = 6;
			break;

		case "contact_logs":
			$showAdmin = 7;
			break;
		case "comments":
			$showAdmin = 7;
			break;
		case "member":
			$showAdmin = 7;
			break;
			
		case "infos":
			$showAdmin = 8;
			break;
			
		case "albums":
			$showAdmin = 9;
			break;
		case "images":
			$showAdmin = 9;
			break;
		case "video":
			$showAdmin = 9;
			break;

		case "widgets":
			$showAdmin = 10;
			break;
		case "img_group":	
			$showAdmin = 10;
			break;
		case "img":	
			$showAdmin = 10;
			break;
		case "interface":	
			$showAdmin = 10;
			break;
		case "popup":	
			$showAdmin = 10;
			break;
		case "exit_popup":	
			$showAdmin = 10;
			break;

		case "nicks":
			$showAdmin = 11;
			break;
		case "optin":	
			$showAdmin = 11;
			break;	
		case "optin_type":	
			$showAdmin = 11;
			break;

		default:
			$showAdmin = 1;
			break;
	}
?>

<script type="text/javascript">
$(function(){
	$('#menu .activemenu .sub').css('display', 'block');
	$('#menu .activemenu a').removeClass('inactive');
})
$(document).ready(function(e) {
	var showed = localStorage['showed'];
	if (showed == "yes") {
		$('#show_hide_menu').css('display', 'block');
		$('#click_show').html('<span>&raquo; Ẩn bớt menu &laquo;</span>');
	}
    $('#click_show').click(function() {
		if ($('#show_hide_menu').is(':hidden')==true) {
			$('#show_hide_menu').show('fast');
			$('#click_show').html('<span>&raquo; Ẩn bớt menu &laquo;</span>');
			localStorage['showed'] = "yes";
		}
		else
		{
			$('#show_hide_menu').hide('fast');
			$('#click_show').html('<span>&raquo; Hiển thị thêm menu &laquo;</span>');
			localStorage['showed'] = "";
		}
	}); 
});
</script>

<div id="leftSide">
  <div class="logo">
  	<a href="#" target="_blank" onclick="return false;">
        <img src="<?=$FullUrl?>/images/admin/logo.png" width="136" alt="" />
    </a></div>
  <div class="sidebarSep mt0"></div>
  <div class="version-cms">CMS VERSION 5</div>
  <!-- Left navigation -->
  <ul id="menu" class="nav">
    <li class="dash" id="menu1"><a class="<?=($showAdmin==1)?' active':''?>" title="" href="admin.php"><span>Trang chủ</span></a></li>
	<? if (cmsFunction::isShowGroupMenu(2)) { ?>
    <li class="categories_li<?=($showAdmin==2)?' activemenu':''?>" id="menu2"><a href="/admin.php?do=categories&act=list&cid=121&root=1" title="" class="<?=($showAdmin==2)?' active':''?>"><span>Danh mục</span><strong></strong></a>
    </li> 
    <? } if (cmsFunction::isShowGroupMenu(8)) { ?>
    <li class="setting_li<?=($showAdmin==8)?' activemenu':''?>" id="menu8"><a href="/admin.php?do=infos" title="" class="<?=($showAdmin==8)?' active':''?>"><span>Cấu hình website</span><strong></strong></a>
    </li>
    <? } ?>
    <div style="display:none;" id="show_hide_menu">
    <?php if (cmsFunction::isShowGroupMenu(3)) { ?>
     <li class="article_li<?=($showAdmin==3)?' activemenu':''?>" id="menu3"><a href="#" title="" class="exp<?=($showAdmin==3)?' active':''?>"><span>Tin tức</span><strong></strong></a>
      <ul class="sub">
        <li <?=$do=='articles'&&$act!='add'?'class="this"':''?>><a href="admin.php?do=articles" title="">Tất cả tin tức</a></li>      
        <li <?=$do=='articles'&&$act=='add'?'class="this"':''?>><a href="admin.php?do=articles&act=add" title="">Thêm tin tức</a></li>      
      </ul>
    </li>
	<? } if (cmsFunction::isShowGroupMenu(4)) { ?>
     <li class="product_li<?=($showAdmin==4)?' activemenu':''?>" id="menu4"><a href="#" title="" class="exp<?=($showAdmin==4)?' active':''?>"><span>Sản phẩm</span><strong></strong></a>
      <ul class="sub">
        <li <?=$do=='products'&&$act!='add'?'class="this"':''?>><a href="admin.php?do=products" title="">Tất cả sản phẩm</a></li>
        <li <?=$do=='products'&&$act=='add'?'class="this"':''?>><a href="admin.php?do=products&act=add" title="">Thêm sản phẩm</a></li>   
<li <?=$do=='quanlymaus'?'class="this"':''?>><a href="admin.php?do=quanlymaus" title="">Quản lý màu sắc</a></li>		
<li <?=$do=='quanlysizes'?'class="this"':''?>><a href="admin.php?do=quanlysizes" title="">Quản lý kích thước</a></li>		
<li <?=$do=='quanlythuonghieus'?'class="this"':''?>><a href="admin.php?do=quanlythuonghieus" title="">Quản lý thương hiệu</a></li>		
      </ul>
    </li> 
    <? } if (cmsFunction::isShowGroupMenu(5)) { ?>
    <li class="cart_li<?=($showAdmin==5)?' activemenu':''?>" id="menu5"><a href="#" title="" class="exp<?=($showAdmin==5)?' active':''?>"><span>Bán hàng</span><strong></strong></a>
      <ul class="sub">
        <li <?=$do=='orders'&&!$act?'class="this"':''?>><a href="admin.php?do=orders" title="">Đơn hàng chưa hoàn thành</a></li>
        <li <?=$do=='orders'&&$act=='finish'?'class="this"':''?>><a href="admin.php?do=orders&act=finish" title="">Đơn hàng đã hoàn thành</a></li>
        <li <?=$do=='payments'||$do=='banks'?'class="this"':''?>><a href="admin.php?do=payments" title="">Hệ thống thanh toán</a></li>
        <li <?=$do=='thankyou'?'class="this"':''?>><a href="admin.php?do=thankyou" title="">Cấu hình bán hàng</a></li>  
      </ul>
    </li>
    <? } if (cmsFunction::isShowGroupMenu(6)) { ?>
    <li class="ui<?=($showAdmin==6)?' activemenu':''?>" id="menu6"><a href="#" title="" class="exp<?=($showAdmin==6)?' active':''?>"><span>Quản lý website</span><strong></strong></a>
      <ul class="sub">
        <li <?=$do=='admin_groups'?'class="this"':''?>><a href="admin.php?do=admin_groups" title="">Các nhóm quản trị viên & phân quyền</a></li>
        <li <?=$do=='users'?'class="this"':''?>><a href="admin.php?do=users" title="">Danh sách quản trị viên</a></li> 
        <li <?=$do=='userlog'?'class="this"':''?>><a href="admin.php?do=userlog" title="">Theo dõi hoạt động quản trị viên</a></li> 
      </ul>
    </li>
	<? } if (cmsFunction::isShowGroupMenu(7)) { ?>
     <li class="member_li<?=($showAdmin==7)?' activemenu':''?>" id="menu7"><a href="#" title="" class="exp<?=($showAdmin==7)?' active':''?>"><span>Người dùng</span><strong></strong></a>
      <ul class="sub">
        <?php /*?><li <?=$do=='member'?'class="this"':''?>><a href="admin.php?do=member" title="">Danh sách thành viên</a></li> <?php */?>
        <li <?=$do=='contact_logs'?'class="this"':''?>><a href="admin.php?do=contact_logs" title="">Danh sách liên hệ</a></li>
        <li <?=$do=='comments'?'class="this"':''?>><a href="admin.php?do=comments" title="">Danh sách bình luận</a></li>           
      </ul>
    </li>
    <? } if (cmsFunction::isShowGroupMenu(9)) { ?>
    <li class="gallery_li<?=($showAdmin==9)?' activemenu':''?>" id="menu9"><a href="#" title="" class="exp<?=($showAdmin==9)?' active':''?>"><span>Thư viện</span><strong></strong></a>
      <ul class="sub">
        <li <?=$do=='albums'||$do=='images'?'class="this"':''?>><a href="admin.php?do=albums" title="">Album ảnh</a></li> 
        <li <?=$do=='video'?'class="this"':''?>><a href="admin.php?do=video" title="">Video Youtube</a></li> 
      </ul>
    </li>
    <? } if (cmsFunction::isShowGroupMenu(10)) { ?>
    <li class="template_li<?=($showAdmin==10)?' activemenu':''?>" id="menu10"><a href="#" title="" class="exp<?=($showAdmin==10)?' active':''?>"><span>Giao diện</span><strong></strong></a>
      <ul class="sub">
        <li <?=$do=='widgets'&$cid==1?'class="this"':''?>><a href="admin.php?do=widgets&cid=1" title="">Widget cột trái</a></li>
        <li <?=$do=='widgets'&$cid==2?'class="this"':''?>><a href="admin.php?do=widgets&cid=2" title="">Widget cột phải</a></li>
        <li <?=$do=='widgets'&$cid==3?'class="this"':''?>><a href="admin.php?do=widgets&cid=3" title="">Widget trang chủ</a></li>
        <li <?=$do=='widgets'&$cid==4?'class="this"':''?>><a href="admin.php?do=widgets&cid=4" title="">Widget footer</a></li>
        <li <?=$do=='img_group'||$do=='img'?'class="this"':''?>><a href="admin.php?do=img_group&act=detail&cid=1" title="">Hình Slider trang chủ</a></li>
        <li <?=$do=='interface'?'class="this"':''?>><a href="admin.php?do=interface" title="">Các mẫu giao diện</a></li>
        <li <?=$do=='popup'?'class="this"':''?>><a href="admin.php?do=popup" title="">Popup</a></li>
        <li <?=$do=='exit_popup'?'class="this"':''?>><a href="admin.php?do=exit_popup" title="">Exit Popup</a></li>
      </ul>
    </li>
    <? } if (cmsFunction::isShowGroupMenu(11)) { ?>
    <li class="marketing_li<?=($showAdmin==11)?' activemenu':''?>" id="menu11"><a href="#" title="" class="exp<?=($showAdmin==11)?' active':''?>"><span>Marketing Online</span><strong></strong></a>
      <ul class="sub">
        <li <?=$do=='nicks'?'class="this"':''?>><a href="admin.php?do=nicks" title="">Nick hỗ trợ</a></li>
        <?php /*?><li <?=$do=='optin_type'?'class="this"':''?>><a href="admin.php?do=optin_type" title="">Chương trình Opt-In</a></li>
        <li <?=$do=='optin'?'class="this"':''?>><a href="admin.php?do=optin" title="">Email Opt-In</a></li><?php */?>
      </ul>
    </li>
    <? } ?>
    </div>
    <li style="margin-top:30px;"><a href="#" class="exp" id="click_show"><span>&raquo; Hiển thị thêm menu &laquo;</span></a></li>
  </ul>
</div>