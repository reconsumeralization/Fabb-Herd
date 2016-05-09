$(document).ready(function() {
    $(".page_list li, .news_list li").click(function() {
        if ($('.html_preview', this).hasClass('visible')) {
            $('.html_preview', this).removeClass('visible');
        } else {
            $('.html_preview', this).addClass('visible');
        }
    });
    $(".page_list [id^='new']").click(function() {
        window.location = '/admin/page/edit/-1';
    });
    $(".news_list [id^='new']").click(function() {
        window.location = '/admin/news/edit/-1';
    });
    $(".cattle_list [id^='new']").click(function() {
        window.location = '/admin/cattle/edit/-1';
    });
    $(".show_list [id^='new']").click(function() {
        window.location = '/admin/show/edit/-1';
    });
    $(".posts_list [id^='new']").click(function() {
        window.location = '/admin/posts/edit/-1';
    });
    $(".delete").click(function() {
        var id = $(this).data('id'),
            type = $(this).parent().parent().parent().prop('class').split('_list')[0],
            tgt = $(this).parent().parent();
        if (id) {
            if (confirm('Are you sure you want to delete this item?')) {
                $.ajax({
                    'url': '/admin/delete',
                    'type': 'post',
                    'dataType': 'json',
                    'data': {'submitted': true, 'type': type, 'id': id},
                    'success': function(i) {
                        if (typeof i.status !== 'undefined' && i.status) {
                            tgt.fadeOut(function() {
                                $(this).empty().remove();
                            });
                        } else {
                            alert('Unfortunately the item could not be deleted at this time.');
                        }
                    }
                });
            }
        }
    });
});
