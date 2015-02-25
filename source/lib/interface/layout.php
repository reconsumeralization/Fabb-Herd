<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of layout
 *
 * @author richard
 */
namespace data;
class layout {
    static function BuildPage($page=array()) {
        global $common;
        $opts = array('xhr'=>false);
        if (!empty($page)) {
            switch ($page[0]) {
                case "admin":
                    if (!\data\auth::logged_in()) {
                        if (!is_null($common->getParam('submitted'))) {
                            $login = \data\auth::login();
                        }
                        $page[1] = 'login';
                    } else if (empty($page[1])) {
                        $page[1] = 'index';
                    }
                    $params = array_slice($page, 3);
                    require_once '../lib/interface/admin/__base.php';
                    if (file_exists('../lib/interface/admin/'.$page[1].'.php')) {
                        require_once '../lib/interface/admin/'.$page[1].'.php';
                    }
                    if (!$opts['xhr']) {
                        include '../lib/templates/admin/header.php';
                    }
                    if (isset($page[2]) && !empty($page[2])) {
                        if (file_exists('../lib/templates/admin/'.$page[1].'/'.$page[2].'.php')) {
                            include '../lib/templates/admin/'.$page[1].'/'.$page[2].'.php';
                        }
                    } else {
                        if (file_exists('../lib/templates/admin/'.$page[1].'.php')) {
                            include '../lib/templates/admin/'.$page[1].'.php';
                        }
                    }
                    if (!$opts['xhr']) {
                        include '../lib/templates/admin/footer.php';
                    }
                    break;
                default:
                    include '../lib/templates/header.php';
                    include '../lib/templates/footer.php';
                    break;
            }
        }
    }
    static function StaticNav() {
        $nav = \data\handling::GetNav();
        $outp = '';
        foreach ($nav as $item) {
            $outp .= '<a href="#'.$item['url'].'">'.$item['title'].'</a>';
        }
        return $outp;
    }
    static function PageTemplate($data) {
        $outp = '<div id="'.$data['url'].'-content" class="container">';
        if ($data['url'] === 'home') {
            $outp .= $data['html'];
        } else {
            
            $data['html'] = preg_replace_callback('/{_([a-zA-Z0-9\/_]*)_}/', '\data\layout::CodeReplacer', $data['html']);
            
            $outp .= '<div class="breaker" id="'.$data['url'].'-breaker">
                <h1>'.$data['title'].'</h1>
            </div>
            <div class="content">
                '.$data['html'].'
            </div>';
        }
        $outp .= '<div class="clear"></div></div>';
        return $outp;
    }
    static function BuildSection($page='') {
        $pages = \data\handling::GetPages($page);
        foreach ($pages as $content) {
            $output .= \data\layout::PageTemplate($content);
        }
        return $output;
    }
    static function CodeReplacer($code) {
        if (file_exists('../lib/templates/'.$code[1].'.php')) {
            require_once '../lib/templates/'.$code[1].'.php';
            return call_user_func('\templates\\'.$code[1].'::BuildOutput');
        }
    }
}
