<@liaAddScript>
LITHIUM.jQuery.ajax({
	url: "//powerbi.uservoice.com/api/v1/forums/265200/suggestions.json?client=GZU4N2lErc9TuKoCkWTvA",
	dataType: "jsonp"
}).done(function (result) {
	console.log("done");
	for (i = 0; i < result.suggestions.length; i++){
		$("#uv_ideas").show();
		$("#uv_loading").hide();
/* The vote_count parameter is changed to supporters_count by iTalent team as part of iTrack MC-361 */
    /* As part of SDL activities 7/20/2018 replacing all http URLs with https */

		$("#uv_ideas").append("<div class=\"idea-item\"><span class=\"title\"><a href=\""+result.suggestions[i].url.replace('http://','https://')+"\">"+result.suggestions[i].title+"</a></span>&nbsp;<span class=\"vote-count\">("+result.suggestions[i].supporters_count+" votes)</span></div>");
	}
}).fail(function (jqXHR, textStatus) {
	$("#uv_ideas").append("<p>Error fetching ideas</p>");
	$("#uv_ideas").show();
	$("#uv_loading").hide();
	console.log(textStatus);
});
</@liaAddScript>
<div class="lia-panel lia-panel-standard custom-uservoice-ideas"> 
    <div class="lia-decoration-border">
        <div class="lia-decoration-border-top">
            <div> </div>
        </div>
        <div class="lia-decoration-border-content">
            <div>
                <div class="lia-panel-heading-bar-wrapper">
                    <div class="lia-panel-heading-bar lia-bg-yellow">
                       <span class="lia-panel-heading-bar-title">
						Top Ideas
					</span>
                    </div>
                </div>
                <div class="lia-panel-content-wrapper">

                    <div class="lia-panel-content">
                    <div id="uv_loading" style="display:block"><img src="${skin.images.feedback_loading.url}" /></div>
<div id="uv_ideas" style="display:none"></div>
					</div>
                </div>
            </div>
        </div>
        <div class="lia-decoration-border-bottom">
            <div> </div>
        </div>
    </div>
</div>
