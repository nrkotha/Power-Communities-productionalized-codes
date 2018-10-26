<#--
    UI enhancement for Idea Exchange Page. 
    iTrack :MC – 7. 
 -->
<#if page.name == "IdeaExchangePage">
<style>
  /* Setting default CSS for all Statuses */
    .comment-status-bar .MessageStatus.lia-status .message-status-link
    {
        font-weight: normal;
        text-decoration: none;
        color: white;
        font-size: 11px;
        padding: 2px 5px 2px 5px;
        text-shadow: rgba(0,0,0,0.25) 0 1px 1px;
        text-transform: uppercase;
    }
  /* Setting default CSS for all Statuses on hover */
    .comment-status-bar .MessageStatus.lia-status a.message-status-link:hover {
        color: white !important;
        text-decoration: none !important;
    }
    .MessageStatus.lia-status {
      font-weight:normal;
    }  
  /*  Setting CSS for authorAvatar */
    span.MessageStatus.lia-status img {
        height: 20px;
        width: 26px;
        margin-bottom: -6px;
    }
    .lia-message-heading span.lia-message-subject-status {
    display: none;
    }
  /* Setting Tabs width */
     .IdeaExchangePage div.lia-tabs-standard-wrapper.lia-component-tabs {
      display: inline-flex;
     }
  /* Hiding Components */
    .lithium-idea-label-comp {
      display:none;
    }
  /* Setting Tabs background and border */ 
    .IdeaExchangePage .lia-link-navigation.tab-link.lia-custom-event{
      padding: 0px 6px;
    }
  /* Hiding lithium defined border for Tabs */
    #lia-body .lia-content ul.lia-tabs-standard {
      border-bottom: none;
      margin-top: -4px;
    }
  /* Setting custom values for tab active case */
  .IdeaExchangePage .lia-link-navigation.tab-link.lia-custom-event  {
        //background: #C30052 !important;
        font-weight: normal !important;
        border-bottom: none !important;
    }
  .IdeaExchangePage .lia-tabs-active .lia-link-navigation.tab-link.lia-custom-event {
        font-weight: normal !important;
        border-bottom: none !important;
    }
    .lia-link-navigation.popular-link.tab-link.lia-custom-event {
      padding-left: 10px;
    }
    .lia-link-navigation.most-kudoed-link.tab-link.lia-custom-event {
      padding-left: 8px;
    }
    /* Setting custom values for tab on hover case */
    .IdeaExchangePage .lia-tabs-inactive .lia-link-navigation.tab-link.lia-custom-event:hover {
      border-bottom: none !important;
    }
    .status-comment-body p {
    font-weight: normal;
    }
   li.lia-tabs .lia-custom-event {
    width: 80px;
    margin-right: 10px !important;
    }
  .lia-tabs-standard {
    display: inline-flex;
    }
</style>

<#-- Loading phase based on environment -->
<#assign env = config.getString("phase", "prod") />
<#assign comPrefix = ""/>
<#if env == "stage"> <#--Start (is Stage instance)--> 
    <#if community.urls.communityPrefix == '/wcgxx29332'>    
        <#-- PowerBI dev2 -->
        <#assign cphase = "microsoftbidev2"/>
    <#elseif community.urls.communityPrefix == '/bsono97638'>    
        <#-- PowerBI dev1 -->
         <#assign cphase = "microsoftbidev"/>
    <#elseif community.urls.communityPrefix == '/oxcrx34285'>
        <#-- PowerBI Stage -->
        <#assign cphase = "microsoftbi"/>
    <#else>
        <#-- Power Users Stage -->
        <#assign cphase = "microsoftazure"/>
    </#if>
<#else>
  <#if community.urls.communityPrefix == '/oxcrx34285'>    
    <#-- PowerBI Prod -->
    <#assign cphase = "microsoftbi"/>
  <#else>
    <#-- Power Users Prod -->
    <#assign cphase = "microsoftazure"/>
  </#if>
</#if>

<#-- Calling Ideas and Label components. -->
<div class="lithium-idea-label-comp">
<#--We are placing this component in a div as we are seeing duplicated labels in the dropdown-->
  <div class = "idea-labels-custom-enchancer"><@component id="ideas.widget.labels"/></div>
  <@component id="ideas.widget.statuses"/>
</div>

<#assign url = http.request.url />
<#if url?matches(".*label-name/?.*$")>
  <#assign labelClass = "custom-idea-labels active"/>
<#else>
  <#assign labelClass = "custom-idea-labels"/>
</#if>

<#if url?matches(".*status-key/?.*$")>
  <#assign statusClass = "custom-idea-status active"/>
<#else>
  <#assign statusClass = "custom-idea-status"/>
</#if>

