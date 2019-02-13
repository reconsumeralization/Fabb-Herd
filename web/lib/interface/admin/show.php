<?php

/*
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

/**
 * Description of show
 *
 * @author richard
 */
namespace admin;
class show {
    static function list_shows() {
        $tbl = array('s'=>'tbl_shows');
        $cols = array('s'=>array('id', 'title', '__DATE_FORMAT(date, \'%d/%m/%Y\') AS date'));
        $data = \data\collection::buildQuery("SELECT", $tbl, array(), $cols);
        $output = '<ul class="show_list">';
        if ($data[1] > 0) {
            if (file_exists('../lib/templates/admin/show/list_shows.php')) {
                $templ = file_get_contents('../lib/templates/admin/show/list_shows.php');
                foreach ($data[0] as $show) {
                    $output .= preg_replace_callback('/{_([a-zA-Z0-9\/_]*)_}/',
                    function($matches) use ($show) {                                                        
                        if (isset($show[$matches[1]])) {
                            return $show[$matches[1]];
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
            $info->title = 'New Show';
            $info->date = \date('d/m/Y');
            $info->description = '<p>Show description here</p>';
        } else {
            // means we need to get some data \\
            $tbl = array('s'=>'tbl_shows');
            $cols = array('s'=>array('id', 'title', '__DATE_FORMAT(date, \'%d/%m/%Y\') AS date', 'description'));
            $cond = array(
                's'=>array(
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
                $info->date = $data[0][0]['date'];
                $info->description = $data[0][0]['description'];
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
            if (!empty($title)) {
                // is an update \\
                $data = array(
                    'response'=>array(
                        'tbl_shows'=>array('id'=>$id)
                    )
                );
                $info = array(
                    'fields'=>array(
                        'title'=>$title,
                        'date'=>$date,
                        'description'=>$description
                    ),
                    'where'=>array('id'=>$id)
                );
                if ($id !== -1) {
                    $upd = \data\collection::runUpdate('tbl_shows', $info, $data);
                    if (is_array($upd)) {
                        return 'Successfully updated';
                    } else {
                        return 'An error occurred. Please try again';
                    }
                } else {
                    // is an insert \\
                    $ins = \data\collection::runInsert('tbl_shows', $info, $data);
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
