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
        if (!move_uploaded_file($tempFile,$common->getParam('DOCUMENT_ROOT', 'server').$targetFile)) {
            return "error";
        } else {
            return $targetFile;
        }
    }
}
