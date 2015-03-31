<?php
/**
 * Created by Vadym Radvansky
 * Date: 4/10/14 2:39 PM
 */
include './deployer.phar';
include './config.php';


// ---------------------------------------------------------------------------------------------------
//
//                celestial
//
// ---------------------------------------------------------------------------------------------------

$t = new Transport_SSH();
//$t->setConnectedSSH($ssh);
$t
    ->setHost('celestial.agile55.com')
    ->setUsername($config['ssh_username'])
    ->setPrivateKeyPath($config['ssh_key_path'])
;

$server_deploy_folder = time();
$base_path = '/www/scandic-fusion.demo.agile55.com';

$s1 = new Server('Celestial Scandic Fusion project installation');
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
$s1->task('git',"clone -b master https://".$config['github_username']."@github.com/agiletech/scandic-fusion.git ./releases/$server_deploy_folder",array('pass'=>$config['ssh_password']));


// composer
$s1->task('cmd',"cd $base_path/shared/");
$s1->task('cmd',"rm composer.phar");
$s1->task('cmd',"curl -sS https://getcomposer.org/installer | php");
$s1->task('cmd',"cd $base_path/releases/$server_deploy_folder");
$s1->task('cmd',"ln -s ../../shared/composer.phar composer.phar");
$s1->task('cmd',"php composer.phar install");


//// simlinks
$s1->task('cmd',"cd $base_path/releases/$server_deploy_folder");
$s1->task('cmd',"ln -s ../../vendor/atk4/atk4/public/atk4/ frontend/public/atk4");
//logs
$s1->task('cmd',"ln -s ../../../shared/logs-front frontend/logs");
$s1->task('cmd',"ln -s ../../../shared/logs-admin admin/logs");
//uploads
$s1->task('cmd',"ln -s ../../../../shared/upload frontend/public/upload");
$s1->task('cmd',"ln -s ../../../shared/upload frontend/upload");
$s1->task('cmd',"ln -s ../../../../shared/upload admin/public/upload");
$s1->task('cmd',"ln -s ../../../shared/upload admin/upload");
//configs
$s1->task('cmd',"cp -n $base_path/releases/$server_deploy_folder/frontend/config-dist.php $base_path/shared/config-frontend.php");
$s1->task('cmd',"cp -n $base_path/releases/$server_deploy_folder/admin/config-dist.php $base_path/shared/config-admin.php");
$s1->task('cmd',"ln -s ../../../shared/config-frontend.php frontend/config.php");
$s1->task('cmd',"ln -s ../../../shared/config-admin.php admin/config.php");
//test
$s1->task('cmd',"ln -s ../../shared/config-frontend.php config.php");//Need for phpunit
$s1->task('cmd',"cp -n $base_path/releases/$server_deploy_folder/tests/config-dist.php $base_path/shared/config-tests.php");
$s1->task('cmd',"ln -s ../../../shared/config-tests.php tests/config.php");
//migrator
$s1->task('cmd',"cp -n $base_path/releases/$server_deploy_folder/phinx-distrib.yml $base_path/shared/phinx.yml");
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
$d->addServer($s1);
$d->run();

// deployer ------------------------------------------------------------------------------------------