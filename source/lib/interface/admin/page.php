<?php

/*
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

/**
 * Description of page
 *
 * @author richard
 */
namespace admin;
class page {
    static function list_pages() {
        $tbl = array('p'=>'tbl_pages');
        $cols = array('p'=>array('id', 'title', 'html'));
        $data = \data\collection::buildQuery("SELECT", $tbl, array(), $cols);
        $output = '<ul class="page_list">';
        if ($data[1] > 0) {
            if (file_exists('../lib/templates/admin/page/list_pages.php')) {
                $templ = file_get_contents('../lib/templates/admin/page/list_pages.php');
                foreach ($data[0] as $page) {
                    $output .= preg_replace_callback('/{_([a-zA-Z0-9\/_]*)_}/',
                    function($matches) use ($page) {                                                        
                        if (isset($page[$matches[1]])) {
                            return $page[$matches[1]];
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
            $info->title = 'New Page';
            $info->url = 'new-page';
            $info->html = '<p>Your content goes here</p>';
            $info->header = '';
        } else {
            // means we need to get some data \\
            $tbl = array('p'=>'tbl_pages');
            $cols = array('p'=>array('id', 'title', 'url', 'html', 'header'));
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
            $data = \data\collection::buildQuery("SELECT", $tbl, array(), $cols, $cond, array('LIMIT 1'));
            if ($data[1] > 0) {
                $info->title = $data[0][0]['title'];
                $info->url = $data[0][0]['url'];
                $info->html = $data[0][0]['html'];
                $info->header = $data[0][0]['header'];
            }
        }
        return $info;
    }
    static function update() {
        global $common;
        if (!is_null($common->getParam('submitted'))) {
            $id = (int)$common->getParam('id');
            $title = $common->getParam('title');
            $url = $common->getParam('url');
            $html = $common->getParam('html');
            $header = $common->getParam('header', 'file');
            $move = '';
            if (!empty($header['tmp_name'])) {
                require_once '../lib/interface/admin/upload.php';
                $move = \admin\upload::moveFile($header, 'headings');
            }
            if (!empty($title) && !empty($url)) {
                // is an update \\
                $data = array(
                    'response'=>array(
                        'tbl_pages'=>array('id'=>$id)
                    )
                );
                $info = array(
                    'fields'=>array(
                        'title'=>$title,
                        'url'=>$url,
                        'html'=>$html,
                        'header'=>$move
                    ),
                    'where'=>array('id'=>$id)
                );
                if ($id !== -1) {
                    $upd = \data\collection::runUpdate('tbl_pages', $info, $data);
                    if (is_array($upd)) {
                        return 'Successfully updated';
                    } else {
                        return 'An error occurred. Please try again';
                    }
                } else {
                    // is an insert \\
                    $ins = \data\collection::runInsert('tbl_pages', $info, $data);
                    if (is_array($ins)) {
                        return 'Successfully inserted';
                    } else {
                        return 'An error occurred. Please try again';
                    }    
                }
            } else {
                return 'A title and a URL are required';
            }
            
        }
    }
}
