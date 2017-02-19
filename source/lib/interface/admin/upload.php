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
    static $video = ['mp4', 'mov', 'm4v', 'wmv'];
    static $image = ['jpg', 'jpeg', 'png', 'gif', 'bmp'];
    static function upload() {
        global $common;
        $allowed = array_merge(self::$video, self::$image);
        if (!is_null($common->getParam('file', 'file'))) {
            $file = $common->getParam('file', 'file');
            $dir = $common->getParam('HTTP_FOLDER', 'server');
            $thumb = $common->getParam('HTTP_THUMB', 'server');
            $size = $common->getParam('HTTP_SIZE', 'server');
            $file_info = pathinfo($file['name']);
            $video = false;
            if (!is_null($size)) {
                $target_path = $dir . DIRECTORY_SEPARATOR;
                $file_name =  time().'-'.$file['name'];
                $finfo = new \finfo(FILEINFO_MIME_TYPE);
                $fmime = $finfo->file($file['tmp_name']);
                if (!is_null($size)) {
                    $size = explode('x', $size);
                } else {
                    $size = getimagesize($file['tmp_name']);
                }
                if (!is_null($thumb)) {
                    $thumb = explode('x', $thumb);
                } else {
                    $thumb = [$size[0]/3, $size[1]/3];
                }
                $width = $size[0];
                $height = $size[1];
                $tW = $thumb[0];
                $tH = $thumb[1];
                $imgResource = self::createImageResource($file_name, $file['tmp_name'], $fmime);
                $thumbResource = $imgResource;
                $img = $imgResource['img'];
                $thumbImg = $thumbResource['img'];
                $cW = $imgResource['width'];
                $cH = $imgResource['height'];
                
                
                if (in_array(strtolower($file_info['extension']), $allowed)) {
                    if ($img) {
                        // full image \\
                        $imageResized = self::resizeImage($width, $height, $img, $cW, $cH);
                        $resp['error'] = (self::saveImage($imageResized, $common->getParam('DOCUMENT_ROOT', 'server').DIRECTORY_SEPARATOR.'img'.DIRECTORY_SEPARATOR.$target_path.$file_name, 50)) ? false : true;
                        if (!$resp['error']) {
                            $resp['filename'] = $file_name;
                            // thumb \\
                            $thumbResized = self::resizeImage($tW, $tH, $thumbImg, $cW, $cH);
                            $resp['error'] = (self::saveImage($thumbResized, $common->getParam('DOCUMENT_ROOT', 'server').DIRECTORY_SEPARATOR.'thumbs'.DIRECTORY_SEPARATOR.$target_path.$file_name, 50)) ? false : true;
                            if ($resp['error']) {
                                $resp['message'] = 'Thumb could not be generated';
                            }
                        } else {
                            $resp['message'] = 'Image could not be saved'; 
                        }
                    } else if (in_array(strtolower($file_info['extension']), self::$video)) {
                        $video = true;
                        $video_web = DIRECTORY_SEPARATOR.'videos'.DIRECTORY_SEPARATOR.'encoded'.DIRECTORY_SEPARATOR.$target_path.urldecode($file_name);
                        $video_location = $common->getParam('DOCUMENT_ROOT', 'server').$video_web;
                        $tgt = $common->getParam('DOCUMENT_ROOT', 'server').DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'encoding'.DIRECTORY_SEPARATOR.$file_name;
                        if (!@move_uploaded_file($file['tmp_name'], $tgt)) {
                            $resp['message'] = 'File could not be uploaded';
                            $resp['error'] = true;
                        } else {
                            // generate a thumbnail based on the provided time \\
                            $frames = exec('/usr/local/bin/ffmpeg -nostats -i \''.$tgt.'\' -vcodec copy -f rawvideo -y /dev/null 2>&1 | grep frame | awk \'{split($0,a,"fps")}END{print a[1]}\' | sed \'s/.*= *//\'');
                            $screens = floor($frames / 40);
                            exec('/usr/local/bin/ffmpeg -i \''.$tgt.'\' -ss 00:00:10.00 -vframes 1 \''.$video_location.'.png\'');
                            $finfo = new \finfo(FILEINFO_MIME_TYPE);
                            $fmime = $finfo->file($video_location.'.png');
                            $posterResource = self::createImageResource($file_name.'.png', $video_location.'.png', $fmime);
                            if ($posterResource['img']) {
                                $posterResized = self::resizeImage($tW, $tH, $posterResource['img'], imagesx($posterResource['img']), imagesy($posterResource['img']));
                                exec('/usr/local/bin/ffmpeg -i \''.$tgt.'\' -frames 1 -q:v 1 -vf "select=not(mod(n\,'.$screens.')),scale=-1:'.imagesy($posterResized).',tile=40x1" \''.$video_location.'_frames.png\'');
                                $resp['error'] = (self::saveImage($posterResized, $video_location.'.png', 50)) ? false : true;
                            } else {
                                $resp['error'] = true;
                            }
                            if (!$resp['error']) {
                                // if its a video, lets encode it \\
                                // make mp4 \\
                                exec('/usr/local/bin/ffmpeg -i \''.$tgt.'\' -codec:v libx264 -profile:v high -preset slow -b:v 500k -maxrate 500k -bufsize 1000k -vf scale="\'if(gt(a,5/3),trunc('.$width.'/2)*2,-2)\':\'if(gt(a,5/3),-2,trunc('.$height.'/2)*2)\'" -threads 0 -strict -2 -codec:a aac -b:a 128k \''.$video_location.'.mp4\' > /dev/null 2>/dev/null &');

                                // make webm \\
                                exec('/usr/local/bin/ffmpeg -i \''.$tgt.'\' -vcodec libvpx -qscale 6 -acodec libvorbis -ab 128k -vf scale="\'if(gt(a,5/3),trunc('.$width.'/2)*2,-2)\':\'if(gt(a,5/3),-2,trunc('.$height.'/2)*2)\'" \''.$video_location.'.webm\' > /dev/null 2>/dev/null &');
                                // make ogg \\
                                exec('/usr/local/bin/ffmpeg -i \''.$tgt.'\' -vcodec libtheora -qscale 6 -acodec libvorbis -ab 128k -vf scale="\'if(gt(a,5/3),trunc('.$width.'/2)*2,-2)\':\'if(gt(a,5/3),-2,trunc('.$height.'/2)*2)\'" \''.$video_location.'.ogg\' > /dev/null 2>/dev/null &');
                                $resp['encoding'] = true;
                                $resp['error'] = false;
                                $resp['filename'] = $file_name;
                            } else {
                                $resp['message'] = 'Poster could not be generated';
                            }
                        }
                    }
                } else {
                    $resp['error'] = true;
                    $resp['message'] = 'Invalid file';
                }
                if ($resp['error']) {
//                    var_dump($resp);
                    print_r('error');
                } else {
                    if ($video) {
                        $previewSize = [];
                        if (file_exists($video_location.'.png')) {
                            $preview = getimagesize($video_location.'.png');
                            $previewSize = ['width'=>$preview[0], 'height'=>$preview[1], 'single_width'=>$width, 'single_height'=>$height];
                        }
                        print_r(json_encode(['type'=>'video', 'thumb'=>$video_web.'.png', 'size'=>$previewSize, 'filename'=>$video_web]));
                    } else {
                        print_r(json_encode(['type'=>'image', 'thumb'=>DIRECTORY_SEPARATOR.'img'.DIRECTORY_SEPARATOR.$target_path.$file_name, 'filename'=>DIRECTORY_SEPARATOR.'img'.DIRECTORY_SEPARATOR.$target_path.$file_name]));
                    }
                }
            } else {
                print_r(call_user_func_array(get_called_class().'::moveFile', array($file, $dir)));
            }
        }
    }
    static function isVideo()
    {
        
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
    static function createImageResource($name='', $tmpName='', $fmime='') {
        $ext = pathinfo($name);
        // get the dimensions \\
        list($width, $height) = \getimagesize($tmpName);
        $img = false;
        switch(strtolower($ext['extension'])) {
            case 'jpg': 
            case 'jpeg':
                if (\imagetypes() & IMG_JPG && ($fmime === 'image/jpeg' || $fmime === 'image/pjpeg')) {
                    $img = \imagecreatefromjpeg($tmpName);
                }
                break;

            case 'gif':
                if (\imagetypes() & IMG_GIF && $fmime === 'image/gif') {
                    $img = \imagecreatefromgif($tmpName);
                }
                break;

            case 'png':
                if (\imagetypes() & IMG_PNG && $fmime === 'image/png') {
                    $img = \imagecreatefrompng($tmpName);
                }
                break;

            default:
                // *** No extension - No save.
                break;
        }
        return ['img'=>$img, 'width'=>$width, 'height'=>$height];
    }
    static function resizeImage($newWidth, $newHeight, $img, $width, $height, $option="auto") {  
  
        // *** Get optimal width and height - based on $option  
        $optionArray = self::getDimensions($newWidth, $newHeight, $width, $height, strtolower($option));  
        $optimalWidth  = round($optionArray['optimalWidth']);
        $optimalHeight = round($optionArray['optimalHeight']);  
        // *** Resample - create image canvas of x, y size  
        if ($option == 'square' || $option == 'rectangle') {
            $imageResized = imagecreatetruecolor($newWidth, $newHeight);
            $white = imagecolorallocate($imageResized, 255, 255, 255);
            imagefill($imageResized, 0, 0, $white);
            if ($optimalWidth < $newWidth) {
                imagecopyresampled($imageResized, $img, round(($newWidth-$optimalWidth)/2), 0, 0, 0, $optimalWidth, $optimalHeight, $width, $height);  
            } else if ($optimalHeight < $newHeight) {
                imagecopyresampled($imageResized, $img, 0, round(($newHeight-$optimalHeight)/2), 0, 0, $optimalWidth, $optimalHeight, $width, $height);  
            } else {
                imagecopyresampled($imageResized, $img, 0, 0, 0, 0, $optimalWidth, $optimalHeight, $width, $height);  
            }
        } else {
            $imageResized = imagecreatetruecolor($optimalWidth, $optimalHeight);
            imagecopyresampled($imageResized, $img, 0, 0, 0, 0, $optimalWidth, $optimalHeight, $width, $height);  
        }
        

        // *** if option is 'crop', then crop too  
        if ($option == 'crop') {  
            self::crop($imageResized, $optimalWidth, $optimalHeight, $newWidth, $newHeight);  
        }
        return $imageResized;
    }
    
    static function getDimensions($newWidth, $newHeight, $width, $height, $option) {  
       switch ($option) {
            case 'exact':
                $optimalWidth = $newWidth;
                $optimalHeight= $newHeight;
                break;
            case 'portrait':
                $optimalWidth = self::getSizeByFixedHeight($newHeight, $width, $height);
                $optimalHeight= $newHeight;
                break;
            case 'landscape':
                $optimalWidth = $newWidth;
                $optimalHeight= self::getSizeByFixedWidth($newWidth, $width, $height);
                break;
            case 'auto':
            case 'square':
            case 'rectangle':
                $optionArray = self::getSizeByAuto($newWidth, $newHeight, $width, $height);
                $optimalWidth = $optionArray['optimalWidth'];
                $optimalHeight = $optionArray['optimalHeight']; 
                break;  
            case 'crop':  
                $optionArray = self::getOptimalCrop($newWidth, $newHeight, $width, $height);
                $optimalWidth = $optionArray['optimalWidth'];
                $optimalHeight = $optionArray['optimalHeight'];
                break;
        }
        return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);
    }
    static function getSizeByFixedHeight($newHeight, $width, $height) {
        $ratio = $width / $height;
        $newWidth = $newHeight * $ratio;
        return $newWidth;
    }  

    static function getSizeByFixedWidth($newWidth, $width, $height) {  
        $ratio = $height / $width;  
        $newHeight = $newWidth * $ratio;  
        return $newHeight;  
    }  

    static function getSizeByAuto($newWidth, $newHeight, $width, $height) {
        if ($height < $width) {
            $optimalWidth = $newWidth;
            $optimalHeight = self::getSizeByFixedWidth($newWidth, $width, $height);
            if ($optimalHeight > $newHeight) {
                $optimalHeight = $newHeight;
                $optimalWidth = self::getSizeByFixedHeight($newHeight, $width, $height);
            }
        } elseif ($height > $width) {
            $optimalWidth = self::getSizeByFixedHeight($newHeight, $width, $height);
            $optimalHeight = $newHeight;
            if ($optimalWidth > $newWidth) {
                $optimalWidth = $newWidth;
                $optimalHeight = self::getSizeByFixedWidth($newWidth, $width, $height);
            }
        } else {
            if ($newHeight < $newWidth) {
                $optimalWidth = $newWidth;
                $optimalHeight = self::getSizeByFixedWidth($newWidth, $width, $height);
                if ($optimalHeight > $newHeight) {
                    $optimalHeight = $newHeight;
                    $optimalWidth = self::getSizeByFixedHeight($newHeight, $width, $height);
                }
            } else if ($newHeight > $newWidth) {
                $optimalWidth = self::getSizeByFixedHeight($newHeight, $width, $height);
                $optimalHeight = $newHeight;
                if ($optimalWidth > $newWidth) {
                    $optimalWidth = $newWidth;
                    $optimalHeight = self::getSizeByFixedWidth($newWidth, $width, $height);
                }
            } else {
                // *** Square being resized to a square
                $optimalWidth = $newWidth;
                $optimalHeight = $newHeight;
            }
        }

        return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);  
    }  

    static function getOptimalCrop($newWidth, $newHeight, $width, $height) {  

        $heightRatio = $height / $newHeight;  
        $widthRatio  = $width /  $newWidth;  

        if ($heightRatio < $widthRatio) {  
            $optimalRatio = $heightRatio;  
        } else {  
            $optimalRatio = $widthRatio;  
        }  

        $optimalHeight = $height / $optimalRatio;  
        $optimalWidth  = $width  / $optimalRatio;  

        return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);  
    }
    
    static function crop($imageResized, $optimalWidth, $optimalHeight, $newWidth, $newHeight) {  
        // *** Find center - this will be used for the crop  
        $cropStartX = ( $optimalWidth / 2) - ( $newWidth /2 );  
        $cropStartY = ( $optimalHeight/ 2) - ( $newHeight/2 );  

        $crop = $imageResized;  

        // *** Now crop from center to exact requested size  
        $imageResized = imagecreatetruecolor($newWidth , $newHeight);  
        imagecopyresampled($imageResized, $crop , 0, 0, $cropStartX, $cropStartY, $newWidth, $newHeight , $newWidth, $newHeight);  
        return $imageResized;
    }
    static function saveImage($imageResized, $savePath, $imageQuality="100") {  
        // *** Get extension  
        $ext = pathinfo($savePath);  
        $resp = false;
        switch(strtolower($ext['extension'])) {  
            case 'jpg':  
            case 'jpeg':  
                if (imagetypes() & IMG_JPG) {  
                    $resp = imagejpeg($imageResized, $savePath, $imageQuality);  
                }  
                break;  

            case 'gif':  
                if (imagetypes() & IMG_GIF) {  
                    $resp = imagegif($imageResized, $savePath);  
                }  
                break;  

            case 'png':  
                // *** Scale quality from 0-100 to 0-9  
                $scaleQuality = round(($imageQuality/100) * 9);  

                // *** Invert quality setting as 0 is best, not 9  
                $invertScaleQuality = 9 - $scaleQuality;  

                if (imagetypes() & IMG_PNG) {  
                    $resp = imagepng($imageResized, $savePath, $invertScaleQuality);  
                }
                break;  

            default:  
                // *** No extension - No save.  
                break;  
        }  
        imagedestroy($imageResized);  
        return $resp;
    }
}
