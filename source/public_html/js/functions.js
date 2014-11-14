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
    $("#cattle-list li:first").each(function() {
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
        //$("#cattle-name").text($(this).find('.text').text());
        var tgt = $(this).prop('id').split('icon-')[1];
        $(".cattle-info").hide();
        $("#cattle-"+tgt).show();
        $("#cattle-"+tgt+" .cattle-figures .cattle-figure").each(function() {
            adjustHeights($('span', this));
        });
        if ($(".image-thumbs li:first", "#cattle-"+tgt).length > 0) {
            if ($(".image-thumbs li:first", "#cattle-"+tgt).hasClass('cattle-video')) {
                $(".image-view .img-container", "#cattle-"+tgt).html($(".image-thumbs li:first", "#cattle-"+tgt).attr('video-url'));
            } else {
                var img = $(".image-thumbs li:first img", "#cattle-"+tgt).clone();
                $(".image-view .img-container", "#cattle-"+tgt).html(img.width($(".image-view", "#cattle-"+tgt).width()));
            }
        }
    });
    $("#cattle-list li").hover(function() {
        $(this).siblings().removeClass('hover');
        $(this).addClass('hover');
    }, function () {
        $(this).removeClass('hover');
    }).click(function() {
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
        //$("#cattle-name").text($(this).find('.text').text());
        var tgt = $(this).prop('id').split('icon-')[1];
        $(".cattle-info").hide();
        $("#cattle-"+tgt).show();
        $("#cattle-"+tgt+" .cattle-figures .cattle-figure").each(function() {
            adjustHeights($('span', this));
        });
        if ($(".image-thumbs li:first", "#cattle-"+tgt).length > 0) {
            if ($(".image-thumbs li:first", "#cattle-"+tgt).hasClass('cattle-video')) {
                $(".image-view .img-container", "#cattle-"+tgt).html($(".image-thumbs li:first", "#cattle-"+tgt).attr('video-url'));
            } else {
                var img = $(".image-thumbs li:first img", "#cattle-"+tgt).clone();
                $(".image-view .img-container", "#cattle-"+tgt).html(img.width($(".image-view", "#cattle-"+tgt).width()));
            }
        }
    });
    $(".image-thumbs .cattle-video").click(function() {
        var tgt = $(this).parent().parent().find(".image-view .img-container");
        tgt.html($(this).attr('video-url'));
    });
    $(".image-thumbs li[class!='cattle-video']").click(function() {
        var img = $("img", this).clone();
        var tgt = $(this).parent().parent().find(".image-view .img-container");
        tgt.html(img.width($(".image-view").width()));
        
    });
    $(".cattle-figures .cattle-figure").each(function() {
        adjustHeights($('span', this));
    });
    if (($("#about-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#about-content .content").outerHeight() > 400)) {
        $("#about-breaker").height($(window).height()-$("#about-content .content").outerHeight());
    }
    if (($("#news-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#news-content .content").outerHeight() > 400)) {
        $("#news-breaker").height($(window).height()-$("#news-content .content").outerHeight());
    }
    if (($("#cattle-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#cattle-content .content").outerHeight() > 400)) {
        $("#cattle-breaker").height($(window).height()-$("#cattle-content .content").outerHeight());
    }
    if (($("#contact-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#contact-content .content").outerHeight() > 400)) {
        $("#contact-breaker").height($(window).height()-$("#contact-content .content").outerHeight());
    }
    if (($("#shows-content .content").outerHeight() < $(window).height()) && ($(window).height()-$("#shows-content .content").outerHeight() > 400)) {
        $("#shows-breaker").height($(window).height()-$("#shows-content .content").outerHeight());
    }
    if ($("#about-breaker").height() > $(window).height()-100) {
        $("#about-breaker").height($(window).height()-100);
    }
    if ($("#news-breaker").height() > $(window).height()-100) {
        $("#news-breaker").height($(window).height()-100);
    }
    if ($("#cattle-breaker").height() > $(window).height()-100) {
        $("#cattle-breaker").height($(window).height()-100);
    }
    if ($("#contact-breaker").height() > $(window).height()-100) {
        $("#contact-breaker").height($(window).height()-100);
    }
    if ($("#shows-breaker").height() > $(window).height()-100) {
        $("#shows-breaker").height($(window).height()-100);
    }
    var headHght = $("#header").height();
    
    $("#news-content a.view").click(function(ev) {
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
    $("#news-content .news-photos img").click(function(ev) {
        ev.stopPropagation();
        displayImg.apply(this);
    });
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
                    if (i.offset == 0) {
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
                        $form[0].reset();
                        $form.prepend('<p class="success">Your message was successfully sent.</p>');
                    } else {
                        var msg = "";
                        for (var x in i.message) {
                            msg += i.message[x]+'<br />';
                        }
                        $form.prepend('<p class="error">'+msg+'</p>');
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
