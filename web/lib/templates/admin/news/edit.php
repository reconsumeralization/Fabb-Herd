<?php
$resp = '';
if (!is_null($common->getParam('submitted'))) {
    $resp = \admin\news::update();
}
$info = \admin\news::edit($params[0]);
?>
<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
<form action="/admin/news/edit/<?php echo $info->id; ?>" method="post">
    <h1>Edit News Story</h1>
    <?php
    if (!empty($resp)) {
        echo '<h3>'.$resp.'</h3>';
    }
    ?>
    <h4>Title: <input type="text" name="title" value="<?php echo $info->title; ?>" /></h4>
    <h4>Date: <input type="text" name="date" value="<?php echo $info->date; ?>" /></h4>
    <h4>Description: <textarea name="description"><?php echo $info->description; ?></textarea></h4>
    <h4>Story:</h4>
    <textarea class="story" name="story" style="height: 400px;"><?php echo $info->story; ?></textarea>
    <h4>News Images</h4>
    <ul class="image-list">
        <?php
        foreach ($info->images as $id=>$img) {
            echo '<li><input type="hidden" name="images[]" value="'.$img.'" /><img data-dz-thumbnail alt="'.basename($img).'" width="100" height="100" src="'.$img.'" /><div class="remove"><span>✘ - remove</span></div></li>';
        }
        ?>
    </ul>
    <div id="fileDrop">
        Drop files here:
    </div>
    <input type="hidden" name="id" value="<?php echo $info->id; ?>" />
    <input type="hidden" name="submitted" value="TRUE" />
    <input type="submit" name="save" value="Save" />
    <input type="reset" name="restore" value="Reset Changes" />
    <input type="button" name="delete" value="Delete" />
</form>
<script type="text/javascript">
    tinymce.init({
        selector: ".story",
        toolbar: "undo redo | styleselect | bold italic | link image",
        plugins: "link",
        content_css: "/css/main.css"
    });
    var dropZone = new Dropzone('div#fileDrop', {
        url: '/admin/upload',
        headers: {"folder": "news"}
    });
    dropZone.on('success', function(file, filename) {
        if (file.status === 'success') {
            var clone = $(file.previewElement).clone();
            var html = '<li><input type="hidden" name="images[]" value="'+filename+'" />'+$(".dz-details img", clone).prop('outerHTML')+'<div class="remove"><span>✘ - remove</span></div></li>';
            $(".image-list").append(html);
            setTimeout(function() {
                $(file.previewElement).empty().remove();
            }, 1000);
        }
    });
    $(".image-list").on('click', 'div.remove', function() {
        $(this).parent().empty().remove();
    });
    $(function() {
        $("input[name='delete']").click(function() {
            var con = confirm("Are you sure you wish to delete this news item?");
            if (con) {
                $.ajax({
                    "url": "/admin/delete",
                    "type": "post",
                    "dataType": "json",
                    "data": {"submitted": true, "type": "news", "id": <?php echo $info->id; ?>},
                    "success": function(i) {
                        if (typeof i === 'object' && i.status) {
                            window.location.href = "/admin/news"
                        }
                    }
                });
            }
        });
    });
</script>