$(function() {
    $("#home-content .hero").css({'min-height': $(window).height()});
    if ($(window).height() < $(document).height()) {
        $("#home-content .hero").css({'min-height': $(document).height()});
    }
//    $("#home-content .hero").append('<a href="#scroll" class="home-scroll"><img src="/img/down-arrow.png" width="50" /></a>');
//    $(".home-scroll").click(function(ev) {
//        ev.preventDefault();
//        $("html, body").animate({
//            scrollTop: $(window).height()+'px'
//        });
//    });
//    $(window).scroll(function() {
//        if ($(window).scrollTop() !== 0) {
//            $(".home-scroll").fadeOut();
//        } else {
//            $(".home-scroll").fadeIn();
//        }
//    });
    $("#home-content .hero").append('<ul class="home-news-holder news-holder" />');
    $.getScript('/js/twitter.config.js', function() {
        if ($(window).height() < $(document).height()) {
            $("#home-content .hero").css({'min-height': $(document).height()});
        }
    });
    $(".news-holder").on('click', 'a.view', function(ev) {
        ev.preventDefault();
        if ($(this).hasClass('visible')) {
            $(this).next('div').slideUp();
            $(this).prev('p').slideDown();
            $(this).removeClass('visible').text('View more');
        } else {
            $(this).next('div').slideDown();
            $(this).prev('p').slideUp();
            $(this).addClass('visible').text('View less');
        }
    });
});