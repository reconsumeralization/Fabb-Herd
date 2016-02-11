<?php

/*
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

/**
 * Description of admin
 *
 * @author richard
 */
namespace admin;
class __ {
    static function display_block($name='') {
        if (method_exists(get_called_class(), $name)) {
            return call_user_func_array(get_called_class().'::'.$name, array_slice(func_get_args(), 1));
        } else {
            return 'Method not found';
        }
    }
    static function page_count() {
        $count = \admin\__::get_data_item('tbl_pages', '__COUNT(id)', []);
        return 'Total pages: '.$count;
    }
    /**
     * 
     * @param (string) table name $_tbl
     * @param (string) column name $_col
     * @param (array) condition $_cond - formatted: array('col'=>'column_name', 'operand'=>'column_operand', 'value'=>'column_value')
     * @return (string) the resultant first row
     */
    static function get_data_item($_tbl, $_col, $_cond) {
        $tbl = array('t'=>$_tbl);
        $cols = array('t'=>array($_col.' AS col'));
        $cond = [];
        if (!empty($_cond)) {
            $cond = array('t'=>array($_cond));
        }
        $limi = array('LIMIT 1');
        $data = \data\collection::buildQuery("SELECT", $tbl, array(), $cols, $cond, $limi);
        if ($data[1] > 0) {
            return $data[0][0]['col'];
        }
    }
}
