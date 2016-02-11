<?php

/*
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

/**
 * Description of cattle
 *
 * @author richard
 */
namespace admin;
class cattle {
    static function list_cattle() {
        $tbl = array('c'=>'tbl_cattle');
        $cols = array('c'=>array('id', 'name', '__DATE_FORMAT(dob, \'%d/%m/%Y\') AS dob', 'category', 'height', 'description', 'icon', 'sire', 'dam', 'video', 'link'));
        $data = \data\collection::buildQuery("SELECT", $tbl, array(), $cols, array(), 'ORDER BY c.name ASC');
        $output = '<ul class="cattle_list">';
        if ($data[1] > 0) {
            if (file_exists('../lib/templates/admin/cattle/list_cattle.php')) {
                $templ = file_get_contents('../lib/templates/admin/cattle/list_cattle.php');
                foreach ($data[0] as $cattle) {
                    $output .= preg_replace_callback('/{_([a-zA-Z0-9\/_]*)_}/',
                    function($matches) use ($cattle) {                                                        
                        if (isset($cattle[$matches[1]])) {
                            return $cattle[$matches[1]];
                        }
                    }, $templ);
                }
                    
            }
        }
        return $output.'<li id="new/-1">Create new</li></ul>';
    }
    static function edit($id=-1) {
        $info = new \stdClass();
        $info->id = (int)$id;
        if ($info->id === -1) {
            // means its new \\
            $info->name = 'Name';
            $info->dob = \date('d/m/Y');
            $info->category = '';
            $info->section = '';
            $info->height = '';
            $info->description = 'A brief description goes here';
            $info->icon = '';
            $info->sire = '';
            $info->dam = '';
            $info->video = '';
            $info->link = '';
            $info->images = array();
        } else {
            // means we need to get some data \\
            $tbl = array('c'=>'tbl_cattle');
            $joins = array(
                array(
                    'table'=>'tbl_cattle_photos',
                    'as'=>'p',
                    'on'=>array('c.id', '=', 'p.cattle_id')
                )
            );
            $cols = array(
                'c'=>array('id', 'name', '__DATE_FORMAT(dob, \'%d/%m/%Y\') AS dob', 'category', 'section', 'height', 'description', 'icon', 'sire', 'dam', 'video', 'link'),
                'p'=>array('id AS photo_id', 'url')
            );
            $cond = array(
                'c'=>array(
                    "join"=>'AND',
                    array(
                        'col'=>'id',
                        'operand'=>'=',
                        'value'=>$id
                    )
                )
            );
            $data = \data\collection::buildQuery("SELECT", $tbl, $joins, $cols, $cond);
            if ($data[1] > 0) {
                $info->name = $data[0][0]['name'];
                $info->dob = $data[0][0]['dob'];
                $info->category = $data[0][0]['category'];
                $info->section = $data[0][0]['section'];
                $info->height = $data[0][0]['height'];
                $info->description = $data[0][0]['description'];
                $info->icon = $data[0][0]['icon'];
                $info->sire = $data[0][0]['sire'];
                $info->dam = $data[0][0]['dam'];
                $info->video = $data[0][0]['video'];
                $info->link = $data[0][0]['link'];
                
                $info->images = array();
                foreach ($data[0] as $img) {
                    $info->images[$img['photo_id']] = $img['url'];
                }
            }
        }
        return $info;
    }
    static function update() {
        global $common;
        if (!is_null($common->getParam('submitted'))) {
            $id = (int)$common->getParam('id');
            $name = $common->getParam('name');
            $dateObj = \DateTime::createFromFormat('d/m/Y', $common->getParam('dob'));
            if ($dateObj === false) {
                $dateObj = new \DateTime();
            }
            $dob = $dateObj->format('Y-m-d');
            $category = $common->getParam('category');
            $section = $common->getParam('section');
            $height = $common->getParam('height');
            $description = $common->getParam('description');
            $icon = $common->getParam('icon', 'file');
            $sire = $common->getParam('sire');
            $dam = $common->getParam('dam');
            $video = $common->getParam('video');
            $link = $common->getParam('link');
            
            $images = $common->getParam('images');
            
            $move = '';
            if (!empty($icon['tmp_name'])) {
                require_once '../lib/interface/admin/upload.php';
                $move = \admin\upload::moveFile($icon, 'cattle');
            }
            
            if (!is_null($name)) {
                // is an update \\
                $data = array(
                    'response'=>array(
                        'tbl_cattle'=>array('id'=>$id)
                    )
                );
                $info = array(
                    'fields'=>array(
                        'name'=>$name,
                        'dob'=>$dob,
                        'category'=>$category,
                        'section'=>$section,
                        'height'=>$height,
                        'description'=>$description,
                        'icon'=>$move,
                        'sire'=>$sire,
                        'dam'=>$dam,
                        'video'=>$video,
                        'link'=>$link
                    ),
                    'where'=>array('id'=>$id)
                );
                if (!empty($images)) {
                    $imageData = array(
                        'response'=>array(
                            'tbl_cattle_photos'=>array()
                        )
                    );
                    $imageInfo = array('rows'=>array());
                    foreach ($images as $image) {
                        $imageInfo['rows'][] = array(
                            'fields'=>array(
                                'cattle_id'=>&$data['response']['tbl_cattle']['id'],
                                'url'=>$image,
                                'alt'=>''
                            )
                        );
                    }
                }
                if ($id !== -1) {
                    $upd = \data\collection::runUpdate('tbl_cattle', $info, $data);
                    $del = \data\collection::quickDelete('tbl_cattle_photos', array('cattle_id', '=', $id));
                    if (isset($imageInfo)) {
                        $img = \data\collection::runInsert('tbl_cattle_photos', $imageInfo, $imageData);
                    }
                    if (is_array($upd)) {
                        return 'Successfully updated';
                    } else {
                        return 'An error occurred. Please try again';
                    }
                } else {
                    // is an insert \\
                    $ins = \data\collection::runInsert('tbl_cattle', $info, $data);
                    if (isset($imageInfo)) {
                        $img = \data\collection::runInsert('tbl_cattle_photos', $imageInfo, $imageData);
                    }
                    if (is_array($ins)) {
                        return 'Successfully inserted';
                    } else {
                        return 'An error occurred. Please try again';
                    }    
                }
            } else {
                return 'A name is required';
            }
            
        }
    }
}
