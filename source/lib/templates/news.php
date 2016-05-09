<?php

/* 
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

namespace templates;
require_once __DIR__.'/../../vendor/autoload.php';
class news {
    static function BuildOutput($url, $offset=0) {
        global $common;
        $tbl = array('n'=>'tbl_news');
        $cols = array(
            'n'=>array('*'),
            'p'=>array('id AS photo_id', 'url')
        );
        $joins = array(
            array('table'=>'tbl_news_photos', 'as'=>'p', 'on'=>array('p.news_id', '=', 'n.id'))
        );
        $cond = array();
        $limit = array("ORDER BY n.date DESC", "LIMIT $offset,6");
        
        $data = \data\collection::buildQuery("SELECT", $tbl, $joins, $cols, $cond, $limit);
        $items = [];
        $outp = '';
        if ($data[1] > 0) {
            $news = array();
            foreach ($data[0] as $photo) {
                if (!isset($news[$photo['id']])) {
                    $news[$photo['id']] = array('date'=>($photo['date'] === '0000-00-00') ? $photo['date'] : new \DateTime($photo['date']), 'timestamp'=>strtotime($photo['date']), 'title'=>$photo['title'], 'description'=>$photo['description'], 'story'=>$photo['story'], 'photos'=>array());
                }
                if (!is_null($photo['url'])) {
                    $news[$photo['id']]['photos'][$photo['photo_id']] = $photo['url'];
                }
            }
            require_once 'posts.php';
            $blog = \templates\posts::BuildOutput($url, $offset, true);
            $feed = $common->GetFacebook();
            if (is_array($feed)) {
                foreach ($feed as $post) {
                    if (isset($post['message'])) {
                        $news[$post['id']] = ['date'=>'<div class="image"><img src="/img/Facebook-icon.png" alt="Facebook" width="40"></div><div class="author">'.ucfirst($post['created_time']).'</div>', 'timestamp'=>$post['timestamp'], 'description'=>$post['description'], 'story'=>'<span class="facebook">'.$post['message'].'</span>', 'photos'=>(!empty($post['image'])) ? [$post['image_id']=>$post['image']] : []];
                    }
                }
            }
            foreach ($news as $item) {
                $items[] = \templates\news::NewsItem($item);
            }
            if (is_array($blog)) {
                foreach ($blog as $post) {
                    $items[] = $post;
                }
            }
            $outp = '<ul class="news-holder">';
            $outp .= implode('', $items);
            $outp .= '</ul>';
        }
        return $outp;
    }
    static function NewsItem($item) {
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
        $photos = '';
        if (isset($item['photos']) && !empty($item['photos'])) {
            $photos = '<ul class="news-photos">';
            foreach ($item['photos'] as $photo) {
                if (!empty($photo)) {
                    $photos .= '<li><img src="'.$photo.'" /></li>';
                }
            }
            $photos .= '</ul>';
        }
        return "<li id=\"news_{$item['timestamp']}\">$title".((isset($item['description'])) ? "<p>{$item['description']}</p><a class=\"view\" href=\"#view\">View more</a><div class=\"news-story\">" : '<div>')."{$item['story']}$photos</div></li>";
    }
}