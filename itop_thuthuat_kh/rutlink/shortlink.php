<? 
switch($act){
	case 'detail':
		choseTemplate();
		break;
}

function choseTemplate()
{
	global $db, $lg, $tpl, $title_page, $keywords, $descriptions, $product, $article, $do;
	
	$unique_key = SafeQueryString('unique_key');
	$sql = "select * from articles where unique_key_$lg like '$unique_key'";
	$article = $db->getRow($sql);

	if ($article["id"]) {
		$title_page = $article["title_$lg"];
		$keywords = $article["keyword_$lg"];
		$descriptions = $article["des_$lg"];
		$cid = $article["cid"];
		$do = "articles";
		$tpl = "detail";
	} else {
		$sql = "select * from products where unique_key_$lg like '$unique_key'";
		$product = $db->getRow($sql);

		if ($product["id"]) {
			$title_page = $product["title_$lg"];
			$keywords = $product["keyword_$lg"];
			$descriptions = $product["des_$lg"];
			$cid = $product["cid"];
			$do = "products";
			$tpl = "detail";
		}
	}
}
?>