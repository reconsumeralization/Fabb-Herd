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
    var headHght = oldHeadHght = $("#header").height();
    $("#home-content").css({'min-height': $(window).height()});
    cattleList();
    $("#cattle-list li:first").each(function() {
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
        $(this).height($(this).height()+8);
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
            $(".image-view", "#cattle-"+tgt).height($(".image-view", "#cattle-"+tgt).width()/1.25);
        }
    });
    $("#cattle-list li").hover(function() {
        $(this).siblings().removeClass('hover');
        $(this).addClass('hover');
        if (!$(this).hasClass('active')) {
            $(this).siblings(":not(.active)").height($(this).height());
            $(this).height($(this).height()+8);
        }
    }, function () {
        $(this).removeClass('hover');
        if (!$(this).hasClass('active')) {
            $(this).height($(this).height()-8);
        }
    }).click(function() {
        $(this).siblings(":not(.active), :not(.hover)").height($(this).height()-8);
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
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
            $(".image-view", "#cattle-"+tgt).height($(".image-view", "#cattle-"+tgt).width()/1.25);
        }
        var scrollLoc = $("#cattle-content").position().top+$("h2.cattle-name", "#cattle-"+tgt).position().top - headHght;
        //$("#cattle-content").position().top+($(".breaker", "#cattle-content").height() - headHght*2)
        $("html, body").animate({
            'scrollTop': scrollLoc
        });
    });
    $(".image-thumbs .cattle-video").click(function() {
        var tgt = $(this).parent().parent().find(".image-view .img-container");
        tgt.html($(this).attr('video-url'));
        $("iframe", tgt).width(tgt.width()).height(tgt.width()/1.25);
        $(this).parent().parent().find(".image-view").height(tgt.width()/1.25);
    });
    $(".image-thumbs li[class!='cattle-video']").click(function() {
        var img = $("img", this).clone();
        var tgt = $(this).parent().parent().find(".image-view .img-container");
        tgt.html(img);
        img.width(tgt.width());
        $(this).parent().parent().find(".image-view").height(tgt.width()/1.25);
    });
    $(".cattle-figures .cattle-figure").each(function() {
        adjustHeights($('span', this));
    });
    prepContainer();
    
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
        var scrollLoc = $(tgt).position().top+($(".breaker", tgt).height() - headHght*2)-headHght;
        $("html, body").animate({
            'scrollTop': scrollLoc
        }, 1000);
    });
    
    adjustSize();
    $(window).resize(function() {
        cattleList();
        adjustSize();
        prepContainer();
    });
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
            if (fontS < 30) {
                fontS = 30;
            }
            $("html").css({'font-size': fontS+'%'});
            var newHeadHght = ($(window).width()/1280 < $(window).height()/770) ? $(window).width()/1280*headHght : $(window).height()/770*headHght;
            if (newHeadHght < 40) {
                newHeadHght = 40;
            }
            $("#header").height(newHeadHght+'px');
            headHght = newHeadHght;
        } else {
            $("html").css({'font-size': '100%'});
            $("#header").height(oldHeadHght+'px');
            headHght = oldHeadHght;
        }
    }
    function checkURL() {
        // check the URL and go to the corresponding location \\
        if (window.location.href.search('#') > -1) {
            var tgt = '#'+window.location.href.split('#')[1]+'-content';
            $("html, body").scrollTop($(tgt).position().top+($(".breaker", tgt).height() - headHght*2)-headHght);
        }
    }
    function cattleList() {
        var height = 0;
        $("#cattle-list li").each(function() {
            $(this).height('auto');
            $(".holder", this).width('100%');
            $(".holder > img", this).width('100%');
            var width = $(".holder", this).width();
            $(".holder", this).height(width);
            $(".holder > img.default", this).css({'margin-top': width/10});
            if (height === 0) {
                height = $(this).height();
            }
            var tgt = $(this).prop('id').split('icon-')[1];
            $(this).height(height);
            var gall = $(".image-view .img-container", "#cattle-"+tgt);
            $("iframe", gall).width(gall.width()).height(gall.width()/1.25);
            $("img", gall).width(gall.width());
            $(".image-view", "#cattle-"+tgt).height(gall.width()/1.25);
        });
    }
    function prepContainer() {
        $(".container").each(function() {
            if ($(this).attr('id') !== 'home-content') {
                if ($(".is-mobile").css('display') === 'inline') {
                    // means its portrait \\
                    $(".breaker", this).height($(window).height()/2-headHght);
                    $(this).css({
                        'background-size': 'auto '+($(window).height()/2)+'px'
                    });
                } else if ($(".is-mobile").css('display') === 'none') {
                    $(".breaker", this).height($(window).height()/2);
                    //$(this).css({'background-size': 'auto '+($(window).height()/2)+'px'});
                    $(this).css({'background-size': '100% auto'});
                } else {
                    $(".breaker", this).height($(window).height()-headHght);
                }
            } else {
                if ($(".is-mobile").css('display') === 'inline') {
                    $(this).css({'background-size': 'auto 100%'});
                } else {
                    $(this).css({'background-size': '100% auto'});
                }
            }
        });
    }
    (function() {
        var c = $('<div />');
        var smg = new Image();
        smg.src='/img/smg-logo.png';
        smg.align='middle';
        c.css({'float': 'right', 'font-family': 'Verdana, Helvetica, sans-serif', 'font-size': '0.7rem', 'position': 'relative', 'z-index': 1, 'width': '25%'}).html(smg).prepend('&#83;&#105;&#116;&#101;&#32;&#100;&#101;&#115;&#105;&#103;&#110;&#101;&#100;&#32;&#97;&#110;&#100;&#32;&#104;&#111;&#115;&#116;&#101;&#100;&#32;&#98;&#121;');
        $("body").append(c);
        c.find('img').width('30%');
    })();
});
