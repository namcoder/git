<?php
	class products
	{
		public $name;
		public $short;
		public $content;
		public $img;
		public $unique_key;
		public $cid;
		public $price;
		public $price_sale;
		public $id;
		public $code;
		public $view;
		public $dated;
		public $keyword;
		public $description;
		public $title;
		public $mausac;
		public $kichthuoc;
		public $thuonghieu;
		public $index;
		public $reverse_unique_key;
		public $ext_url;
		public $new_tab;
		// khoi tao
		public function __construct($product) {
			global $lg;
			$rlg = $lg=="vn"?"en":"vn";
	
			$this->name = $product["name_$lg"];
			$this->short = $product["short_$lg"];
			$this->content = $product["content_$lg"];
			$this->unique_key = $product["unique_key_$lg"];
			$this->img = $product["img"];
			$this->cid = $product["cid"];
			$this->price = $product["price"];
			$this->kichthuoc = $product["kichthuoc"];
			$this->mausac = $product["mausac"];
			$this->thuonghieu = $product["thuonghieu"];
			$this->price_sale = $product["price_sale"];
			$this->id = $product["id"];
			$this->code = $product["code"];
			$this->view = $product["view"];
			$this->dated = $product["dated"];
			$this->keyword = $product["keyword_$lg"];
			$this->description = $product["des_$lg"];
			$this->title = $product["title_$lg"];
			$this->index = $product["is_noindex"];
			$this->reverse_unique_key = $product["unique_key_$rlg"];
			$this->ext_url = $product["ext_url"];
			$this->new_tab = $product["new_tab"];
		}
		
		public function isNewTab() {
			return $this->new_tab==1?true:false;
		}
		
		public function isSaleOff() {
			return $this->price_sale>0?true:false;
		}
		
		public function getThuonghieu() {
			global $db;
			$sql = "select * from quanlythuonghieus where id=".$this->thuonghieu;
			$thuonghieu = $db->getRow($sql);
			return $thuonghieu;
		}
		
		public function getMausac() {
			return $this->mausac;
		}
		
		public function getKichthuoc() {
			return $this->kichthuoc;
		}
		
		public function getReverseUniqueKey() {
			return $this->reverse_unique_key;
		}
		
		public function getIndex() {
			return $this->index;
		}
		
		public function getTitle() {
			return $this->title;
		}
		
		public function getKeyword() {
			return $this->keyword;
		}
		
		public function getDescription() {
			return $this->description;
		}
		
		public function getPercent() {
			if ($this->price>0)
		  		return number_format((1-($this->price_sale/$this->price))*100);
			return 0;
		}
		
		public function getView() {
			return $this->view;
		}
		
		public function getID() {
			return $this->id;
		}
		
		public function getCID() {
			return $this->cid;
		}

        public function getName() {
            return $this->name;
        }
		
		public function getDate() {
            return $this->dated;
        }
		
		public function getImage($w, $h=0) {
            return getTimThumb($this->img, $w, $h);
        }
		
		public function getImageNoThumb() {
            return GetImage($this->img);
        }
		
		public function isHasImage() {
            return file_exists($this->img)?true:false;
        }
		
		public function getShort() {
            return $this->short;
        }
		
		public function getContent() {
            return $this->content;
        }
		
		public function getPrice() {
			$percent = Info::getInfoField('percent');
			return $this->price + $this->price*$percent/100;
		}
		
		public function getPriceSale() {
			$percent = Info::getInfoField('percent');
			return $this->price_sale>0?($this->price_sale + $this->price_sale*$percent/100):($this->price + $this->price*$percent/100);
		}
		
		public function getCode() {
			return $this->code;
		}
		
		public function getLink() {
			global $db;
			
			if ($this->ext_url)
				return $this->ext_url;
			
			$sql = "select * from categories where id=".$this->cid;
			$parent = $db->getRow($sql);
			$parent = new Categories($parent);
			$plink = $parent->getLinkNoExtLink();
			
			return $plink.$this->unique_key.'.html';
        }
		
		public function getRelate() {
			global $db, $lg;

			$num_relate = Info::getInfoField('num_relate_product');
			
			$sql = "select * from products where active=1 and name_$lg<>'' and id<>".$this->id." and cid=".$this->cid." order by id desc";
			$total = $db->getAll($sql);
			if (count($total) < $num_relate)
				return $total;
			
			$num_older = floor($num_relate/2);
			$num_newer = $num_relate%2==0?$num_older:$num_older+1;
			// cu hon
			$sql = "select * from products where active=1 and name_$lg<>'' and id<".$this->id." and cid=".$this->cid." order by id desc limit $num_older";
			$older = $db->getAll($sql);
			// moi hon
			$sql = "select * from products where active=1 and name_$lg<>'' and id>".$this->id." and cid=".$this->cid." order by id asc limit $num_newer";
			$newer = $db->getAll($sql);
			// tinh so chenh lech
			$count_older = $num_older - count($older);
			$count_newer = $num_newer - count($newer);
			if ($count_older) {
				$sql = "select * from products where active=1 and name_$lg<>'' and id>".$this->id." and cid=".$this->cid." order by id asc limit ".($num_newer+$count_older);
				$newer = $db->getAll($sql);
			} else if ($count_newer) {
				$sql = "select * from products where active=1 and name_$lg<>'' and id<".$this->id." and cid=".$this->cid." order by id desc limit ".($num_older+$count_newer);
				$older = $db->getAll($sql);
			}
			// gom thanh 1 mang & tra ve
			$result = array();
			$index = 0;
			if ($newer)
			{
				for ($i=count($newer)-1; $i>-1; $i--)
				{
					$result[$index] = $newer[$i];
					$index++;
				}
			}
			if ($older)
			{
				for ($j=0; $j<count($older); $j++)
				{
					$result[$index] = $older[$j];
					$index++;
				}
			}
			return $result;
		}
		
		public function getCustomField() {
			global $db, $lg;
			
			$sql = "select c.* from products_customfields p, customfields c where active=1 and name_$lg<>'' and customfieldid=c.id and productid=".$this->id." order by num asc, c.id asc";
			return $db->getAll($sql);
		}
		
		public function getTag($tab='') {
			global $db, $FullUrl, $lg;
	
			$sql = "select tags.* from tags, tags_art where active=1 and idart=".$this->id." and post_in='products' and tags.idtag=tags_art.idtag";
			$tags = $db->getAll($sql);
			$begintab = $endtab = "";
			$prefix = $lg=='vn'?"/tag/san-pham/":"/en/tag/products/";
			$result = "";
	
			if($tab!=''){
				$begintab = "<".$tab.">";
				$endtab = "</".$tab.">";
			}
			if ($tags)
			{
				foreach ($tags as $i=>$tag) {
					$result .= $begintab."<a href='".$FullUrl.$prefix.$tag["unique_key_tag"]."/' title='".$tag["name_tag"]."'>".$tag["name_tag"]."</a>".$endtab;
					if($i+1 !=count($tags))
						$result .= ", ";
				}
			}
			return $result;
		}
		
		public function getComments() {
			
			global $db;
	
			$sql = "select * from comments where cmt_post_id=".$this->id." and cmt_do='products' and cmt_active=1 and cmt_pid=0 order by cmt_id desc";
			return $db->getAll($sql);
		}

		public function getNumComment() {
			global $db;

			$sql = "select * from comments where cmt_post_id=".$this->id." and cmt_do='products' and cmt_active=1";
			return $db->numRows($db->query($sql));
		}
		
		public function countView() {	// tinh luot view
			global $db;
			
			$UniqueSession = "ProAreViewed";
			$IdString = "[".$this->id."]";
			
			if(!isset($_SESSION[$UniqueSession]))
			{
				$_SESSION[$UniqueSession] = $IdString;
	
				$sql = "update products set view=view + 1 where id=".$this->id;
				$db->query($sql);
			}
			else
			{
				$mystring = $_SESSION[$UniqueSession];
				$findme = $IdString;
				$pos = strpos($mystring, $findme);
				
				if($pos === false)
				{
					$_SESSION[$UniqueSession] .= $IdString;
					
					$sql = "update products set view=view + 1 where id=".$this->id;	
					$db->query($sql);
				}
			}
		}

		public static function getStatus($status) {	
			if($status==0)
				return 'Chưa thanh toán';
			else if($status==1)
				return 'Đã thanh toán';
			else if($status==2)
				return 'Đã xử lý';
		}
	
		public static function getStatusImage($status) {	
			if($status==0)
				return 'images/admin/icons/color/hide.png';
			else if($status==1)
				return 'images/admin/icons/color/tick.png';
			else if($status==2)
				return 'images/table/finished.png';
		}

		public function __destruct() {
		}
	}
?>