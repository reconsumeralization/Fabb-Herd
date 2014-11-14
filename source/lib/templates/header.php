<!DOCTYPE html>
<html>
    <head>
        <title>The FABB Herd</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/css/main.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="/js/functions.js"></script>
    </head>
    <body>
        <div class="is-mobile"></div>
        <div id="header" class="fixed">
            <div class="container">
                <?php
                echo \data\layout::StaticNav();
                ?>
                <div id="small-logo"><img src="/img/small-logo.png" alt="The Fabb Herd" width="100%" /></div>
            </div>
        </div>
        <?php
        echo \data\layout::BuildSection();
        ?>