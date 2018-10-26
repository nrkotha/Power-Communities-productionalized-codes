<#if coreNode.id == "BestReportContest" || coreNode.id == "BestReportContestJan2016">
  <#assign bannerImage = '<img src=“${community.urls.tapestryPrefix}/assets/best-report-banner.png“ alt=""/>' >
<#elseif coreNode.id == "">
  <#assign bannerImage = '<img src="http://community-staging.powerbi.com/html/assets/data_stories_blk.png" alt=""/>' >
<#else>
  <#assign bannerImage = ''>
</#if >

<section class="contest-wrapper">
  <div class="contest-banner">
 ${bannerImage}
  </div>
</section>
