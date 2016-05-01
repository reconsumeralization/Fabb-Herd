<?php

/* 
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

require_once "../lib/config.php";
header("Content-Type: text/javascript");
if (!is_null($common->getParam('submitted'))) {
    $fields = $common->getAllParam();
    $cols = array();
    $err = array();
    foreach ($fields as $key=>$val) {
        switch ($key) {
            case "name":
            case "email":
                if (empty($val)) {
                    $err[] = $key.' is required';
                }
            case "phone":
            case "message":
                $cols[$key] = $val;
                break;
        }
    }
    if (!empty($cols)) {
        if (empty($err)) {
            \data\collection::runInsert('tbl_contact', array('fields'=>$cols), array('response'=>array('tbl_contact'=>array())));
            require_once '../lib/mail/__init.php';
            $mail = new mail();
            $mail->sendMail('helen@fabbherd.com', 'Contact form has been submitted on The Fabb Herd website', 'mail.html', $cols, 'website@fabbherd.com', 'Website @ The Fabb Herd', 'website@fabbherd.com', 'mliIG2b87GSN', 'mail.fabbherd.com', 26);
            echo json_encode(array("success"=>true));
        } else {
            echo json_encode(array("success"=>false, "message"=>$err));
        }
    } else {
        echo json_encode(array("success"=>false, "message"=>array('you must enter values into the form.')));
    }
} else {
    echo json_encode(array("success"=>false, "message"=>array('malformed form submission.')));
}