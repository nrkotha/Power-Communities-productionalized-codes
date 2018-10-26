<#-- MC-108 Redirecting registered user to welcome page -->

<#attempt>
  <#-- Commenting this code as part of iTrack MC-179-->
  <#--<#if user.registered && !user.anonymous && http.request.referrer?contains("userregistrationpage")>-->
  <#if user.registered && !user.anonymous>
  <#assign page_views = "" logins = ""/>
    <#assign metrics = restadmin("/users/id/${user.id?c}/metrics").metrics />
    <#list metrics.metric as value>
      <#if value.@name == "page_views">
        <#assign page_views = value />
      </#if>
      <#if value.@name == "logins">
        <#assign logins = value />
      </#if>
    </#list>
  <#if (logins == "1") && (page_views == "0" || page_views == "1" || page_views == null || page_views == "")>
    <#assign isWelcomeShown = usercache.get("isWelcomeShown","0")/> 
    <#if isWelcomeShown == "0">
       <#assign isWelcomeShown = usercache.put("isWelcomeShown", "1") />
       ${http.response.setRedirectUrl("/t5/custom/page/page-id/PowerBI_Welcome")}
    </#if>
  </#if>
  </#if>
<#recover>
</#attempt>

<#-- Code is written as part of MC-408(GDPR)-->
<#-- Commenting following code as part of MC-409, MC-410 -->
<#-- <#if page.name == "data_privacy_compliance">
    <#assign is_user_admin = false />
    <#if user.registered >
     <#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
      <#if role.name?? && (role.name == "Administrator")>
        <#assign is_user_admin = true />
        <#break>
      </#if>
     </#list>
    </#if>
    <#if !is_user_admin>
        ${http.response.setRedirectUrl("/")}
     </#if>
 </#if> -->
<#-- End code is written as part of MC-408(GDPR) -->

<#if coreNode.id == "BestReportContestEntries" || coreNode.id == "DataStoriesSubmissions">

   <#assign is_user_admin = false />

   <#if user.registered >
     <#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
      <#if role.name?? && (role.name == "Administrator")>
        <#assign is_user_admin = true />
      </#if>
     </#list>
   </#if>

   <#if http.request.url?index_of("postpage") < 0 && http.request.url?index_of("postsuccesspage") < 0 && !is_user_admin>
     ${http.response.setRedirectUrl("https://powerbi.microsoft.com")}
   </#if>
</#if>

<#-- MC-76 A/B testing changing skin and Community page based on role -->
<#if page.name !="BizAppsPage">
<#attempt>
  <#if user.registered>  <#-- Start (registered) -->
    <#assign hasABTestRole = false />
    <#assign roleList = usercache.get("roleList", "") />
    <#-- <#if roleList?has_content> -->
    <#if false>
    <#else>
      <#assign roles = restadmin("/users/id/${user.id?c}/roles").roles.role />
      <#assign roleList = [ ] />
      <#list roles as r>
        <#assign roleName = r.name />
        <#assign curr = {"roleName": roleName } />
        <#assign roleList = roleList + [ curr ] />
      </#list>   
      <#assign roleList = usercache.put("roleList", roleList) /> 
    </#if> 

    <#list roleList as role>
      <#if role.roleName?? && role.roleName?matches("AB Testers")>
      <#assign hasABTestRole = true />
      <#break>
      </#if>
    </#list>

    <#if hasABTestRole> <#-- Start (AB Testeres) -->
      <#assign abSwitchReq = http.request.parameters.name.get("req", "")/>
      <#if abSwitchReq == "beta">
        <#assign testerView = usercache.put("testerView", "beta")  />
          ${http.response.setRedirectUrl("/")}
        <#elseif abSwitchReq == "default">
          <#assign testerView = usercache.put("testerView", "default")  />
          ${http.response.setRedirectUrl("/")}
        <#else>
      </#if>
      
      <#-- Get user previous decision on AB tester view -->
      <#assign testerView = usercache.get("testerView", "") />
      <#-- <#assign testerView = ""/> -->
      <#if testerView == "">
        <#assign testerView = "beta"/>
        <#assign testerView = usercache.put("testerView", testerView)  />
      </#if>


      <#if testerView == "beta">

        <#-- Community Page -->
        <#if page.name == "CommunityPage">
          ${http.response.replaceQuilt("CommunityPage", "CommunityPage.2017SR")}
        </#if>

        <#if page.name != "CommunityPage" && coreNode.id!="Events" && coreNode.id!="RD_Events">

          <#-- Category Page View -->
          <#if page.name == "CategoryPage">
            <#-- Forums -->
            <#if (coreNode.id?index_of("forums") >=0)>
              ${http.response.replaceQuilt("CategoryPage", "CategoryPage.2017SRForum")}

