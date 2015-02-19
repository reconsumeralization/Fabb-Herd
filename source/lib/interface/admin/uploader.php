<?php

/*
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

/**
 * Description of uploader
 *
 * @author richard
 */
namespace admin;
class uploader {
    static function upload() {
        global $common;
        $folder = $common->getParam('DOCUMENT_ROOT', 'server').DIRECTORY_SEPARATOR.'public_html'.DIRECTORY_SEPARATOR.'img';
        if (!is_null($common->getParam('file', 'file'))) {
            $file = $common->getParam('file', 'file');
            $tempFile = $file['tmp_name'];
            $targetPath = $folder. DIRECTORY_SEPARATOR;
            $targetFile =  $targetPath. $file['name'];
            move_uploaded_file($tempFile,$targetFile);
        }
    }
}
