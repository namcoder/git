<?php
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);
session_start();
require("installer.php");
$installer = new Installer;
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>Web Builder Installer</title>
        <link rel="icon" type="image/png" href="/installer/img/favicon/favicon-16x16.png" sizes="16x16"/>
        <link rel="icon" type="image/png" href="('/installer/img/favicon/favicon-32x32.png" sizes="32x32"/>
        <link rel="icon" type="image/png" href="/installer/img/favicon/favicon-96x96.png" sizes="96x96"/>
        <link href="/installer/assets/css/style.min.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="master">
            <div class="box">
                <div class="header">
                    <h1 class="header__title"><?php $installer->title(); ?></h1>
                </div>
                <ul class="step">
                    <li class="step__divider"></li>
                    <li class="step__item <?php $installer->step('final'); ?>">
                        <i class="step__icon fa fa-server" aria-hidden="true"></i>
                    </li>
                    <li class="step__divider"></li>
                    <li class="step__item <?php $installer->step('environment'); ?>">
                        <i class="step__icon fa fa-cog" aria-hidden="true"></i>
                    </li>
                    <li class="step__divider"></li>
                    <li class="step__item <?php $installer->step('permissions'); ?>">
                        <i class="step__icon fa fa-key" aria-hidden="true"></i>
                    </li>
                    <li class="step__divider"></li>
                    <li class="step__item <?php $installer->step('requirements'); ?>">
                    	<i class="step__icon fa fa-list" aria-hidden="true"></i>
                    </li>
                    <li class="step__divider"></li>
                    <li class="step__item <?php $installer->step('welcome'); ?>">
                        <i class="step__icon fa fa-home" aria-hidden="true"></i>
                    </li>
                    <li class="step__divider"></li>
                </ul>
                <div class="main">
                    <?php $installer->container(); ?>
                </div>
            </div>
        </div>
    </body>
</html>


