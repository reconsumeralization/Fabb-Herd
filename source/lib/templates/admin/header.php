<!DOCTYPE html>
<html>
    <head>
        <title>The FABB Herd</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/css/admin.css" type="text/css" rel="stylesheet" />
        <link href="/css/main.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="/js/dropzone/dropzone.js"></script>
        <script type="text/javascript" src="/js/admin.functions.js"></script>
    </head>
    <body>
        <div id="header" class="fixed">
            <div class="container">
                <?php
                if (\data\auth::logged_in()) {
                ?>
                <a href="/admin/page">Pages</a>
                <a href="/admin/news">News</a>
                <a href="/admin/cattle">Cattle</a>
                <a href="/admin/show">Shows</a>
                <?php
                }
                ?>
                <div id="small-logo"><img src="/img/small-logo.png" alt="The Fabb Herd" width="100%" /></div>
            </div>
        </div>
        <div class="content" id="content">