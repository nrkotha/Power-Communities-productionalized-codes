<#--
    UI enhancement for Idea Exchange Page. 
    iTrack :MC – 7. 

 -->
<#--
 
    Description: 
        This component is created for :
          1. Attaching author image and author details to the Status text in Idea Page. 
-->
<#-- Get ThreadId from the page. -->
<#assign articleId = ""/>
<#if  page.context.thread??  && page.context.thread.topicMessage.uniqueId gt 0>
  <#assign articleId = page.context.thread.topicMessage.uniqueId />
</#if>
<#if articleId?string != "">
	<style>
		 /* Setting default CSS for all Statuses */
		.comment-status-bar .MessageStatus.lia-status .message-status-link
		{
			font-weight: normal;
			text-decoration: none;
			color: white;
			font-size: 11px;
			padding: 2px 5px 2px 5px;
			text-shadow: rgba(0,0,0,0.25) 0 1px 1px;
			text-transform: uppercase;
		}
	  /* Setting default CSS for all Statuses on hover */
		.comment-status-bar .MessageStatus.lia-status a.message-status-link:hover {
			color: white !important;
			text-decoration: none !important;
		}

		.MessageStatus.lia-status {
		  font-weight:normal;
		}
	  
	  /* Setting CSS for authorAvatar */
		span.MessageStatus.lia-status img {
			height: 20px;
			width: 26px;
			margin-bottom: -6px;
		}
	  /* Hiding duplicate status */
		.lia-message-heading span.lia-message-subject-status {
		display: none;
		}
	  /* Reducing Font-weight to normal */ 
	  .status-comment-body p {
		font-weight: normal;
		}  
          select,option {
          font-size: 14px !important;
          font-weight: normal !important; 
          }

	</style>
	<#assign messageCall = restadmin("/threads/id/${articleId}?page_size=1000").thread/>
	<#assign linearObj = messageCall.messages.linear.message/>
	<#assign gtTime= ""/>
	<#assign author= ""/>
	<#--Gathering the required information from the API response. -->
	<#list linearObj as item>
		<#if item.subject?contains("Status changed to")>
		  <#if gtTime == "">
			<#assign gtTime = item.post_time/>
			<#assign author = item.author/>
		  <#else>
			<#if item.post_time?datetime('iso') gt gtTime?datetime('iso')>
			  <#assign gtTime = item.post_time/>
			  <#assign author = item.author/>
			</#if>
		  </#if>
		</#if>
	</#list>
	<#if author?has_content>
	  <#assign query="SELECT * FROM users WHERE login = '${author.login}'"/>
	  <#assign authorCall=restadmin("2.0", "/search?q=" + query?url("UTF-8")) />    
	  <#assign author = authorCall.data.items[0]/>
	</#if>
		<@liaAddScript>
		(function ($) {
			try{
				/* Removing Satus text in Status comment division. */
				$('.comment-status-bar .MessageStatus.lia-status:contains("Status:")').each(function(){
				$(this).html($(this).html().split("Status:").join(""));
				});
			
				/* Displaying Avathar */
			  
				<#if author?has_content>

                             if($(".message-uid-${articleId} .status-comment-body").text().length) {
                                var appendHtml= $(".message-uid-${articleId} .status-comment-body").html();
	                        appendHtml= "<div class='ideaexchange_body'><a href='${author.view_href}'><img src='${author.avatar.message}' class='lia-user-avatar-message' title='${author.login}'/></a>"+"<a href='${author.view_href}'>${author.login}</a> <label>on ${gtTime?datetime("yyyy-MM-dd'T'HH:mm:ss'+00:00'")?string["MM/dd/yyyy, HH:mm a"]?replace(","," at")}</label><span>${author.rank.name?js_string}</span>"+appendHtml+"</div>";
$(".message-uid-${articleId} .status-comment-body").html(appendHtml);

					
			 /*if($(".message-uid-${articleId} .status-comment-body").text().length) {

					
$(".message-uid-${articleId} .status-comment-body").prepend('<a href="${author.view_href}">${author.login} (${author.rank.name?js_string})</a>');
$(".message-uid-${articleId} .status-comment-body").prepend('<a href="${author.view_href}"><img src="${author.avatar.message}" title="${author.login}" class="idea_post_avatar"/></a>');*/

					
				}
				</#if>
			} catch(e) {
				
			}
		
		})(LITHIUM.jQuery);
	</@liaAddScript>
	<#-- Cloning Sucscribe and unubscribe buttons -->
<@liaAddScript>
   (function ($) {
 try{
 $('.AddThis.lia-component-external-widget-add-this').detach().insertAfter(".message-uid-${articleId} .lia-message-actions");
    $( ".lia-component-subscriptions-action-add-thread-user-email" ).text("Follow").clone().insertAfter( ".message-uid-${articleId} .lia-message-actions" );

$( ".lia-component-subscriptions-action-remove-thread-user-email" ).text("Unfollow").clone().insertAfter( ".message-uid-${articleId} .lia-message-actions" );
 }catch(e){

}
  })(LITHIUM.jQuery);
</@liaAddScript>
</#if>

