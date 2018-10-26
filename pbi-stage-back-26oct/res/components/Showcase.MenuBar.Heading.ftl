<#include "common_utils.ftl" />
<#if (page.name=="ForumPage") && underShowcaseCategory()>
    <@liaAddScript>
        ; (function ($) {
            $(".lia-menu-bar .message-post a.lia-button-primary").html("Submit your report").show();
        })(LITHIUM.jQuery);
    </@liaAddScript>
</#if>

<h3><strong>Want to be featured in the Power BI Showcase?</strong></h3>