<script>

var open = window.XMLHttpRequest.prototype.open;


function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function openReplacement(method, url, async, user, password) {
    
    console.log(url);

    if(url.indexOf('search?expands=images&q=SELECT+id,+subject,+body,+view_href,+post_time,+conversation.solved,+conversation.style,+conversation.last_post.author,+conversation.last_post.post_time,+conversation.last_post.post_time_friendly,+conversation.last_post.view_href,+author,+images,+teaser,+replies.count(*),+kudos.sum(weight)+FROM+messages+WHERE+board.id+%3D+%22BestReportContestJan2016%22+AND+depth+%3D+0+ORDER+BY+conversation.last_post_time+DESC+LIMIT+30+OFFSET+0') > -1){

      var arrayOfSorts = [
        "conversation.last_post_time ASC",
        "conversation.last_post_time DESC",
        "post_time ASC",
        "post_time DESC"
      ];

      var randomNum = getRandomInt(0, 3);
      var orderBy = arrayOfSorts[randomNum];

      url = url.replace("+ORDER+BY+conversation.last_post_time+DESC+", "+ORDER+BY+" + orderBy + "+")
      arguments[1] = url;

    }
    return open.apply(this, arguments);
}


window.XMLHttpRequest.prototype.open = openReplacement;

</script>