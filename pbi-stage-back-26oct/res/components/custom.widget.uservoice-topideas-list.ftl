<#attempt>
<@liaAddScript>
LITHIUM.jQuery.ajax({
	url: "//powerbi.uservoice.com/api/v1/forums/265200/suggestions.json?client=GZU4N2lErc9TuKoCkWTvA",
	dataType: "jsonp"
}).done(function (result) {
	console.log("done");
	for (i = 0; i < result.suggestions.length; i++){
		$("#uv_ideas").show();
		$("#uv_loading").hide();
    /* As part of SDL activities 7/20/2018 replacing all http URLs with https */
/* The vote_count parameter is changed to supporters_count by iTalent team as part of iTrack MC-361 */
		$("#uv_ideas").append('<article><div class=\"col-md-6\"><div class=\"topIdeas-title\"><p class=\"data-shaping-modeli\"><a href=\"'+result.suggestions[i].url.replace("http://","https://")+'\">'+result.suggestions[i].title+'</a></p></div></div><div class=\"col-md-6\"><div class=\"posts\"><span class=\"tag-bg\" style=\"background-color:'+result.suggestions[i].status.hex_color+'\"><span class=\"-new\">'+result.suggestions[i].status.name+'</span></span><span class=\"-posts\">'+result.suggestions[i].supporters_count+'<span> Votes</span></span></div></div><div style=\"clear:both\"></div></article>');
	}
    $("#uservoiceCount").text("("+result.response_data.total_records+")");
}).fail(function (jqXHR, textStatus) {
	$("#uv_ideas").append("<p>Error fetching ideas</p>");
	$("#uv_ideas").show();
	$("#uv_loading").hide();
	console.log(textStatus);
});
</@liaAddScript>
<#include "common_utils.ftl" />
<@generateComponentContent componentTitle="" className="custom-uservoice-top-ideas" >
<!-- <div class="custom-uservoice-top-ideas"> -->
<article id="topIdeas" class=""> <!-- container -->
    <article class="topHead">
        <div class="col-md-6">
          <div>
            <h1 class="top-ideas">Top Ideas <span class="layer" id="uservoiceCount"></span></h1>
          </div>
        </div>
        <div class="col-md-6">
           <div class="view-all">
             <h2><a href="https://ideas.powerbi.com/forums/265200-power-bi-ideas/filters/top">View All</a></h2>
           </div>
        </div>
        <div style="clear:both"></div>
    </article>
    <div id="uv_loading" style="display:block"><img src="${skin.images.feedback_loading.url}" /></div>
    <div id="uv_ideas" style="display:none"></div>
</article>
<!--</div> -->
</@generateComponentContent>
<#recover>
</#attempt>