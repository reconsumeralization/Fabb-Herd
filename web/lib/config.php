<?php

/* 
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */
require_once "common/__init.php";
require_once "db/__init.php";
require_once "db/collection.php";
require_once "session/__init.php";

define('debug', true);
if (debug) {
    ini_set('display_errors', '1');
} else {
    ini_set('display_errors', '0');
}
$confArray = array();
$confArray['db'] = array();
$confArray['db']['user'] = 'fabb';
$confArray['db']['password'] = '.7Ja74O729l4S{=tSQm7fm[l7WxL2l';
$confArray['db']['host'] = 'localhost';
$confArray['db']['name'] = 'fabb-herd';

$common = new common();
$db = new db($confArray['db']);
$session = new session("Fabb-Herd");
define('www', 'http://'.$common->getParam('SERVER_NAME', 'server'));
require_once 'interface/data.php';
require_once 'interface/layout.php';
require_once 'interface/auth.php';