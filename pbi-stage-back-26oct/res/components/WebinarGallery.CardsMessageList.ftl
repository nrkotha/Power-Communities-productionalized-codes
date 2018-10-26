<#--

    Webinar Gallery: A Gallery where users can post webinars. 
    iTrack : MC – 13. 

 -->
<#--
 
    Description:

        This component is created to display grid structure of all the webinars posted to the board. 

    Activities:
        1. Displays grid structure of all webinars posted to the board.
        2. Has the functionality to filter the webinars through Labels.
        3. Has the functionality to filter the webinars through custom filters Featured, Top Kudos and Recently posted.          

-->
<#attempt>
<html>

<head>
<style> .lia-messages-message-card {float: left;} img.lia-card-image {
    width: 261px; height:173px;} .lia-messages-message-card-body {padding:10px}</style>

</head>
<#include "common_utils.ftl" />

<!-- Get list of random numbers without repeat -->
<#function getRandomList cant, max>
    <#if cant gt max>
        <#local cant=max>
    </#if>
    <#local nums=[] />
    <#list 1..cant as i>
        <#local num=random(1,max) />
        <#local added=false />
        <#if nums?seq_contains(num)==false>
            <#local nums=nums + [num] />
            <#local added=true />
        <#else>
            <#list 1..cant as x>
                <#local num=random(1,max) />
                <#if nums?seq_contains(num)==false>
                    <#local nums=nums + [num] />
                    <#local added=true />
                    <#break />
                </#if>
            </#list>
        </#if>
        <#if added==false>
            <#list 1..max as num>
                <#if nums?seq_contains(num)==false>
                    <#local nums=nums + [num] />
                    <#break />
                </#if>
            </#list>
        </#if>
    </#list>
    <#return nums>
</#function>

<!-- Get component parameters -->
<#if webuisupport.path.parameters.name.get("page")??>
    <#assign pageNumber=webuisupport.path.parameters.name.get("page", "1" )>
<#else>
    <#assign pageNumber=1 />
</#if>

<#attempt>
    <#if http.request.parameters.name.get("filter")??>
        <#assign filter=http.request.parameters.name.get("filter", "" )>
    <#else>
        <#assign filter="" />
    </#if>
<#recover>
    <#assign filter="" />
</#attempt>

<#attempt>
    <#if http.request.parameters.name.get("sortby")??>
        <#assign sortByAttr=http.request.parameters.name.get("sortby", "" )>
    <#else>
        <#assign sortByAttr="" />
    </#if>
<#recover>
    <#assign sortByAttr="" />
</#attempt>

<#attempt>
    <#if http.request.parameters.name.get("featured")??>
        <#assign featuredAttr=http.request.parameters.name.get("featured", "no" )>
    <#else>
        <#assign featuredAttr="no" />
    </#if>
<#recover>
    <#assign featuredAttr="no" />
</#attempt>

<#attempt>
    <#assign postsToDisplay=settings.name.get("layout.messages_per_page_linear")?number!16 />
<#recover>
    <#assign postsToDisplay=16 />
</#attempt>

<#assign sourceBoard=coreNode.id />

<#attempt>
    <#assign sortBy=env.context.component.getParameter("sortBy") />
<#recover>
    <#assign sortBy="" />
</#attempt>

<#attempt>
    <#assign sortDirection=env.context.component.getParameter("sortDirection") />
<#recover>
    <#assign sortDirection="DESC" />
</#attempt>

<#attempt>
    <#assign featured=env.context.component.getParameter("featured") />
<#recover>
    <#assign featured="featured" />
</#attempt>

<#attempt>
    <#assign filterEnabled=env.context.component.getParameter("filter") />
<#recover>
    <#assign filterEnabled="no" />
</#attempt>

<#attempt>
    <#assign preFilterBy=env.context.component.getParameter("preFilterBy") />
<#recover>
    <#assign preFilterBy="" />
</#attempt>

<!-- Clean parameters -->
<#if sourceBoard=="oxcrx34285"> <!-- for preview only -->
    <#assign sourceBoard="webinarGallery" />
</#if>

<#if sortDirection?has_content>
    <#assign sortDirection=sortDirection?upper_case />
<#else>
    <#assign sortDirection="DESC" />
