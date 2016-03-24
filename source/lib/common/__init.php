<?php

/*
 * Dettol / Lysol - 2013
 */

/**
 * The class for all common functions
 *
 * @author Richard
 */
class common {
    protected $self = array();
    var $isPage = true;
    public function __get($name = null) {
        return $this->self[$name];
    }
    public function __set($name, $value) {
        $this->self[$name] = $value;
    }
    public function curlRequest($url) {
        // create curl resource
        $ch = curl_init();

        // set url
        curl_setopt($ch, CURLOPT_URL, $url);

        //return the transfer as a string
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        // $output contains the output string
        $output = curl_exec($ch);

        // close curl resource to free up system resources
        curl_close($ch);

        return $output;
    }
    
    public function curlPOSTRequest($url, $data, $type='pairs') {
        set_time_limit(60);
        $output = array();
        $curlSession = curl_init();
        curl_setopt($curlSession, CURLOPT_URL, $url);
        curl_setopt($curlSession, CURLOPT_HEADER, 0);
        curl_setopt($curlSession, CURLOPT_POST, 1);
        curl_setopt($curlSession, CURLOPT_POSTFIELDS, http_build_query($data));
        
        curl_setopt($curlSession, CURLOPT_RETURNTRANSFER,1); 
        curl_setopt($curlSession, CURLOPT_TIMEOUT,30); 

        curl_setopt($curlSession, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curlSession, CURLOPT_SSL_VERIFYHOST, 1);

        $rawresponse = curl_exec($curlSession);
        if (verbose) {
            $info = curl_getinfo($curlSession);
            print_r($info);
        }
        switch ($type) {
            case 'json':
                $output = new stdClass();
                $output->status = "Success";
                if (curl_error($curlSession)){
                    $output->status = "Error";
                    $output->statusMsg = curl_error($curlSession);
                } else {
                    $output = json_decode($rawresponse);
                    if (!is_object($output)) {
                        $output = new stdClass();
                    }
                    $output->buildQuery = http_build_query($data);
                }
                break;
            case 'pairs':
                //Split response into name=value pairs
                $response = explode(' ', $rawresponse);
                // Check that a connection was made
                if (curl_error($curlSession)){
                    // If it wasn't...
                    $output['Status'] = "FAIL";
                    $output['StatusDetail'] = curl_error($curlSession);
                }

                // Tokenise the response
                for ($i=0; $i<count($response); $i++){
                    // Find position of first "=" character
                    $splitAt = strpos($response[$i], "=");
                    // Create an associative (hash) array with key/value pairs ('trim' strips excess whitespace)
                    $output[trim(substr($response[$i], 0, $splitAt))] = trim(substr($response[$i], ($splitAt+1)));
                }
                break;
            default:
                $output = $rawresponse;
                break;
        }

        // Close the cURL session
        curl_close ($curlSession);


        // Return the output
        return $output;
    }
    
    public function curlGETRequest($url, $data, $type='json') {
        set_time_limit(60);
        $output = array();
        $curlSession = curl_init();
        $query = http_build_query($data);
        curl_setopt($curlSession, CURLOPT_URL, $url.'?'.$query);
        curl_setopt($curlSession, CURLOPT_HEADER, 0);
        curl_setopt($curlSession, CURLOPT_RETURNTRANSFER,1); 
        curl_setopt($curlSession, CURLOPT_TIMEOUT,30); 

        curl_setopt($curlSession, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curlSession, CURLOPT_SSL_VERIFYHOST, 1);

        $rawresponse = curl_exec($curlSession);
        
        $info = curl_getinfo($curlSession);
        if (verbose) {
            print_r($info);
            print_r($rawresponse);
        }
        switch ($type) {
            case 'json':
                $output = new stdClass();
                $output->status = "Success";
                if (curl_error($curlSession)){
                    $output->status = "Error";
                    $output->statusMsg = curl_error($curlSession);
                } else {
                    $output = json_decode($rawresponse);
                }
                break;
            case 'pairs':
                //Split response into name=value pairs
                $response = explode(' ', $rawresponse);
                // Check that a connection was made
                if (curl_error($curlSession)){
                    // If it wasn't...
                    $output['Status'] = "FAIL";
                    $output['StatusDetail'] = curl_error($curlSession);
                }

                // Tokenise the response
                for ($i=0; $i<count($response); $i++){
                    // Find position of first "=" character
                    $splitAt = strpos($response[$i], "=");
                    // Create an associative (hash) array with key/value pairs ('trim' strips excess whitespace)
                    $output[trim(substr($response[$i], 0, $splitAt))] = trim(substr($response[$i], ($splitAt+1)));
                }
                break;
            default:
                $output = $rawresponse;
                break;
        }

        // Close the cURL session
        curl_close ($curlSession);


        // Return the output
        return $output;
    }

