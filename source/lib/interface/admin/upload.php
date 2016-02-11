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
$opts['xhr'] = true;
class upload {
    static function upload() {
        global $common;
        if (!is_null($common->getParam('file', 'file'))) {
            $file = $common->getParam('file', 'file');
            $dir = $common->getParam('HTTP_FOLDER', 'server');
            print_r(call_user_func_array(get_called_class().'::moveFile', array($file, $dir)));
        }
    }
    static function moveFile($file, $tgtDir=null) {
        global $common;
        $folder = DIRECTORY_SEPARATOR.'img' . (!is_null($tgtDir) ? DIRECTORY_SEPARATOR . $tgtDir : '');
        $tempFile = $file['tmp_name'];
        $targetPath = $folder . DIRECTORY_SEPARATOR;
        $targetFile =  $targetPath.time().'-'.$file['name'];
        $rootDir = strstr($common->getParam('DOCUMENT_ROOT', 'server'), 'public_html', true);
        if ($rootDir === false) {
            $rootDir = $common->getParam('DOCUMENT_ROOT', 'server');
        }
        if (!move_uploaded_file($tempFile,$rootDir.DIRECTORY_SEPARATOR.'public_html'.$targetFile)) {
            return "error";
        } else {
            return $targetFile;
        }
    }
    static function resizeFile($file, $size=400, $tgtDir=null) {
        
    }
}
