<#if !user.anonymous>   
    <#assign restUrl="/users/id/" + user.id?c + "/roles">
    <#assign userRoles = restadmin(restUrl).roles />
    <#assign userIsPugLeader = false />

    <#list userRoles.role as role>
        <#if role.name == "PUG Leader" || role.name == "PUG MS Ambassador">
            <#assign userIsPugLeader = true />
            <#break>
        </#if>
    </#list>

    <#if userIsPugLeader>
        <div class="lia-panel lia-panel-standard">
            <div class="lia-decoration-border">
                <div class="lia-decoration-border-top">
                    <div></div>
                </div>
                <div class="lia-decoration-border-content">
                    <div>
                        <div class="lia-panel-heading-bar-wrapper">
                            <div class="lia-panel-heading-bar"><span class="lia-panel-heading-bar-title">Leader Resources</span></div>
                        </div>
                        <div class="lia-panel-content-wrapper"> 
                            <div class="lia-panel-content pug-claim-badge-ct">
                                <p>Exclusive area for PUG Leaders</p>
                                <a href="${community.urls.tapestryPrefix}/PUG-Leaders-Forum/bd-p/PUGLeadersForum">
                                    <button class="lia-button lia-button-secondary pug-btn">Click here</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="lia-decoration-border-bottom">
                    <div> </div>
                </div>
            </div>
        </div>
    </#if>

</#if>
