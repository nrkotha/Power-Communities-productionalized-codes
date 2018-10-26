<#assign groups=rest("/groups/list").groups />
<div class="pug-cmp pug-list">
        <div class="pug-description">
            Power BI User Groups (PUGs) bring passionate Power BI people together to share, learn and grow their skills and opportunities. Whether you are brand new to the world of analytics or an expert in data analytics and visualization - PUGs are a community for people from every profession, background and age. Come and share best practices, learn the latest features, connect with other Power BI enthusiasts and have FUN!
        </div>
        <div class="pug-section">
            <div class="pug-section-header">User Groups</div>
            <div class="pug-section-content">
                <#list groups.group as group>
                    <div class="pug-list-item">
                        <a href="${community.urls.tapestryPrefix}/${group.id}/gp-p/${group.id}">${group.title}</a>
                        <#assign matches=group.description?matches( ".*Location: (.*)")>
                            <div>
                                <#list matches as m>
                                    ${m?groups[1]}
                                </#list>
                            </div>
                    </div>
                </#list>
            </div>
        </div>
        <div class="pug-section">
            <div class="pug-section-header">Don't see a group near you?</div>
            <div class="pug-section-content">
                <div>Get notified when one opens in your area.</div>
                <a href="http://aka.ms/pugnotify" target="_blank">
                    <button class="lia-button lia-button-secondary pug-btn">Notify me</button>
                </a>
            </div>
        </div>
</div>