    /**
    * function: escape_data
    * description: make all values safe before adding to database
    * values {
    *	data: string
    * }
    */

    public function escape_data ($data) {
        global $db;
        if (is_string($data)) {
            if (ini_get('magic_quotes_gpc')) {
                $data = stripslashes($data);
            }
            if (function_exists('mysqli_real_escape_string') && $db->dbc !== false) {
                $data = @mysqli_real_escape_string ($db->dbc, trim($data));
            } else {
                $data = @mysqli_escape_string ($db->dbc, trim($data));
            }
        }
        return $data;
    }

    /**
     * function: shorten
     * description: shorten a string (given) to the length provided
     * values {
     *       str: string
     *       len: int
     * }
     */
    public function shorten($string, $your_desired_width) {
        $parts = preg_split('/([\s\n\r]+)/', $string, null, PREG_SPLIT_DELIM_CAPTURE);
        $parts_count = count($parts);

        $length = 0;
        $last_part = 0;
        $shorten = false;
        for (; $last_part < $parts_count; ++$last_part) {
            $length += strlen($parts[$last_part]);
            if ($length > $your_desired_width) { $shorten = true;break; }
        }
        return implode(array_slice($parts, 0, $last_part)).(($shorten) ? '...' : '');
    }

    public function getAllParam($type='post') {
        switch (strtolower($type)) {
            case 'get':
                $type = $_GET;
            break;
            case 'cookie':
                $type = $_COOKIE;
            break;
            case 'server':
                $type = $_SERVER;
            break;
            case 'file':
                $type = $_FILES;
            break;
            case 'request':
                $type = $_REQUEST;
            break;
            default:
                $type = $_POST;
            break;
        }
        return $type;
    }

