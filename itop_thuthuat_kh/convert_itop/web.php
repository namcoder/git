<?php
Route::get('test', 'moveCatController@index');
Route::get('test', 'moveCatController@action');
Route::get('change-language/{lang_code}', 'Frontend\IndexController@changeLanguage');
Route::group(['prefix' => 'admin', 'namespace' => 'Backend'], function () {
    Route::group(['middleware' => ['web', 'admin']], function () {
        Route::get('/', 'AdminController@getIndex');
        Route::get('dashboard', 'AdminController@getIndex');

        Route::group(['prefix' => 'theme'], function () {
            Route::get('/', 'ThemeController@getIndex');
            Route::get('css-editor.html', 'ThemeController@createCSSEditor');
            Route::post('/storeCss', 'ThemeController@storeCss');
            Route::post('/resetCss', 'ThemeController@resetCss');
            Route::post('/singleResetCss', 'ThemeController@singleResetCss');
            Route::post('/singleUpdateCss', 'ThemeController@singleUpdateCss');
            Route::post('/autoSaveCss', 'ThemeController@autoSaveCss');
            Route::post('/active', 'ThemeController@postActive');
            Route::get('add', 'ThemeController@getCreate');
            Route::get('edit/{id}', 'ThemeController@getCreate');
            Route::post('create', 'ThemeController@postCreate');
            Route::get('delete/{id}', 'ThemeController@getDelete');
            Route::get('show-hide.html', 'ThemeController@createShowHide');
            Route::post('show-hide.html', 'ThemeController@updateShowHide');
            Route::get('config-pagination.html', 'ThemeController@createProductPagination');
            Route::post('config-pagination.html', 'ThemeController@updateProductPagination');
            Route::get('config-slider.html', 'ThemeController@getSliderConfig');
            Route::post('config-slider.html', 'ThemeController@postSliderConfig');
            Route::get('google-search.html', 'ThemeController@createGoogleId');
            Route::post('google-search.html', 'ThemeController@updateGoogleId');
            Route::match(['get', 'post'], 'list_popup.html', 'Popup\PopupController@getPopUpPostLang');
            Route::match(['get', 'post'], 'create_popup.html', 'Popup\PopupController@createPopUp');
            Route::match(['get', 'post'], 'detail_popup/{id}.html', 'Popup\PopupController@detailPopup');
            Route::match(['get', 'post'], 'update_popup/{id}.html', 'Popup\PopupController@detailPopup');
            Route::post('popup/change-status.html', 'Popup\PopupController@changeStatus');
            Route::match(['get', 'post'], 'delete_popup.html', 'Popup\PopupController@delete');
            //Exit pop up
            Route::match(['get', 'post'], 'list_exit_popup.html', 'Popup\ExitPopupController@getPopUpPostLang');
            Route::match(['get', 'post'], 'create_exit_popup.html', 'Popup\ExitPopupController@createPopUp');
            Route::match(['get', 'post'], 'detail_exit_popup/{id}.html', 'Popup\ExitPopupController@detailPopup');
            Route::match(['get', 'post'], 'update_exit_popup/{id}.html', 'Popup\ExitPopupController@detailPopup');
            Route::post('exit-popup/change-status.html', 'Popup\ExitPopupController@changeStatus');

            Route::match(['get', 'post'], 'delete_exit_popup.html', 'Popup\ExitPopupController@delete');
            //Social
            Route::match(['get', 'post'], 'list_social.html', 'Social\SocialController@listSocial');
        });

        Route::group(['prefix' => 'module'], function () {
            Route::get('/', 'ModuleController@getIndex');
        });

        Route::group(['prefix' => 'statistic'], function () {
            Route::get('/orders', 'Statistic\StatisticController@getOrdersStatistic');
        });

        Route::group(['prefix' => 'account'], function () {
            Route::get('/add.html', 'Account\AddController@create');
            Route::post('/add', 'Account\AddController@store');
            Route::match(['get', 'post'], '/list.html', 'Account\ListController@index');
            Route::post('/delete', 'Account\DeleteController@destroy');
            Route::get('/profile.html', 'Account\ProfileController@create');
            Route::post('/change-profile', 'Account\ProfileController@changeProfile');
            Route::post('/change-password', 'Account\ProfileController@changePassword');
            Route::match(['get', 'post'], 'role-group.html', 'Account\RoleGroupController@index');
        });

        // User Controller
        Route::get('/user', 'UserController@index');
        Route::post('/user/data', 'UserController@data');
        Route::post('/user/save', 'UserController@save');
        Route::get('/user/edit/{id}', 'UserController@edit');

        //Route::get('/profile', 'UserController@profile');
        //Route::post('/profile/save', 'UserController@postUpdateProfile');
        Route::match(array('get', 'post'), 'profile', 'AdminController@profile');
        //Setting Controller
        Route::group(['prefix' => 'setting'], function () {
            Route::match(array('get', 'post'), 'language.html', 'Setting\LanguageController@languages');
            Route::get('email.html', 'Setting\EmailController@create');
            Route::post('email.html', 'Setting\EmailController@update');
            Route::match(array('get', 'post'), 'email/send.html', 'Setting\EmailController@sendEmailTest');
            Route::match(array('get', 'post'), 'website.html', 'Setting\InfoWebsiteController@websites');
            Route::match(array('get', 'post'), 'seo-default.html', 'Setting\SEOController@SEOdefault');
            Route::post('save', 'SettingController@save');
            Route::match(array('get', 'post'), 'tag-advance.html', 'Setting\TagAdvanceController@index');
            Route::match(array('get', 'post'), 'tag-advance/add.html', 'Setting\TagAdvanceController@addTag');
            Route::match(array('get', 'post'), 'tag-advance/edit/{id}.html', 'Setting\TagAdvanceController@editTag');
            Route::match(array('get', 'post'), 'tag-advance/delete/{id}.html', 'Setting\TagAdvanceController@deleteTag');
            Route::get('website-status.html', 'Setting\StatusController@createStatus');
            Route::post('website-status.html', 'Setting\StatusController@updateStatus');
            Route::match(array('get', 'post'), 'application.html', 'Setting\AppController@index');
            Route::match(array('get', 'post'), 'shop-local.html', 'Setting\LocalController@index');
            Route::match(array('get', 'post'), 'del-shop-local.html', 'Setting\LocalController@delShopLocal');
            Route::get('currency.html', 'Setting\CurrencyController@index');
            Route::post('currency.html', 'Setting\CurrencyController@updateCurrency');
        });

        //Categories
        Route::group(['prefix' => 'categories'], function () {
            Route::match(array('get', 'post'), 'home.html', 'Categories\HomeController@index');
            Route::match(array('get', 'post'), 'home/{cat_type_code}.html', 'Categories\HomeController@index');
            Route::match(array('get', 'post'), 'add.html', 'Categories\AddController@index');
            Route::match(array('get', 'post'), 'add/{cat_type_code}.html', 'Categories\AddController@index');
            Route::match(array('get', 'post'), 'edit/{id}.html', 'Categories\EditController@index');
            Route::match(array('get', 'post'), 'delete.html', 'Categories\DeleteController@index');
            Route::post('change-status.html', 'Categories\StatusController@index');
            Route::get('edit-advertisement/{id}', 'Categories\EditController@editAdvertisement');
            Route::post('update-advertisement/{id}', 'Categories\EditController@updateAdvertisement');
        });

        //Menu
        Route::group(['prefix' => 'menu'], function () {
            Route::match(array('get', 'post'), 'home.html', 'Menu\HomeController@index');
            Route::post('save', 'Menu\UpdateController@saveMenu');
            Route::post('create', 'Menu\CreateController@createMenuItem');
            Route::post('delete', 'Menu\DeleteController@deleteMenuItem');
            Route::get('test', 'Menu\HomeController@test');
        });

        // Attribute
        Route::group(['prefix' => 'attribute'], function () {
            Route::get('list-attribute', 'Attribute\AttributeController@listAttribute');
            Route::get('create-attribute', 'Attribute\AttributeController@createAttribute');
            Route::post('store-attribute', 'Attribute\AttributeController@storeAttribute');
            Route::post('delete-attribute/{id}', 'Attribute\AttributeController@deleteAttribute');
            Route::get('edit-attribute/{id}', 'Attribute\AttributeController@editAttribute');
            Route::post('update-attribute/{id}', 'Attribute\AttributeController@updateAttribute');
            Route::get('group-attribute', 'Attribute\AttributeGroupController@listGroup');
            Route::get('create-group-attribute', 'Attribute\AttributeGroupController@createGroup');
            Route::post('store-group-attribute', 'Attribute\AttributeGroupController@storeGroup');
            Route::get('edit-group-attribute/{id}', 'Attribute\AttributeGroupController@editGroup');
            Route::post('update-group-attribute/{id}', 'Attribute\AttributeGroupController@updateGroup');
            Route::post('delete-group-attribute/{id}', 'Attribute\AttributeGroupController@deleteGroup');
        });

        // Selection
        Route::group(['prefix' => 'selection'], function () {
            Route::get('list-selection', 'Selection\SelectionController@listSelection');
            Route::get('create-selection', 'Selection\SelectionController@createSelection');
            Route::post('store-selection', 'Selection\SelectionController@storeSelection');
            Route::get('edit-selection/{id}', 'Selection\SelectionController@editSelection');
            Route::post('update-selection/{id}', 'Selection\SelectionController@updateSelection');
            Route::get('delete-selection/{id}', 'Selection\SelectionController@deleteSelection');
            Route::delete('{id}/value/{value_id}', 'Selection\SelectionController@deleteSelectionValue');
        });

        //News
        Route::group(['prefix' => 'news'], function () {
            Route::match(array('get', 'post'), 'home.html', 'News\HomeController@index');
            Route::match(array('get', 'post'), 'add.html', 'News\AddController@index');
            Route::match(array('get', 'post'), 'edit/{id}.html', 'News\EditController@index');
            Route::match(array('get', 'post'), 'detail/{id}.html', 'News\DetailController@index');
            Route::match(array('get', 'post'), 'delete.html', 'News\DeleteController@index');
            Route::post('change-status.html', 'News\StatusController@index');
            Route::post('update-on-home-page', 'News\StatusController@updateOnHomePage');
            Route::get('edit-advertisement/{id}', 'News\EditController@editAdvertisement');
            Route::post('update-advertisement/{id}', 'News\EditController@updateAdvertisement');

            Route::match(array('get', 'post'), 'feature/home.html', 'News\Features\HomeController@index');
        });

        //Advertisement
        Route::group(['prefix' => 'advertisements'], function () {
            Route::get('index.html', 'Advertisement\AdvertisementController@index');
            Route::get('add.html', 'Advertisement\AdvertisementController@create');
            Route::post('add.html', 'Advertisement\AdvertisementController@store');
            Route::get('edit/{id}', 'Advertisement\AdvertisementController@edit');
            Route::post('edit/{id}', 'Advertisement\AdvertisementController@update');
            Route::delete('/{id}', 'Advertisement\AdvertisementController@delete');
        });
        //Products
        Route::group(['prefix' => 'products'], function () {
            Route::match(array('get', 'post'), 'home.html', 'Products\HomeController@index');
            Route::match(array('get', 'post'), 'add.html', 'Products\AddController@index');
            Route::match(array('get', 'post'), 'edit/{id}.html', 'Products\EditController@index');
            Route::match(array('get', 'post'), 'detail/{id}.html', 'Products\DetailController@index');
            Route::match(array('get', 'post'), 'delete.html', 'Products\DeleteController@index');
            Route::post('change-status.html', 'Products\StatusController@index');
            Route::post('update-on-home-page', 'Products\StatusController@updateOnHomePage');
            Route::get('gallery/{id}.html', array(
                'uses' => 'Products\Gallery\IndexController@index',
            ))->where('id', '[0-9]+');

            Route::post('gallery/add/{id}.html', array(
                'uses' => 'Products\Gallery\AddController@index',
            ));

            Route::post('gallery/delete.html', array(
                'uses' => 'Products\Gallery\DeleteController@index',
            ));
            Route::get('setting.html', 'Products\SettingController@create');
            Route::get('edit-attribute/{id}', 'Products\EditController@editAttribute');
            Route::post('update-attribute/{id}', 'Products\EditController@updateAttribute');
            Route::get('edit-advertisement/{id}', 'Products\EditController@editAdvertisement');
            Route::post('update-advertisement/{id}', 'Products\EditController@updateAdvertisement');

            // Product Selection
            Route::get('edit-selection/{id}', 'Products\EditController@editSelection');
            Route::get('{product_id}/selections/{product_selection_id}', 'Products\SelectionController@getSelections');
            Route::post('{product_id}/selections/{product_selection_id}', 'Products\SelectionController@updateSingleSelection');
            Route::post('{product_id}/selections', 'Products\SelectionController@createSelection');
            Route::put('{product_lang_id}/selections', 'Products\SelectionController@updateSelections');
            Route::post('{product_lang_id}/selections/clone/{product_selection_id}', 'Products\SelectionController@cloneSelections');
            Route::delete('{product_lang_id}/selections/{product_selection_id}', 'Products\SelectionController@deleteSelection');

            //Product Excel
            Route::post('import-product.html', 'Products\HomeController@importProduct');
            Route::get('download-file-demo-import.html', 'Products\HomeController@downloadImport');

            Route::match(array('get', 'post'), 'feature/home.html', 'Products\Features\HomeController@index');

        });

        //Orders
        Route::group(['prefix' => 'orders'], function () {

            Route::match(array('get', 'post'), 'home.html', 'Orders\IndexController@index');

            Route::match(array('get', 'post'), 'payment.html', 'Orders\PaymentController@index');
            Route::match(array('get', 'post'), 'delete-payment.html', 'Orders\PaymentController@deletePayment');
            Route::match(array('get', 'post'), 'edit-payment/{id}.html', 'Orders\PaymentController@editPayment');
            Route::match(array('get', 'post'), 'change-payment-status.html', 'Orders\PaymentController@changeStatusPayment');
            Route::match(array('get', 'post'), 'add-payment.html', 'Orders\AddPaymentController@index');
            Route::match(array('get', 'post'), 'setting.html', 'Orders\SettingController@index');
            Route::match(array('get', 'post'), 'detail/{id}.html', 'Orders\DetailController@index');
            Route::match(array('get', 'post'), 'delete.html', 'Orders\DeleteController@index');
            Route::post('change-status.html', 'Orders\ChangeStatusController@index');
            Route::post('note', 'Orders\ChangeStatusController@updateNote');
            Route::get('email-setting.html', 'Orders\SettingController@settingEmail');
            Route::post('email-setting.html', 'Orders\SettingController@updateEmail');

            //delivery
            Route::match(array('get', 'post'), 'delivery.html', 'Orders\DeliveryController@index');
            Route::match(array('get', 'post'), 'delete-delivery.html', 'Orders\DeliveryController@deleteDelivery');
            Route::match(array('get', 'post'), 'edit-delivery/{id}.html', 'Orders\DeliveryController@editDelivery');
            Route::match(array('get', 'post'), 'change-delivery-status.html', 'Orders\DeliveryController@changeStatusDelivery');
            Route::match(array('get', 'post'), 'add-delivery.html', 'Orders\DeliveryController@addDelivery');
        });

        //Sliders

        Route::group(['prefix' => 'sliders'], function () {
            Route::match(array('get', 'post'), 'home.html', 'Sliders\HomeController@index');
            Route::match(array('get', 'post'), 'add.html', 'Sliders\AddController@index');
            Route::match(array('get', 'post'), 'edit/{id}.html', 'Sliders\EditController@index');
            Route::match(array('get', 'post'), 'detail/{id}.html', 'Sliders\DetailController@index');
            Route::match(array('get', 'post'), 'delete.html', 'Sliders\DeleteController@index');
            Route::post('change_status.html', 'Sliders\StatusController@index');
            Route::match(array('get', 'post'), 'delete_image/{id}.html', 'Sliders\DeleteImageController@index');
        });

        //Layout
        Route::group(['prefix' => 'widgets'], function () {
            Route::get('home/landing-page.html', 'Widgets\LandingPageController@index');
            Route::get('add/landing-page.html', 'Widgets\LandingPageController@create');
            Route::post('landing-page/{widget_id}/change-status/{status}', 'Widgets\LandingPageController@updateStatus');
            Route::post('landing-page/store-block', 'Widgets\LandingPageController@store');
            Route::post('landing-page/delete/{widget_id}', 'Widgets\LandingPageController@delete');
            Route::post('landing-page/update-order', 'Widgets\LandingPageController@updateOrder');
            Route::post('landing-page/update-block/{id}', 'Widgets\LandingPageController@updateBlock');
            Route::get('landing-page/edit', 'Widgets\LandingPageController@edit');
            Route::match(array('get', 'post'), 'home/{widget_category}.html', 'Widgets\HomeController@index');
            Route::match(array('get', 'post'), 'edit/{widget_category}/{id}.html', 'Widgets\EditController@index');
            Route::match(array('get', 'post'), 'add/{widget_category}.html', 'Widgets\AddController@index');
            Route::match(array('get', 'post'), 'delete/{widget_category}.html', 'Widgets\DeleteController@index');
            Route::match(array('get', 'post'), 'detail/{widget_category}/{id}.html', 'Widgets\DetailController@index');
            Route::match(array('get', 'post'), 'change-status/{widget_category}.html', 'Widgets\StatusController@index');
        });

        // Gallery
        Route::group(['prefix' => 'gallery'], function () {
            Route::get('/list-gallery.html', "Gallery\GalleryController@index");
            Route::get('/create-gallery.html', "Gallery\GalleryController@create");
            Route::get('/edit-gallery.html', "Gallery\GalleryController@edit");
            Route::post('/store-gallery', "Gallery\GalleryController@store");
            Route::post('/update-gallery', "Gallery\GalleryController@update");
            Route::delete('/{gallery_id}', "Gallery\GalleryController@destroy");
        });

        // Upload
        Route::group(['prefix' => 'upload'], function () {
            Route::post('/store-image', 'Upload\ImageController@store');
        });

        // Image
        Route::group(['prefix' => 'image'], function () {
            Route::post('/crop', "Image\EditController@crop");
            Route::delete("/", "Image\EditController@delete");
        });

        Route::group(['prefix' => 'nation'], function () {
            Route::match(array('get', 'post'), '/list-nations.html', "Area\NationController@index");
            Route::get('/create-nation.html', "Area\NationController@create");
            Route::get('/edit-nation.html', "Area\NationController@editNation");
            Route::get('/{nation_id}/add-nation-lang.html', "Area\NationController@addNationLang");
            Route::post('store-nation', "Area\NationController@storeNation");
            Route::post('/{nation_id}/update-nation', "Area\NationController@updateNation");
            Route::post('/{nation_id}/store-nation-lang', "Area\NationController@storeNationLang");
        });

        // City
        Route::group(['prefix' => 'city'], function () {
            Route::match(array('get', 'post'), 'list-cities.html', "Area\CityController@listCities");
            Route::get('create-city.html', "Area\CityController@createCity");
            Route::get('edit-city.html', "Area\CityController@editCity");
            Route::get('/{city_id}/add-city-lang.html', "Area\CityController@createCityLang");
            Route::post('store-city', "Area\CityController@storeCity");
            Route::post('/{city_id}/update-city', "Area\CityController@updateCity");
            Route::post('/{city_id}/store-city-lang', "Area\CityController@storeCityLang");
        });

        // Location
        Route::group(['prefix' => 'location'], function () {
            Route::match(array('get', 'post'), 'list-locations.html', "Area\LocationController@listLocations");
            Route::get('create-location.html', "Area\LocationController@createLocation");
            Route::get('edit-location.html', "Area\LocationController@editLocation");
            Route::get('/{location_id}/add-location-lang.html', "Area\LocationController@createLocationLang");
            Route::post('store-location', "Area\LocationController@storeLocation");
            Route::post('/{location_id}/update-location', "Area\LocationController@updateLocation");
            Route::post('/{location_id}/store-location-lang', "Area\LocationController@storeLocationLang");
        });
        
        // Tour
        Route::group(['prefix' => 'tour'], function () {
            Route::get('list-tours.html', "Tour\ListTourController@listTours");
            Route::get('create-tour.html', "Tour\CreateController@createTour");
            Route::get('edit-tour.html', "Tour\EditTourController@editTour");
            Route::get('list-tour-schedules.html', "Tour\ListTourScheduleController@listTourSchedules");
            Route::get("add-tour-to-schedule.html", "Tour\CreateController@createTourSchedule");
            Route::get("edit-tour-schedule.html", "Tour\EditScheduleController@editSchedule");
            Route::post('store-schedule', "Tour\StoreController@storeSchedule");
            Route::post('store-tour', "Tour\StoreController@storeTour");
            Route::post('/{tour_id}/update-tour', 'Tour\UpdateController@updateTour');
            // for ajax call
            Route::get('/{tour_id}', "Tour\AjaxController@getTourInfo");
            Route::put('/schedule', "Tour\AjaxController@updateTourSchedule");
        });

        // Schedule
        Route::group(['prefix' => 'schedule'], function () {
            Route::get('list-schedules.html', "Schedule\ListController@listSchedules");
            Route::get('create-schedule.html', "Schedule\CreateController@createSchedule");
            Route::post('store-schedule', "Schedule\StoreController@storeSchedule");
            // For ajax call
            Route::get('', "Schedule\AjaxController@getScheduleInfo");
        });

        //Contact
        Route::group(['prefix' => 'contact'], function () {
            Route::match(array('get', 'post'), 'home.html', 'Contact\HomeController@index');
            Route::match(array('get', 'post'), 'detail/{id}.html', 'Contact\DetailController@index');
            Route::match(array('get', 'post'), 'delete.html', 'Contact\DeleteController@index');
        });

        //Partners
        Route::group(['prefix' => 'partners'], function () {
            Route::match(array('get', 'post'), 'home.html', 'Partners\HomeController@index');
            Route::match(array('get', 'post'), 'add.html', 'Partners\AddController@index');
            Route::match(array('get', 'post'), 'edit/{id}.html', 'Partners\EditController@index');
            Route::match(array('get', 'post'), 'detail/{id}.html', 'Partners\DetailController@index');
            Route::match(array('get', 'post'), 'delete.html', 'Partners\DeleteController@index');
            Route::post('change_status.html', 'Partners\StatusController@index');
            Route::match(array('get', 'post'), 'delete_image/{id}.html', 'Partners\DeleteImageController@index');
        });

        //Media
        Route::group(['prefix' => 'media'], function () {
            Route::match(array('get', 'post'), 'browser-media.html', 'Media\BrowserController@index');
        });

        //Other Link
        Route::group(['prefix' => 'link'], function () {
            Route::match(array('get', 'post'), 'home.html', 'Link\HomeController@index');
            Route::get('create', 'Link\CreateController@index');
            Route::post('create', 'Link\CreateController@create');
            Route::get('update/{id}', 'Link\UpdateController@index');
            Route::match(['put', 'post'], 'update/{id}', 'Link\UpdateController@update');
            Route::delete('delete/{id}', 'Link\DeleteController@delete');
            Route::get('delete-multi', 'Link\DeleteController@deleteMulti');
        });

        //Tool check SEO
        Route::group(['prefix' => 'check-seo'], function () {
            Route::match(array('get', 'post'), 'detail-page.html', 'CheckSeo\CheckSeoDetailPageController@index');
            Route::match(array('get', 'post'), 'menu-page.html', 'CheckSeo\CheckSeoMenuController@index');
        });
        
        //Service pack
        Route::group(['prefix' => 'service-pack'], function () {
            Route::match(array('get', 'post'), 'home.html', 'ServicePack\HomeController@index');
            Route::match(array('get', 'post'), 'change-status.html', 'ServicePack\ChangeStatusController@index');
            Route::match(array('get', 'post'), 'user-active.html', 'ServicePack\UserActiveController@index');
            
        });
    });

    Route::get('login', 'AdminController@getLogin');
    Route::get('logout', 'AdminController@getLogout');
    Route::post('login', 'AdminController@postLogin');
    Route::post('forgot-password', 'AdminController@postForgotPassword');
    Route::get('password/reset', 'Account\ResetPasswordController@create');
    Route::post('password/reset', 'Account\ResetPasswordController@store');
    Route::post('password/forget', 'Account\ResetPasswordController@sendResetEmail');
});
Route::group(['middleware' => 'admin', 'prefix' => 'api'], function () {
    Route::get('language', ['namespace' => 'Backend', 'uses' => 'Backend\\LanguageController@getAll']);
});

