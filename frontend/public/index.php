<?php
chdir('..');
require_once'../vendor/autoload.php';
require_once 'lib/Frontend.php';
$api=new Frontend('scandic-fusion-front');
$api->main();