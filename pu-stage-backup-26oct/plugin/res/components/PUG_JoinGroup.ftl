<#if coreNode.nodeType=="board">

    <script>
        function fireGroupNavigateExternalTelemetryEvent(){
            try{
                MscomCustomEvent("wcs.cid", "navigate-external-user-group-site");
            }   
            catch(e){};
        }
    </script>

    <#assign pugGroup=rest( "/groups/id/" + coreNode.id).group/>

    <div class="lia-panel lia-panel-standard">
        <div class="lia-decoration-border">
            <div class="lia-decoration-border-top">
                <div> </div>
            </div>
            <div class="lia-decoration-border-content">
                <div>
                    <div class="lia-panel-content-wrapper">
                        <div class="lia-panel-content">
                            <div class="lia-groups-image pug-avatar-image">
                                <#assign avMatches=pugGroup.avatar.url?matches("(.*avatar/).*")>
                                <#list avMatches as am>
                                    <img title="${pugGroup.title}" alt="${pugGroup.title}" src="${am?groups[1]}">
                                    <#break>
                                </#list>
                            </div>
                            <button class="lia-button lia-button-secondary pug-btn" data-toggle="modal" data-target="#joinGroupModal">Join group</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="lia-decoration-border-bottom">
                <div></div>
            </div>
        </div>
    </div>

    <!-- joinGroupModal start -->
    <div class="modal fade" id="joinGroupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          </div>
          <div class="modal-body">
            <h2 class="modal-headline">Join Power BI User Group</h2>
            <p>Membership for this group is managed on an external site.<br />Click the link below to go to the user group's site.</p>

            <#assign matches=pugGroup.description?matches( ".*URL: (.*)")>
            <#list matches as m>
                <a href="${m?groups[1]}" target="_blank" onclick="fireGroupNavigateExternalTelemetryEvent();">
                    <button class="lia-button lia-button-secondary pug-btn">Continue to site</button>
                </a>
                <#break>
            </#list>
          </div>

        </div>
      </div>
    </div>
    <!-- joinGroupModal end -->
</#if>
