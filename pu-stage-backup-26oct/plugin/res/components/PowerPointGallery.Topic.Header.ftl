<#attempt>
<#if page.name=="ForumTopicPage" && page.context.message??>
    <#assign messageid=page.context.message.uniqueId />

    <#assign query="SELECT id, subject, post_time, current_revision.last_edit_time, kudos.sum(weight), replies.count(*), conversation.solved, metrics.views, author.login, author.rank.name, author.rank.icon_left, author.avatar.profile, author.view_href FROM messages WHERE id = '${messageid}'" />
    <#assign queryResult=restadmin("2.0", "/search?q=" + query?url("UTF-8")) />
    <#if queryResult.status=="success" && queryResult.data?? && queryResult.data?has_content && queryResult.data.items?? && queryResult.data.items?has_content>
        <#list queryResult.data.items as item>
            <#if item??>
                <#assign message=item />
            </#if>
        </#list>
    </#if>

    <#if message??>
        <#attempt>
            <#assign post_replies=message.replies.count />
        <#recover>
            <#assign post_replies=0 />
        </#attempt>
        <div class="lia-message-custom-heading">
            <div class="lia-message-subject">
                <div class="lia-quilt-column lia-quilt-column-20 lia-quilt-column-left">
                    <div class="lia-quilt-column-alley lia-quilt-column-alley-left">
                        <#if message.conversation.solved==true>
                            <span class="solved">
                                <img class="lia-img-message-type-solved lia-fa-message lia-fa-type lia-fa-solved" title="Solved!" alt="Accepted Solution" aria-label="Solved!" src="/skins/images/DAF0BA88C349E5CFA6457FA9A7F2F964/mondrian-439108329/images/message_type_solved.svg">
                            </span>
                        </#if>
                        <h1>${message.subject}</h1>
                        <p class="lia-message-dates lia-message-post-date lia-component-post-date-last-edited">
                            <span class="DateTime lia-message-posted-on lia-component-common-widget-date">
                                <span class="local-friendly-date">
                                    ${message.post_time?string('MM-dd-yyyy HH:mm a')}
                                </span>
                            </span>
                            <#if message.post_time?datetime!=message.current_revision.last_edit_time?number_to_datetime>
                                - last edited <span class="DateTime lia-message-edited-on lia-component-common-widget-date">
                                    <span class="local-friendly-date">
                                        ${message.current_revision.last_edit_time?number_to_datetime?string('MM-dd-yyyy HH:mm a')} 
                                    </span>
                                </span>
                            </#if>
                        </p>
                    </div>
                </div>
                <div class="lia-quilt-column lia-quilt-column-04 lia-quilt-column-right">
	                <div class="lia-quilt-column-alley lia-quilt-column-alley-right lia-column-message-options">
                    </div>
                </div>
            </div>
            <div class="lia-message-author lia-component-author">
                <div class="lia-message-author-avatar">
                    <div class="UserAvatar lia-user-avatar lia-component-common-widget-user-avatar">
                        <a class="UserAvatar lia-link-navigation" href="${message.author.view_href!'JavaScript:Void(0)'}">
                            <img class="lia-user-avatar-message" title="${message.author.login}" src="${message.author.avatar.profile}">
                        </a>
                    </div>
                </div>
                <div class="lia-message-author-username">
                    <span class="UserName lia-user-name lia-user-rank-Power-BI-Admin">
                    	<#if message.author.rank.icon_left??>
                        <img class="lia-user-rank-icon lia-user-rank-icon-left" title="${message.author.rank.name}" alt="${message.author.rank.name}" src="${message.author.rank.icon_left}">
                        </#if>
                        <a class="lia-link-navigation lia-page-link lia-user-name-link" href="${message.author.view_href!'JavaScript:Void(0)'}">
                            <span class="">${message.author.login}</span>
                        </a>
                    </span>
                </div>
                <div class="lia-message-author-rank">${message.author.rank.name}</div>
            </div>
            <div class="lia-message-metrics">
                <span class="lia-message-metrics-views">${message.metrics.views}&nbsp;Views</span>
                <div class="lia-social-share linkList linkList-horizontal">
                    <a href="http://www.linkedin.com/shareArticle?mini=true&url=${page.context.message.webUi.url}" class="social-share social-linkedin">
                        <img class="social-default" src="/html/assets/linkedin_blk.png" alt="LinkedIn" />
                        <img class="social-hover" src="/html/assets/linkedin_color.png" alt="LinkedIn" />
                    </a>
                    <a href="http://www.facebook.com/share.php?u=${page.context.message.webUi.url}" class="social-share social-facebook">
                        <img class="social-default" src="/html/assets/facebook_blk.png" alt="Facebook" />
                        <img class="social-hover" src="/html/assets/facebook_color.png" alt="Facebook" />
                    </a>
                    <a href="http://twitter.com/share?text=Check out this video: ${page.context.message.subject} %23PowerUsers %23PowerPointGallery&url=${page.context.message.webUi.url}" class="social-share social-twitter">
                        <img class="social-default" src="/html/assets/twitter_blk.png" alt="Twitter" />
                        <img class="social-hover" src="/html/assets/twitter_color.png" alt="Twitter" />
                    </a>
                </div>
                <div class="lia-message-metrics-kudos"></div>
            </div>
        </div>
		    
        <#-- Fetching Attachment ID from URL -->
        <#assign atID=http.request.parameters.name.get("attachment-id", "" )?js_string>
        <#if atID !="">
			<#-- CSS to bring document viewer into iFrame model -->
				<style>
					#lia-body.modal-open .lia-modal-window.lia-modal-window[window-top-class=lia-document-lightbox] .lia-lightbox-overlay {
						display:none !important;
					}
					#lia-body.modal-open .lia-modal-window.lia-modal-window[window-top-class=lia-document-lightbox] + .lia-modal-backdrop {
						display:none !important;
					}
					#lia-body.modal-open .lia-modal-window.lia-modal-window[window-top-class=lia-document-lightbox] .lia-lightbox-dialog{
						 position:static;
						 height:600px;
						 -webkit-transform: translate(0%, 0%);	
						 width:100%;
						 max-width: 100%;		 
					}
					#lia-body.modal-open .lia-modal-window.lia-modal-window[window-top-class=lia-document-lightbox] .modal-dialog{
						max-width: 1170px;
						padding-left: 15px;
						padding-right: 15px;
						padding-bottom: 10px;
						margin: 0 auto;
					}
					.modal{
						box-shadow:none
					}
					#lia-body.modal-open .lia-modal-window.lia-modal-window[window-top-class=lia-document-lightbox] .modal-content {
						box-shadow: none !important;
						border-radius: 0 !important;
					}
					.lia-component-common-widget-breadcrumb{
						margin-bottom:665px !important;
					}
					#lia-body.modal-open .lia-modal-window.lia-modal-window[window-top-class=lia-document-lightbox]{
						bottom:inherit
					}
					.lia-quilt-row-main {
						display:none;
					}
					.lia-document-title-location{
						display:none;
					}
					#lia-body.modal-open .lia-modal-window[window-top-class=lia-document-lightbox] .lia-lightbox-context{
						display:none !important;
					}
					#lia-body.modal-open .lia-modal-window[window-top-class=lia-document-lightbox] .lia-lightbox-header-wrapper{
					    display:none
					}
					#lia-body .lia-content .lia-quilt-column-14 {
						width: 58.333%;
						float: left;
						z-index: 9999;
						position: relative;
					}
					#lia-body.modal-open .lia-modal-window[window-top-class=lia-document-lightbox] .lia-lightbox-main-content-wrapper {
						max-height: calc(110% - 81px);
					}
					#lia-body.modal-open .lia-modal-window[window-top-class=lia-document-lightbox] {
						    position: absolute !important;
							top: 215px;
							max-width: 1170px !important;
							margin: 0 auto !important;
							z-index:99 !important;
							background: transparent;
					}
					#lia-body.modal-open .lia-modal-window {
							position: fixed;
							left: 0;
							width: 100%;
							z-index: 10;
							background-color: rgba(0,0,0,0.5);
							top: 65px;
					}
          #lia-body .lia-content .user-navigation-settings-drop-down {
						z-index: 9999;
					}
					@media (max-width: 800px){
						body, .lia-page {
							height: auto !important;
						}
						.lia-page {
							overflow-y: auto !important;
						}
					}
					@media (max-width: 480px){
							.modal-open .lia-page {
							position: static !important;
						}
					}
					
					@media screen and (min-width:0\0) and (min-resolution: +72dpi) {
						.lia-lightbox-dialog{
						   position:relative !important;
						   top:300px
						}
						.lia-modal-window.in .modal-dialog {
							overflow: hidden;
						}
					}
					
					
				</style>
		<#else>
		<style>
		.lia-quilt-row-main {
			display:none;
		}
		</style>
			
        </#if>
		

        <@liaAddScript>
            (function ($) {
                $('.lia-message-custom-heading .lia-message-metrics-kudos').append($('.first-message .lia-quilt-row-forum-message-footer .lia-message-kudos').html());
                $(".lia-message-custom-heading .lia-message-subject .lia-column-message-options").append($(".first-message .lia-message-heading .lia-quilt-column-alley-right .lia-message-options"));
				// $('#attachments .attachment-1').insertBefore('.lia-message-custom-heading').show();
				
				// Displaying ppt in separate header
				var attachmentHref = "";
				<#assign tid = (page.context.thread.topicMessage.uniqueId)!-1 />

				try{
					$.each($('.message-uid-${tid} #attachments .lia-link-navigation'),function(index,value){	
						
						if(value.innerText.toLowerCase().indexOf('.ppt') >= 0){
							
							attachmentHref = value.href;
							return false;
						}
					})
				} catch(e) {
				}
				
        /* Automatically reload to the attachment page to show ppt */
				if("${atID}"==""){

if(attachmentHref !="" && attachmentHref != undefined && (location.href.indexOf("lightbox")<0)) {
	location.href=attachmentHref;
} else {
	$(".lia-quilt-row-main").show();
	$('.ppt-load-msg').hide();
}
					
					
				} else {
					setTimeout(function(){ $('.ppt-load-msg').hide();
					$(".lia-quilt-row-main").show() }, 2000);

				} 				
            })(LITHIUM.jQuery);
			

						
        </@liaAddScript>

        <style>
			
            #lia-body .lia-content .lia-quilt-forum-topic-page-showcase .first-message .lia-quilt-column-main-left {
                display: none;
            }

            #lia-body .lia-content .lia-quilt-forum-topic-page-showcase .first-message .lia-message-heading {
                display: none;
            }

            #lia-body .lia-content .lia-quilt-forum-topic-page-showcase .first-message .lia-message-dates {
                display: none;
            }

            <#if post_replies gt 0>
            
            #lia-body .lia-content .lia-quilt-forum-topic-page-showcase .first-message .lia-message-view {
                padding-bottom: 35px;
            }

            #lia-body .lia-content .lia-quilt-forum-topic-page-showcase .first-message:after {
                content: "Comments";
                padding: 7px 7px 7px 10px;
                background-color: #eaeaea;
                display: block;
                font-size: 18px;
                line-height: 26px;
                font-family: 'wf_segoe-ui_semibold','HelevticaNeue-light','Helvetica Neue',Helvetica,Arial,sans-serif;
            }

            </#if >

