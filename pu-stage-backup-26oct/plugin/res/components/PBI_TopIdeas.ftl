<div class="pbi-box-title pbi-bg-yellow"><h3>Top Ideas</h3></div>
<@liaAddScript>
LITHIUM.jQuery.ajax({
	url: "//powerbi.uservoice.com/api/v1/forums/265200/suggestions.json?client=GZU4N2lErc9TuKoCkWTvA",
	dataType: "jsonp"
}).done(function (result) {
	console.log("done");

for(i=0;i<4;i++){
		$("#uv_ideas").show();
		$("#uv_loading").hide();
		$("#uv_ideas").append("<div class=\"idea-item\"><span class=\"title\"><a href=\""+result.suggestions[i].url+"\">"+result.suggestions[i].title+"</a></span>&nbsp;<span class=\"vote-count\">("+result.suggestions[i].vote_count+" votes)</span></div>");

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
