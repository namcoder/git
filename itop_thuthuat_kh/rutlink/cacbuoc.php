htaccess
RewriteRule ^([a-zA-Z0-9\-]+).html index.php?unique_key=$1&lg=vn
bên dưới mấy cái giỏ hàng, thành viên
/domains/myphamvietnam247.com/public_html/index.php sửa
if (isset($_GET['unique_key'])) {
	$do = "shortlink";
	$act = "detail";
} else {
	$do = "main";
	$act = "main";
}
shortlink.php
chỉnh lại hàm tạolink của tin tức & sản phẩm