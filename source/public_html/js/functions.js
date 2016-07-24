$(document).ready(function() {
    $(".mobile-menu").click(function() {
        if ($(this).nextAll('.menu').is(':visible')) {
            $(this).nextAll('.menu').hide();
            $('span', this).text('MENU');
        } else {
            $(this).nextAll('.menu').show();
            $('span', this).text('CLOSE');
        }
        return false;
    });
//    (function() {
//        var c = $('<div />');
//        var smg = new Image();
//        smg.src='/img/smg-logo.png';
//        smg.align='right';
//        c.css({'cursor': 'pointer', 'float': 'right', 'text-align': 'right', 'font-family': 'Verdana, Helvetica, sans-serif', 'font-size': '0.7rem', 'position': 'relative', 'z-index': 1, 'width': '25%'}).html(smg).prepend('&#83;&#105;&#116;&#101;&#32;&#100;&#101;&#115;&#105;&#103;&#110;&#101;&#100;&#32;&#97;&#110;&#100;&#32;&#104;&#111;&#115;&#116;&#101;&#100;&#32;&#98;&#121;');
//        $("body").append(c);
//        c.find('img').width('30%').prop('hspace', '10').css({'max-width': '80px'});
//        c.click(function() {
//            window.open('http://smgdesign.org');
//        });
//    })();
});
function urlify(text) {
    if (typeof text !== 'undefined') {
        var urlRegex = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
        return text.replace(urlRegex, function(url) {
            return '<a href="' + url + '" target="_blank">' + url + '</a>';
        });
    }
    // or alternatively
    // return text.replace(urlRegex, '<a href="$1">$1</a>')
}