</#if>

<#if sortByAttr?has_content>
    <#assign sortBy=sortByAttr?lower_case />
</#if>

<#if sortBy?has_content>
    <#assign sortBy=sortBy?lower_case />
<#else>
    <#assign sortBy="" />
</#if>

<#if featured?has_content>
    <#assign featured=featured?lower_case />
<#else>
    <#assign featured="featured" />
</#if>

<#if filterEnabled?has_content>
    <#assign filterEnabled=filterEnabled?lower_case />
<#else>
    <#assign filterEnabled="no" />
</#if>
<#-- commented as text keys are not used -->
<#--<#assign customNewMessageText="Custom." + sourceBoard + ".NewMessage.Text" />
<#assign newMessageText=text.format(customNewMessageText) />
<#if newMessageText==customNewMessageText>
    <#assign newMessageText="New Message" />
</#if>-->
<#-- commented as text keys are not used -->
<#--<#assign viewVideoText=text.format("Custom.CardsMessageList.ViewVideo.Text") />
<#if viewVideoText=="Custom.CardsMessageList.ViewVideo.Text">
    <#assign viewVideoText="View video" />
</#if>-->

<#assign kudosCssClass="" />
<#assign postdateCssClass="" />

<#switch sortBy>
    <#case "kudos">
        <#assign orderBy="kudos.sum(weight)" />
        <#assign kudosCssClass="selected" />
        <#break>
    <#case "postdate">
        <#assign orderBy="post_time" />
        <#assign postdateCssClass="selected" />
        <#break>
    <#case "random">
        <#assign orderBy="post_time" />
        <#break>
    <#default>
        <#assign orderBy="kudos.sum(weight)" />
        <#assign sortBy="" />
</#switch>

<#assign noOfPostsToDisplay=postsToDisplay?number />
<#assign noOfPostsToFetch=999999 />

<#assign featuredLabels=[] />
<#assign featuredPosts=[] />
<#assign labels=restadmin("/boards/id/${sourceBoard}/settings/name/label.predefined_labels").value />
<#list labels?split(",") as value>
    <#if value?trim?lower_case?contains(featured)==true>
        <#assign featuredLabels=featuredLabels + [value?trim] />
    </#if>
</#list>

<#assign liqlFeatured="AND labels.text in ('" + featuredLabels?join("', '") + "' )" />
<#assign query="SELECT id FROM messages WHERE board.id = '${sourceBoard}' AND depth=0 ${liqlFeatured} LIMIT ${noOfPostsToFetch}" />
<#assign queryResult=restadmin("2.0", "/search?q=" + query?url("UTF-8")) />
<#if queryResult.status=="success" && queryResult.data?? && queryResult.data?has_content && queryResult.data.items?? && queryResult.data.items?has_content>
    <#list queryResult.data.items as item>
        <#assign featuredPosts=featuredPosts + [item.id] />
    </#list>
</#if>

<#if filterEnabled=="yes">
    <#if preFilterBy?? && preFilterBy?has_content && preFilterBy?lower_case?trim==featured>
        <#if !sortBy?trim?has_content>
            <#assign featuredAttr="yes" />
        </#if>
        <#assign preFilterBy="none" />
    </#if>

    <#if filter?? && filter?has_content>
        <#assign filterBy=filter?lower_case?trim />
    <#else />
        <#if preFilterBy?? && preFilterBy?has_content>
            <#assign filterBy=preFilterBy?lower_case?trim />
        <#else />
            <#assign filterBy="none" />
        </#if>
    </#if>

    <#if filterBy != "none">
        <#assign liqlFilterBy="AND labels.text = '" + filterBy + "'" />
        <#assign filterByCssClass="selected" />
    <#else />
        <#assign liqlFilterBy="" />
        <#assign filterByCssClass="" />
    </#if>
        
    <#if featuredAttr == "yes" >                
        <#assign orderBy="kudos.sum(weight)" />

        <#assign featuredCssClass="selected" />
        <#assign kudosCssClass="" />
        <#assign postdateCssClass="" />
    <#else />
        <#assign featuredCssClass="" />
    </#if>

