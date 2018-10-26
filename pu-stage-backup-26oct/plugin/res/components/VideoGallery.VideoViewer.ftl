<#--

    Video Story Gallery Individual post viewer. 
    iTrack :MC – 75. 

 -->
<#--
 
    Description: 
        This component is created to display the Youtube Video in an iFrame.  

    Activities:
        1. Getting the Youtube URL
        2. Modfying it to play in iframe
        3. Adding it to iframe source attribute          

-->
<#include "common_utils.ftl" />
<#if page.name=="ForumTopicPage" && page.context.message??>
    <div class="lia-message-custom-report hidden" >
        <div class="lia-message-custom-report-container">
     <#-- Commented for MC-122  <div class="videoNote"><p>Please check if Flash Player is installed on your machine to play the video.
            </p>
        </div> -->
            <iframe class="videoIframe" width="100%" height="600" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>

    <@liaAddScript>
        (function ($) {
        try {
                if($('.lia-message-body-content .videoUrl').eq(0).text().length >0)
                {
                    var reportUrl ="https://www.youtube.com/"+ $('.lia-message-body-content .videoUrl')[0].textContent; //Getting the Youtube URL
                $('.lia-message-custom-report-container .videoIframe').attr('src', reportUrl.replace('watch?v=', 'embed/')); //Modfying it to play in iframe, Adding it to iframe source attribute
                $('.lia-message-custom-report').removeClass('hidden');
                    $('.lia-message-body-content .videoUrl').remove();
                }

} catch(e){
}

        })(LITHIUM.jQuery);
    </@liaAddScript>
</#if> 