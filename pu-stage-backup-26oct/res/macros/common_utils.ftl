<#function isTopicMessage>

  <#local crumb = (page.content.nav.breadcrumb.crumbs?reverse[1])!{} />

  <#local type = (crumb.type)!"" />

  <#if (type == "")> <#return true /> </#if>

  <#if (type == "message")> 

    <#local id = (crumb.url?split("/m-p/")[1]?split("#")[0])!"" />

    <#if id == "">

      <#return true />

    </#if>

    <#attempt>

      <#local depth = rest("/messages/id/${id}/depth").value?string />

      <#if depth == '0' >

        <#return true />

      </#if>

      <#return false />

    <#recover>

      <#return true />

    </#attempt>

  </#if>  

  <#return true />

</#function>



<#function underEventCategory>

  <#local eventId = "Events" />

  <#if (coreNode.id)?? && (coreNode.id == eventId) >

    <#return true />

  </#if>

  <#local ancestorReverse = (coreNode.ancestors?reverse[1])!{} />

  <#if (ancestorReverse.id)?? && (ancestorReverse.id == eventId) >

    <#return true />

  </#if>

  <#return  false />

</#function>


<#function underShowcaseCategory>
  <#local showcaseId = "PBIShowcase" />
  <#if (coreNode.id)?? && (coreNode.id == showcaseId) >
    <#return true />
  </#if>
  <#local ancestorReverse = (coreNode.ancestors?reverse[1])!{} />
  <#if (ancestorReverse.id)?? && (ancestorReverse.id == showcaseId) >
    <#return true />
  </#if>
  <#return  false />
</#function>

<#function decompose inStr no1 no2=1>

  <#if !no1??> <#return "" /> </#if>

  <#if !inStr??> <#return "" /> </#if>

  <#if inStr == ""> <#return "" /> </#if>    

  <#if no1 == 1>

    <#return inStr?split(" ")[0] />

  </#if>

  <#local tmp = inStr?split(" ")[1]?split(":") />

  <#if no1 == 2>

    <#if no2 == tmp[0]?number > <#return "selected" /> </#if>

    <#return "" />

  </#if>

  <#if no1 == 3>

    <#if no2 == 1 && tmp[1] == "00" > <#return "selected" /> </#if>

    <#if no2 == 2 && tmp[1] == "15" > <#return "selected" /> </#if>      

    <#if no2 == 3 && tmp[1] == "30" > <#return "selected" /> </#if>            

    <#if no2 == 4 && tmp[1] == "45" > <#return "selected" /> </#if>                  

    <#return "" />

  </#if>    

  <#if no1 == 4>

    <#if no2 == 1 && tmp[2] == "AM" > <#return "selected" /> </#if>

    <#if no2 == 2 && tmp[2] == "PM" > <#return "selected" /> </#if>      

    <#return "" />

  </#if>  

 

  <#return "" />    

</#function>



<#function getAttachedImage msgid>

  <#assign query="SELECT url, content_type FROM attachments WHERE message.id = '${msgid}'" />

  <#assign queryResult=restadmin("2.0", "/search?q=" + query?url("UTF-8")) />

  <#if queryResult.status=="success" && queryResult.data?? && queryResult.data?has_content && queryResult.data.items?? && queryResult.data.items?has_content>

    <#assign a=[] />

    <#list queryResult.data.items as att>

        <#if att.content_type?starts_with("image")>

          <#return att.url />

        </#if>

    </#list>

  </#if>

  

  <#return "" />

</#function>



<#assign _rndSeed = .now?long />



<#function random min max>

	<#local str = (_rndSeed * (_rndSeed % 1000))?c />

	<#local rnd = get_middle(str) />

	<#assign _rndSeed = rnd*rnd />

    

    <#local maxLoop=_rndSeed?string?length>

	<#if _rndSeed % 10 == 0>

		<#list 1..maxLoop as i>

			<#if _rndSeed % 10 == 0>

			  <#assign _rndSeed=(_rndSeed / 10)?round>

			<#else>

			  <#break> 

			</#if> 

		</#list>

	</#if>



	<#local h = ("0." + rnd?string)?number />

	<#return ((h * (max - min + 1)) + min)?floor />

</#function>
<#function get_middle str>
  <#local remove = (str?length / 4)?floor />
    <#local middle = str?substring(remove, str?length - remove) />
    <#if middle?length gt 8>
      <#local middle = middle?substring(0, 8) />
    </#if>
  <#return middle?number />
</#function>

