var preloaded = [], preloadlist = [], curDesc = '', prevDesc = '', prev = null, next = null, curInd = -1, curCattle = '', curImg;
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
        var thumb = $(images[x]).data('src'),
            img = $(images[x]).data('src'),
            video, frames;
        if (thumb.substr(0, 6) === 'video:') {
            // this is a video \\
            video = thumb.substr(6);
            thumb = video+'.png';
            frames = video+'_frames.png';
            var thumbImg = new Image();
            // trigger onload if required - top one uses the cache \\
            thumbImg.onload = function() {
                var x = this.var;
                $("h1", "#cattle-header").append('<img src="/img/play-icon.svg" id="img-'+x+'" width="'+(thumbImg.width-24)+'" height="'+(thumbImg.height-24)+'" style="padding: 12px; background-image: url(\''+thumb+'\');" data-thumb="'+thumb+'" data-src="'+$(images[x]).data('src')+'" data-frames="'+frames+'" />');
            
                if (typeof $("#img-"+this.var, "#cattle-header h1").css('width') !== 'undefined') {
                    $("#img-"+this.var, "#cattle-header h1").width($("#img-"+this.var, "#cattle-header h1").css('width'));
                    var ratio = this.width / this.height;
                    var height = (parseInt($("#img-"+this.var, "#cattle-header h1").css('width'))+24) / ratio - 24;
                    $("#img-"+this.var, "#cattle-header h1").height(height);
                    $("#img-"+this.var, "#cattle-header h1").css({'background-size': 'cover'});
                } else {
                    $("#img-"+this.var, "#cattle-header h1").height(this.height-24);
                    $("#img-"+this.var, "#cattle-header h1").width(this.width-24);
                }
            };
            thumbImg.src = thumb;
            thumbImg.var = x;
            var tmpImg = new Image();
            tmpImg.src = frames;
            var thumbAnim;
            $("#cattle-header").on('mouseenter', '#img-'+x, function() {
                var thumbW = $(this).width()+24;
                $(this).css({'background-image': 'url(\''+$(this).data('frames')+'\')'});
                var $this = $(this);
                thumbAnim = setInterval(function() {
                    $this.css({'background-position-x': '-='+thumbW+'px'});
                    console.log($this.css('background-position-x'));
                }, 300);
            });
            $("#cattle-header").on('mouseleave', '#img-'+x, function() {
                $(this).css({'background-image': 'url(\''+$(this).data('thumb')+'\')', 'background-position-x': '0'});
                clearInterval(thumbAnim);
            });
        } else {
            if (thumb.substr(0, 6) === 'image:') {
                thumb = thumb.substr(6);
                img = $(images[x]).data('src').substr(6);
            }
            thumb = thumb.replace('/img/', '/thumbs/');
            $("h1", "#cattle-header").append('<img id="img-'+x+'" src="'+thumb+'" data-src="'+img+'" />');
        }
        if (first) {
            first = false;
            displayImage($("#img-"+x), catInd);
        }
    }
}
function displayImage(src, catInd) {
    var source = src.data('src');
    if (source.substr(0, 6) !== 'video:') {
        if (preloaded.indexOf(source) === -1) {
            preloadImg(source, false);
        }
    }
    if (descVisible()) {
        hideDesc(false, changeImg, source, catInd, src);
    } else {
        changeImg(source, catInd, src);
    }
}
function descVisible() {
    if ($(".cattle-details", "#cattle-header").length === 0) {
        $("#cattle-header").prepend('<div class="cattle-details hide" />');
    }
    return !($(".cattle-details", "#cattle-header").hasClass('hide'));
}
function hideDesc(force, fn, source, catInd, src) {
    if (force || (curDesc !== prevDesc)) {
        $(".cattle-details", "#cattle-header").addClass('hide').one('transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd', function() {
            if ($(this).hasClass('hide')) {
                fn(source, catInd, src);
            }
        });
    } else {
        fn(source, catInd, src);
    }
}
function changeImg(source, catInd, src) {
    var headH = $("#header").height();
    if ($("> #slideshow_video_player", "#cattle-header").length > 0) {
        $("> #slideshow_video_player", "#cattle-header").fadeOut(function() {
            loadMedia.apply(this, [source, catInd, headH]);
            curImg = src;
        });
    } else {
        $("> img:first", "#cattle-header").fadeOut(function() {
            loadMedia.apply(this, [source, catInd, headH]);
            curImg = src;
        });
    }
}
function loadMedia(source, catInd, headH) {
    var $this = $(this);
    if (typeof curImg === 'undefined' || curImg.data('src') !== source) {
        if (source.substr(0, 6) === 'video:') {
            $(this).after('<video autoplay loop style="display:none;" id="slideshow_video_player" />');
            $this = $(this).next('video');
            $(this).empty().remove();
            $("#slideshow_video_player").bind("loadedmetadata", function () {
                var width = this.videoWidth,
                    height = this.videoHeight;
                $(this).width(width);
                $(this).height(height);
                prepImg.apply($this, [source, catInd, headH]);
            });
            $this.append($('<source src="'+source.substr(6)+'.mp4" type="video/mp4"><source src="'+source.substr(6)+'.ogg" type="video/ogg"><source src="'+source.substr(6)+'.webm" type="video/webm">'));
        } else {
            if ($(this).is('#slideshow_video_player')) {
                $(this).after('<img />');
                $this = $(this).next('img');
                $(this).empty().remove();
            }
            if (source.substr(0, 6) === 'image:') {
                source = source.substr(6);
            }
            $this.prop('src', source);
            prepImg.apply($this, [source, catInd, headH]);
        }
    }
}
function prepImg(source, catInd, headH) {
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
    $(this).css('margin-top', headH).addClass('slideshow').fadeIn(function() {
        displayDesc(source, catInd);
    });
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
}
function preloadImgIterate(list) {
    preloadImg(list[0], true, 0, list);
}
function preloadImg(src, iterate, ind, list) {
    if (typeof src !== 'undefined' && src.substr(0, 6) === 'image:') {
        src = src.substr(6);
    }
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
    if ($("> .slideshow:first", "#cattle-header").css('z-index') === '1') {
        $("> .slideshow:first", "#cattle-header").animate({'margin-top': $("#header").height()+$(".cattle-details", "#cattle-header").height()-$(".navigation", "#cattle-header .cattle-details").height()});
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
        if ($(this).data('src').substr(6) === source) {
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
//    if ($(".cattle-details", "#cattle-header").width() > $(document).width()-$("> img:first", "#cattle-header").width()-20) {
//        $(".cattle-details", "#cattle-header").animate({'width': $(document).width()-$("> img:first", "#cattle-header").width()-20});
//    }
}