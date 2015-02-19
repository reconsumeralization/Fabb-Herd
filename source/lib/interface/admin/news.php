<?php

/*
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

/**
 * Description of news
 *
 * @author richard
 */
namespace admin;
class news {
    static function list_news() {
        $tbl = array('n'=>'tbl_news');
        $cols = array('n'=>array('id', 'date', 'title', 'description'));
        $data = \data\collection::buildQuery("SELECT", $tbl, array(), $cols, array(), 'ORDER BY n.date DESC');
        $output = '<ul class="news_list">';
        if ($data[1] > 0) {
            if (file_exists('../lib/templates/admin/news/list_news.php')) {
                $templ = file_get_contents('../lib/templates/admin/news/list_news.php');
                foreach ($data[0] as $news) {
                    $output .= preg_replace_callback('/{_([a-zA-Z0-9\/_]*)_}/',
                    function($matches) use ($news) {                                                        
                        if (isset($news[$matches[1]])) {
                            return $news[$matches[1]];
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
            $info->date = \date('d/m/Y');
            $info->title = 'New News';
            $info->description = 'A brief news description goes here';
            $info->story = '<p>Your main story goes here</p>';
            $info->images = array();
        } else {
            // means we need to get some data \\
            $tbl = array('n'=>'tbl_news');
            $joins = array(
                array(
                    'table'=>'tbl_news_photos',
                    'as'=>'i',
                    'on'=>array('n.id', '=', 'i.news_id')
                )
            );
            $cols = array(
                'n'=>array('id', '__DATE_FORMAT(date, \'%d/%m/%Y\') AS date', 'title', 'description', 'story'),
                'i'=>array('id AS photo_id', 'url')
            );
            $cond = array(
                'n'=>array(
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
                $info->title = $data[0][0]['title'];
                $info->date = $data[0][0]['date'];
                $info->description = $data[0][0]['description'];
                $info->story = $data[0][0]['story'];
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
            $title = $common->getParam('title');
            $dateObj = \DateTime::createFromFormat('d/m/Y', $common->getParam('date'));
            if ($dateObj === false) {
                $dateObj = new \DateTime();
            }
            $date = $dateObj->format('Y-m-d');
            $description = $common->getParam('description');
            $story = $common->getParam('story');
            $images = $common->getParam('images');
            if (!empty($title)) {
                // is an update \\
                $data = array(
                    'response'=>array(
                        'tbl_news'=>array('id'=>$id)
                    )
                );
                $info = array(
                    'fields'=>array(
                        'title'=>$title,
                        'date'=>$date,
                        'description'=>$description,
                        'story'=>$story
                    ),
                    'where'=>array('id'=>$id)
                );
                
                
                if (!empty($images)) {
                    $imageData = array(
                        'response'=>array(
                            'tbl_news_photos'=>array()
                        )
                    );
                    $imageInfo = array('rows'=>array());
                    foreach ($images as $image) {
                        $imageInfo['rows'][] = array(
                            'fields'=>array(
                                'news_id'=>&$data['response']['tbl_news']['id'],
                                'url'=>$image
                            )
                        );
                    }
                }
                if ($id !== -1) {
                    $upd = \data\collection::runUpdate('tbl_news', $info, $data);
                    $del = \data\collection::quickDelete('tbl_news_photos', array('news_id', '=', $id));
                    if (isset($imageInfo)) {
                        $img = \data\collection::runInsert('tbl_news_photos', $imageInfo, $imageData);
                    }
                    if (is_array($upd)) {
                        return 'Successfully updated';
                    } else {
                        return 'An error occurred. Please try again';
                    }
                } else {
                    // is an insert \\
                    $ins = \data\collection::runInsert('tbl_news', $info, $data);
                    if (isset($imageInfo)) {
                        $img = \data\collection::runInsert('tbl_news_photos', $imageInfo, $imageData);
                    }
                    if (is_array($ins)) {
                        return 'Successfully inserted';
                    } else {
                        return 'An error occurred. Please try again';
                    }    
                }
            } else {
                return 'A title is required';
            }
            
        }
    }
}
