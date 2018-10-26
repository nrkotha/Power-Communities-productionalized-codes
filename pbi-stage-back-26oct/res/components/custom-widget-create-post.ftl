<#assign commonData = coreNode.settings.name.get("customcontent.3_text")!""/>
<#if commonData =="">
	<#assign commonData  = {}/>
<#else>
<#attempt>
	<#assign commonData  = commonData?eval/>
<#recover>
</#attempt>
</#if>
<#assign enablePostButton = false/>

<#if page.name == "ForumPage" || page.name == "ForumTopicPage">
	<#assign postURL = "/t5/forums/postpage/board-id/${coreNode.id}"/>
	<#if coreNode.permissions.hasPermission("create_thread")>
    	<#assign enablePostButton = true/>
	</#if>
<#elseif page.name == "TkbPage" || page.name == "TkbArticlePage">
	<#assign postURL = "/t5/tkb/choosetemplatepage/board-id/${coreNode.id}"/>
	<#if coreNode.permissions.hasPermission("administer_article") || coreNode.permissions.hasPermission("save_unpublished_article")>
    	<#assign enablePostButton = true/>
	</#if>
<#elseif page.name == "IdeaExchangePage" || page.name == "IdeaPage ">
	<#if coreNode.permissions.hasPermission("create_idea_thread")>
    	<#assign enablePostButton = true/>
	</#if>
	<#assign postURL = "/t5/forums/postpage/board-id/${coreNode.id}"/>
<#else>
</#if>
<#if enablePostButton>
	<div class="custom-create-post">
		<a href="${postURL}"><#attempt>${(commonData.postButtonText??)?then(commonData.postButtonText,"Write a post")}<#recover>Write a post</#attempt></a>
	</div>
<#else>
	<#if page.name != "TkbPage" && page.name != "TkbArticlePage">
		<div class="custom-create-post">
			<a href="JavaScript:Void(0)" class="lia-button lia-button-primary lia-link-disabled"><#attempt>${(commonData.postButtonText??)?then(commonData.postButtonText,"Write a post")}<#recover>Write a post</#attempt></a>
		</div>
	</#if>
</#if>
<#attempt>
<#-- Adding author avatar to starting of the post -->
<#function authorAvatarHTML msz>
	<#return '<div class="lia-message-author-avatar"><div class="UserAvatar lia-user-avatar lia-component-common-widget-user-avatar"><a class="UserAvatar lia-link-navigation" target="_self" href="${msz.author.view_href}"><img class="lia-user-avatar-message" title="${msz.author.login}" alt="${msz.author.login}" src="${msz.author.avatar.message}"></a><div></div><div class="lia-message-author-rank">${msz.author.rank.name?js_string}</div>'?js_string/>
</#function>

<#-- Adding Avater to Posts -->
<#if page.context.thread.topicMessage.uniqueId?? && page.context.thread.topicMessage.uniqueId gt 0 && (page.name == "TkbArticlePage" || page.name == "IdeaPage")>
	<#assign authorAvatars = '['/>

	<#assign authorQuery = "SELECT conversation.messages_count,topic.id,topic.author.login,topic.author.avatar,topic.author.view_href,topic.author.rank,id,author.login,author.avatar,author.view_href,author.rank FROM messages WHERE parent.id='${page.context.thread.topicMessage.uniqueId}' LIMIT 2000"/>
	<#assign queryResult = rest("2.0", "/search?q=" + authorQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
	<#if (queryResult?size > 0)>
		<#if page.name != "IdeaPage">
			<#assign authorAvatars = authorAvatars + '{"id":"${queryResult[0].topic.id}","authorHTML":"${authorAvatarHTML(queryResult[0].topic)}"}'/>
		</#if>

		<#list queryResult as msz_l>
			<#if authorAvatars != "[">
				<#assign authorAvatars = authorAvatars + ','/>
			</#if>
			<#assign authorAvatars = authorAvatars + '{"id":"${msz_l.id}","authorHTML":"${authorAvatarHTML(msz_l)}"}'/>
		</#list>
	</#if>
	<#assign authorAvatars = authorAvatars+']'/>
	<@liaAddScript>
	;(function($){
	$(".lia-accepted-solutions-header .lia-section-header-title").text($(".lia-accepted-solutions-header .lia-section-header-title").text()+" ("+$('.lia-accepted-solutions-header').nextUntil('.lia-replies-header').length+")");
		
		/* Adding Avatar and Rank to authors */
		var authorAvatars = ${authorAvatars};
		$.each(authorAvatars,function(index,msz){
		<#if page.name == "IdeaPage">
				/* Add avatar */
				$("div.message-uid-"+msz.id+" .lia-message-author").prepend(msz.authorHTML);

				/* Change Rank position */
				$("div.message-uid-"+msz.id+" .lia-message-author").append($("div.message-uid-"+msz.id+" .UserName:eq(0)>.lia-user-rank-icon:eq(0)"))
		<#else>
			$("div.message-uid-"+msz.id+" .lia-message-author").prepend(msz.authorHTML);
			</#if>
		})
		<#if page.name == "IdeaPage">
			/* Change Rank position */
			$("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-author").append($("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-author .UserName:eq(0)>.lia-user-rank-icon:eq(0)"))
/* Change subject position */
$("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-subject-status").insertAfter($("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-author"));
$("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-subject").insertAfter($("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-author"));
		</#if>
	})(LITHIUM.jQuery);
	</@liaAddScript>
