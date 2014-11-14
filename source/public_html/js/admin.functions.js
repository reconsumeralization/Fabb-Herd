$(document).ready(function() {
    /*$("#header").css({"bottom": 0});
    var headerTop = $("#header").offset().top;
    $(window).scroll(function() {
        var header = $("#header"),
            scroll = $(window).scrollTop();
        if (scroll >= headerTop) {
            header.addClass('fixed');
        } else {
            header.removeClass('fixed');
        }
    });*/
    $("#home-content").css({'min-height': $(window).height()});
    
    if (($("#about-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#about-content .content").outerHeight() > 400)) {
        $("#about-breaker").height($(window).height()-$("#about-content .content").outerHeight()+100);
    }
    if (($("#news-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#news-content .content").outerHeight() > 400)) {
        $("#news-breaker").height($(window).height()-$("#news-content .content").outerHeight()+100);
    }
    if (($("#cattle-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#cattle-content .content").outerHeight() > 400)) {
        $("#cattle-breaker").height($(window).height()-$("#cattle-content .content").outerHeight()+100);
    }
    $("#cattle-list li").hover(function() {
        $(this).siblings().removeClass('hover');
        $(this).addClass('hover');
    }, function () {
        $(this).removeClass('hover');
    }).click(function() {
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
        $("#cattle-name").text($(this).find('.text').text());
    });
    $("#image-view").height($("#image-view").width()/1.6);
    $("#cattle-figures .cattle-figure").each(function() {
        adjustHeights($('span', this));
    });
    if (($("#contact-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#contact-content .content").outerHeight() > 400)) {
        $("#contact-breaker").height($(window).height()-$("#contact-content .content").outerHeight()+53);
    }
    if (($("#events-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#events-content .content").outerHeight() > 400)) {
        $("#events-breaker").height($(window).height()-$("#events-content .content").outerHeight()+53);
    }
    var headHght = $("#header").height();
    
    $("#contact-form").submit(function(ev) {
        ev.preventDefault();
        var fields = {},
            cont = true;
        $("input, textarea", this).each(function() {
            if ($(this).attr('data-required') === 'true' && $(this).val() === '') {
                cont = false;
                $(this).css({'background-color': '#cc0202', 'color': '#ffffff'});
            } else {
                fields[$(this).prop('name')] = $(this).val();
                $(this).css({'background-color': '#ffffff', 'color': '#000000'});
            }
        });
        $(this).find('.success, .error').empty().remove();
        if (cont) {
            var loader = $('<div class="loader" />');
            loader.height($(this).height());
            $(this).append(loader.fadeIn());
            var $form = $(this);
            $.ajax({
                'url': $(this).prop('action'),
                'type': $(this).prop('method'),
                'dataType': 'json',
                'data': fields,
                'success': function(i) {
                    loader.empty().remove();
                    if (i.success) {
                        $form.reset();
                        $form.prepend('<p class="success">Your message was successfully sent.</p>');
                    } else {
                        $form.prepend('<p class="error">Unfortunately an error occurred. Please try again.</p>');
                    }
                },
                'error': function() {
                    loader.empty().remove();
                    $form.prepend('<p class="error">Unfortunately an error occurred. Please try again.</p>');
                }
            });
        }
    });
    
    $("#header .container a").click(function() {
        var tgt = '#'+$(this).prop('href').split('#')[1]+'-content';
        $("html, body").animate({
            'scrollTop': $(tgt).position().top
        });
    });
    
    adjustSize();
    $(window).resize(adjustSize);
    checkURL();
    function adjustHeights(elem) {
        var fontstep = 2;
        if ($(elem).height()>($(elem).parent().height()-12) || $(elem).width()>($(elem).parent().width()-12)) {
            $(elem).css('font-size',(($(elem).css('font-size').substr(0,2)-fontstep)) + 'px').css('line-height',(($(elem).css('font-size').substr(0,2))) + 'px');
            adjustHeights(elem);
        }
    }
    function adjustSize() {
        // take the width of the browser and drop all fonts accordingly \\
        if ($(window).width() < 1280 || $(window).height() < 770) {
            var fontS = ($(window).width()/1280 < $(window).height()/770) ? $(window).width()/1280*100 : $(window).height()/770*100;
            if (fontS < 70) {
                fontS = 70;
            }
            $("html").css({'font-size': fontS+'%'});
            var newHeadHght = ($(window).width()/1280 < $(window).height()/770) ? $(window).width()/1280*headHght : $(window).height()/770*headHght;
            if (newHeadHght < 55) {
                newHeadHght = 55;
            }
            $("#header").height(newHeadHght+'px');
        } else {
            $("html").css({'font-size': '100%'});
        }
    }
    function checkURL() {
        // check the URL and go to the corresponding location \\
        if (window.location.href.search('#') > -1) {
            var tgt = '#'+window.location.href.split('#')[1]+'-content';
            $("html, body").scrollTop($(tgt).position().top);
        }
    }
});