<#macro generateComponentContent className componentTitle="" componentStyle="">
  <div class="lia-panel lia-panel-standard Chrome ${className}" style="${componentStyle}">
    <div class="lia-decoration-border">
      <div class="lia-decoration-border-top"><div> </div></div>
      <div class="lia-decoration-border-content">
        <div>
          <#if componentTitle?trim?length gt 0>
            <div class="lia-panel-heading-bar-wrapper">
              <div class="lia-panel-heading-bar">
                <span class="lia-panel-heading-bar-title">${componentTitle}</span>
              </div>
            </div>
          </#if>
          <div class="lia-panel-content-wrapper">
            <div class="lia-panel-content">
              <#nested />
            </div>
          </div>
        </div>
      </div>
      <div class="lia-decoration-border-bottom">
        <div> </div>
      </div>
    </div>
  </div>
</#macro>

<#macro generateNavContent HomePageTitle HomePageLink>
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navBarLinks">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>                        
    </button>
    <a class="navbar-brand" href="${HomePageLink}">${HomePageTitle}</a>
  </div>
  <div class="collapse navbar-collapse" id="navBarLinks">
    <ul class="nav navbar-nav">  
        <#nested />
    </ul>
  </div>
</#macro>
<#macro generateCategoryBoardList CategoryID InteractionStyle NoOfBoardsToShow>
  <li>
    <#assign category = CategoryID/>
    <#assign iStyle = InteractionStyle />
    <#assign limit = NoOfBoardsToShow />
    <#assign restQuery = "SELECT id,title,view_href,parent_category.title,parent_category.view_href FROM boards"/>

    <#if category != "">
      <#assign restQuery = restQuery + " WHERE parent_category.id='"+category +"'"/>
    </#if>
    <#if iStyle!="">
      <#assign restQuery = restQuery + " AND conversation_style='"+iStyle+"'"/>
    </#if>
    <#if restQuery !="">  <#-- Start (Empty Query) -->
      <#assign restQuery = restQuery+ " ORDER BY position ASC"/>  
      <#assign restQuery = restQuery + " LIMIT "+limit/>
      <#assign apiVersion = "2.0"/>
      <#assign queryResult = rest(apiVersion, "/search?q=" + restQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
      <#if (queryResult?size > 0)>
        <a href="${queryResult[0].parent_category.view_href}">${queryResult[0].parent_category.title}</a>
        <ul class="custom-navbar-boardUl">
          <#list queryResult as board>
            <li class="custom-navbar-boardLi">
              <a href="${board.view_href}">${board.title}</a>
            </li>
          </#list>
          <#nested />
        </ul>
      </#if>
    </#if>
  </li>
</#macro>

<#macro moreDropdownLinks title >
  <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="JavaScript:Void(0)">${title} <i class="fa fa-angle-down" style="font-size:12px"></i></a>
      <ul class="dropdown-menu more-menu">
        <#nested />
        <li><a id="navSitemap" onclick="toggle_visibility('sitemap');" href="JavaScript:Void(0)">Sitemap...</a></li>
      </ul>
  </li>
</#macro>

<#macro ShowBannerImage ImageURL MinWidth MaxWidth height>
  <style>
     @media screen <#if MaxWidth!="">and (max-width: ${MaxWidth})</#if> <#if MinWidth!="">and (min-width: ${MinWidth})</#if>{
        #ask-community {
        background-image: url(${ImageURL});
        height:${height};
        }
        .ask-community-content{
           height:${height};
        }
      }
  </style>
</#macro>

<#macro ShowBannerAsColor ColorCode>
  <style>
  #ask-community {
      background: ${ColorCode} !important;
      height:192px !important;
  }
  .ask-community-content{
           height:192px !important;
  }
  </style>
</#macro>
<#function get_middle str>

	<#local remove = (str?length / 4)?floor />

    <#local middle = str?substring(remove, str?length - remove) />

    <#if middle?length gt 8>

    	<#local middle = middle?substring(0, 8) />

    </#if>

	<#return middle?number />

</#function>
<#--Adding this code to change the 1000 and above values to k/M formats -->
<#function kformat number>
  <#assign order     = number?round?c?length />
  <#assign thousands = ((order - 1) / 3)?floor />
  <#if (thousands < 0)><#assign thousands = 0 /></#if>
  <#assign Map = [ {"factor": 1, "unit": ""}, {"factor": 1000, "unit": "K"}, {"factor": 1000000, "unit": "M"}, {"factor": 1000000000, "unit":"G"}, {"factor": 1000000000000, "unit": "T"} ,{"factor": 1000000000000000, "unit": "P"} ,{"factor": 1000000000000000000, "unit": "E"}]/>
  <#assign Value = (number / (Map[thousands].factor))?string + Map[thousands].unit />
  <#return Value />
</#function>