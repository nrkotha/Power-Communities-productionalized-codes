  <#assign limit = env.context.component.getParameter("limit")!"4" />
<style type="text/css">
.uv_card_ideas .cmBlog-Widget {
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.04);
    border: solid 1px #ccc;
    height: 219px;
}
#topIdeas #uv_card_ideas .tag-bg span{
font-size:15px;
}
.comments_iconsc img{
padding-top:2px;
}
.lia-quilt-layout-community-home-2017sr .lia-panel.lia-panel-standard.Chrome.custom-uservoice-top-ideas.top-ideacard {
    padding: 0;
}
.custom-uservoice-top-ideas.top-ideacard article#topIdeas article.topHead {
    border-bottom: 0px solid #eaeaea;
    padding-bottom: 0px;
}
.uv_card_ideas .tag-bg{
margin-top:4px;
}
.uv_card_ideas .line {
    border-top: 1px solid #e6e6e6;
    margin: 0;
}
.uv_card_ideas .col-md-4:nth-child(3n) {
    margin-right: 0;
}
.uv_card_ideas .col-md-4{
width: 370px;
    margin-right: 30px;
margin-bottom:24px;
}
.uv_card_ideas .layer-img figure {
    margin: 0;
    float: left;
    margin-right: 21px;
padding-top:4px;
}
.uv_card_ideas .bg-communityBlog {
    padding: 32px 24px 0 24px;
}
.uv_card_ideas .bg-communityBlog .user-profile, 
.uv_card_ideas .bg-communityBlog .user-info {
    float: left;
}
#uv_card_ideas .layer-img figure span{
color: #2b2b2b;
}
.uv_card_ideas .bitmap {
    width: 36px;
    height: 36px;
    border-radius: 50px;
    margin-right: 12px;
}

.uv_card_ideas .username {
    width: 65px;
    height: 20px;
    font-size: 15px;
    color: #855d0c;
}
.uv_card_ideas .date-posted {
    width: 79px;
    height: 20px;
    letter-spacing: normal;
    color: #767676;
    font-size: 15px;
}
#lia-body .uv_card_ideas .text-Analytics-in-Po {
    margin: 24px 0;
}
#lia-body .uv_card_ideas .text-Analytics-in-Po a {
    color: #2b2b2b !important;
    font-weight: 400;
    width: 310px;
    display: block;
    display: -webkit-box;
    max-width: 100%;
    height: 2.4em;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 18px;
}
.uv_card_ideas .layer-img {
    padding: 5px 0 15px 20px !important;
}
.uv_card_ideas.layer-img figure {
    float: left;
    margin-right: 21px;
}
@media (max-width: 1120px)
{
.uv_card_ideas .col-md-4 {
    width: 33%;
    float: left;
    margin-right: 0px;
}

.custom-uservoice-top-ideas.top-ideacard .lia-panel-content {
    padding: 0;
}
}
@media (max-width: 930px)
{
.uv_card_ideas .layer-img figure {
    
    margin-right: 10px;
}
}
@media (max-width: 768px){

.uv_card_ideas [class*="col-"] {
    padding-left: 15px !important;
    padding-right: 15px !important;
}
.lia-quilt-layout-community-home-2017sr .lia-panel.lia-panel-standard.Chrome.custom-uservoice-top-ideas.top-ideacard {
    padding: 0 15px;
}
.uv_card_ideas .col-md-4 {
    width: 50%;
    float: left;
    margin-right: 0px;
}
}
@media (max-width: 690px){

.uv_card_ideas .layer-img {
    padding: 5px 0 15px 12px !important;
}
.custom-uservoice-top-ideas.top-ideacard article#topIdeas article.topHead {  
    margin-left: 15px;
    margin-right: 15px;
}
.lia-panel.lia-panel-standard.Chrome.custom-uservoice-top-ideas.top-ideacard .uv_card_ideas [class*="col-"] {
    padding-left: 15px !important;
    padding-right: 15px !important;
}
.lia-panel.lia-panel-standard.Chrome.custom-uservoice-top-ideas.top-ideacard{
padding:0 !important;
}
.custom-uservoice-top-ideas .topHead col-md-6{
width:100%;
}
}
@media (max-width: 560px){
.uv_card_ideas .col-md-4 {
    width: 100%;
    float: left;
    margin-right: 0px;
}
.custom-uservoice-top-ideas.top-ideacard #topIdeas .view-all{
float:right;
}
}
</style>
<@liaAddScript>
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [month, day, year].join('-');
}