</#if>



<#-- Adding Reply count -->
<#if page.context.thread.topicMessage.uniqueId?? && page.context.thread.topicMessage.uniqueId gt 0>
	<#assign replyCountQuery = "SELECT replies.count(*) FROM messages WHERE id = '${page.context.thread.topicMessage.uniqueId}' "/>
	<#assign queryResult = rest("2.0", "/search?q=" + replyCountQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
	<#if (queryResult?size > 0)>
		<#assign replyCount = queryResult[0].replies.count/>
		<@liaAddScript>
		;(function($){
			/* All Replies Count */
			if(location.href.indexOf("/page/")<0 && $(".lia-panel-message-root")[0]!=undefined){
				var replyHTML = '<div class="custom-reply">${replyCount} Replies</div>';

				$("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-kudos").after(replyHTML);
				$("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-button.lia-button-secondary.reply-action-link.lia-action-reply").clone().appendTo(".custom-reply");
				if($("div.lia-replies-header .lia-section-header-title")[0] != undefined) {
					$("div.lia-replies-header .lia-section-header-title").text("All Replies (${replyCount})")
				} else {
					$(".lia-linear-display-message-view:eq(0)").after('<div class="lia-section-header section-header section-answer lia-replies-header"><br><span class="lia-section-header-title section-header">All Replies (${replyCount})</span></div>')
				}
			}
		})(LITHIUM.jQuery);
		</@liaAddScript>
	</#if>
	<#if page.name == "ForumTopicPage">
	<@liaAddScript>
		;(function($){
			$.each(document.querySelectorAll("div.lia-linear-display-message-view"),function(index,mainDiv){
				$.each(mainDiv.querySelectorAll("div[data-message-id]"),function(index,element){

					var postDateUser = element.querySelector('.lia-message-post-date .lia-user-name .lia-page-link.lia-user-name-link');
					$(element).find('.lia-message-post-date .lia-user-name').prepend(postDateUser);

		 			var dateEle = element.querySelector('.lia-message-post-date');
					$(element).find(' .lia-message-author .lia-message-author-username .lia-user-name-link').after(dateEle); 
					/* Unhide postdate after re arrangement */
					$(".lia-message-post-date").css("display","inline-block");
					/* var rankEle = element.querySelector('.lia-message-author .lia-link-navigation.lia-page-link.lia-user-name-link');
					$(element).find(' .lia-message-author .lia-message-author-username').prepend(rankEle); */

					/* Change Rank position */
					$(element).find(".lia-message-author .UserName:eq(0)").append($(element).find(".lia-message-author .UserName:eq(0)>.lia-user-rank-icon:eq(0)"))


					/* Adding kudos classs for like and helpful */
					if($(element).find('.solution')[0]  != undefined){
						$(element).find(".lia-button-group").addClass("custom-button-image-kudos-solved");
					}  

		});
		}); 

		/* $(".lia-link-navigation.kudos-link.lia-link-ticket-post-action").on("click",function(){
			$.each(document.querySelectorAll("div.lia-linear-display-message-view"),function(index,mainDiv){
				$.each(mainDiv.querySelectorAll("div[data-message-id]"),function(index,element){
					if($(element).find('.solution')[0]  != undefined){
						$(element).find(".lia-button-group").addClass("custom-button-image-kudos-solved")

					}  
				});
			}); 

		}); */

		
		

		$("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-actions .lia-button-group").append($(".lia-rating-metoo"));
		$(".lia-rating-metoo").css("display","inline-block");

		/* MC-202: Setting alignment of group buttons on quick reply */
        $('form.lia-message-quick-reply input.lia-button-Submit-action').bind("click", function(e){
		var setTimer = setInterval(function(){ 
			if(document.querySelectorAll(".InfoMessage").length>0){
				
				try {
					if($("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-actions .lia-button-group .lia-rating-metoo").length == 0) {
						$("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-actions .lia-button-group").append($(".lia-rating-metoo"));
					}

					/* Re-adding reply button */
					if(document.querySelectorAll(".custom-reply").length == 0){
						var replyHTML = '<div class="custom-reply">${replyCount} Replies</div>';

						$("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-message-kudos").after(replyHTML);
						$("div.message-uid-"+"${page.context.thread.topicMessage.uniqueId}"+" .lia-button.lia-button-secondary.reply-action-link.lia-action-reply").clone().appendTo(".custom-reply");
					}

				} catch(e) {

				}
				$(".lia-rating-metoo").css("display","inline-block");
				clearInterval(setTimer);

			}

		 }, 100);

	        	
	    });
		
		$( document ).ready(function() {
		console.log('inside load: '+$(".lia-action-quick-reply").length);
			if ($(".lia-action-quick-reply").length == 0) {
				console.log('length is zero');
				$(".lia-action-reply").css("right", "33px");
			}
		});

        


	})(LITHIUM.jQuery);
	</@liaAddScript>
	</#if>

</#if>
<#recover>

</#attempt>
