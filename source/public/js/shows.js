$(function() {
    $("#shows-content a.load-more").click(function(ev) {
        ev.preventDefault();
        var offset = $(this).attr('offset'),
            tgt = $(this);
        $.ajax({
            "url": "/data.php",
            "type": "get",
            "dataType": "json",
            "data": {"type": "shows", "offset": offset},
            "success": function(i) {
                if (i.success) {
                    tgt.attr('offset', i.offset);
                    if (i.offset === 0) {
                        tgt.empty().remove();
                    } else {
                        if (i.left.length > 0) {
                            var xL = i.left.length;
                            for (var x=0;x<xL;x++) {
                                $("#shows-content .left-col .news-holder").append(i.left[x]);
                            }
                        }
                        if (i.right.length > 0) {
                            var xL = i.right.length;
                            for (var x=0;x<xL;x++) {
                                $("#shows-content .right-col .news-holder").append(i.right[x]);
                            }
                        }
                    }
                }
            }
        });
    });
});