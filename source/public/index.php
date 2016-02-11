<?php
require_once '../lib/config.php';

\data\layout::BuildPage(explode('/', $common->getParam('url', 'get')));