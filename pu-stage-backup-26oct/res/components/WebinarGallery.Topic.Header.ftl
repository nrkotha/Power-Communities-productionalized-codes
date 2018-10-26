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
                    <a href="http://twitter.com/share?text=Check out this video: ${page.context.message.subject} %23PowerUsers %23webinarGallery&url=${page.context.message.webUi.url}" class="social-share social-twitter">
                        <img class="social-default" src="/html/assets/twitter_blk.png" alt="Twitter" />
                        <img class="social-hover" src="/html/assets/twitter_color.png" alt="Twitter" />
                    </a>
                </div>
                <div class="lia-message-metrics-kudos"></div>
            </div>
        </div>

        <@liaAddScript>
            (function ($) {
                $('.lia-message-custom-heading .lia-message-metrics-kudos').append($('.first-message .lia-quilt-row-forum-message-footer .lia-message-kudos').html());
                $(".lia-message-custom-heading .lia-message-subject .lia-column-message-options").append($(".first-message .lia-message-heading .lia-quilt-column-alley-right .lia-message-options"));
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

<#-- Webinar Gallery Topic Page CSS -->

			#lia-body .lia-content .lia-quilt-forum-topic-page-webinar-gallery .first-message .lia-quilt-column-main-left {
                display: none;
            }

            #lia-body .lia-content .lia-quilt-forum-topic-page-webinar-gallery .first-message .lia-message-heading {
                display: none;
            }

            #lia-body .lia-content .lia-quilt-forum-topic-page-webinar-gallery .first-message .lia-message-dates {
                display: none;
            }

            <#if post_replies gt 0>
            
            #lia-body .lia-content .lia-quilt-forum-topic-page-webinar-gallery .first-message .lia-message-view {
                padding-bottom: 35px;
            }

            #lia-body .lia-content .lia-quilt-forum-topic-page-webinar-gallery .first-message:after {
                content: "Comments";
                padding: 7px 7px 7px 10px;
                background-color: #eaeaea;
                display: block;
                font-size: 18px;
                line-height: 26px;
                font-family: 'wf_segoe-ui_semibold','HelevticaNeue-light','Helvetica Neue',Helvetica,Arial,sans-serif;
            }

            </#if >
        </style>
    </#if>
</#if>