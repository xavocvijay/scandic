<?php
include './deployer.phar';
include './config.php';

// ---------------------------------------------------------------------------------------------------
//
//                local
//
// ---------------------------------------------------------------------------------------------------

$t = new Transport_Local();

$server_deploy_folder = time();
$base_path = getcwd();

$s1 = new Server('My local computer TDash project installation');
$s1->setTransport($t);
$s1->setBasePath($base_path);


// shared
$s1->task('cmd','mkdir -m 755 ./shared');
$s1->task('cmd','mkdir -m 777 ./shared/upload');
$s1->task('cmd','mkdir -m 777 ./shared/upload/atk4_markdown');
$s1->task('cmd',"mkdir -m 777 ./shared/logs-front");
$s1->task('cmd',"mkdir -m 777 ./shared/logs-admin");


// releases
$s1->task('cmd','mkdir -m 755 ./releases');
$s1->task('cmd',"mkdir releases/$server_deploy_folder");
$s1->task('cmd',"git clone git@github.com:agiletech/scandic-fusion.git ./releases/$server_deploy_folder");


// composer
$s1->task('cmd',"cd $base_path/shared/");
$s1->task('cmd',"rm composer.phar");
$s1->task('cmd',"curl -sS https://getcomposer.org/installer | php");
$s1->task('cmd',"cd $base_path/releases/$server_deploy_folder");
$s1->task('cmd',"ln -s ../../shared/composer.phar composer.phar");
$s1->task('cmd',"php composer.phar install");


// links
$s1->task('cmd',"cd $base_path/releases/$server_deploy_folder");
$s1->task('cmd',"ln -s ../../vendor/atk4/atk4/public/atk4/ frontend/public/atk4");
$s1->task('cmd',"ln -s ../../../shared/logs-front frontend/logs");
$s1->task('cmd',"ln -s ../../../shared/logs-admin admin/logs");
$s1->task('cmd',"ln -s ../../../../shared/upload frontend/public/upload");
$s1->task('cmd',"ln -s ../../../../shared/upload admin/public/upload");
$s1->task('cmd',"cp -n $base_path/releases/$server_deploy_folder/frontend/config-dist.php $base_path/shared/config-frontend.php");
$s1->task('cmd',"cp -n $base_path/releases/$server_deploy_folder/admin/config-dist.php $base_path/shared/config-admin.php");
$s1->task('cmd',"ln -s ../../../shared/config-frontend.php frontend/config.php");
$s1->task('cmd',"ln -s ../../../shared/config-admin.php admin/config.php");
$s1->task('cmd',"ln -s vendor/bin/phinx phinx");
$s1->task('cmd',"ln -s ../../shared/phinx.yml .");

// packages public dirs
$s1->task('cmd',"mkdir admin/public/packages");
$s1->task('cmd',"ln -s ../../../vendor/atk4/atk4-homepage/public admin/public/packages/atk4_atk4homepage");
$s1->task('cmd',"ln -s ../../../vendor/atk4/markdown/public admin/public/packages/atk4_markdown");
$s1->task('cmd',"mkdir frontend/public/packages");
$s1->task('cmd',"ln -s ../../../vendor/atk4/atk4-homepage/public frontend/public/packages/atk4_atk4homepage");
$s1->task('cmd',"ln -s ../../../vendor/atk4/markdown/public frontend/public/packages/atk4_markdown");


// create CURRENT symlink
$s1->task('cmd',"cd $base_path");
$s1->task('cmd',"rm current");
$s1->task('cmd',"ln -s ./releases/$server_deploy_folder/ current");

// ---------------------------------------------------------------------------------------------------
//
//                deployer
//
// ---------------------------------------------------------------------------------------------------

$d = new Deployer();
$d->addServer($s1); // local
$d->run();

// deployer --------------------------------------------------------------------------------------------

