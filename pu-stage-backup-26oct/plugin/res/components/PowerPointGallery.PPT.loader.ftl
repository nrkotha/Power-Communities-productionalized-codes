<style>
.ppt-load-msg{
    text-align: center;
}
/* This code is commented by satya as part of iTrack BIZCM-844 */
.lia-lightbox-dialog .lia-close-button {
   display: none;
}
</style>
<#if page.name == "ForumTopicPage">
<#assign atID=http.request.parameters.name.get("attachment-id", "" )?js_string/>
<div class="ppt-load-msg">Loading PowerPoint, please wait..</div>
</#if>