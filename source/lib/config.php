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

$confArray = array();
$confArray['db'] = array();
$confArray['db']['user'] = 'smgdev_fabb';
$confArray['db']['password'] = '^!g5[&yCpM=[';
$confArray['db']['host'] = 'localhost';
$confArray['db']['name'] = 'smgdev_fabb';

$common = new common();
$db = new db($confArray['db']);
$session = new session("Fabb-Herd");
require_once 'interface/data.php';
require_once 'interface/layout.php';
require_once 'interface/auth.php';