<#elseif (coreNode.id?index_of("PBI_Redesigned_Community") >=0)>
              ${http.response.replaceQuilt("CategoryPage", "CategoryPage.2017SR")}

            <#-- Gallery -->
            <#elseif (coreNode.id?index_of("Galleries") >=0)>
              ${http.response.replaceQuilt("CategoryPage", "CategoryPage.2017SRGallery")}
            <#-- Knowledge Base -->
            <#elseif (coreNode.id?index_of("KnowledgeBase") >=0)>
              ${http.response.replaceQuilt("CategoryPage", "CategoryPage.2017SRTKB")}

            <#-- do not replace page if custom quilt already applied -->
            <#elseif !http.response.hasReplacementQuilt("CategoryPage")>
              ${http.response.replaceQuilt("CategoryPage", "CategoryPage.2017SRForum")}
            <#else>
            </#if>

          </#if>
        </#if>
        <#if ((coreNode.ancestors?size >=2) && !(coreNode.ancestors?reverse[1].id?index_of("Events") >=0) && !(coreNode.ancestors?reverse[1].id?index_of("RD_Events") >=0))&& coreNode.id!="Events" && coreNode.id!="RD_Events" && coreNode.id != "Microsoft">
          <#if page.name == "ForumPage">
            <#-- Forums -->
            <#if (coreNode.ancestors?reverse[1].id?index_of("forums") >=0)>
              ${http.response.replaceQuilt("ForumPage", "ForumPage.2017SRForum")}

            <#-- Gallery -->
            <#elseif (coreNode.ancestors?reverse[1].id?index_of("Galleries") >=0) || (coreNode.ancestors[0].id?index_of("Galleries") >=0)>
              ${http.response.replaceQuilt("ForumPage", "ForumPage.2017SRGallery")}

            <#-- do not replace page if custom quilt already applied -->
            <#elseif !http.response.hasReplacementQuilt("ForumPage")>
              ${http.response.replaceQuilt("ForumPage", "ForumPage.2017SRForum")}
            <#else>
            </#if>
          </#if>
      
          <#if page.name == "ForumTopicPage">
            <#-- Forums -->
            <#if (coreNode.ancestors?reverse[1].id?index_of("forums") >=0)>
              ${http.response.replaceQuilt("ForumTopicPage", "ForumTopicPage.2017SRForum")}

            <#-- do not replace page if custom quilt already applied -->
            <#elseif !(coreNode.ancestors?reverse[1].id?index_of("Galleries") >=0) && !(coreNode.ancestors[0].id?index_of("Galleries") >=0) && !http.response.hasReplacementQuilt("ForumTopicPage")>
              ${http.response.replaceQuilt("ForumTopicPage", "ForumTopicPage.2017SRForum")}
            <#else>
            </#if>
          </#if>

          <#if page.name == "TkbPage">
            <#-- Knowledge Base -->
            <#if (coreNode.ancestors?reverse[1].id?index_of("KnowledgeBase") >=0)>
              ${http.response.replaceQuilt("TkbPage", "TKBPage.2017SRTKB")}

            <#-- do not replace page if custom quilt already applied -->
            <#elseif !http.response.hasReplacementQuilt("TkbPage")>
              ${http.response.replaceQuilt("TkbPage", "TKBPage.2017SRTKB")}
            <#else>
            </#if>
          </#if>

          <#-- TKB Category Page : Knowledge Base-->
          <#if page.name == "TkbCategoryPage" && (coreNode.id?index_of("KnowledgeBase") >=0)>
            ${http.response.replaceQuilt("TkbCategoryPage", "TkbCategoryPage.2017SRTKB")}
          </#if>

          <#-- do not replace page if custom quilt already applied -->
          <#if !http.response.hasReplacementQuilt("TkbCategoryPage")>
            ${http.response.replaceQuilt("TkbCategoryPage", "TkbCategoryPage.2017SRTKB")}
          </#if>

          <#if page.name == "IdeaExchangePage">
            ${http.response.replaceQuilt("IdeaExchangePage", "IdeaExchangePage.2017SRIdea")}
          </#if>

          <#if page.name == "IdeaPage">
            ${http.response.replaceQuilt("IdeaPage", "IdeaPage.2017SRIdea")}
          </#if>
          <#--
          <#if page.name == "BlogArticlePage">
            ${http.response.replaceQuilt("BlogArticlePage", "BlogArticlePage.2017SRBlog")}
          </#if>
          
          <#if page.name == "BlogPage">
            ${http.response.replaceQuilt("BlogPage", "BlogPage.2017SRBlog")}
          </#if> -->
          
        </#if>
        <#if page.name == "BlogRollExtracts">
            ${http.response.replaceQuilt("BlogRollExtracts", "BlogRollExtracts.2017SR")}
          </#if>

        <#assign setSkin = skin.set("power_bi_redesign")/>

      </#if>

    </#if>  <#-- Start (AB Testeres) -->
      
  </#if>  <#-- End (registered) -->
