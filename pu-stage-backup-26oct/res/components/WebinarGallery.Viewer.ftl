<#--

    Webinar Gallery Individual post viwer. 
    iTrack :MC - 13. 

 -->
<#--
 
    Description: 
        This component is created to display the webinar in an iFrame.  

    Activities:
        1. Getting the Webinar URL
        2. Modfying it to play in iframe
        3. Adding it to iframe source attribute          

-->

<#include "common_utils.ftl" />
<#if page.name=="ForumTopicPage" && page.context.message??>
    <div class="lia-message-custom-report">
        <div class="lia-message-custom-report-container">
        <div class="WebinarNote"><p>Loading...
</p></div>
            <iframe class="webinarIframe" width="100%" height="600" frameborder="0"></iframe>
        </div>
    </div>

    <@liaAddScript>
        (function ($) {
        try {
		       var webUrl = $('.first-message .lia-message-body-content .webinarUrl')[0].textContent;
				$('.lia-message-custom-report-container .webinarIframe').attr('src', decodeURIComponent(webUrl));
				 $('.lia-message-custom-report').removeClass('hidden');
				 $('.first-message .lia-message-body-content .webinarUrl').remove();
                $('.first-message .lia-message-body-content .webinarUrl').remove("X-Frame-Options");
				$('.first-message .lia-message-body-content .webinarUrl').addHeader("Access-Control-Allow-Origin", "*");
		    
                
} catch(e){

}

        })(LITHIUM.jQuery);
    </@liaAddScript>
</#if> 