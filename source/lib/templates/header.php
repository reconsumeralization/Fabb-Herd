<!DOCTYPE html>
<html>
    <head>
        <title>The FABB Herd</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/css/main.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="/js/functions.js"></script>
        <?php
        $rootDir = strstr($common->getParam('DOCUMENT_ROOT', 'server'), 'public', true);
        if ($rootDir === false) {
            $rootDir = $common->getParam('DOCUMENT_ROOT', 'server');
        }
        if (file_exists($rootDir.DIRECTORY_SEPARATOR.'public'.DIRECTORY_SEPARATOR.'js'.DIRECTORY_SEPARATOR.$page[0].'.js')) {
            ?>
        <script type="text/javascript" src="/js/<?php echo $page[0]; ?>.js"></script>
        <?php
        }
        ?>
    </head>
    <body>
        <div class="is-mobile"></div>
        <div id="header">
            <div class="container">
                <a href="#menu" class="mobile-menu"><span>MENU</span></a>
                <a class="facebook" href="https://www.facebook.com/pages/The-Fabb-Herd/584492104929231" target="_blank"><img src="/img/Facebook-icon.png" alt="Facebook" width="100%" /></a>
                <a class="facebook" href="https://twitter.com/fabbherd" target="_blank"><img src="/img/twitter-icon.png" width="100%" /></a>
                <div class="menu">
                <?php
                echo \data\layout::StaticNav();
                ?>
                </div>
            </div>
            <div id="small-logo"><img src="/img/small-logo.png" alt="The Fabb Herd" width="100%" /></div>
        </div>
        <?php
        echo \data\layout::BuildSection($page[0]);