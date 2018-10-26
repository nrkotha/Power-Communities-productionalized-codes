</center>
<!-- skip content -->
<div class="skip_div">
<a href="#skip_content" class="skip">skip to main content</a>
</div>
<!--end skip content -->
<div id="fixed-banner">
	<div id="cookie-banner"></div>
${settings.name.get("layout.microsoftbi_header")}
<#--<#include "layout.microsoftbi_header.ftl"/>-->
</div>
<div class="custom-branding-line"><div class="custom-branding-container"><div class="custom-branding-line-left"></div><div class="custom-branding-line-right"><div class="custom-user-menu"><@component id="common.widget.user-navigation-combine"/></div></div></div></div><@liaBody /><center>${settings.name.get("layout.microsoftbi_footer")}</center>

<link type="text/css" rel="stylesheet" href="/html/assets/jquery.qtip.min.css" />
<!--<script type="text/javascript" src="/html/assets/jquery.min.js"></script> -->
<script type="text/javascript" src="/html/assets/jquery.qtip.min.js"></script>
<script type="text/javascript">
    jQuery.noConflict();

    ;(function($) {
        $(document).ready(function() {

        try{

// $(".lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Search Community...").val("").focus().blur();
$(".custom-community-help .lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Ask a question").val("").focus().blur();
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
        }); 
    })(jQuery);
</script>
<#-- ${settings.name.get("layout.urlfetcher_footer")} -->
<#--<#include "layout.microsoftbi_footer.ftl" />-->