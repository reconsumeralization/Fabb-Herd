<?php

/* 
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */
require_once "../lib/config.php";
header("Content-Type: text/javascript");
switch ($common->getParam('type', 'get')) {
    case "shows":
        require_once '../lib/templates/shows.php';
        print_r(json_encode(\templates\shows::BuildOutput($common->getParam('offset', 'get')+6, 'xhr')));
        break;
}