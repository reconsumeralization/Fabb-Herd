<?php
$resp = '';
if (!is_null($common->getParam('submitted'))) {
    $resp = \admin\cattle::update();
}
$info = \admin\cattle::edit($params[0]);
?>
<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
<form action="/admin/cattle/edit/<?php echo $info->id; ?>" method="post" enctype="multipart/form-data">
    <h1>Edit Cattle</h1>
    <?php
    if (!empty($resp)) {
        echo '<h3>'.$resp.'</h3>';
    }
    ?>
    <h4>Name: <input type="text" name="name" value="<?php echo $info->name; ?>" /></h4>
    <h4>Date of Birth: <input type="text" name="dob" value="<?php echo $info->dob; ?>" /></h4>
    <h4>Category: <input type="text" name="category" value="<?php echo $info->category; ?>" /></h4>
    <h4>Section: <select name="section"><option value="herd-sires" <?php echo ($info->section === 'herd-sires') ? 'selected="selected"' : ''; ?>>Herd sires</option><option value="ai-sires" <?php echo ($info->section === 'ai-sires') ? 'selected="selected"' : ''; ?>>Ai sires</option><option value="females" <?php echo ($info->section === 'females') ? 'selected="selected"' : ''; ?>>Females</option><option value="for-sale" <?php echo ($info->section === 'for-sale') ? 'selected="selected"' : ''; ?>>For sale</option></select></h4>
    <h4>Height: <input type="text" name="height" value="<?php echo $info->height; ?>" /></h4>
    <h4>Description: <textarea name="description" class="description"><?php echo $info->description; ?></textarea></h4>
    <h4>Icon: <input type="file" name="icon" value="<?php echo $info->icon; ?>" /><?php echo (!empty($info->icon)) ? '<img src="'.$info->icon.'" width="100" height="100" />' : ''; ?></h4>
    <h4>Sire: <input type="text" name="sire" value="<?php echo $info->sire; ?>" /></h4>
    <h4>Dam: <input type="text" name="dam" value="<?php echo $info->dam; ?>" /></h4>
    <h4>Link: <input type="text" name="link" value="" /></h4>
    <h4>Images</h4>
    <ul class="image-list">
        <?php
        foreach ($info->images as $id=>$img) {
            $imgsrc = explode(':', $img);
            if ($imgsrc[0] === 'image') {
                $src = $imgsrc[1];
            } else if ($imgsrc[0] === 'video') {
                $src = $imgsrc[1].'.png';
            } else {
                $src = $imgsrc[0];
            }
            echo '<li style="width: 140px; height: 100px; background-image:url(\''.$src.'\'); background-size: cover; background-position: center; margin-bottom: 20px;"><input type="hidden" name="images[]" value="'.$img.'" /><img data-dz-thumbnail width="140" height="100" /><div class="remove"><span>✘ - remove</span></div></li>';
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
        selector: ".description",
        content_css: "/css/main.css"
    });
    var dropZone = new Dropzone('div#fileDrop', {
        maxFilesize: 1024,
        url: '/admin/upload',
        headers: {"folder": "cattle/gallery", "size": "1280x720", "thumb": "140x100"}
    });
    dropZone.on('success', function(file, filename) {
        if (file.status === 'success') {
            var json = $.parseJSON(filename)
            var clone = $(file.previewElement).clone();
            $(".dz-details img", clone).prop({'width':140, 'height': 100});
            var html = '<li style="width: 140px; height: 100px; background-image:url(\''+json['thumb']+'\'); background-size: cover; background-position: center; margin-bottom: 20px;"><input type="hidden" name="images[]" value="'+json['type']+':'+json['filename']+'" />'+$(".dz-details img", clone).prop('outerHTML')+'<div class="remove"><span>✘ - remove</span></div></li>';
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
            var con = confirm("Are you sure you wish to delete this cattle?");
            if (con) {
                $.ajax({
                    "url": "/admin/delete",
                    "type": "post",
                    "dataType": "json",
                    "data": {"submitted": true, "type": "cattle", "id": <?php echo $info->id; ?>},
                    "success": function(i) {
                        if (typeof i === 'object' && i.status) {
                            window.location.href = "/admin/cattle"
                        }
                    }
                });
            }
        });
    });
</script>