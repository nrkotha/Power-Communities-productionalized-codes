<#include "common_utils.ftl" />
<#assign commonData = coreNode.settings.name.get("customcontent.3_text")!""/>
<#if commonData =="">
    <#assign commonData  = {}/>
<#else>
<#attempt>
    <#assign commonData  = commonData?eval/>
<#recover>
</#attempt>
</#if>
<style>
.custom-gallery-message-card-image-wrapper{
position: relative;

}
#lia-body .lia-content .custom-gallery-showcase a.custom-gallery-image-ancor:hover .custom-gallery-message-card-image-wrapper:after {
    content: attr(text);
    position: absolute;
    width: 100%;
    height: 100%;
    padding-top: 25%;
    background: rgba(0,0,0,0.5);
    color: #fff;
    font-size: 24px;
    text-align: center;
    font-weight: 600;
   top:0;
}
</style>
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
    <#assign sourceBoard="PBIShowcase" />
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

<#assign customNewMessageText="Custom." + sourceBoard + ".NewMessage.Text" />
<#assign newMessageText=text.format(customNewMessageText) />
<#if newMessageText==customNewMessageText>
    <#assign newMessageText="New Message" />
</#if>

<#assign viewReportText=text.format("Custom.CardsMessageList.ViewReport.Text") />
<#if viewReportText=="Custom.CardsMessageList.ViewReport.Text">
    <#assign viewReportText="View report" />
</#if>

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
            Featured
        </a>
        <a href="#" class="button ${kudosCssClass}" id="cardsmessagelist_topkudos">
            Popular
        </a>
        <a href="#" class="button ${postdateCssClass}" id="cardsmessagelist_recentyposted">
            Recent
        </a>
    </div>
    <div class="lia-component-custom-cards-message-list-filter">
        <select class="lia-filter-select ${filterByCssClass}" id="cardsmessagelist_filter" name="cardsmessagelist_filter" style="width:130px;">
            <#if skin.id == "power_bi_redesign">
            <option value="none">Category</option>
            <#else>
            <option value="none">${text.format("menubar.button.options")}</option>
            </#if>
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
<#assign query="SELECT id, subject, view_href, kudos.sum(weight), author.view_href, author.login, conversation.messages_count, metrics.views FROM messages WHERE board.id = '${sourceBoard}' AND depth=0 ${liqlFilterBy} ORDER BY ${orderBy} ${sortDirection} LIMIT ${noOfPostsToFetch}" />
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
    <div class="custom-gallery-showcase">
        <article id="datastories" class=""> <!-- container -->
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
                    
                    <#if post.view_href?? && post.view_href?has_content >
                        <#assign view_href = post.view_href?keep_before("#")/>
                    <#else />
                        <#assign view_href="" />
                    </#if>

                    <#if attachmentUrl?? && attachmentUrl?has_content>
                        <#assign post_image=attachmentUrl />
                    <#else>
                        <#attempt>
                            <#assign image=restadmin("/messages/id/${post.id}/uploads/images/index/0").image />
                            <#assign post_image=image.url />
                        <#recover>
                            <#assign post_image="${asset.get('/html/assets/image_unavailable.png')}" />

                        </#attempt>
                        
                    </#if>
                    
                    <article class="col-md-3 last-ele">
                        
                            <div class="cmBlog-Widget">
							<a tabindex="-1" class="custom-gallery-image-ancor" href="${view_href}" >
                               <div class="bg-communityBlog" >
                                    <figure class="mask-copy">
                  <div class="custom-gallery-message-card-image-wrapper" text='<#attempt>${(commonData.galleryViewCardText??)?then(commonData.galleryViewCardText,"View report")}<#recover>View report</#attempt>'>
                        <#attempt>
                  
                                        <img class="bitmap" src="${post_image}">
                         <#recover>
                                        <img class="bitmap" src="${asset.get('/html/assets/image_unavailable.png')}">

                        </#attempt>
                    </div>
                                    </figure>
                                   
                                </div>
								 </a>
								 <div class="data-user-info">
                                        <span ><a class="data-info" href="${view_href}" >${post.subject}</a></span>
                                        <a href="${post.author.view_href}"><span class="username">by</span> ${post.author.login}</a>
                                    </div>
                                <hr class="line"/>
                                <div class="layer-img">
                                    <figure>  
                                        <img class="layer" src="${asset.get('/html/assets/likes.png')}">
                                        <span>
                                            ${post_kudos}
                                        </span>
                                    </figure> 
                                    <figure>  
                                        <img class="layer" src="${asset.get('/html/assets/comments.png')}">
                                        <span>${post.conversation.messages_count-1}</span>
                                    </figure> 
                                    <figure>  
                                        <img class="layer" src="${asset.get('/html/assets/views.png')}">
                                        <span>${post.metrics.views}</span>
                                    </figure> 
                                    <div style="clear:both"></div>
                                </div>
                            </div>
                       
                    </article>
                </#if>
            </#list>
        </article>
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

    $('.lia-menu-bar .lia-button-primary span').html('${newMessageText}');
    $('.lia-menu-bar .lia-paging-full').hide();
    $('.lia-component-custom-cards-message-header').append($('.lia-menu-bar-buttons'));
  //  $('.lia-component-common-widget-breadcrumb').append($('.lia-menu-bar-buttons .lia-button-wrapper.lia-button-wrapper-primary'));
})(LITHIUM.jQuery);
</@liaAddScript>