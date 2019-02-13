$(function() {
    $.getScript('/js/twitter.config.js');
    $("#news-content").on('click', 'a.view', function(ev) {
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
    $("#news-content").on('click', '.news-photos img', function(ev) {
        ev.stopPropagation();
        displayImg.apply(this);
    });
    $(".news-holder li").each(function() {
        $('> p', this).html(urlify($('> p', this).html()));
        $('.news-story .facebook', this).html(urlify($('.news-story .facebook', this).html()));
    });
});
function displayImg() {
    var lgImg = $(this).clone();
    $("body").find('.news-image, .modalBG').empty().remove();
    var imgModal = $('<div class="news-image" />'),
        imgBG = $('<div class="modalBG" />');
    imgBG.width($(window).width()).height($(window).height());
    imgModal.append(lgImg);
    lgImg.width('80%');
    $("body").append(imgModal, imgBG);
    if (lgImg.height() > $(window).height()) {
        lgImg.width('auto');
        lgImg.height($(window).height()-100);
    }
    imgModal.width(lgImg.width()).height(lgImg.height());
    imgModal.css({'left': '50%', 'margin-left': '-'+lgImg.width()/2+'px'});
    imgBG.one('click', function() {
        imgModal.empty().remove();
        imgBG.empty().remove();
    });
    var nxtImg = ($(this).parent().next().length > 0) ? $(this).parent().next().find('img') : $(this).parent().siblings().first().find('img');
    lgImg.one('click', function() {
        displayImg.apply(nxtImg);
    });
}