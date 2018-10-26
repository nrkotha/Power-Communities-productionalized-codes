</center>${settings.name.get("layout.urlfetcher_header_stream")}<center>

<#if coreNode.id=="StreamCommunityBoards">
    <div class="lia-hero-section lia-content">
        <div class="container">
            <h2 class="welcome-title">Welcome to the Community</h2>
            <div class="banner-search-form">
                <@component id="common.widget.search-form" />
            </div>
            <ul class="linkList linkList-horizontal linkList-topics">
                <li>Topics</li>
                <li><a class="button button-featured" href="/t5/Microsoft-Stream-Community/ct-p/MicrosoftStreamCommunity">Stream</a></li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/StreamForum/label-name/general%20questions">
                        General questions
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/StreamForum/label-name/create%20content">
                        Create content
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/StreamForum/label-name/manage%20content">
                        Manage content
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/StreamForum/label-name/watch%20videos">
                        Watch videos
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/StreamForum/label-name/share%20and%20embed%20questions">
                        Share and embed
                    </a>
                </li>
            </ul>
        </div>
    </div>
</#if><@liaBody /></center>${settings.name.get("layout.urlfetcher_footer_stream")}<center>