<div class="lia-component-custom-cards-message-header"> 
    <div class="lia-component-custom-cards-message-list-sort">
        <a href="#" class="button ${featuredCssClass}" id="cardsmessagelist_featured">
            <span class="icon icon-featured"></span>
            Featured
        </a>
        <a href="#" class="button ${kudosCssClass}" id="cardsmessagelist_topkudos">
            <span class="icon icon-top"></span>
            Top Kudos
        </a>
        <a href="#" class="button ${postdateCssClass}" id="cardsmessagelist_recentyposted">
            <span class="icon icon-recent"></span>
            Recently posted
        </a>
    </div>
    <div class="lia-component-custom-cards-message-list-filter">
        <select class="lia-filter-select ${filterByCssClass}" id="cardsmessagelist_filter" name="cardsmessagelist_filter">
            <option value="none">All messages</option>
            <#list labels?split(",") as value>
                <#if value?trim?lower_case?contains(featured) == false>
                    <#if value?lower_case?trim == filterBy>
                        <option value="${value?lower_case?trim}" selected>${value}</option>
                    <#else />
                        <option value="${value?lower_case?trim}">${value}</option>
                    </#if>
                </#if>
            </#list>
        </select>
    </div>
</div>
<#else />
    <#assign liqlFilterBy="" />
    <#assign featuredAttr="no" />
</#if>

<!-- Get post list -->
<#assign query="SELECT id, subject, view_href, kudos.sum(weight), author.view_href, author.login FROM messages WHERE board.id = '${sourceBoard}' AND depth=0 ${liqlFilterBy} ORDER BY ${orderBy} ${sortDirection} LIMIT ${noOfPostsToFetch}" />
<#assign queryResult=restadmin("2.0", "/search?q=" + query?url("UTF-8")) />
<#if queryResult.status=="success" && queryResult.data?? && queryResult.data?has_content && queryResult.data.items?? && queryResult.data.items?has_content>
    <#if featuredAttr == "yes" && featuredPosts?? && featuredPosts?has_content >
        <#assign featuredItems=[] />
        <#assign commonItems=[] />
        <#list queryResult.data.items as item>
            <#if featuredPosts?seq_index_of(item.id) gt -1>
                <#assign featuredItems=featuredItems + [item] />
            <#else />
                <#assign commonItems=commonItems + [item] />
            </#if>
        </#list>
        <#assign queryResultItems=featuredItems + commonItems />
    <#else />
        <#assign queryResultItems=queryResult.data.items />
    </#if>

    <#assign totalPosts=queryResultItems?size />
    
    <#if totalPosts gt 0>
        <#if sortBy !="random">
            <#assign postSorted=queryResultItems?chunk(noOfPostsToDisplay)[pageNumber-1] />
            <#else />
            <#assign posts=[] />
            <#assign randomArray=getRandomList(noOfPostsToDisplay, totalPosts) />
            <#list randomArray as i>
                <#assign posts=posts + [queryResultItems[i - 1]] />
            </#list>
            <#assign postSorted=posts />
        </#if>
    </#if>
</#if>

