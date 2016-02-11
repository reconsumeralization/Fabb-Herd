<?php

$action = $argv[1];
require_once 'lib/config.php';
require_once 'lib/interface/admin/upload.php';
switch ($action) {
    case "cattle_photos":
        // loop through each image in the image db and create resized copies \\
        $tbl = [
            'p'=>'tbl_cattle_photos'
        ];
        $joins = [];
        $cols = [
            'p'=>['url']
        ];
        $cond = [];
        $images = \data\collection::buildQuery("SELECT", $tbl, $joins, $cols, $cond);
        if ($images[1]) {
            $rootDir = __DIR__.'/../../public';
            $target_path = 'cattle/gallery/';
            foreach ($images[0] as $image) {
                // see if the file exists \\
                if (file_exists($rootDir.DIRECTORY_SEPARATOR.$image['url'])) {
                    $width = 1280;
                    $height = 720;
                    $tW = 90;
                    $tH = 60;
                    $finfo = new \finfo(FILEINFO_MIME_TYPE);
                    $fmime = $finfo->file($rootDir.DIRECTORY_SEPARATOR.$image['url']);
                    $imgResource = \admin\upload::createImageResource(basename($image['url']), $rootDir.DIRECTORY_SEPARATOR.$image['url'], $fmime);
                    $thumbResource = $imgResource;
                    $img = $imgResource['img'];
                    $thumbImg = $thumbResource['img'];
                    $cW = $imgResource['width'];
                    $cH = $imgResource['height'];
                    if ($img) {
                        // full image \\
                        $imageResized = \admin\upload::resizeImage($width, $height, $img, $cW, $cH);
                        $resp['error'] = (\admin\upload::saveImage($imageResized, $rootDir.DIRECTORY_SEPARATOR.'img'.DIRECTORY_SEPARATOR.$target_path.basename($image['url']), 50)) ? false : true;
                        if (!$resp['error']) {
                            $resp['message'] = basename($image['url'])."\r\n";
                            // thumb \\
                            $thumbResized = \admin\upload::resizeImage($tW, $tH, $thumbImg, $cW, $cH);
                            $resp['error'] = (\admin\upload::saveImage($thumbResized, $rootDir.DIRECTORY_SEPARATOR.'thumbs'.DIRECTORY_SEPARATOR.$target_path.basename($image['url']), 50)) ? false : true;
                            if ($resp['error']) {
                                $resp['message'] = 'Thumb could not be generated';
                            }
                        } else {
                            $resp['message'] = 'Image could not be saved'; 
                        }
                        print_r($resp['message']);
                    }
                }
            }
        }
        break;
}