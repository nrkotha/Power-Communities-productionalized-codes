<#include "common_utils.ftl" />

<@generateComponentContent componentTitle="" className="custom-community-help" >
<!-- <div class="custom-community-help"> -->
<div >
<section id="bg-widgets">
   <article class=""> <!-- Container -->
      <div class="col-md-4" >
      <div class="inner-widget">
      <!-- <figure>
        <img src="${asset.get("/html/assets/ask-a-question.png")}"/>
      </figure> -->
      <#if user.anonymous>
          <h3 class="welcome">Welcome</h3>
      <#else>
          <h3 class="welcome">Welcome, ${user.login}</h3>
      </#if>
      <p class="bg-widgets-para">Connect, learn and discuss with business intelligence experts and peers.</p>
      <div class="take-the-tour"><a target="_blank" href="https://powerbi.microsoft.com/en-us/guided-learning/#">Take the tour </a></div>
    </div>
    </div>
    <div class="col-md-4">
      <div class="inner-widget">
      <!-- <figure>
        <img src="${asset.get("/html/assets/get-started.png")}"/>
      </figure> -->
      <h3>Ask a question</h3>
<@component id="custom.widget.search" showAdvance="false"/>
      <#-- <@component id="common.widget.search-bar" defaultToCommunity="true" showAdvancedSearchLink="false" hideGranularity="true"/>  -->
       <img class="searchIcon" src="/html/assets/search.png"/>
    </div>
    </div>
    
    <div class="col-md-4">
     <div class="inner-widget">
      <#assign onlineQuery = "SELECT count(*) FROM users WHERE online_status = 'online'"/>
      <#assign onlineCount=restadmin("2.0", "/search?q=" + onlineQuery?url("UTF-8")).data.count/>
      <span>Users online (${onlineCount})</span>
      <@component id="users.widget.users-avatars-online" />
      <div id="online-Info">
         <#assign basePath = ""/>
       <#if coreNode.nodeType =="category">
        <#assign basePath = "/categories/id/"+coreNode.id/>
       </#if>
       <#assign solCount = restadmin("${basePath}/solutions/count").value/>
       <#assign postCount = restadmin("${basePath}/posts/count").value/>
<#attempt>
       <#assign memberCount = restadmin("${basePath}/users/count").value/>
<#recover>
<#assign memberCount = 0/>
</#attempt>
         <span>${solCount} solutions</span>
         <span>${postCount} posts</span>
         <!-- <span>${memberCount} members</span> -->
      </div>
     </div>
    </div>
   </article>
</section>
</div>
<!--</div> -->
</@generateComponentContent>
<div style="clear:both"></div>
