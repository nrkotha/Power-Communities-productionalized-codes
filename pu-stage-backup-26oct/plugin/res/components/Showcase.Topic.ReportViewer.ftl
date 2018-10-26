<#include "common_utils.ftl" />
<#if page.name=="ForumTopicPage" && page.context.message??>
    <div class="lia-message-custom-report hidden">
        <div class="lia-message-custom-report-container">
            <iframe width="800" height="600" frameborder="0"></iframe>
        </div>
    </div>

    <@liaAddScript>
        (function ($) {
            /* Changed the jQuery Class structure to get reportid in different division strucutres(MC-122) */
            if ($('.lia-message-body-content .reportid').length > 0 && $('.lia-message-body-content .reportid').text() != "") {
                /* Commenting following code as part of MC-5 by iTalent. Unable to show power bi report in iframe if body has two report ids. Hence capturing only one id 
                var reportUrl = 'https://app.powerbi.com/view?r=' + $('.first-message .lia-message-body-content .reportid').text();
                */
                var reportUrl = 'https://app.powerbi.com/view?r=' + $('.lia-message-body-content .reportid')[0].textContent;
                $('.lia-message-custom-report-container iframe').attr('src', reportUrl.replace(/\u200B/g,''));
                $('.lia-message-custom-report').removeClass('hidden');
                $('.lia-message-body-content .reportid').remove();
            }
        })(LITHIUM.jQuery);
    </@liaAddScript>
</#if>  