<?php

/* 
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

namespace templates;
class shows {
    static function BuildOutput($offset=0, $xhr=false) {
        $tbl = array('s'=>'tbl_shows');
        $cols = array(
            's'=>array('*')
        );
        $joins = array();
        $cond = array();
        $limit = array("ORDER BY s.date DESC", "LIMIT $offset,6");
        
        $data = \data\collection::buildQuery("SELECT", $tbl, $joins, $cols, $cond, $limit);
        $items = array("left"=>array(), "right"=>array());
        $outp = '';
        if ($data[1] > 0) {
            foreach ($data[0] as $i=>$item) {
                if (($i+1) % 2 != 0) {
                    $items['left'][] = \templates\shows::ShowItem($item);
                } else {
                    $items['right'][] = \templates\shows::ShowItem($item);
                }
            }
            if (!$xhr) {
                if (!empty($items['left']) && !empty($items['right'])) {
                        $outp = '<div class="left-col even-col"><ul class="news-holder">';
                        $outp .= implode('', $items['left']);
                        $outp .= '</ul></div>';
                        $outp .= '<div class="right-col even-col"><ul class="news-holder">';
                        $outp .= implode('', $items['right']);
                        $outp .= '</ul></div>';
                        if ($data[1] == 6) {
                            // potentially an extra resultset \\
                            $outp .= '<div class="clear"></div><a href="#load" class="load-more" offset="0">View More</a>';
                        }

                } else {
                    $outp = '<ul class="news-holder">';
                    $outp .= implode('', $items['left']);
                    $outp .= '</ul>';
                }
            } else {
                $items['offset'] = $offset+6;
                $items['success'] = true;
                $outp = $items;
            }
        } else if ($xhr) {
            $outp = array('success'=>true, 'offset'=>0);
        }
        return $outp;
    }
    static function ShowItem($item) {
        if ($item['date'] !== '0000-00-00') {
            $item['date'] = (new \DateTime($item['date']))->format('d/m/Y');
        } else {
            $item['date'] = '';
        }
        return "<li><h4>{$item['title']} - {$item['date']}</h4><p>{$item['description']}</p></li>";
    }
}