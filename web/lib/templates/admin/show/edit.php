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
        content_css: "/css/main.css",
        plugins: [
            "advlist autolink link image lists charmap print preview hr anchor pagebreak",
            "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
            "table contextmenu directionality emoticons paste textcolor responsivefilemanager"
        ],
        toolbar1: "undo redo | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | styleselect",
        toolbar2: "| responsivefilemanager | link unlink anchor | image media | forecolor backcolor  | print preview code "
    });
    $(function() {
        $("input[name='delete']").click(function() {
            var con = confirm("Are you sure you wish to delete this cattle?");
            if (con) {
                $.ajax({
                    "url": "/admin/delete",
                    "type": "post",
                    "dataType": "json",
                    "data": {"submitted": true, "type": "show", "id": <?php echo $info->id; ?>},
                    "success": function(i) {
                        if (typeof i === 'object' && i.status) {
                            window.location.href = "/admin/show"
                        }
                    }
                });
            }
        });
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
    <input type="button" name="delete" value="Delete" />
</form>