<select id ="customLabelSel" class="${labelClass}" aria-label="Show idea categories">
  <option hidden>Categories</option>
</select>

<select id ="customStatusSel" class="${statusClass}" aria-label="Show idea statuses">
  <option hidden>Status</option>
</select>

<@liaAddScript>
(function ($) {
  try{
    /* Get ThreadIds from the page. */
    var articleIds="";
    $.each($('.lia-message-subject .lia-link-navigation'),function(index,ele){
      var eleTId = ele.href.split("/").reverse()[0];
      articleIds = (articleIds=="")?eleTId:eleTId+","+articleIds;  
    });
    
    /* Function to add Avathar */
    function addAvathar(thread){    
      if($(".lia-js-data-messageUid-"+thread.id.toString()+" .status-comment-body").text().length) {
      $(".lia-js-data-messageUid-"+thread.id.toString()+" .comment-status-bar .MessageStatus.lia-status").prepend("<a href="+thread.authorProfile+"><img src="+thread.authorAvatar+" title="+thread.authorName+"></a>");
      $(".lia-js-data-messageUid-"+thread.id.toString()+" .comment-status-bar .MessageStatus.lia-status").append("<a href="+thread.authorProfile+">"+thread.authorName+" ("+thread.authorRank+")"+" "+"</a> responded");
      }
    }
    
    if(articleIds !="") {
      /* Removing Satus text in Status comment division. */
      $('.comment-status-bar .MessageStatus.lia-status:contains("Status:")').each(function(){
        $(this).html($(this).html().split("Status:").join(""));
      });
      
      /* Sending ThreadIds to Endpoint. */    
      $.ajax({
        type: "POST", 
        url: "/plugins/custom/microsoft/"+"${cphase}"+"/custom-idea-page-enhancedata?page_size=1000",
        data: { "ArticleId" : articleIds, 'xslt':'json.xsl' },
        success: function(data) {
          if(data.response.status == "success") {
            
          
            /* Getting JSON response from Endpoint. */
            var isArray = Array.isArray(data.response.thread);
            /* Checking if response contains Thread Array, if yes */ 
            if(isArray){
              $.each(data.response.thread,function(index,eachThread){
                addAvathar(eachThread);
              });
            } 
            else {
              /*If response doesn't contains Thread Array*/
              addAvathar(data.response.thread)
            }
          }
        }   
      });
    }
     
     
      /* Start: Label */
    /* Appending label dropdown to UI */
    $('#customLabelSel').appendTo(".lia-tabs-standard-wrapper.lia-component-tabs .lia-tabs-standard");
    /* Fetching Idea Labels from Lithium components and building select options */
    $(".idea-labels-custom-enchancer .LabelsList .lia-list-standard li").each(function(index,ele) {

        $('#customLabelSel').append('<option value="'+ele.querySelector(".lia-link-navigation").textContent.trim().toLowerCase()+'">'+ele.querySelector(".lia-link-navigation").textContent+"("+ele.querySelector(".label-count").innerHTML+")"+'</option>');
    });

    /* Fetching the selected label from url */
    var labelInUrl = "";
    if(location.href.indexOf("label-name/")>=0){
      labelInUrl = location.href.split("label-name/")[1].split("/")[0];
      $('#customLabelSel').val(decodeURIComponent(labelInUrl));
      
    }
    /* Select dropdown on change functionality */
    $("#customLabelSel").change(function() {
      location.href = LITHIUM.CommunityJsonObject.CoreNode.viewHref+"/label-name/"+this.value;
    });
    /* End : Label */


    /* Start: Idea */
    /* Appending label dropdown to UI */
    $('#customStatusSel').appendTo(".lia-tabs-standard-wrapper.lia-component-tabs .lia-tabs-standard");
    /* Fetching Idea Status from Lithium components and building select options */
    $(".MessageStatusesTaplet .lia-list-standard li").each(function(index,ele) {

        $('#customStatusSel').append('<option value="'+ele.querySelector(".lia-link-navigation").href.split("status-key/")[1]+'">'+ele.querySelector(".lia-link-navigation").textContent+"("+ele.querySelector(".count").innerHTML+")"+'</option>');
    });

    /* Fetching the selected Status from url */
    var statusInUrl = "";
    if(location.href.indexOf("status-key/")>=0){
      statusInUrl = location.href.split("status-key/")[1].split("/")[0];
      $('#customStatusSel').val(decodeURIComponent(statusInUrl));
    }
    /* Select dropdown on change functionality */
    $("#customStatusSel").change(function() {
      location.href = LITHIUM.CommunityJsonObject.CoreNode.viewHref+"/status-key/"+this.value;
    });
    /* End: Idea */
  } catch(e) {
    
  }
    
})(LITHIUM.jQuery);
</@liaAddScript>
</#if>