<!-- Build the messages list -->
<#if postSorted?? && postSorted?size gt 0>
    <div class="lia-component-custom-cards-message-list">
        <#list postSorted as post>
            <#if post??>
                <#attempt>
                    <#assign post_kudos=post.kudos.sum.weight />
                <#recover>
                    <#assign post_kudos=0 />
                </#attempt>
                <#attempt>
                    <#assign attachmentUrl=getAttachedImage(post.id) />
                <#recover>
                </#attempt>
                <#attempt>
                    <#assign image=restadmin("/messages/id/${post.id}/uploads/images/index/0").image />
                <#recover>
                </#attempt>
                <#if post.view_href?? && post.view_href?has_content >
                    <#assign view_href = post.view_href?keep_before("#")/>
                <#else />
                    <#assign view_href="" />
                </#if>

                <#if attachmentUrl?? && attachmentUrl?has_content>
                    <#assign post_image=attachmentUrl />
                <#else>
                    <#if image?? && image.url??>
                        <#assign post_image=image.url />
                        
                    <#else>
                        <#assign post_image="" />
                    </#if>
                </#if>

                <div class="lia-messages-message-card">
                    <div class="lia-messages-message-card-container">
                        <a href="${view_href}">
                            <div class="lia-messages-message-card-image-wrapper" text="View">
                                <#if post_image?has_content>
                                    <img src="${post_image}" class="lia-card-image" title="${post.subject}" alt="${post.subject}" style ="height:173;width:300;"/>
                                <#else>
                                    <img src="/html/assets/image_unavailable.png" class="lia-card-image" title="${post.subject}" alt="${post.subject}" height="173" width="300" />
                                </#if>
                            </div>
                            <div class="lia-messages-message-card-body">
                                <div class="message-subject lia-messages-message-subject">${post.subject}</div>
                                <div class="lia-message-stats-wrapper">
                                    <span class="lia-users-user-login UserName lia-user-name ng-isolate-scope">${post.author.login}</span>
                                    <div class="lia-message-stats ng-isolate-scope">
                                        <#if featuredPosts?seq_index_of(post.id) gt -1>
                                            <span class="lia-messages-message-featured lia-topic-stat-wrapper">
                                                <i class="lia-fa lia-fa-featured lia-message-stats-icon" title="featured"></i>
                                                <span class="lia-topic-featured lia-topic-stat ng-binding">Featured</span>
                                            </span>
                                        </#if>
                                        <span class="lia-messages-message-kudos-count lia-topic-stat-wrapper">
                                            <i class="lia-fa lia-fa-thumbs-up lia-message-stats-icon" title="kudos"></i>
                                            <span class="lia-topic-kudos-count lia-topic-stat ng-binding">${post_kudos}</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </#if>
        </#list>
    </div>
</#if>

<!-- Build the paging control -->
<#if sortBy !="random">
    <#if totalPosts?? && totalPosts gt 1>
        <#assign customPager=webuisupport.paging.pageableItem.setCurrentPageNumber(pageNumber?number).setItemsPerPage(noOfPostsToDisplay?number).setTotalItems(totalPosts?number).setPagingMode("enumerated").build />

        <div class="lia-component-custom-cards-message-list-paging">
            <@component id="common.widget.pager" pageableItem=customPager />
        </div>
    </#if>
</#if>

<@liaAddScript>
function updateUrlSearch(search, param, value) {
    var jsonSearch = search ?
        JSON.parse(
            '{"' + search.replace(/&/g, '","').replace(/=/g, '":"') + '"}',
            function (key, val) {
                return key === "" ? val : decodeURIComponent(val)
            }
        ) : {};

    if (value != "") {
        jsonSearch[param] = value;
    } else {
        delete jsonSearch[param];
    }

    return $.param(jsonSearch);
}

function getUrlSearch() {
    return window.location.search.substring(1).replace(/\+/g, ' ');
}

function updateUrlQuery(search) {
    var url = '${coreNode.webUi.url}';
    window.location = url + '?' + search;
}

(function ($) {
    $('#cardsmessagelist_filter').change(function () {
        var search = getUrlSearch();

        var filter = $('#cardsmessagelist_filter').val();
        search = updateUrlSearch(search, 'filter', filter);

        updateUrlQuery(search);
    });

    $('#cardsmessagelist_topkudos').click(function () {
        var search = getUrlSearch();

        event.preventDefault();
        search = updateUrlSearch(search, 'sortby', 'kudos');
        search = updateUrlSearch(search, 'featured', '');

        updateUrlQuery(search);
    });

    $('#cardsmessagelist_recentyposted').click(function () {
        var search = getUrlSearch();

        event.preventDefault();
        search = updateUrlSearch(search, 'sortby', 'postdate');
        search = updateUrlSearch(search, 'featured', '');

        updateUrlQuery(search);
    });

    $('#cardsmessagelist_featured').click(function () {
        var search = getUrlSearch();

        event.preventDefault();
        search = updateUrlSearch(search, 'featured', 'yes');
        search = updateUrlSearch(search, 'sortby', '');

        updateUrlQuery(search);
    });

    $('.lia-menu-bar .lia-button-primary span').html('Submit a Webinar');
    $('.lia-menu-bar .lia-paging-full').hide();
    $('.lia-component-custom-cards-message-header').append($('.lia-menu-bar-buttons'));
})(LITHIUM.jQuery);
</@liaAddScript>
</html>
<#recover>

</#attempt>