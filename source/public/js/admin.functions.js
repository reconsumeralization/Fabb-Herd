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
});
