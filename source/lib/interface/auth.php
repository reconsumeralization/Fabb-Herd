<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of auth
 *
 * @author richard
 */
namespace data;
class auth {
    static function login() {
        global $common, $session;
        $user = $common->getParam('username');
        $pass = $common->getParam('password');
        $err = array();
        $cont = true;
        $tbl = array("u"=>"tbl_users");
        $cols = array(
            "u"=>array("id", "name", "username", "name", "last_action")
        );
        $cond = array(
            "u"=>array(
                "join"=>"AND",
                array(
                    "col"=>"username",
                    "operand"=>"=",
                    "value"=>"'$user'"
                ),
                array(
                    "col"=>"password",
                    "operand"=>"=",
                    "value"=>"md5('$pass')"
                )
            )
        );
        if (is_null($user)) {
            $err[] = 'Username is required';
            $cont = false;
        }
        if (is_null($pass)) {
            $err[] = 'Password is required';
            $cont = false;
        }
        if ($cont) {
            $data = \data\collection::buildQuery("SELECT", $tbl, array(), $cols, $cond);
            if ($data[1] > 0) {
                foreach ($data[0][0] as $key=>$val) {
                    $session->addVar($key, $val);
                }
                header("Location: /admin");
                exit();
            } else {
                $err[] = 'Your details could not be found';
            }
        }
        return $err;
    }
    static function logout() {
        
    }
    static function cur_user() {
        global $session;
        if (is_null($session->getVar('id'))) {
            return false;
        }
        $user = array(
            "id"=>$session->getVar('id'),
            "name"=>$session->getVar('name'),
            "last_action"=>$session->getVar('last_action'),
            "last_action_time"=>$session->getVar('last_action_time')
        );
        return $user;
    }
    static function logged_in() {
        global $session;
        if (is_null($session->getVar('id'))) {
            return false;
        }
        return true;
    }
}