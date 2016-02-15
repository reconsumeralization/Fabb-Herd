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
    <h4>Section: <select name="section"><option value="herd-sires" <?php echo ($info->section === 'herd-sires') ? 'selected="selected"' : ''; ?>>Herd sires</option><option value="ai-sires" <?php echo ($info->section === 'ai-sires') ? 'selected="selected"' : ''; ?>>Ai sires</option><option value="females" <?php echo ($info->section === 'females') ? 'selected="selected"' : ''; ?>>Females</option></select></h4>
    <h4>Height: <input type="text" name="height" value="<?php echo $info->height; ?>" /></h4>
    <h4>Description: <textarea name="description" class="description"><?php echo $info->description; ?></textarea></h4>
    <h4>Icon: <input type="file" name="icon" value="<?php echo $info->icon; ?>" /><?php echo (!empty($info->icon)) ? '<img src="'.$info->icon.'" width="100" height="100" />' : ''; ?></h4>
    <h4>Sire: <input type="text" name="sire" value="<?php echo $info->sire; ?>" /></h4>
    <h4>Dam: <input type="text" name="dam" value="<?php echo $info->dam; ?>" /></h4>
    <sub>Video example link: <?php echo htmlentities('<iframe width="420" height="315" src="//www.youtube.com/embed/ARqOIqJ9kbo?rel=0&start=27&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>'); ?></sub>
    <h4>Video: <textarea name="video"><?php echo $info->video; ?></textarea></h4>
    <h4>Link: <input type="text" name="link" value="" /></h4>
    <h4>Images</h4>
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
</form>
<script type="text/javascript">
    tinymce.init({
        selector: ".description",
        content_css: "/css/main.css"
    });
    var dropZone = new Dropzone('div#fileDrop', {
        url: '/admin/upload',
        headers: {"folder": "cattle/gallery"}
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
</script>