<#-- ppt Gallery Topic Page CSS -->

			#lia-body .lia-content .lia-quilt-forum-topic-page-ppt-gallery .first-message .lia-quilt-column-main-left {
                display: none;
            }

            #lia-body .lia-content .lia-quilt-forum-topic-page-ppt-gallery .first-message .lia-message-heading {
                display: none;
            }

            #lia-body .lia-content .lia-quilt-forum-topic-page-ppt-gallery .first-message .lia-message-dates {
                display: none;
            }

            <#if post_replies gt 0>
            
            #lia-body .lia-content .lia-quilt-forum-topic-page-ppt-gallery .first-message .lia-message-view {
                padding-bottom: 35px;
            }

            #lia-body .lia-content .lia-quilt-forum-topic-page-ppt-gallery .first-message:after {
                content: "Comments";
                padding: 7px 7px 7px 10px;
                background-color: #eaeaea;
                display: block;
                font-size: 18px;
                line-height: 26px;
                font-family: 'wf_segoe-ui_semibold','HelevticaNeue-light','Helvetica Neue',Helvetica,Arial,sans-serif;
            }

            </#if >

			<#if skin.id == "powerapps_skin">
                #lia-body.modal-open .lia-modal-window[window-top-class=lia-document-lightbox] {
                            top: 500px !important;
                    }
            </#if>
		
        </style>
    </#if>
</#if>
<#recover>

</#attempt>
