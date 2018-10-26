<#if page.name=="ForumTopicPage" && page.context.message??>
    <div class="lia-message-custom-social-buttons">
        <div class="linkList linkList-horizontal">
            <a href="http://www.linkedin.com/shareArticle?mini=true&url=${page.context.message.webUi.url}" class="social-share social-linkedin">
                <img src="/html/assets/linkedin_blk.png" )" alt="LinkedIn" />
            </a>
            <a href="http://www.facebook.com/share.php?u=${page.context.message.webUi.url}" class="social-share social-facebook">
                <img src="/html/assets/facebook_blk.png" alt="Facebook" />
            </a>
            <a href="http://twitter.com/share?text=${page.context.message.subject}&url=${page.context.message.webUi.url}" class="social-share social-twitter">
                <img src="/html/assets/twitter_blk.png" alt="Twitter" />
            </a>
        </div>
    </div>
</#if>