    public function getParam($name, $type='post', $default=NULL, $escape=true) {
        switch (strtolower($type)) {
            case 'get':
                $type = $_GET;
            break;
            case 'cookie':
                $type = $_COOKIE;
            break;
            case 'server':
                $type = $_SERVER;
            break;
            case 'file':
                $type = $_FILES;
            break;
            case 'request':
                $type = $_REQUEST;
            break;
            default:
                $type = $_POST;
            break;	
        }
        if (isset($type[$name])) {
            if ($escape) {
                return $this->escape_data($type[$name]);
            } else {
                return $type[$name];
            }
        } else {
            return $default;
        }
    }
    public function array_slice_assoc ($array, $key, $length, $preserve_keys = true) {
        $offset = array_search($key, array_keys($array));
        if (is_string($length)) {
            $length = array_search($length, array_keys($array)) - $offset;
        }
        return array_slice($array, $offset, $length, $preserve_keys);
    }
    public function getTblData($tbl, $order='') {
        global $db;
        if (!is_null($tbl)) {
            $data = $db->dbResult($db->dbQuery("SELECT * FROM $tbl $order"));
            if ($data[1] > 0) {
                return $data[0];
            }
        }
        return array();
    }
    public function reindex(array $source) {
        $i = 0;
        foreach ($source as $key => $val) {
            if ($key != $i) {
                unset($source[$key]);
                $source[$i] = $val;
            }
            $i++;
        }
        return $source;
    }
    public function bytesToSize($bytes, $precision = 2) {
        $kilobyte = 1024;
        $megabyte = $kilobyte * 1024;
        $gigabyte = $megabyte * 1024;
        $terabyte = $gigabyte * 1024;

        if (($bytes >= 0) && ($bytes < $kilobyte)) {
            return $bytes . ' B';

        } elseif (($bytes >= $kilobyte) && ($bytes < $megabyte)) {
            return round($bytes / $kilobyte, $precision) . ' KB';

        } elseif (($bytes >= $megabyte) && ($bytes < $gigabyte)) {
            return round($bytes / $megabyte, $precision) . ' MB';

        } elseif (($bytes >= $gigabyte) && ($bytes < $terabyte)) {
            return round($bytes / $gigabyte, $precision) . ' GB';

        } elseif ($bytes >= $terabyte) {
            return round($bytes / $terabyte, $precision) . ' TB';
        } else {
            return $bytes . ' B';
        }
    }
    public function array_merge_recursive_new() {

        $arrays = func_get_args();
        $base = array_shift($arrays);

        foreach ($arrays as $array) {
            reset($base); //important
            while (list($key, $value) = @each($array)) {
                if (is_array($value) && @is_array($base[$key])) {
                    $base[$key] = $this->array_merge_recursive_new($base[$key], $value);
                } else {
                    $base[$key] = $value;
                }
            }
        }

        return $base;
    }
    public function array_search_sub($array, $key, $value) {
        foreach ($array as $subArray) {
            if (isset($subArray[$key]) && $subArray[$key] == $value) {
                return TRUE;
            }
        }
        return FALSE;
    }
    public function setReporting() {
        global $logging;
        ini_set('log_errors', 'On');
        ini_set('error_log', ROOT.'/tmp/logs/error.log');
        if (debug) {
            error_reporting(E_ALL);
            ini_set('display_errors', 'On');
            set_error_handler(array(&$logging, debug.'Handler'));
        } else {
            error_reporting(E_ALL);
            ini_set('display_errors', 'Off');
        }
    }
    public function logData($file='', $data=array(), $mode='develop') {
        if (debug == $mode) {
            $fh = fopen(ROOT .'/tmp/logs/'.$file, 'w');
            if ($fh) {
                fwrite($fh, print_r($data, true));
                fclose($fh);
            }
        }
    }
    public function stripSlashesDeep($value) {
        $value = is_array($value) ? array_map(array('common', 'stripSlashesDeep'), $value) : stripslashes($value);
        return $value;
    }
 