LITHIUM.jQuery.ajax({
	url: "//powerbi.uservoice.com/api/v1/forums/265200/suggestions.json?client=GZU4N2lErc9TuKoCkWTvA",
	dataType: "jsonp"
}).done(function (result) {
	console.log("done");
  var limit = Number("${limit}");
  if(limit > result.suggestions.length){
    limit = result.suggestions.length;
  }
  
	for (i = 0; i < limit; i++){
		$("#uv_card_ideas").show();
		$("#uv_card_loading").hide();
    var ideItem = result.suggestions[i];
    var statusColor = "transparent";
        statusText = "";
    if(ideItem.status != null){
        statusColor = ideItem.status.hex_color;
        statusText = ideItem.status.name;
    }
    
/* The vote_count parameter is changed to supporters_count by iTalent team as part of iTrack MC-361 */
		$("#uv_card_ideas").append('<article class="col-md-4 col-sm-4 col-xs-12"><div class="cmBlog-Widget"><div class="bg-communityBlog"><figure class="user-profile"><img class="bitmap" alt="'+ideItem.creator.name+'" title="'+ideItem.creator.name+'" src="'+ideItem.creator.avatar_url+'"></figure><div class="user-info"><a href="'+ideItem.creator.url+'"><span class="username">'+ideItem.creator.name+'</span></a><br/><span class="date-posted">'+formatDate(ideItem.created_at)+'</span></div><div style="clear:both"></div><p class="text-Analytics-in-Po"><a href="'+ideItem.url+'">'+ideItem.title+'</a></p></div><hr class="line"/><div class="layer-img"><figure><img class="layer" alt="likes" src="${asset.get("/html/assets/likes.png")}"><span>'+ideItem.supporters_count+'</span></figure><figure class="comments_iconsc"><img class="layer" alt="comments" src="${asset.get("/html/assets/comments.png")}"><span>'+ideItem.comments_count+'</span></figure><span class="tag-bg" style="background-color:'+statusColor+'"><span class="-new">'+statusText+'</span></span><div style="clear:both"></div></div></div></article>');
  }
    $("#uservoiceCardCount").text("("+result.response_data.total_records+")");
}).fail(function (jqXHR, textStatus) {
	$("#uv_card_ideas").append("<p>Error fetching ideas</p>");
	$("#uv_card_ideas").show();
	$("#uv_card_loading").hide();
	console.log(textStatus);
});
</@liaAddScript>
<#include "common_utils.ftl" />
<@generateComponentContent componentTitle="" className="custom-uservoice-top-ideas top-ideacard" >
<!-- <div class="custom-uservoice-top-ideas"> -->
<article id="topIdeas" class=""> <!-- container -->
    <article class="topHead">
        <div class="col-md-8">
          <div>
            <h2 class="top-ideas">Top Ideas <span class="layer" id="uservoiceCardCount"></span></h2>
          </div>
        </div>
        <div class="col-md-4">
           <div class="view-all">
             <h2><a href="https://ideas.powerbi.com/forums/265200-power-bi-ideas/filters/top">View All</a></h2>
           </div>
        </div>
        <div style="clear:both"></div>
    </article>
    <div id="uv_card_loading" style="display:block"><img src="${skin.images.feedback_loading.url}" /></div>
    <div id="uv_card_ideas" style="display:none" class="uv_card_ideas"></div>
</article>
<!--</div> -->
</@generateComponentContent>
