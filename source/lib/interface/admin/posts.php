<?php

/*
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

/**
 * Posts
 *
 * @author richard
 */
namespace admin;
class posts {
    static function list_posts() {
        $tbl = array('p'=>'tbl_posts');
        $cols = array('p'=>array('id', 'date', 'title', 'description'));
        $data = \data\collection::buildQuery("SELECT", $tbl, array(), $cols, array(), 'ORDER BY p.date DESC');
        $output = '<ul class="posts_list">';
        if ($data[1] > 0) {
            if (file_exists('../lib/templates/admin/posts/list_posts.php')) {
                $templ = file_get_contents('../lib/templates/admin/posts/list_posts.php');
                foreach ($data[0] as $post) {
                    $output .= preg_replace_callback('/{_([a-zA-Z0-9\/_]*)_}/',
                    function($matches) use ($post) {                                                        
                        if (isset($post[$matches[1]])) {
                            return $post[$matches[1]];
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
            $info->title = 'New Blog Post';
            $info->page_title = 'New Blog Post';
            $info->url = 'post-url';
            $info->description = 'A brief blog post summary goes here';
            $info->html = '<p>Your main story goes here</p>';
        } else {
            // means we need to get some data \\
            $tbl = array('p'=>'tbl_posts');
            $cols = array(
                'p'=>array('id', '__DATE_FORMAT(date, \'%d/%m/%Y\') AS date', 'title', 'page_title', 'url', 'description', 'html')
            );
            $cond = array(
                'p'=>array(
                    "join"=>'AND',
                    array(
                        'col'=>'id',
                        'operand'=>'=',
                        'value'=>$id
                    )
                )
            );
            $data = \data\collection::buildQuery("SELECT", $tbl, [], $cols, $cond);
            if ($data[1] > 0) {
                $info->date = $data[0][0]['date'];
                $info->title = $data[0][0]['title'];
                $info->page_title = $data[0][0]['page_title'];
                $info->url = $data[0][0]['url'];
                $info->description = $data[0][0]['description'];
                $info->html = $data[0][0]['html'];
            }
        }
        return $info;
    }
    static function update() {
        global $common;
        if (!is_null($common->getParam('submitted'))) {
            $id = (int)$common->getParam('id');
            $title = $common->getParam('title');
            $metatitle = $common->getParam('page_title');
            $url = $common->getParam('url');
            $dateObj = \DateTime::createFromFormat('d/m/Y', $common->getParam('date'));
            if ($dateObj === false) {
                $dateObj = new \DateTime();
            }
            $date = $dateObj->format('Y-m-d');
            $description = $common->getParam('description');
            $html = $common->getParam('html');
            if (!empty($title)) {
                // is an update \\
                $data = array(
                    'response'=>array(
                        'tbl_posts'=>array('id'=>$id)
                    )
                );
                $info = array(
                    'fields'=>array(
                        'title'=>$title,
                        'page_title'=>$metatitle,
                        'url'=>$url,
                        'date'=>$date,
                        'description'=>$description,
                        'html'=>$html
                    ),
                    'where'=>array('id'=>$id)
                );
                if ($id !== -1) {
                    $upd = \data\collection::runUpdate('tbl_posts', $info, $data);
                    if (is_array($upd)) {
                        return 'Successfully updated';
                    } else {
                        return 'An error occurred. Please try again';
                    }
                } else {
                    // is an insert \\
                    $ins = \data\collection::runInsert('tbl_posts', $info, $data);
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
