</center>
<!-- skip content -->
<div class="skip_div">
<a href="#skip_content" class="skip">Skip to main content</a>
</div>
<!--end skip content -->
<div id="fixed-banner">
	<div id="cookie-banner"></div>
<#-- MC-396: Change header if mobileclient is iOS -->	
<#assign mobClient = http.request.cookies.name.get("mobileClient").getValue()!""/>
			
<#if mobClient != "ios">
		
	<#assign cookies = http.response.cookies />
			
	<#list cookies as cookie,value>
		
		<#if cookie == "mobileClient">
					<#assign mobClient = value.getValue()/>
		
		</#if>
		
	</#list>
		
</#if>
			
<#if mobClient == "ios">
		
${settings.name.get("layout.urlfetcher_header_ios")}
		
<#else>

 ${settings.name.get("layout.urlfetcher_header")}
</#if>

</div>
<div class="custom-branding-line">
<div class="custom-branding-container">
<div class="custom-branding-line-left"></div>
<div class="custom-branding-line-right">
	<div class="custom-user-menu">
		<@component id="common.widget.user-navigation-combine"/>
		
			
		</div>
		<div class="custom-goto-menu">
		<@component id="common.widget.site-navigation"/>
		</div>
	</div>
</div>
</div>
<@liaBody /><#--<center>${settings.name.get("layout.microsoftbi_footer")}</center>-->
<#--<link type="text/css" rel="stylesheet" href="/html/assets/jquery.qtip.min.css" />-->
<#--<script type="text/javascript" src="/html/assets/jquery.min.js"></script>-->
<#--<script type="text/javascript" src="/html/assets/jquery.qtip.min.js"></script>-->
<script src="/html/assets/jquery.slides.min.js"></script>
    <@liaAddScript>

    ;(function($) {
        $(document).ready(function() {

        try{

// $(".lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Search Community...").val("").focus().blur();
//$(".custom-community-help .lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Ask a question").val("").focus().blur();
                // $(".lia-form-type-text.lia-search-input-tkb-article").attr("placeholder", "Search Knowledge Base...").val("").focus().blur();
                // $(".lia-form-type-text.UserSearchField.lia-search-input-user").attr("placeholder", "Search Users...").val("").focus().blur();
   /* $('.lia-user-avatar-message').each(function () {
        $(this).qtip({
            content: "<a href='/''>title</a>",
            hide: {
                fixed: true,
                delay: 2000
            }
             });
         }); */
          
     
    /* $(".lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Search Community...").val("").focus().blur();*/
    /* $('.lia-user-avatar-message').each(function() {
// $('.lia-user-avatar-message').on('mouseover', function(event){
    if($(this).closest(".UserNavigation ")[0] == undefined){

    var uname = $(this).attr('title');
                $(this).attr('title', '');
         $(this).qtip({
            content: {
                text: function(event, api) {
                    $.ajax({
                        url: "/plugins/custom/microsoft/microsoftbidev2/custom-html-userdescription",
                            data: {
                                uname: uname
                            }
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        api.set('content.text', content);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },

        position: {
                adjust: {
                 method: 'flip flip'
            },
        at: "center left",
                my: "center right",
                viewport: $(window),
        // target: $(this),
            },
            hide: {
                fixed: true,
                delay: 300
            },
           style: {
                tip:false, 
                width: false, // No set width
        height: false, // No set height
                classes: "ui-tooltip-light custom-qtip2"
            }
         });
        }
     }); */
       /* Start: This code is added by iTalentdigital as part of MC-419 */
            if(LITHIUM.CommunityJsonObject.Page.name == "MyProfilePage") {
                if($('.close-account-tab').length > 0) {
                    $('<li class="lia-tabs email-tab lia-tabs-inactive"><span ><a class="lia-link-navigation privacy-link tab-link lia-custom-event" href="/t5/custom/page/page-id/data_privacy_compliance">Privacy</a></span></li>').insertAfter($('.close-account-tab'));
                } else {
                   $('.PersonalProfile .lia-tabs-standard-wrapper .lia-tabs-secondary').append('<li class="lia-tabs email-tab lia-tabs-inactive"><span ><a class="lia-link-navigation privacy-link tab-link lia-custom-event" href="/t5/custom/page/page-id/data_privacy_compliance">Privacy</a></span></li>');
                } 
            }   
            if(LITHIUM.CommunityJsonObject.Page.name == "FaqPage") {
                $('ul.lia-component-faq-index').append('<li><div class="faq-title"><a class="lia-link-navigation pr" href="/t5/custom/page/page-id/data_privacy_compliance">Privacy</a></div></li>');
            }
            /* End: This code is added by iTalentdigital as part of MC-419 */
          
        }
        catch(e){
            console.log(e);
        }
        <#assign env = config.getString("phase", "prod") />
        <#if env == "stage">
        $(".navigation .menu-main li:last-child ul li ").each(function() {
    console.log($(this).find('a').attr('href'))
    if($(this).find('a').attr('href') == "https://aka.ms/PA_Comm_Forums"){
      $(this).find('a').attr('href',"/t5/Forums/ct-p/PA_Comm_Forums")
    }
    if($(this).find('a').attr('href') == "https://aka.ms/PA_Comm_Galleries"){
      $(this).find('a').attr('href',"/t5/Galleries/ct-p/PA_Comm_Galleries")
    }
    if($(this).find('a').attr('href') == "https://aka.ms/PA_Comm_Ideas"){
      $(this).find('a').attr('href',"/t5/Ideas/ct-p/PA_Comm_Ideas")
    }
    if($(this).find('a').attr('href') == "https://aka.ms/PA_Comm_Issues"){
      $(this).find('a').attr('href',"/t5/Issues/ct-p/PA_Comm_Issues")
    }
    if($(this).find('a').attr('href') == "https://aka.ms/PA_Comm_Events"){
      $(this).find('a').attr('href',"/t5/Events/ct-p/PA_Comm_Events")
    }
    if($(this).find('a').attr('href') == "https://aka.ms/PA_Comm_UserGroups"){
      $(this).find('a').attr('href',"/t5/User-Groups/ct-p/PA_Comm_UserGroups")
    }
    if($(this).find('a').attr('href') == "https://aka.ms/PA_Comm_CommunityBlog"){
      $(this).find('a').attr('href',"/t5/Community-Blog/ct-p/PA_Comm_CommunityBlog")
    }
  });
  </#if>
        }); 
    })(LITHIUM.jQuery);
 </@liaAddScript>
<#-- ${settings.name.get("layout.urlfetcher_footer")} -->
<#-- <#include "layout.urlfetcher_footer.ftl" /> -->
${settings.name.get("layout.urlfetcher_footer")}
<#--<#include "layout.urlfetcher_footer.ftl" />-->