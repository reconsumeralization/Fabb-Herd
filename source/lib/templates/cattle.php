<?php

/* 
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */

namespace templates;
class cattle {
    static function BuildOutput() {
        $tbl = array('c'=>'tbl_cattle');
        $cols = array(
            'c'=>array('*'),
            'p'=>array('url', 'alt')
        );
        $joins = array(array('table'=>'tbl_cattle_photos', 'as'=>'p', 'on'=>array('p.cattle_id', '=', 'c.id')));
        $cond = array();
        $limit = array("ORDER BY c.section, c.name ASC");
        $data = \data\collection::buildQuery("SELECT", $tbl, $joins, $cols, $cond, $limit);
        $items = [];
        if ($data[1] > 0) {
            $cattle = array();
            foreach ($data[0] as $photo) {
                if (!isset($cattle[$photo['id']])) {
                    $cattle[$photo['id']] = array('id'=>$photo['id'], 'section'=>$photo['section'], 'name'=>$photo['name'], 'dob'=>$photo['dob'], 'category'=>$photo['category'], 'height'=>$photo['height'], 'description'=>$photo['description'], 'icon'=>$photo['icon'], 'sire'=>$photo['sire'], 'dam'=>$photo['dam'], 'video'=>$photo['video'], 'link'=>$photo['link'], 'photos'=>array());
                }
                if (!empty($photo['url'])) {
                    $cattle[$photo['id']]['photos'][] = array('url'=>$photo['url'], 'alt'=>$photo['alt']);
                }
            }
        }
        foreach ($cattle as $i=>$item) {
            if (!isset($items[$item['section']])) {
                $items[$item['section']] = [];
            }
            $items[$item['section']][] = \templates\cattle::CattleTitle($i, $item);
        }
        $outp = '';
        foreach ($items as $section=>$sectionItems) {
            $outp .= '<h2>'.$section.'</h2>';
            $outp .= '<ul class="cattle-list">';
            $outp .= implode('', $sectionItems);
            $outp .= '</ul>';
        }
        return $outp;
    }
    static function CattleTitle($i, $item) {
        return '<li class="cattle-item" id="icon-'.$item['id'].'"><a title="'.str_replace(' ', '-', $item['name']).'"></a><span class="holder"><img '.((empty($item['icon'])) ? ((!empty($item['photos'][0])) ? 'src="'.str_replace('/img/', '/thumbs/', $item['photos'][0]['url']).'"' : 'src="/img/cattle/default.png" class="default"') : 'src="'.$item['icon'].'"').' alt="'.$item['name'].'" /></span>'.\templates\cattle::CattleDescription($item).'</li>';
    }
    static function CattleDescription($item) {
        global $common;
        $images = array();
        foreach ($item['photos'] as $photo) {
            $images[] = '<span class="cattle-img" data-src="'.$photo['url'].'" alt="'.$photo['alt'].'"></span>';
        }
        $dob = new \DateTime($item['dob']);
        $tod = new \DateTime();
        $age = $dob->diff($tod)->y;
        return '<div class="cattle-info" id="cattle-'.$item['id'].'">
                    <div class="cattle-details">
                        <h2 class="cattle-name">'.$item['name'].'</h2>
                        <div class="cattle-description">
                            '.$item['description'].'
                            '.(($item['dob'] !== '0000-00-00') ? '<br /><strong>DOB: </strong>'.$dob->format('d/m/Y') : '').'
                            '.((!empty($item['sire'])) ? '<br /><strong>Sire: </strong>'.$item['sire'] : '').'
                            '.((!empty($item['dam'])) ? '<br /><strong>Dam: </strong>'.$item['dam'] : '').'
                            '.((!empty($item['link'])) ? '<br /><a href="'.$item['link'].'" target="_blank">More Information</a>' : '').'
                        </div>
                    </div>
                    <div class="cattle-images">
                            '.implode('', $images).'
                            '.(!empty($item['video']) ? '<span class="cattle-video" data-src="'.htmlentities($item['video']).'"></span>' : '').'
                    </div>
                </div>';
    }
}