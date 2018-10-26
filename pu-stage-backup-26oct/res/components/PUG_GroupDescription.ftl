<#if coreNode.nodeType == "board">

    <#assign pugGroup=rest("/groups/id/" + coreNode.id).group/>
    <div class="lia-panel lia-panel-standard">
        <div class="lia-decoration-border">
            <div class="lia-decoration-border-top">
            </div>
            <div class="lia-decoration-border-content">
                <div>
                    <div class="lia-panel-content-wrapper">
                        <div class="lia-panel-content">
                            <h2>${pugGroup.title}</h2>

                            <#assign matches=pugGroup.description?matches( ".*Location: (.*)")>
                            <#list matches as m>
                                 <p>${m?groups[1]}</p>
                            </#list>

                            <#assign descMatches=pugGroup.description?matches("(^.*)")>
                            <#list descMatches as dm>
                                 <p>${dm?groups[0]}</p>
                                 <#break>
                            </#list>
                            
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
