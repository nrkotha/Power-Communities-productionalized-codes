<style>
 .panel{background-color: #FFFFFF;
    border: 1px solid #E0E0E0;
    border-radius: 3px;
    -webkit-box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.1);
    -moz-box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.1);
    box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.1);
}
.panel-head{
  padding:20px;
  border-bottom:1px solid #E0E0E0;
}
.heading{
font-size: 18px;
font-weight: bold;
}
.all-content{
float:right;
}
.panel-body{
padding:20px;
}
</style>

<#attempt>
<div class="panel">
<#assign result = rest("threads/featured/nested?restapi.response_style=view")/>

<div class="panel-head">
<span class="heading">Featured Topics</span><a href="#" class="all-content">See All</a>
</div>
<div class="panel-body">
<#list result.threads.thread as thread>

<div><a href="${thread.messages.topic.@view_href}">${thread.messages.topic.subject}</a></div>
<div>${thread.messages.topic.teaser}</div>
<#assign board_id=thread.board.@href?keep_after_last("/")/>
<#assign board_name = rest("2.0","/search?q=" + "SELECT title FROM boards where id = '${board_id}' "?url).data.items[0]/>
<div><a href="${thread.board.@view_href}">${board_name.title}</a></div>
<br/>
</#list>

</div>
</div>
<#recover>
</#attempt>