Route::get('all-theme', 'HomeController@getTheme');
Route::get('add-theme/{id}', 'HomeController@addTheme');
Route::get('/', 'HomeController@index')->name('home');

// User
Route::get('/user/login', 'UserController@getUserLogin');
Route::get('/user/logout', 'UserController@getUserLogout');
Route::post('/user/login', 'UserController@postUserLogin');
Route::get('/user/register', 'UserController@getUserRegister');
Route::post('/user/register', 'UserController@postUserRegister');

// Should end of route file
Route::get('/page/{slug}', 'PageController@getPage');

Route::match(array('get', 'post'), '/get-image', 'TestController@image');

/*
 * Detect link language and link array request
 */

Route::match(array('get', 'post'), '/', 'Frontend\IndexController@index');
Route::match(array('get', 'post'), '/cart.html', 'Frontend\CartController@cart');
Route::match(array('get', 'post'), '/gio-hang.html', 'Frontend\CartController@giohang');
Route::match(array('get', 'post'), '/addcart.html', 'Frontend\CartController@addCart');
Route::match(array('get', 'post'), '/payment.html', 'Frontend\CartController@payment');
Route::match(array('get', 'post'), '/thanh-toan.html', 'Frontend\CartController@thanhtoan');
Route::match(array('get', 'post'), '/payment-online-success.html', 'Frontend\CartController@paymentOnlineSuccess');
Route::match(array('get', 'post'), '/thanh-toan-online-thanh-cong.html', 'Frontend\CartController@thanhtoanonlinethanhcong');
Route::match(array('get', 'post'), '/payment-online-cancel.html', 'Frontend\CartController@paymentOnlineCancel');
Route::match(array('get', 'post'), '/huy-thanh-toan-online.html', 'Frontend\CartController@huythanhtoanonline');
Route::post('/cart/send-notice-email', 'Frontend\CartController@sendNoticeEmail');
Route::post('/cart/add-ship.html', 'Frontend\CartController@addShip');

Route::match(array('get', 'post'), '/book-tour.html', 'Frontend\TourController@bookTour');
Route::match(array('get', 'post'), '/dat-tour.html', 'Frontend\TourController@datTour');
/**
 * Send contact message
 */
Route::post('/contact/sendMessageContact', 'Frontend\ContactController@sendMessageContact');
Route::post('/landing/contact', 'Frontend\ContactController@contactLanding');

Route::match(array('get', 'post'), '/test-footer', 'Frontend\FooterController@index');
Route::match(array('get', 'post'), '/test-sidebarleft', 'Frontend\SidebarLeftController@index');
Route::match(array('get', 'post'), '/{segment1}/', 'Frontend\IndexController@index');
Route::match(array('get', 'post'), '/{segment1}/{segment2}/', 'Frontend\IndexController@index');
Route::match(array('get', 'post'), '/{segment1}/{segment2}/{segment3}/', 'Frontend\IndexController@index');
Route::match(array('get', 'post'), '/{segment1}/{segment2}/{segment3}/{segment4}/', 'Frontend\IndexController@index');
Route::match(array('get', 'post'), '/{segment1}/{segment2}/{segment3}/{segment4}/{segment5}', 'Frontend\IndexController@index');