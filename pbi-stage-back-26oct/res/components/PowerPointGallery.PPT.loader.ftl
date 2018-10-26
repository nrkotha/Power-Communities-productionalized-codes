<style>
.ppt-load-msg{
    text-align: center;
}
</style>
<#if page.name == "ForumTopicPage">
<#assign atID=http.request.parameters.name.get("attachment-id", "" )?js_string/>
<div class="ppt-load-msg">Loading PowerPoint, please wait..</div>
</#if>