    public function removeMagicQuotes() {
        if (get_magic_quotes_gpc()) {
            $_GET = stripSlashesDeep($_GET);
            $_POST = stripSlashesDeep($_POST);
            $_COOKIE = stripSlashesDeep($_COOKIE);
        }
    }
    function unregisterGlobals() {
        if (ini_get('register_globals')) {
            $array = array('_SESSION', '_POST', '_GET', '_COOKIE', '_REQUEST', '_SERVER', '_ENV', '_FILES');
            foreach ($array as $value) {
                foreach ($GLOBALS[$value] as $key => $var) {
                    if ($var === $GLOBALS[$key]) {
                        unset($GLOBALS[$key]);
                    }
                }
            }
        }
    }
    public function numbers($num, $caps = false) {
        $nums = array('zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty', 'twenty one', 'twenty two', 'twenty three', 'twenty four', 'twenty five', 'twenty six', 'twenty seven', 'twenty eight', 'twenty nine', 'thirty');
        if ($num) {
            return ($caps) ? ucfirst($nums[$num]) : $nums[$num];
        }
        return '';
    }
    public function arrayToInt(&$val) {
        $val = intval($val);
    }
    public function safeFilename($filename) {
        $filename = str_replace("#","_",$filename);
        $filename = str_replace(" ","_",$filename);
        $filename = str_replace("'","",$filename);
        $filename = str_replace('"',"",$filename);
        $filename = str_replace("__","_",$filename);
        $filename = str_replace("&","and",$filename);
        $filename = str_replace("/","_",$filename);
        $filename = str_replace("\\", "_",$filename);
        $filename = str_replace("?","",$filename);
        return $filename;
    }
    public function fuzzyTimeElapsed($time)
    {
        $etime = time() - $time;
        $time = 'Just now';
        if ($etime < 0) {
            $time = 'In '.$time.' seconds';
        } else if ($etime < 60) {
            $time = 'A few moments ago';
        } else if ($etime < 60 * 5) {
            $time = 'a few minutes ago';
        } else if ($etime < 60 * 10) {
            $time = 'about 10 minutes ago';
        } else if ($etime < (60 * 60)) {
            $time = 'about an hour ago';
        } else if ($etime < (60 * 60 * 24)) {
            $time = 'about a day ago';
        } else if ($etime < (60 * 60 * 24 * 5)) {
            $time = 'a few days ago';
        } else if ($etime < (60 * 60 * 24 * 7)) {
            $time = 'about a week ago';
        } else if ($etime < (60 * 60 * 24 * 16)) {
            $time = 'a couple of weeks ago';
        } else if ($etime < (60 * 60 * 24 * 25)) {
            $time = 'a few weeks ago';
        } else if ($etime < (60 * 60 * 24 * 40)) {
            $time = 'about a month ago';
        } else if ($etime < (60 * 60 * 24 * 70)) {
            $time = 'a couple of months ago';
        } else if ($etime < (60 * 60 * 24 * 120)) {
            $time = 'a few months ago';
        } else if ($etime < (60 * 60 * 24 * 240)) {
            $time = 'about 6 months ago';
        } else if ($etime < (60 * 60 * 24 * 500)) {
            $time = 'a year ago';
        } else {
            $time = 'a few years ago';
        }
        return $time;
    }
    public function dateCalc($date, $format='auto')
    {
        $dateObj = \DateTime::createFromFormat('Y-m-d', $date);
        if ($format === 'auto') {
            $today = new \DateTime();
            $diff = $dateObj->diff($today);
            $dateStr = $dateObj->format('jS M y');
            if ($diff->d < 1 && $diff->m < 1 && $diff->y < 1) {
                $format = 'Today';
            } else if ($diff->d < 3 && $diff->m < 1 && $diff->y < 1) {
                $dateStr = 'Yesterday';
            } else if ($diff->d < 7 && $diff->m < 1 && $diff->y < 1) {
                $dateStr = $dateObj->format('l');
            } else if ($diff->y < 1) {
                $dateStr = $dateObj->format('jS M');
            }
        } else {
            $dateStr = $dateObj->format($format);
        }
        return $dateStr;
    }
    public function GetFacebook()
    {
        global $common;
        $fb = new \Facebook\Facebook([
            'app_id' => '256694271333014',
            'app_secret' => '999ea9a56111536821327a4c7f56669f',
            'default_graph_version' => 'v2.5',
            'default_access_token' => '256694271333014|999ea9a56111536821327a4c7f56669f', // optional
        ]);

        // Use one of the helper classes to get a Facebook\Authentication\AccessToken entity.
        //   $helper = $fb->getRedirectLoginHelper();
        //   $helper = $fb->getJavaScriptHelper();
        //   $helper = $fb->getCanvasHelper();
        //   $helper = $fb->getPageTabHelper();

        try {
            // Get the Facebook\GraphNodes\GraphUser object for the current user.
            // If you provided a 'default_access_token', the '{access-token}' is optional.
            $response = $fb->get('/584492104929231/feed?limit=8');
        } catch(\Facebook\Exceptions\FacebookResponseException $e) {
            // When Graph returns an error
            var_dump($e);
            return false;
        } catch(\Facebook\Exceptions\FacebookSDKException $e) {
            // When validation fails or other local issues
            return false;
        }
        $feeds = $response->getDecodedBody();
        if (count($feeds['data']) > 0) {
            foreach ($feeds['data'] as &$post) {
                $object = $fb->get('/'.$post['id'].'?fields=object_id');
                $photoID = $object->getDecodedBody();
                if (isset($photoID['object_id'])) {
                    $post['image'] = 'https://graph.facebook.com/'.$photoID['object_id'].'/picture';
                    $post['image_id'] = $photoID['object_id'];
                }
                if (isset($post['message'])) {
                    $post['description'] = str_replace("\n", '<br />', $common->shorten($post['message'], 100));
                    $post['message'] = str_replace("\n", '<br />', $post['message']);
                }
                $post['created_time'] = $common->fuzzyTimeElapsed(strtotime($post['created_time']));
            }
        }
        return $feeds['data'];
    }
}
