<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of data
 *
 * @author richard
 */
namespace data;
class handling {
    static function GetPages($title='') {
        $tbl = array(
            'p'=>'tbl_pages'
        );
        $joins = array();
        $cols = array(
            'p'=>array('*')
        );
        $cond = array();
        if (!empty($title)) {
            $cond = array('p'=>array('url'=>$title));
        }
        $data = \data\collection::buildQuery("SELECT", $tbl, $joins, $cols, $cond);
        return $data[0];
    }
    static function GetNav() {
        $tbl = array(
            'p'=>'tbl_pages'
        );
        $joins = array();
        $cols = array(
            'p'=>array('url', 'title')
        );
        $cond = array();
        $data = \data\collection::buildQuery("SELECT", $tbl, $joins, $cols, $cond);
        return $data[0];
    }
}

?>
