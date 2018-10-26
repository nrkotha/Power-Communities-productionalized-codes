<#include "common_utils.ftl" />

<#attempt>
    <#assign optional=env.context.component.getParameter("optional") />
<#recover>
    <#assign optional="false" />
</#attempt>

<#if optional !="true">
    <#assign optional="false" />
</#if>
<#if (page.name=="PostPage" || page.name=="EditPage" ) && isTopicMessage()>
    <div class="lia-form-row lia-form-microsoftmsg-report-url-entry" style="display: none;">
        <div class="lia-form-label-wrapper">
            <label for="microsoftmsg_report_url" class="lia-form-label">Power BI Publish to Web URL
            <#if optional!="true">
            <span class="field-required">*</span>
            </#if>
            </label>
            <a target="_blank" class="lia-link-navigation lia-link-microsoftmsg-report-url" href="http://go.microsoft.com/fwlink/?LinkId=808625">Learn More</a>
        </div>
        <div class="lia-quilt-row lia-quilt-row-standard">
            <div class="lia-quilt-column lia-quilt-column-24 lia-quilt-column-single">
                <div class="lia-quilt-column-alley lia-quilt-column-alley-single">
                    <div class="lia-form-microsoftmsg-report-url-input">
                        <input class="lia-form-microsoftmsg-report-url-input lia-form-type-text lia-form-input-vertical" id="microsoftmsg_report_url" name="microsoftmsg_report_url" value="" placeholder="Report Url" type="text" optional="${optional}">
                    </div>
                </div>
            </div>
        </div>
    </div>
</#if>