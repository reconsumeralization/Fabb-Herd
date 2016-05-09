<?php
$resp = '';
if (!is_null($common->getParam('submitted'))) {
    $resp = \admin\posts::update();
}
$info = \admin\posts::edit($params[0]);
?>
<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
<form action="/admin/posts/edit/<?php echo $info->id; ?>" method="post">
    <h1>Edit Blog Post</h1>
    <?php
    if (!empty($resp)) {
        echo '<h3>'.$resp.'</h3>';
    }
    ?>
    <h4>Title: <input type="text" name="title" value="<?php echo $info->title; ?>" /></h4>
    <h4>Meta Title: <input type="text" name="page_title" value="<?php echo $info->page_title; ?>" /></h4>
    <h4>URL: <input type="text" name="url" value="<?php echo $info->url; ?>" /></h4>
    <h4>Date: <input type="text" name="date" value="<?php echo $info->date; ?>" /></h4>
    <h4>Description: <textarea name="description"><?php echo $info->description; ?></textarea></h4>
    <h4>HTML:</h4>
    <textarea class="html" name="html" style="height: 800px;"><?php echo $info->html; ?></textarea>
    <input type="hidden" name="id" value="<?php echo $info->id; ?>" />
    <input type="hidden" name="submitted" value="TRUE" />
    <input type="submit" name="save" value="Save" />
    <input type="reset" name="restore" value="Reset Changes" />
    <input type="button" name="delete" value="Delete" />
</form>
<script type="text/javascript">
    tinymce.init({
        selector: ".html",
        content_css: "/css/main.css",
        body_class: "container",
        body_id: "<?php echo ($info->url !== 'home') ? 'new' : $info->url; ?>-content",
        plugins: [
            "advlist autolink link image lists charmap print preview hr anchor pagebreak",
            "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
            "table contextmenu directionality emoticons paste textcolor responsivefilemanager"
        ],
        toolbar1: "undo redo | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | styleselect",
        toolbar2: "| responsivefilemanager | link unlink anchor | image media | forecolor backcolor  | print preview code ",
        image_advtab: true,
        external_filemanager_path:"/js/filemanager/",
        filemanager_title:"Filemanager" ,
        external_plugins: { "filemanager" : "/js/filemanager/plugin.min.js"}
    });
    $(function() {
        $("input[name='delete']").click(function() {
            var con = confirm("Are you sure you wish to delete this blog post?");
            if (con) {
                $.ajax({
                    "url": "/admin/delete",
                    "type": "post",
                    "dataType": "json",
                    "data": {"submitted": true, "type": "post", "id": <?php echo $info->id; ?>},
                    "success": function(i) {
                        if (typeof i === 'object' && i.status) {
                            window.location.href = "/admin/posts"
                        }
                    }
                });
            }
        });
    });
</script>