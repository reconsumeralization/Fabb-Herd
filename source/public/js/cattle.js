var preloaded = [], preloadlist = [], curDesc = '', prevDesc = '', prev = null, next = null, curInd = -1, curCattle = '', curImg = '';
$(function() {
    // show the first one \\
    $(".cattle-list .cattle-item").click(function() {
        displayCattle($(this));
    });
    $("h1", "#cattle-header").on('click', 'img', function() {
        displayImage($(this), curInd);
    });
    $("#cattle-header").append('<img style="display: none;" class="preload" />');
    $(".cattle-list .cattle-item").each(function() {
        $(this).find('.cattle-info .cattle-images .cattle-img').each(function() {
            preloadlist.push($(this).data('src'));
        });
    });
    preloadImgIterate(preloadlist);
    // if a hash is provided then lets load the cattle by name \\
    loadCattle(window.location.hash.substring(1));
    
    $(window).resize(function() {
        var curImgSel = curImg;
        displayCattle(curCattle);
        displayImage(curImgSel, curInd);
    });
    setInterval(detectWidth, 2000);
});
function displayCattle(el) {
    window.location.hash = el.find('a:first').prop('title');
    $("#cattle-header").css({'max-height': 'none'});
    // get a list of icons for the heading bar \\
    var images = el.find('.cattle-info .cattle-images .cattle-img'),
        desc = el.find('.cattle-info .cattle-details').html(),
        imgL = images.length;
    // loop each image source and append to the h1 \\
    $("h1", "#cattle-header").html('');
    curDesc = desc;
    displayThumbs(images, imgL, el.index());
    curInd = el.index();
    if (imgL > 1) {
        $("h1", "#cattle-header").slideDown();
    } else {
        $("h1", "#cattle-header").slideUp();
    }
    curCattle = el;
}
function displayThumbs(images, imgL, catInd) {
    var first = true;
    for (var x = 0; x < imgL; x++) {
        $("h1", "#cattle-header").append('<img id="img-'+x+'" src="'+$(images[x]).data('src').replace('/img/', '/thumbs/')+'" data-src="'+$(images[x]).data('src')+'" />');
        if (first) {
            first = false;
            displayImage($("#img-"+x), catInd);
        }
    }
}
function displayImage(src, catInd) {
    var source = src.data('src');
    if (preloaded.indexOf(source) === -1) {
        preloadImg(source, false);
    }
    if (descVisible()) {
        hideDesc(false, changeImg, source, catInd);
    } else {
        changeImg(source, catInd);
    }
    curImg = src;
}
function descVisible() {
    if ($(".cattle-details", "#cattle-header").length === 0) {
        $("#cattle-header").prepend('<div class="cattle-details hide" />');
    }
    return !($(".cattle-details", "#cattle-header").hasClass('hide'));
}
function hideDesc(force, fn, source, catInd) {
    if (force || (curDesc !== prevDesc)) {
        $(".cattle-details", "#cattle-header").addClass('hide').one('transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd', function() {
            if ($(this).hasClass('hide')) {
                fn(source, catInd);
            }
        });
    } else {
        fn(source, catInd);
    }
}
function changeImg(source, catInd) {
    var headH = $("#header").height();
    $("> img:first", "#cattle-header").fadeOut(function() {
        $(this).prop('src', source);
        if ($(this).width() > $(window).width()) {
            $(this).css('width', '100%');
            $(this).css('height', 'auto');
        }
        if ($(this).height() > $(window).height()-(headH*2)) {
            $(this).css('height', $(window).height()-headH);
            $(this).css('width', 'auto');
            $(".hero").css({'border-bottom': '1px solid #0d6506'});
        } else {
            $(".hero").css({'border-bottom': 'none'});
        }
        $(this).css('margin-top', headH).addClass('slideshow').fadeIn(function() {displayDesc(source, catInd);});
        if (!$(".cattle-details", "#cattle-header").data('width')) {
            $(".cattle-details", "#cattle-header").data('width', $(".cattle-details", "#cattle-header").width());
        }
        if ($(this).width() < $(document).width() && $(document).width()-$(this).width()-20 > 160) {
            $(".cattle-details", "#cattle-header").animate({'width': $(document).width()-$(this).width()-20});
        } else if ($(".cattle-details", "#cattle-header").data('width')) {
            $(".cattle-details", "#cattle-header").animate({'width': $(".cattle-details", "#cattle-header").data('width')});
        }
        detectWidth();
        window.scrollTo(0, 0);
    });
}
function preloadImgIterate(list) {
    preloadImg(list[0], true, 0, list);
}
function preloadImg(src, iterate, ind, list) {
    $(".preload", "#cattle-header").prop('src', src).one('load', function() {
        preloaded.push(src);
        if (iterate) {
            if (list.length > ind) {
                preloadImg(list[ind+1], true, ind+1, list);
            }
        }
    }).each(function() {
        if(this.complete) $(this).load();
    });
}
function displayDesc(source, catInd) {
    if (curDesc !== prevDesc) {
        var pad = parseInt($(".cattle-details", "#cattle-header").css('padding-top'))+parseInt($(".cattle-details", "#cattle-header").css('padding-bottom'))+parseInt($(".cattle-details", "#cattle-header").css('margin-top'))+parseInt($(".cattle-details", "#cattle-header").css('margin-bottom'));
        var thumbs = ($("h1", "#cattle-header").is(':visible')) ? $("h1", "#cattle-header").height() : 0;
        $(".cattle-details", "#cattle-header").height($("#cattle-header").height()-thumbs-pad).html(curDesc).removeClass('hide');
        prevDesc = curDesc;
    }
    displayNav(source, catInd);
    if ($("> img:first", "#cattle-header").css('z-index') === '1') {
        $("> img:first", "#cattle-header").animate({'margin-top': $("#header").height()+$(".cattle-details", "#cattle-header").height()-$(".navigation", "#cattle-header .cattle-details").height()});
    }
}
function displayNav(source, catInd) {
    // find the cattle by index \\
    var el = $(".cattle-list .cattle-item:eq("+catInd+")"),
        images = el.find('.cattle-info .cattle-images .cattle-img'),
        imgL = images.length,
        cur = -1,
        pType = '',
        nType = '';
    
    images.each(function(x) {
        if ($(this).data('src') === source) {
            cur = x;
        }
    });
    if (cur === 0) {
        // need to check for a prev cattle \\
        if (catInd-1 >= 0) {
            var pEl = $(".cattle-list .cattle-item:eq("+(catInd-1)+")"),
                pImages = pEl.find('.cattle-info .cattle-images .cattle-img');
            pType = 'cattle';
            prev = pImages.filter(':last');
        } else {
            prev = null;
        }
    } else {
        pType = 'image';
        prev = images.filter(':eq('+(cur-1)+')');
    }
    if (cur === imgL-1) {
        // need to check for a next cattle \\
        if (catInd+1 < $(".cattle-list .cattle-item").length) {
            var nEl = $(".cattle-list .cattle-item:eq("+(catInd+1)+")"),
                nImages = nEl.find('.cattle-info .cattle-images .cattle-img');
            nType = 'cattle';
            next = nImages.filter(':first');
        } else {
            next = null;
        }
    } else {
        nType = 'image';
        next = images.filter(':eq('+(cur+1)+')');
    }
    $(".cattle-details", "#cattle-header").find('.navigation').empty().remove();
    var nav = $('<div class="navigation" />');
    if (prev !== null) {
        nav.append('<div class="prev"><span>&lt;</span>PREV</div>');
    }
    if (next !== null) {
        nav.append('<div class="next"><span>&gt;</span>NEXT</div>');
    }
    $(".cattle-details", "#cattle-header").append(nav);
    $(".prev", nav).click(function() {
        if (pType === 'image') {
            displayImage(prev, catInd);
        } else {
            displayCattle($(".cattle-list .cattle-item:eq("+(catInd-1)+")"));
        }
    });
    $(".next", nav).click(function() {
        if (nType === 'image') {
            displayImage(next, catInd);
        } else {
            displayCattle($(".cattle-list .cattle-item:eq("+(catInd+1)+")"));
        }
    });
}
function loadCattle(target) {
    if (target !== '') {
        displayCattle($("a[title='"+target+"']").parent());
    }
}
function detectWidth() {
    if ($(".cattle-details", "#cattle-header").width() > $(document).width()-$("> img:first", "#cattle-header").width()-20) {
        $(".cattle-details", "#cattle-header").animate({'width': $(document).width()-$("> img:first", "#cattle-header").width()-20});
    }
}