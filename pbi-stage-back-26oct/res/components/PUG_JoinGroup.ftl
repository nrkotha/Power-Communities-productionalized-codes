<#if coreNode.nodeType=="board">
    <#assign pugGroup=rest( "/groups/id/" + coreNode.id).group />

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
                            <button class="lia-button lia-button-secondary pug-btn" data-pops-up="joinGroupModal">Join group</button>
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
    <section class="section section-size3 modal text-center" id="joinGroupModal">
        <a href="#" class="close">&times;</a>
        <div class="row">
            <div class="column large-10 large-centered">
                <p class="text-heading1 text-center">Join Power BI User Group</p>
                <p>Membership for this group is managed on an external site.<br />Click the link below to go to the user group's site.</p>
            </div>
        </div>

        <div class="row">
            <div class="column large-10 large-centered">
                <#assign matches=pugGroup.description?matches( ".*URL: (.*)" ) />
                <#list matches as m>
                    <a href="${m?groups[1]}" target="_blank" onclick="fireGroupNavigateExternalTelemetryEvent();">
                        <button class="lia-button lia-button-secondary pug-btn">Continue to site</button>
                    </a>
                    <#break>
                </#list>
            </div>
        </div>
    </section>
    <!-- joinGroupModal end -->
</#if>
