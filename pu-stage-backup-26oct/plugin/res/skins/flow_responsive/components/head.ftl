<#-- ${settings.name.get("layout.urlfetcher_head")} -->
${settings.name.get("layout.urlfetcher_head_flow")} 
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="${asset.get("/html/assets/favicon.ico")}"/>
<@component id="Custom.Head.TwitterCardMeta" />
<style type="text/css">
body{
font-family: 'SegoeUI', 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}
</style>
<script type="text/javascript">
$( document ).ready(function() {
  $(".skip").click(function(event){
    var skipTo="#"+this.href.split('#')[1]; 
    $(skipTo).attr('tabindex', -1).on('blur focusout', function () {   
    $(this).removeAttr('tabindex');     	
    }).focus();	
    $("html, body").animate({
            scrollTop: 0
        }, 600);
  });
$(".lia-img-icon-idea-board.lia-fa-icon.lia-fa-idea").attr("title", "Idea");
$(".lia-img-icon-blog-board.lia-fa-icon.lia-fa-blog").attr("title", "Blog");
$(".ViewProfilePage .lia-view-all .lia-link-navigation").attr("aria-label", "Earned Badges list");
$(".lia-top-quilt > .lia-quilt-row-main").attr("id","skip_content");
	$(".lia-top-quilt > .lia-quilt-row-main").attr("role","main");
	$(".lia-search-input-message").attr("aria-label","Search the Community");
$(".TagCloudTaplet .view-all-link").attr("aria-label", "See All Top Tags");
$(".lia-component-ideas-widget-completed-ideas .view-all-link").attr("aria-label", "See All Completed Ideas");
$(".KudoedAuthorsLeaderboardTaplet .view-all-link").attr("aria-label", "See All Top Kudoed Authors");
$(".lia-component-kudos-widget-messages-leaderboard .view-all-link").attr("aria-label", "See All Top Kudod Posts");
$(".lia-component-tags-widget-tagger .tagging-leaderboard-link").attr("aria-label", "See All Top Taggers");
$(".lia-component-images-widget-gallery .view-all-link").attr("aria-label", "See All Photos");
$(".lia-component-tags-widget-my-tags .view-all-link").attr("aria-label", "See All Latest Tags");
$(".lia-component-kudos-widget-my-recent-kudos-to-users .small-text").attr("aria-label", "See All Kudos given to");
$(".lia-component-kudos-widget-my-recent-kudos-from-users .small-text").attr("aria-label", "See All Kudos from");
$(".lia-component-tags-widget-recently-tagged-messages .view-all-link").attr("aria-label", "See All Latest Tagged");
$(".lia-component-tags-widget-frequent-tagged-messages .view-all-link").attr("aria-label", "See All Top Tagged");
$(".lia-component-tags-widget-related-tag-cloud .view-all-link").attr("aria-label", "See All Related Tags");
$(".lia-component-tags-widget-leaderboard-messages-title .view-all-link").attr("aria-label", "See All Top Tagged Posts in Community Feedback");
$(".lia-component-tags-widget-leaderboard-messages-community-title .view-all-link").attr("aria-label", "See All Top Tagged Posts in the community");
$(".lia-component-tags-widget-leaderboard-title .tagging-leaderboard-link").attr("aria-label", "See All Top Taggers in the community");
$(".lia-component-tags-widget-leaderboard-title .tagging-leaderboard-link").attr("aria-label", "See All Top Taggers in Community Feedback");
$(".lia-component-tags-widget-leaderboard-community-title .tagging-leaderboard-link").attr("aria-label", "See All Top Taggers in Community");
$(".lia-component-groups-widget-group-members-view .view-all-link").attr("aria-label", "See All Members");
$(".lia-component-tkb-widget-top-contributors-taplet .view-all-link").attr("aria-label", "See All Top Contributors");
$(".MessageHistory .message-history-link").attr("aria-label", "See All Message History");
$(".lia-component-images-widget-gallery a.lia-link-navigation.view-all-link").attr("aria-label", "See All Photos");
$(".lia-component-users-widget-my-friends-by-request  .lia-link-navigation.small-text").attr("aria-label", "See All My friends")
$(".lia-component-forums-widget-recent-messages .view-all-link").attr("aria-label", "See All latest posts");
$(".lia-component-kudos-widget-my-recently-kudoed-messages .lia-link-navigation.small-text").attr("aria-label", "See All My Kudod posts");
$(".lia-component-kudos-widget-messages-recently-kudoed-by-user .lia-link-navigation.small-text").attr("aria-label", "See All Posts I Kudoed");
$(".lia-component-forums-widget-users-online .view-all-link").attr("aria-label", "See All Users Online");
$(".lia-component-solutions-widget-recently-solved-threads .view-all-link").attr("aria-label", "See All New Solutions");
$(".lia-component-tkb-widget-user-contributed-articles .lia-view-all a.lia-link-navigation").attr("aria-label", "See All My Knowledge Base Contributions");

	$("a.default-menu-option, .lia-menu-dropdown-items li a").keyup(function(e) {
	  if (e.keyCode === 27){
	  $("a.default-menu-option").attr("aria-expanded","false");  
	  $(".lia-menu-navigation-wrapper").removeClass("dropdownHover");
	  $(".default-menu-option").closest("ul").focus(); 
	  } 
	});
});

</script>