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
$opts['xhr'] = true;
class delete {
    static function run() {
        global $common;
        $ret = '';
        if (!is_null($common->getParam('submitted'))) {
            switch ($common->getParam('type')) {
                case "page":
                    $ret = ["status"=>\admin\delete::del_page($common->getParam('id'))];
                    break;
                case "show":
                    $ret = ["status"=>\admin\delete::del_show($common->getParam('id'))];
                    break;
                case "cattle":
                    $ret = ["status"=>\admin\delete::del_cattle($common->getParam('id'))];
                    break;
                case "news":
                    $ret = ["status"=>\admin\delete::del_news($common->getParam('id'))];
                    break;
                case "post":
                    $ret = ["status"=>self::del_post($common->getParam('id'))];
                    break;
            }
        }
        return $ret;
    }
    private static function del_page($id) {
        // delete the provided page \\
        $data = [
            "tbl_pages"=>[
                "id"=>$id
            ]
        ];
        return \data\collection::buildQuery("DELETE", $data);
    }
    private static function del_show($id) {
        // delete the provided show \\
        $data = [
            "tbl_shows"=>[
                "id"=>$id
            ]
        ];
        return \data\collection::buildQuery("DELETE", $data);
    }
    private static function del_cattle($id) {
        // delete the provided cattle \\
        $data = [
            "tbl_cattle"=>[
                "id"=>$id
            ],
            "tbl_cattle_photos"=>[
                "cattle_id"=>$id
            ]
        ];
        return \data\collection::buildQuery("DELETE", $data);
    }
    private static function del_news($id) {
        // delete the provided news \\
        $data = [
            "tbl_news"=>[
                "id"=>$id
            ],
            "tbl_news_photos"=>[
                "news_id"=>$id
            ]
        ];
        return \data\collection::buildQuery("DELETE", $data);
    }
    private static function del_post($id) {
        // delete the provided post \\
        $data = [
            "tbl_posts"=>[
                "id"=>$id
            ]
        ];
        return \data\collection::buildQuery("DELETE", $data);
    }
}
