<?php
if (!isset($blog) || !$blog) {
    $section = \data\layout::BuildSection($page);
} else {
    require_once 'posts.php';
    $section = \templates\posts::BlogPost($page);
}
if (empty($section)) {
    $notfound = \data\layout::PageNotFound();
    $section = ['title'=> 'Whoops! Page Not Found'];
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title><?php echo (isset($section['page_title'])) ? $section['page_title'] : $section['title']; ?></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="<?php echo (isset($section['description'])) ? $section['description'] : ''; ?>">
        <link href="/css/main.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="/js/functions.js"></script>
        <script type="text/javascript" src="/js/twitterFetcher_min.js"></script>
        <?php
        $rootDir = strstr($common->getParam('DOCUMENT_ROOT', 'server'), 'public_html', true);
        if ($rootDir === false) {
            $rootDir = $common->getParam('DOCUMENT_ROOT', 'server');
        }
        if (file_exists($rootDir.DIRECTORY_SEPARATOR.'public_html'.DIRECTORY_SEPARATOR.'js'.DIRECTORY_SEPARATOR.$page[0].'.js')) {
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
                <a href="#menu" class="nav mobile-menu"><span>MENU</span></a>
                <a class="facebook" href="https://www.facebook.com/pages/The-Fabb-Herd/584492104929231" target="_blank"><img src="/img/Facebook-icon.png" alt="Facebook" width="100%" /></a>
                <a class="facebook" href="https://twitter.com/fabbherd" target="_blank"><img src="/img/twitter-icon.png" width="100%" /></a>
                <div class="menu">
                <?php
                echo \data\layout::StaticNav();
                ?>
                </div>
            </div>
            <div id="small-logo"><?php echo ($section['title'] !== 'Home') ? '<a class="home" href="/"><img src="/img/logo-web.png" alt="The Fabb Herd" width="100%" /></a>' : ''; ?></div>
        </div>
        <?php
        if (isset($notfound)) {
            ?>
        <div class="hero notfound">
            <img src="/img/home-bg.jpg" alt="Page Not Found" />
            <h1>Whoops! (404) We can&apos;t find the page you were looking for.</h1>
        </div>
        <?php
        } else {
            echo \data\layout::PageTemplate($section);
        }