<#if (skin.id == "power_bi_redesign" || skin.id=="pbi_redesigned_community") && page.name !="BizAppsPage">
       ${http.response.replaceQuilt("Header", "HeaderPage.2017SR")}
       ${http.response.replaceQuilt("HeaderPageNoTitleNoBreadcrumbs", "HeaderPage.2017SR")}
       ${http.response.replaceQuilt("HeaderPageNoTitle", "HeaderPage.2017SR")}
        <#if page.name == "ErrorPage">
          ${http.response.replaceQuilt("ErrorPage", "ErrorPage.2017SR")}
       </#if>
</#if>

<#recover>

</#attempt>
</#if>
<#assign env = config.getString("phase", "prod") />
<#if env == "stage">
  <#if coreNode.id=='groups'>
    ${http.response.setRedirectUrl("http://www.pbiusergroup.com/home")}
  </#if>
<#else>
  <#if coreNode.id=='Groups'>
    ${http.response.setRedirectUrl("http://www.pbiusergroup.com/home")}
  </#if>
</#if>


<!-- code for events authorization -->

${http.session.setAttribute("event_custimization", "false")}

<#if config.getString("phase", "prod") == "stage"><!-- Stage -->
  <#assign isStage = false />
<#else> <!-- Production -->
  <#assign isStage = false />
</#if>     

<#if page.name == "ForumTopicPage" && isStage && coreNode.id == "Events">
   ${http.response.replaceQuilt("ForumMessage", "ForumMessage.event_detail")}
</#if>

<#if coreNode.id == "RD_Events" && isStage>

  <#assign is_event_tester = true />
  <#if user.registered >
    <#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
     <#if role.name?? && (role.name == "AB Events Tester")>
       <#assign is_event_tester = true />
     </#if>
    </#list>
  </#if>

  <#if is_event_tester > 
    ${http.response.replaceQuilt("CategoryPage", "ForumPage.EventsHome")}
  </#if>
    
</#if>

<#if page.name !="BizAppsPage">
	<#-- MC-441: Set mobile client cookie if request is from PowerBI iOS application -->
	<#assign mobileClient = http.request.parameters.name.get("mobileClient","")?html />
	<#if (mobileClient == "ios")>
	    <#assign mobCtCookie = http.request.createCookie("mobileClient", "ios") />
	    ${mobCtCookie.setMaxAge(3600)} <#--1 hour-->
	    ${mobCtCookie.setPath("/")}
	    ${mobCtCookie.setDomain(".powerbi.com")}
            ${http.response.addCookie(mobCtCookie)}
	</#if>
</#if>