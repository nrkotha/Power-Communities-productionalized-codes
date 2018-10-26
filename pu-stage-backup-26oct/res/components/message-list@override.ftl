<#if page.name="TkbPage" || page.name="ForumPage" || page.name="GroupPage">
  <div class="custom-widget-boards-browser-list">
   <table id="header-strip">
    <#if page.name="TkbPage">
    <tr>
       <th>Subject</th>
       <th>Contributors</th>
       <th>Comments</th>
       <th>Views</th>
     </tr>
    <#elseif page.name="ForumPage">
     <tr>
       <th>Subject</th>
       <th>Replies</th>
       <th>Views</th>
     </tr>
     <#elseif page.name="GroupPage">
       <tr>
       <th>Subject</th>
       <th>Replies</th>
       <th>Kudos</th>
     </tr>
     <#else>
    </#if>
    
   </table>
   <@delegate />
  </div>
<#else>
  <@delegate />
</#if>