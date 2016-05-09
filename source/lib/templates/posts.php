<?php

/* 
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

namespace templates;
require_once __DIR__.'/../../vendor/autoload.php';
class posts {
    static function BuildOutput($url, $offset=0, $inline=false) {
        global $common;
        $tbl = array('p'=>'tbl_posts');
        $cols = array(
            'p'=>array('*', '__DATE_FORMAT(date, \'%d/%m/%Y\') AS date')
        );
        $cond = array();
        $limit = array("ORDER BY p.date DESC", "LIMIT $offset,6");
        
        $data = \data\collection::buildQuery("SELECT", $tbl, [], $cols, $cond, $limit);
        $items = [];
        $outp = '';
        if ($data[1] > 0) {
            $posts = $data[0];
            
            foreach ($posts as $post) {
                $items[] = self::BlogItem($post);
            }
            if ($inline) {
                return $items;
            }
            $outp = '<ul class="post-holder">';
            $outp .= implode('', $items);
            $outp .= '</ul>';
        }
        return $outp;
    }
    static function BlogItem($item) {
        if (is_a($item['date'], 'DateTime')) {
            $item['date'] = $item['date']->format('d/m/Y');
        } else if ($item['date'] === '0000-00-00'){
            $item['date'] = '';
        }
        if (!empty($item['title'])) {
            $title = "<h4>{$item['title']} - {$item['date']}</h4>";
        } else {
            $title = "<h4>{$item['date']}</h4>";
        }
        return "<li id=\"news_".strtotime($item['date_added'])."\">$title".((isset($item['description'])) ? "<p>{$item['description']}</p>" : "")."<a href=\"/blog/{$item['url']}\">View post</a></li>";
    }
    static function BlogPost($page)
    {
        $title = $page[1];
        $tbl = array(
            'p'=>'tbl_posts'
        );
        $joins = array(
            array(
                'table'=>'tbl_pages',
                'as'=>'pa',
                'on'=>array('pa.url', '=', "'blog'")
            )
        );
        $cols = array(
            'p'=>array('*'),
            'pa'=>array('header')
        );
        $cond = array();
        if (!empty($title)) {
            $cond = array('p'=>array('url'=>"'$title'"));
        }
        $data = \data\collection::buildQuery("SELECT", $tbl, $joins, $cols, $cond);
        $date = new \DateTime($data[0][0]['date']);
        $data[0][0]['html'] = '<p class="date_posted">Date posted: '.$date->format('d/m/Y').'</p>'.$data[0][0]['html'];
        return $data[0][0];
    }
}