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
        var dateText = obj.find('.timePosted').text().split('/');
        var date = new Date(dateText[2]+'/'+dateText[1]+'/'+dateText[0]);
        html += '<li id="news_'+date.getTime()/1000+'"><h4 class="twitter-head"><a href="'+link+'" target="_blank"><div class="image"><img src="/img/twitter-icon.png" width="40" /></div><div class="author">'+author+' - '+handle+'</div></a></h4><p class="twitter-desc">'+obj.find('.tweet').html()+'</p></li>';
        n++;
    }
    elem.append(html);
    var news = elem;
    var items = news.children('li'),
        itemArr = [];
    items.each(function() {
        itemArr.push($(this));
    });
    news.empty();
    itemArr.sort(function(a, b) {
        var timea = $(a).prop('id').split('news_')[1],
            timeb = $(b).prop('id').split('news_')[1];
        if (parseInt(timea) < parseInt(timeb)) {
            return 1;
        }
        if (parseInt(timea) > parseInt(timeb)) {
            return -1;
        }
        return 0;
    });
    news.append(itemArr);
}
twitterFetcher.fetch(twitConfig);