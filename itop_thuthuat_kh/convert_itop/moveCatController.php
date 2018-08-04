<?php

namespace App\Http\Controllers;

use App\Repositories\Contracts\OptionRepositoryInterface;
use Illuminate\Http\Request;
use Image;
use \Storage;
use Illuminate\Support\Facades\DB;
use App\Models\Backend\WbCats;
use App\Models\Backend\WbCatLangs;
use App\Models\Backend\WbSliders;
use App\Models\Backend\WbSliderLangs;


class moveCatController extends Controller
{


    public function action(Request $request)
    {

        include("Movedata/htspa_hts.php");


//       dd($component);
//       dd($categories);


//        include( $request->fileToUpload);
//        echo $articles[0]["id"];

//        foreach ($request->imageHighSrc as $key => $image_high_src) {
//            $high_image = Image::make($image_high_src);
//            $image_name = str_random(20) . "-" . $request->imageName[$key];
//            Storage::put("upload/temp/high/".$image_name, (string) $high_image->encode());
//            $medium_image = Image::make($request->imageMediumSrc[$key]);
//            Storage::put("upload/temp/medium/".$image_name, (string) $medium_image->encode());
//        }
//        return redirect()->back();
//       
//       

        $mail = array();
        array_push($mail, $infos[0]["mail_contact"]);
        $mail = json_encode($mail);
        DB::table('wb_options')
            ->where('option_key', 'website_email_contact')
            ->update(['option_value' => $mail]);

        DB::table('wb_options')
            ->where('option_key', 'website_logo')
            ->update(['option_value' => $infos[0]["logo"]]);

        DB::table('wb_options')
            ->where('option_key', 'website_name')
            ->update(['option_value' => $infos[0]["mail_name"]]);

        DB::table('wb_options')
            ->where('option_key', 'website_icon')
            ->update(['option_value' => $infos[0]["favicon"]]);

        DB::table('wb_options')
            ->where('option_key', 'website_map')
            ->update(['option_value' => $infos[0]["googlemap"]]);

//        DB::table('wb_options')
//            ->where('option_key','website_script')
//            ->update(['option_value' => $infos[0]["zopim"]]);

//        $phone=array();
//        array_push($phone, $infos[0]["mail_phone"]);
//        $phone=json_encode($phone);
//        DB::table('wb_options')
//            ->where('option_key','website_phone')
//            ->update(['option_value' => $phone]);

        DB::table('wb_options')
            ->where('option_key', 'website_copyright')
            ->update(['option_value' => $infos[0]["copyright_vn"]]);


        DB::table('wb_cats')->where('cat_type_code', '!=', "home")->delete();
        $frist_cat = DB::table('wb_cats')->first();
        DB::table('wb_cat_langs')->where('cat_id', '!=', $frist_cat->cat_id)->delete();
        DB::table('wb_posts')->delete();
        DB::table('wb_post_langs')->delete();
        DB::table('wb_products')->delete();
        DB::table('wb_product_langs')->delete();
        DB::table('wb_menus')->delete();


        $datacat = array();
        $datacatlang = array();
        $data_post = array();


        for ($i = 0; $i < count($categories); $i++) {
            $wpCat = array(
                "cat_id" => '',
                "cat_image_high" => '',
                "cat_image_medium" => '',
                "cat_image_low" => '',
                "cat_parent_id" => '',
                "cat_type_code" => '',
                "cat_is_show" => 1,
            );


            $wpCatlang = array(
                'cat_lang_name' => '',
                'cat_lang_slug' => '',
                'cat_lang_url' => '',
                'cat_lang_title' => '',
                'cat_lang_description' => '',
                'cat_lang_seo_title' => '',
                'cat_lang_seo_description' => '',
                'cat_lang_seo_keyword' => '',
                'cat_lang_image_high' => '',
                'cat_lang_image_medium' => '',
                'cat_lang_image_low' => '',
                'cat_lang_content' => '',
                'cat_lang_is_show' => 1,
                'cat_id' => '',
                'lang_code' => 'vi',
            );


            for ($j = 0; $j < count($component); $j++) {

                if ($categories[$i]['comp'] == $component[$j]["id"]) {

                    if ($component[$j]["do"] == "intro") {

                        $wpCat["cat_type_code"] = "intros";
                        break;

                    }
                    if ($component[$j]["do"] == "articles") {

                        $wpCat["cat_type_code"] = "news";
                        break;

                    }
                    if ($component[$j]["do"] == "contact") {

                        $wpCat["cat_type_code"] = "contacts";
                        break;

                    }
                    if ($component[$j]["do"] == "products") {

                        $wpCat["cat_type_code"] = "products";
                        break;

                    }
                    if ($component[$j]["do"] == "submenu") {
                        $check = 0;
                        $listId = moveCatController::getIdChild($categories,  $categories[$i]['id']);

                        foreach($listId as $idCat) {
                            foreach ($articles as $item) {


                                if ($item['cid'] == $categories[$i]['id'] || $item['cid']== $idCat) {


                                    $check = 1;
                                    break;

                                }
                            }
                        }
                        if ($check == 1) {
                            $wpCat["cat_type_code"] = "news";

                            break;

                        } else {
                            foreach($listId as $idCat) {
                                foreach ($products as $item) {
                                    if ($item['cid'] == $categories[$i]['id']|| $item['cid']== $idCat) {
                                        $check = 2;
                                    }
                                }
                            }
                            if ($check == 2) {
                                $wpCat["cat_type_code"] = "products";
                                break;
                            }
                        }

                    }


                    break;
                }


            }

            if ($wpCat["cat_type_code"] != "") {

                if ($categories[$i]['img']) {
                    $wpCat["cat_image_high"] = $categories[$i]['img'];
                    $wpCat["cat_image_medium"] = $categories[$i]['img'];
                    $wpCat["cat_image_low"] = $categories[$i]['img'];

                }
                if ($categories[$i]['active']) {
                    $wpCat["cat_is_show"] = $categories[$i]['active'];
                    $wpCatlang["cat_lang_is_show"] = $categories[$i]['active'];


                }

                $wpCat["cat_id"] = $categories[$i]['id'];
                $wpCat["cat_parent_id"] = 0;

                if ($categories[$i]['name_vn']) {
                    $wpCatlang["cat_lang_name"] = $categories[$i]['name_vn'];

                }
                if ($categories[$i]['unique_key_vn']) {

                    $wpCatlang["cat_lang_slug"] = $categories[$i]['unique_key_vn'];
                    $wpCatlang["cat_lang_url"] = $categories[$i]['unique_key_vn'] . "/";
                } else {

                    $wpCatlang["cat_lang_slug"] = str_slug($categories[$i]['name_vn']);
                    $wpCatlang["cat_lang_url"] = str_slug($categories[$i]['name_vn']) . "/";
                }

                if ($categories[$i]['title_vn']) {
                    $wpCatlang["cat_lang_title"] = $categories[$i]['title_vn'];
                }
                if ($categories[$i]['des_vn']) {
                    $wpCatlang["cat_lang_description"] = $categories[$i]['des_vn'];
                }
                if ($categories[$i]['seo_f_vn']) {
                    $wpCatlang["cat_lang_seo_title"] = $categories[$i]['seo_f_vn'];

                }
                if ($categories[$i]['keyword_vn']) {
                    $wpCatlang["cat_lang_seo_keyword"] = $categories[$i]['keyword_vn'];

                }
                if ($categories[$i]['img']) {

                    $wpCatlang["cat_lang_image_high"] = $categories[$i]['img'];
                    $wpCatlang["cat_lang_image_medium"] = $categories[$i]['img'];
                    $wpCatlang["cat_lang_image_low"] = $categories[$i]['img'];
                }

                if ($categories[$i]['content_vn']) {
                    $wpCatlang["cat_lang_content"] = $categories[$i]['content_vn'];

                }
                $wpCatlang["cat_id"] = $wpCat["cat_id"];

                array_push($datacat, $wpCat);
                array_push($datacatlang, $wpCatlang);
            }


        }

        DB::table('wb_cats')->insert($datacat);
        DB::table('wb_cat_langs')->insert($datacatlang);


        //====move menu=====//

        for ($i = 0; $i < count($categories); $i++) {

            $menu_top = array(
                'cat_id' => '',
                'menu_parent_id' => null,
                'menu_order' => 1,
                'menu_position' => 'top',
            );


            $menu_top["cat_id"] = $categories[$i]["id"];

            if ($categories[$i]["pid"] == 121 || $categories[$i]["pid"] == 0) {

                $id_menu = DB::table('wb_menus')->insertGetId($menu_top);

                if ($menu_top["cat_id"] != 1) {

                    for ($k = 0; $k < count($categories); $k++) {
                        $menu_top_child = array(
                            'cat_id' => '',
                            'menu_parent_id' => null,
                            'menu_order' => 1,
                            'menu_position' => 'top',
                        );

                        if ($categories[$i]["id"] == $categories[$k]["pid"]) {

                            $menu_top_child["cat_id"] = $categories[$k]["id"];
                            $menu_top_child["menu_parent_id"] = $id_menu;
                            $id_child = DB::table('wb_menus')->insertGetId($menu_top_child);

                        }
                    }
                }
            }


        }

        $result = DB::table('wb_menus')->get();
        $result1 = DB::table('wb_cats')->get();

        foreach ($result as $item) {
            $check = 0;
            foreach ($result1 as $item1) {
                if ($item1->cat_id == $item->cat_id) {
                    $check = 1;
                    break;
                }
            }
            if ($check == 0) {

                DB::table('wb_menus')->where('cat_id', $item->cat_id)->delete();
            }

        }


        ///=====sort menu====///     


        //====move slider========//
        for ($imgi = 0; $imgi < count($img); $imgi++) {

            $wb_sliders = [
                'post_image_high' => "",
                'post_image_medium' => "",
                'post_image_low' => "",
                'post_is_show' => 0,
                'post_type' => "sliders",
                'post_order' => 0,
                'post_sliders_link_target' => 0,
            ];

            if ($img[$imgi]["img"]) {
                $wb_sliders['post_image_high'] = $img[$imgi]['img'];
                $wb_sliders['post_image_medium'] = $img[$imgi]['img'];
                $wb_sliders['post_image_low'] = $img[$imgi]['img'];
            }
            if ($img[$imgi]["active"] == 0) {

                $wb_sliders['post_is_show'] = 0;
            }
            if ($img[$imgi]["num"]) {
                $wb_sliders['post_order'] = $img[$imgi]['num'];
            }

            if (isset($img[$imgi]["new_tab"])) {

                $wb_sliders['post_sliders_link_target'] = $img[$imgi]['new_tab'];
            }

            $sliders = WbSliders::create($wb_sliders);


            $wb_slider_langs = [

                'post_lang_title' => '',
                'post_lang_description' => '',
                'post_lang_seo_title' => '',
                'post_lang_seo_keyword' => '',
                'post_lang_seo_description' => '',
                'post_lang_url' => '',
                'post_lang_content' => '',
                'post_lang_date_public' => '',
                'post_lang_view' => 1,
                'post_lang_is_on_top' => '',
                'post_id' => $sliders->id,
                'lang_code' => 'vi',
                'post_lang_image_high' => "",
                'post_lang_image_medium' => "",
                'post_lang_image_low' => "",
                'post_lang_link_target' => 0,

            ];

            if ($img[$imgi]["name_vn"]) {

                $wb_slider_langs["post_lang_title"] = $img[$imgi]["name_vn"];

            }
            if ($img[$imgi]["url"]) {
                $wb_slider_langs["post_lang_url"] = $img[$imgi]["url"];
            }
            if ($img[$imgi]["img"]) {
                $wb_slider_langs['post_lang_image_high'] = $img[$imgi]['img'];
                $wb_slider_langs['post_lang_image_medium'] = $img[$imgi]['img'];
                $wb_slider_langs['post_lang_image_low'] = $img[$imgi]['img'];
            }


            WbSliderLangs::create($wb_slider_langs);
        }
        //====move product========//
        for ($proi = 0; $proi < count($products); $proi++) {

            $result = DB::table('wb_cats')->get();

            for ($ire = 0; $ire < count($result); $ire++) {

                if ($products[$proi]["cid"] == $result[$ire]->cat_id) {

                    $pro_new = array(
                        "product_image_high" => "",
                        "product_image_medium" => "",
                        "product_image_low" => "",
                        "product_code" => "",
                        "product_original_price" => "",
                        "product_sale_price" => "",
                        "product_weigh" => "",
                        "product_is_show" => 1,
                        "cat_id" => $products[$proi]["cid"],
                    );
                    $pro_new_lang = array(
                        "product_lang_url" => "",
                        "product_lang_title" => "",
                        "product_lang_description" => "",
                        "product_lang_content" => "",
                        "product_lang_seo_title" => "",
                        "product_lang_seo_description" => "",
                        "product_lang_seo_keyword" => "",
                        "product_lang_image_high" => "",
                        "product_lang_image_medium" => "",
                        "product_lang_image_low" => "",
                        "product_id" => "",
                        "lang_code" => "vi",
                        "product_lang_original_price" => "",
                        "product_lang_sale_price" => "",
                        "product_lang_note_price" => "",
                    );
                    if ($products[$proi]['active']) {

                        $pro_new["product_is_show"] = $products[$proi]['active'];
                    }

                    if ($products[$proi]["view"]) {
                        $pro_new_lang["product_lang_view_count"] = $products[$proi]["view"];
                    }

                    if ($products[$proi]['dated']) {

                        $pro_new["created_at"] = $products[$proi]['dated'];
                        $pro_new["updated_at"] = $products[$proi]['dated'];
                        $pro_new_lang["created_at"] = $products[$proi]['dated'];
                        $pro_new_lang["updated_at"] = $products[$proi]['dated'];
                    }
                    if ($products[$proi]["img"]) {
                        $pro_new["product_image_high"] = $products[$proi]["img"];
                        $pro_new["product_image_medium"] = $products[$proi]["img"];
                        $pro_new["product_image_low"] = $products[$proi]["img"];
                    }
                    if ($products[$proi]["price"]) {
                        $pro_new["product_original_price"] = $products[$proi]["price"];

                    }
                    if ($products[$proi]["price_sale"]) {
                        $pro_new["product_sale_price"] = $products[$proi]["price_sale"];

                    }

                    $id_pro_new = DB::table('wb_products')->insertGetId($pro_new);


                    if ($id_pro_new) {

                        $pro_new_lang["product_id"] = $id_pro_new;

                    }

                    if ($products[$proi]["unique_key_vn"]) {

                        $pro_new_lang["product_lang_url"] = $products[$proi]["unique_key_vn"] . ".html";

                    } else {
                        $pro_new_lang["product_lang_url"] = str_slug($products[$proi]["name_vn"]) . ".html";

                    }

                    if ($products[$proi]["title_vn"]) {
                        $pro_new_lang["product_lang_title"] = $products[$proi]["title_vn"];
                    }
                    if ($products[$proi]["short_vn"]) {
                        $pro_new_lang["product_lang_description"] = $products[$proi]["short_vn"];
                        $pro_new_lang["product_lang_seo_description"] = $products[$proi]["short_vn"];
                    }
                    if ($products[$proi]["content_vn"]) {
                        $pro_new_lang["product_lang_content"] = $products[$proi]["content_vn"];
                    }
                    if ($products[$proi]["name_vn"]) {
                        $pro_new_lang["product_lang_seo_title"] = $products[$proi]["name_vn"];
                    }

                    if ($products[$proi]["keyword_vn"]) {
                        $pro_new_lang["product_lang_seo_keyword"] = $products[$proi]["keyword_vn"];
                    }

                    if ($products[$proi]["name_vn"]) {
                        $pro_new_lang["product_lang_seo_title"] = $products[$proi]["name_vn"];
                    }

                    if ($products[$proi]["img"]) {
                        $pro_new_lang["product_lang_image_high"] = $products[$proi]["img"];
                        $pro_new_lang["product_lang_image_low"] = $products[$proi]["img"];
                        $pro_new_lang["product_lang_image_medium"] = $products[$proi]["img"];
                    }
                    if ($products[$proi]["price"]) {
                        $pro_new_lang["product_lang_original_price"] = $products[$proi]["price"];
                    }
                    if ($products[$proi]["price_sale"]) {
                        $pro_new_lang["product_lang_sale_price"] = $products[$proi]["price_sale"];
                    }

                    $id_pro_new_lang = DB::table('wb_product_langs')->insertGetId($pro_new_lang);

                    break;
                }
            }


        }


        //====move post========// 
        for ($posti = 0; $posti < count($articles); $posti++) {


            $item_post = array(
                "post_image_high" => "",
                "post_image_medium" => "",
                "post_image_low" => "",
                "post_type" => "",
                "post_is_show" => 1,
                "post_time" => ""
            );

            $item_post_lang = array(
                "post_lang_url" => "",
                "post_lang_title" => "",
                "post_lang_description" => "",

                "post_lang_content" => "",
                "post_lang_seo_title" => "",
                "post_lang_seo_description" => "",
                "post_lang_seo_keyword" => "",
                "post_lang_image_high" => "",
                "post_lang_image_medium" => "",
                "post_lang_image_low" => "",
                "post_id" => "",
                "lang_code" => "vi",
            );


            for ($i1 = 0; $i1 < count($categories); $i1++) {
                if ($categories[$i1]["id"] == $articles[$posti]["cid"]) {
                    for ($j1 = 0; $j < count($component); $j1++) {
                        if ($component[$j1]["id"] == $categories[$i1]['comp']) {

                            if ($component[$j1]["do"] == "intro") {

                                $item_post["post_type"] = "intros";
                                break;

                            }
                            if ($component[$j1]["do"] == "articles") {

                                $item_post["post_type"] = "news";
                                break;

                            }
                            if ($component[$j1]["do"] == "contact") {

                                $item_post["post_type"] = "contacts";
                                break;

                            }
                            if ($component[$j1]["do"] == "products") {

                                $item_post["post_type"] = "products";
                                break;

                            }

                            break;
                        }
                    }
                    break;
                }
            }
            if ($item_post["post_type"] != "") {


                if ($articles[$posti]["active"]) {
                    $item_post["post_is_show"] = $articles[$posti]["active"];
                }

                if ($articles[$posti]["view"]) {
                    $item_post_lang["post_lang_view"] = $articles[$posti]["view"];
                }

                if ($articles[$posti]["img"]) {
                    $item_post["post_image_medium"] = $articles[$posti]["img"];
                    $item_post["post_image_high"] = $articles[$posti]["img"];
                    $item_post["post_image_low"] = $articles[$posti]["img"];
                }

                if ($articles[$posti]['cid']) {
                    $item_post["cat_id"] = $articles[$posti]["cid"];
                }
                if ($articles[$posti]['dated']) {
                    $item_post["created_at"] = $articles[$posti]["dated"];
                    $item_post["post_time"] = $articles[$posti]["dated"];
                    $item_post["updated_at"] = $articles[$posti]["dated"];
                    $item_post_lang["created_at"] = $articles[$posti]["dated"];
                    $item_post_lang["updated_at"] = $articles[$posti]["dated"];

                }


                $id_post = DB::table('wb_posts')->insertGetId($item_post);


                if ($articles[$posti]['name_vn']) {

                    $item_post_lang["post_lang_title"] = $articles[$posti]["name_vn"];
                    $item_post_lang["post_lang_seo_title"] = $articles[$posti]["name_vn"];

                }
                if ($articles[$posti]['unique_key_vn']) {

                    $item_post_lang["post_lang_url"] = $articles[$posti]["unique_key_vn"] . ".html";
                } else {
                    $item_post_lang["post_lang_url"] = str_slug($articles[$posti]["name_vn"]) . ".html";

                }
                if ($articles[$posti]['short_vn']) {
                    $item_post_lang["post_lang_description"] = $articles[$posti]["short_vn"];
                    $item_post_lang["post_lang_seo_description"] = $articles[$posti]["short_vn"];
                }
                if ($articles[$posti]['content_vn']) {
                    $item_post_lang["post_lang_content"] = $articles[$posti]["content_vn"];
                }
                if ($articles[$posti]["keyword_vn"]) {
                    $item_post_lang["post_lang_seo_keyword"] = $articles[$posti]["keyword_vn"];
                }
                if ($articles[$posti]["img"]) {
                    $item_post_lang["post_lang_image_high"] = $articles[$posti]["img"];
                    $item_post_lang["post_lang_image_medium"] = $articles[$posti]["img"];
                    $item_post_lang["post_lang_image_low"] = $articles[$posti]["img"];

                }
                $item_post_lang["post_id"] = $id_post;
                $id_post_lang = DB::table('wb_post_langs')->insertGetId($item_post_lang);
            }


        }


        //===replace path=======//

        $tabble = DB::table('wb_post_langs')->select("post_lang_content", "post_lang_id")->get();

        for ($rep = 0; $rep < count($tabble); $rep++) {

            $str = $tabble[$rep]->post_lang_content;
            $str_replace = str_replace("/kcfinder/upload/", "/upload/data/", $str);
            DB::table('wb_post_langs')
                ->where('post_lang_id', $tabble[$rep]->post_lang_id)
                ->update(['post_lang_content' => $str_replace]);


        }

        $tabble = DB::table('wb_product_langs')->select("product_lang_id", "product_lang_content")->get();

        for ($rep = 0; $rep < count($tabble); $rep++) {

            $str = $tabble[$rep]->product_lang_content;
            $str_replace = str_replace("/kcfinder/upload/", "/upload/data/", $str);
            DB::table('wb_product_langs')
                ->where('product_lang_id', $tabble[$rep]->product_lang_id)
                ->update(['product_lang_content' => $str_replace]);
        }

        $tabble = DB::table('wb_cat_langs')->select("cat_lang_id", "cat_lang_content")->get();

        for ($rep = 0; $rep < count($tabble); $rep++) {

            $str = $tabble[$rep]->cat_lang_content;
            $str_replace = str_replace("/kcfinder/upload/", "/upload/data/", $str);
            DB::table('wb_cat_langs')
                ->where('cat_lang_id', $tabble[$rep]->cat_lang_id)
                ->update(['cat_lang_content' => $str_replace]);
        }

        return "done";
    }

    public function getIdChild($categories, $id)
    {
        $list =array();
        for ($i = 0; $i < count($categories); $i++) {
            if($categories[$i]['pid'] == $id){
                array_push($list,$categories[$i]['id']);
            }
        }
        return $list;
    }


}
