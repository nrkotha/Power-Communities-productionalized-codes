${settings.name.get("layout.microsoftbi_head")}
<#--<#include "layout.microsoftbi_head.ftl"/>-->
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="${asset.get("/html/assets/favicon.png")}"/>
<@component id="Custom.Head.TwitterCardMeta" />
<style type="text/css">
body{
font-family: 'SegoeUI', 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}
</style>
<script type="text/javascript">
$( document ).ready(function() {
  $(".skip").click(function(event){
    var skipTo="#"+this.href.split('#')[1]; 
    $(skipTo).attr('tabindex', -1).on('blur focusout', function () {   
    $(this).removeAttr('tabindex');   
    }).focus();
  });
});
</script>