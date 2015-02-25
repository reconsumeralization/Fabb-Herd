<?php
$resp = '';
if (!is_null($common->getParam('submitted'))) {
    $resp = \admin\show::update();
}
$info = \admin\show::edit($params[0]);
?>
<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
    tinymce.init({
        selector: ".html",
        content_css: "/css/main.css"
    });
</script>
<form action="/admin/show/edit/<?php echo $info->id; ?>" method="post">
    <h1>Edit Show</h1>
    <?php
    if (!empty($resp)) {
        echo '<h3>'.$resp.'</h3>';
    }
    ?>
    <h4>Show Title: <input type="text" name="title" value="<?php echo $info->title; ?>" /></h4>
    <h4>Show Date: <input type="text" name="date" value="<?php echo $info->date; ?>" /></h4>
    <h4>Show Description:</h4>
    <textarea class="html" name="description"><?php echo $info->description; ?></textarea>
    <input type="hidden" name="id" value="<?php echo $info->id; ?>" />
    <input type="hidden" name="submitted" value="TRUE" />
    <input type="submit" name="save" value="Save" />
    <input type="reset" name="restore" value="Reset Changes" />
</form>