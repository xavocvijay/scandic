<?php
chdir('..');
require_once'../vendor/autoload.php';
require_once 'lib/Admin.php';
$api=new Admin('scandic-fusion-admin');
$api->main();
