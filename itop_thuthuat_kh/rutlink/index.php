<?php
session_start();
global $lg, $prefix_url;
$prefix_url = "/";

include('./includes/config.php');

if(isset($_GET['lg'])){
	$lg = mysql_real_escape_string($_GET["lg"]);
	$lg = strip_tags($lg);
	$_SESSION['lg'] = mysql_real_escape_string($_GET["lg"]);
}
else{
	$lg = "vn";
	$_SESSION['lg'] = "vn";		
}

// begin cache
	global $cache_filename;
	$cache_time = 0;//24*60*60;
	if(isset($_SESSION["store_login"])){
		$cache_time = 0;
	}
	if(($do=="products" || $do=="articles") && $act=="detail"){
		$cache_time = 24*60*60;
	}
	$cache_folder = 'cache/';
	$cache_filename = $cache_folder.md5($_SERVER['REQUEST_URI']) . "_" . $_SESSION['lg'] . ".txt"; 
	$cache_created  = (file_exists($cache_filename)) ? filemtime($cache_filename) : 0;  
	
	if (file_exists($cache_filename) && ((time() - $cache_created) < $cache_time)) {  
		include($cache_filename);
	}
	else{
		
	ob_start();
	
	// end cache

if($lg=="en")
	$prefix_url = "/en/";

	
include('language/'.$_SESSION['lg'].'.php');

define('TPL_DIR','templates/site/');
define('SRC_DIR','sources/site/');
define('CLASS_DIR','class/');

include("./includes/constant.php");
include("./includes/functions.php");
include("./includes/va_db.php");

include(CLASS_DIR.'bao_tri.class.php');
include(CLASS_DIR."info.class.php");
include(CLASS_DIR."template.php");
include(CLASS_DIR."cart.class.php");
include(CLASS_DIR."imagegroup.class.php");
include(CLASS_DIR."categories.class.php");
include(CLASS_DIR."email.class.php");
include(CLASS_DIR."articles.class.php");
include(CLASS_DIR."albums.class.php");
include(CLASS_DIR."videos.class.php");
include(CLASS_DIR."products.class.php");
include(CLASS_DIR."members.class.php");
include(CLASS_DIR."comment.class.php");

if(BaoTri::Check()){
	include(TPL_DIR.'baotri.php');
}
else{
	global $page, $do, $act ,$tpl, $db, $title_page, $keywords, $descriptions;
	
	if(isset($_GET['do'])){
		$do = CleanSQLInjection(isset($_GET["do"])?$_GET["do"]:'main');
		$act = CleanSQLInjection(isset($_GET["act"])?$_GET["act"]:"main");
	}
	else{
		if(isset($_GET['cat1'])){
			global $cat1, $cat2, $cat3, $cat4, $cat5;
			$cat1_key = CleanSQLInjection($_GET['cat1']);
			
			if($cat1_key == "index"){
				$do = "main";
				$act = "main";
			}
			else{
				$sql = "select * from categories where unique_key_$lg='$cat1_key'";
				$r1 = $db->getRow($sql);
				//seo
				$title_page = $r1["title_$lg"];
				$keywords = $r1["keyword_$lg"];
				$descriptions = $r1["des_$lg"];
				
				if($r1['has_child'] == 1){
					$do = "submenu";
					$act = "list";
				}
				else{
					$sql = "select do, act from component where id=".$r1['comp'];
					$r = $db->getRow($sql);
					$do = $r['do'];
					$act = $r['act'];
				}
				
				if ($r1["id"] != "121") {
					$sql = "select * from categories where name_$lg<>'' and id=".$r1["pid"];
					$r2 = $db->getRow($sql);
			
					if ($r2["id"] != "121") {
						$sql = "select * from categories where name_$lg<>'' and id=".$r2["pid"];
						$r3 = $db->getRow($sql);
			
						if ($r3["id"] != "121") {
							$sql = "select * from categories where name_$lg<>'' and id=".$r3["pid"];
							$r4 = $db->getRow($sql);
							
							if ($r4["id"] != "121") {
								$sql = "select * from categories where name_$lg<>'' and id=".$r4["pid"];
								$r5 = $db->getRow($sql);
							}
						}
					}
				}
				
				if ($r5["id"]) {
					$cat1 = $r4;
					$cat2 = $r3;
					$cat3 = $r2;
					$cat4 = $r1;
				} else if ($r4["id"]) {
					$cat1 = $r3;
					$cat2 = $r2;
					$cat3 = $r1;
				} else if ($r3["id"]) {
					$cat1 = $r2;
					$cat2 = $r1;
				} else if ($r2["id"]) {
					$cat1 = $r1;
				}

				if ($do) {
					if(isset($_GET['unique_key'])){
						$act = "detail";
					}
				} else {
					$do = "404";
				}
			}
		}
		else{
			if (isset($_GET['unique_key'])) {
				$unique_key = SafeQueryString('unique_key');
				$sql = "select * from articles where unique_key_$lg like '$unique_key'";
				$article = $db->getRow($sql);
			
				if ($article["id"]) {
					$do = "shortlink";
					$act = "detail";
				} else {
					$sql = "select * from products where unique_key_$lg like '$unique_key'";
					$product = $db->getRow($sql);
			
					if ($product["id"]) {
						$do = "shortlink";
						$act = "detail";
					} else {
						global $act;
						$sql = "select * from products_labels where unique_key_$lg='$unique_key'";
						$label = $db->getRow($sql);
			
						if ($label["id"]) {
							$do = "shortlink";
							$act = "detail";
						}
					}
				}
				if (!$do)
					$do = "404";
			} else {
				$do = "main";
				$act = "main";
			}
		}
	}
	$page = isset($_GET["page"])?is_numeric($_GET["page"])?$_GET["page"]:'1':'1';

	if (file_exists("./sources/site/".$do.".php")){
		require("./sources/site/".$do.".php");
	}
	else{
		require("404.php");
		return;
	}	
	//show
	include(SRC_DIR.'index.php');
}
?>
<?php  
	global $cache_filename;
	file_put_contents($cache_filename, ob_get_contents());  
	ob_end_flush();  
	}
?>