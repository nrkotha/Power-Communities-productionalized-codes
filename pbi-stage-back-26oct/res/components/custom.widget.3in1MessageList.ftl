<#include "common_utils.ftl" />

<#attempt>
    <#assign type=http.request.parameters.name.get("type")>
<#recover>
    <#assign type='' />
</#attempt>
<#-- No of post to display -->
<#assign sourceBoard=coreNode.id />
<#-- Navigation with default select option -->
<style>
.latestPostDateColumn, .messagePostDateColumn, .messageSubjectColumn .UserName .lia-user-rank-icon{
    display:none;
}
</style>
<div class="tabs-structure">
    <#if coreNode.nodeType == "community">
        <#assign baseURL = "/"/>

    <#elseif coreNode.nodeType == "category">
        <#assign baseURL = "/t5/xx/ct-p/"+coreNode.id/>
    <#else>
        <#assign baseURL = "/t5/xx/bd-p/"+coreNode.id/>
    </#if>


<a href="${baseURL}" class="forum-category-tabs ${(type=='')?string('custom-nav-selected','custom-nav-deseleceted')}" title="Recent posts">Recent</a>
<a href="${http.request.url?split('/page')[0]?split('?')[0]}?type=popular" class="forum-category-tabs ${(type=='popular')?string('custom-nav-selected','custom-nav-deseleceted')}" title="Most liked posts">Popular</a>
<a href="${http.request.url?split('/page')[0]?split('?')[0]}?type=trending" class="forum-category-tabs ${(type=='trending')?string('custom-nav-selected','custom-nav-deseleceted')}" title="Most liked posts in the last 60 days">Trending</a>
</div>
<#switch type>
    <#case "">
        <div>
            <#if page.name=="ForumPage">
        <#-- Loading recent message list (Lithium OOB) -->
        <@component id="menu-bar"/>
        <@component id="reply-filter"/>
        <@component id="PUG_RecentEvents-SingleCategory"/>
        <@component id="message-list"/>
        <@component id="paging"/>
        <#-- Loading pageination -->
        <#elseif page.name=="TkbPage">
    <@component id="menu-bar"/>
    <@component id="filtered-by"/>
    <@component id="message-list"/>
    <@component id="paging"/>
        <#else>

        </#if>
            <@liaAddScript>
                (function ($) {
                    try{
                        if($(".threadSubjectColumn")[0]!=undefined){
                             $('.MessageList  .thread-list table tbody tr').each(function(){
                                $(this).children(':last-child').children(':first-child').appendTo($(this).children('.threadSubjectColumn'));
                                $(this).children('.kudosCountColumn').after($(this).children('.repliesCountColumn'));
                            });

                        } else {
                            $('.lia-component-forums-widget-message-list table tbody tr').each(function(){

                                var authorDate = '<span class="local-time">by </span>'+ $(this).find('.messageAuthorColumn .UserProfileSummary .lia-user-name').html()+' '+$(this).find('.messagePostDateColumn').html();
                                $(this).children('.messageSubjectColumn').append(authorDate);
                                $(this).children('.kudosCountColumn').after($(this).children('.repliesCountColumn'));
                            });
                        }
                       
                    }catch(e){
                    }

                })(LITHIUM.jQuery);
            </@liaAddScript>

      </div>
        <#break>
    <#case 'popular'>
        <div>
        <#-- Loading popular message list (custom) -->
        <@component id="custom.widget.message-list" type="popular"/>
        </div>
        <#break>
    <#case 'trending'>
        <div>
       <#-- Loading popular message list (custom) -->
        <@component id="custom.widget.message-list" type="trending"/>
        </div>
        <#break>
    <#default>
        <#break>
</#switch>