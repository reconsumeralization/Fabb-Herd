<?php
$resp = '';
if (!is_null($common->getParam('submitted'))) {
    $resp = \admin\page::update();
}
$info = \admin\page::edit($params[0]);
?>
<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
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
            var con = confirm("Are you sure you wish to delete this page?");
            if (con) {
                $.ajax({
                    "url": "/admin/delete",
                    "type": "post",
                    "dataType": "json",
                    "data": {"submitted": true, "type": "page", "id": <?php echo $info->id; ?>},
                    "success": function(i) {
                        if (typeof i === 'object' && i.status) {
                            window.location.href = "/admin/page"
                        }
                    }
                });
            }
        });
    });
</script>
<form action="/admin/page/edit/<?php echo $info->id; ?>" method="post" enctype="multipart/form-data">
    <h1>Edit Page</h1>
    <?php
    if (!empty($resp)) {
        echo '<h3>'.$resp.'</h3>';
    }
    ?>
    <h4>Page Title: <input type="text" name="page_title" value="<?php echo $info->page_title; ?>" /></h4>
    <h4>Navigation Title: <input type="text" name="title" value="<?php echo $info->title; ?>" /></h4>
    <h4>Page URL: <input type="text" name="url" value="<?php echo $info->url; ?>" /></h4>
    <h4>Heading Image: <input type="file" name="header" value="<?php echo $info->header; ?>" /><?php echo (!empty($info->header)) ? '<input type="hidden" name="old_header" value="'.$info->header.'" /><img src="'.$info->header.'" width="100" />' : ''; ?></h4>
    <h4>Page Description:</h4>
    <textarea name="description" style="height: 100px;"><?php echo $info->description; ?></textarea>
    <h4>Page Content:</h4>
    <textarea class="html" name="html" style="height: 800px;"><?php echo htmlentities($info->html); ?></textarea>
    <input type="hidden" name="id" value="<?php echo $info->id; ?>" />
    <input type="hidden" name="submitted" value="TRUE" />
    <input type="submit" name="save" value="Save" />
    <input type="reset" name="restore" value="Reset Changes" />
    <input type="button" name="delete" value="Delete Page" />
</form>