var twitConfig = {
  "id": '712970731005546496',
  "domId": 'tweets',
  "maxTweets": 6,
  "enableLinks": true,
  "showUser": true,
  "showTime": true,
  "lang": 'en',
  
  "dateFunction": dateFormatter,
  "customCallback": handleTweets
};
function dateFormatter(date) {
    var day = date.getDate(),
        month = date.getMonth()+1;
    if (day < 10) day = '0'+day;
    if (month < 10) month = '0'+month;
    return day+'/'+month+'/'+date.getFullYear();
}
function handleTweets(tweets) {
    var x = tweets.length,
        n = 0,
        elem = $(".news-holder"),
        html = '';
    while (n < x) {
        // convert to elem \\
        var obj = $('<div>'+tweets[n]+'</div>');
        var link = $(".user div a", obj).attr('href');
        var img = $(".user div a span:first", obj);
        img.find('img').attr('align', 'middle');
        var author = $(".user div a span:eq(1)", obj).html();
        var handle = $(".user div a span:eq(2)", obj).html();
        html += '<li><h4 class="twitter-head"><a href="'+link+'" target="_blank"><div class="image">'+img.html()+'</div><div class="author">'+author+' - '+handle+'</div></a></h4><p class="twitter-desc">'+obj.find('.tweet').html()+'</p></li>';
        n++;
    }
    elem.append(html);
}
twitterFetcher.fetch(twitConfig);