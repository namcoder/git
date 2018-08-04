<script type="text/javascript" src="{{ resolveAsset('js/admin/jquery-1.8.2.min.js', $theme) }}"></script>
<script>
    $(document).ready(function () {
        $('.dropdown').click(function () {
                $(this).children("ul").toggle();
            }
        );
    });
</script>
<style>
    .search_google {
        margin: 0px 0px !important;
        width: 40%;
        height: auto;
    }

    #gsc-i-id1 {
        height: 17px !important;
    }

    .cse input.gsc-search-button, input.gsc-search-button {
        text-indent: -9999em;
        border: none !important;
        width: 66px;
        height: 25px !important;
        background-color: rgba(128, 128, 128, 0.54) !important;
        background-image: none !important;
    }

    .cse .gsc-search-button input.gsc-search-button-v2, input.gsc-search-button-v2 {
        margin-top: 0 !important;
    }

    .cse .gsc-control-cse, .gsc-control-cse {
        padding: 0 !important;
    }

    @media only screen
    and (min-device-width: 320px)
    and (max-device-width: 568px)
    and (orientation: landscape) {
        .top_search_edit {
            margin: 10px 10px;
            float: left;
        }
    }
</style>
<?php
    $search_box = $isShow->search->value;
    $search_value = 'search_box';
    $search_google = $isShow->google->is_show;
    $lang_default = getLangCodeCurrent();
?>
<div class="header">
    <div class="hcontent">
        <div>
            <a class="logo edit_logo" href="{{getUrlHomePage()}}" title="">
                <img src="{{assets(getLogoWebsite())}}" class="edit_logo_size" title="" alt=""/>
            </a>
        </div>
    </div>
    <div class="right-top-box">
        <div class="top-cart">
            <?php
                $langs = getAllUrlLanguages();
            ?>
            @if(isShowCart())
                <a title="{{trans('index.cart')}}"
                   href="/{{trans('frontend/carts.cart_link')}}.html">[{{count(getCart())}}
                    ] {{trans('index.products')}}</a>
            @endif
            <?php
                $lg= session()->get('website_language');
            ?>
            <div class="lang_mobile">
                @if(count($langs) > 1)
                    @foreach($langs as $lang)
                        @if($lang['lang_code'] == $lg )
                               @if($lg== 'vi')
                                <a href="/change-language/en" title="English">
                                    <img alt="English" src="/images/icons/country/en.png"/>
                                </a>
                                @else
                                    <a href="/change-language/vi" title="Tiếng Việt">
                                        <img alt="Tiếng Việt" src="/images/icons/country/vi.png"/>
                                    </a>
                                @endif
                        @endif
                    @endforeach
                @endif
            </div>
        </div>
        <p class="cl"></p>
    </div>
    @if(($search_google == 1))
        <div class="top_search_edit">
            <gcse:search enableAutoComplete="true"></gcse:search>
        </div>
    @else
        <div class="top_search_edit">
            @if(strpos($search_box, $search_value) !== false)
                <form action="{{getUrlSearch()}}" method="get" id="search_mini_form">
                    <div class="input-group">
                        @if(strpos($search_box,'products,news') !== false)
                            <div class="input-group-btn select">
                                <select name="type" class="category_filter">
                                    <option value="products">{{ trans('index.products') }}</option>
                                    <option value="news">{{ trans('index.news') }}</option>
                                </select>
                            </div>
                        @else
                            <input type="hidden" name="type"
                                   value="@if(strpos($search_box,'products') !== false){{'products'}}@else{{"news"}}@endif">
                        @endif
                        <input type="text" name="query" placeholder="{{trans('index.keyword')}}"
                               class="form-control input-text">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn_search"><i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                </form>
            @endif
        </div>
    @endif
    <ul class="nav" id="top_menu">
        @foreach($top_menus as $menu)
            @php($menu_childs = $menu->child($menu->menu_id))

            <li>
                <a href="{{WbUrl::createUrl($menu->cat_id, 'category')}}" <?= $menu->getType($menu->cat_id) == 'links' ? 'target = "_blank"' : '' ?>>{{$menu->getName($menu->cat_id)}}
                    @if(count($menu_childs) > 0)
                        <i class="fa fa-caret-down" aria-hidden="true"></i>
                    @endif
                </a>
                @if(count($menu_childs) > 0)
                    @include('theme.'.$theme.'.master.menu.child')
                @endif
            </li>
        @endforeach
        <li class="edit_language">
            <?php

            $lg= session()->get('website_language');

            ?>

            @if(count($langs) > 1)
                @foreach($langs as $lang)
                    @if($lang['lang_code'] == $lg )
                           @if($lg== 'vi')
                            <a href="/change-language/en" title="English">
                                <img alt="English" src="/images/icons/country/en.png"/>
                            </a>
                            @else
                                <a href="/change-language/vi" title="Tiếng Việt">
                                    <img alt="Tiếng Việt" src="/images/icons/country/vi.png"/>
                                </a>
                            @endif
                    @endif
                @endforeach
            @endif
        </li>
    </ul>

    <div class="container demo-1">

        <div class="column">
            <div id="dl-menu" class="dl-menuwrapper">
                <button class="dl-trigger">Menu</button>
                <ul class="dl-menu">
                    @foreach($top_menus as $menu)
                        <li>
                            <a href="{{WbUrl::createUrl($menu->cat_id, 'category')}}">{{$menu->getName($menu->cat_id)}}
                                @if(count($menu->getChild) > 0)
                                    <i style="margin-left: 10px;" class="fa fa-caret-right" aria-hidden="true"></i>
                                @endif
                            </a>

                            @include('theme.'.$theme.'.master.menu.child-mobile')
                        </li>

                    @endforeach

                </ul>
            </div><!-- /dl-menuwrapper -->
        </div>
    </div>
</div><!-- /container -->

<script>
    $(function() {
        $( '#dl-menu-2' ).dlmenu();
    });
</script>

<?php
$google_search_id = $isShow->google->value;
?>
<script>
    (function () {
        var cx = "<?php echo $google_search_id;?>";
        var gcse = document.createElement('script');
        gcse.type = 'text/javascript';
        gcse.async = true;
        gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(gcse, s);
    })();
    window.onload = function () {
        /* document.getElementById('gsc-i-id1').placeholder = 'Tìm kiếm';*/
        /*document.getElementById('gsc-i-id1').height = '17px';*/
    }
</script>
