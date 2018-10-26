<div class="lia-panel lia-panel-standard">
    <div class="lia-decoration-border">
        <div class="lia-decoration-border-top">
            <div></div>
        </div>
        <div class="lia-decoration-border-content">
            <div>
                <div class="lia-panel-heading-bar-wrapper">
                    <div class="lia-panel-heading-bar"><span class="lia-panel-heading-bar-title">Claim your PUG Badge</span></div>
                </div>
                <div class="lia-panel-content-wrapper"> 
                    <#if !user.anonymous>   
                        <div class="lia-panel-content pug-claim-badge-ct">
                            <p id="claimBadgeText">
                                Already a member of this group?
                                <br />Claim your PUG badge!
                            </p>
                            <p id="badgetAlreadyClaimedText">
                                You’ve claimed this PUG badge!
                                <br /> See all your badges <a href="${community.urls.tapestryPrefix}/badges/userbadgespage/user-id/${user.id?c}/page/1">here.</a>
                            </p>
                        </div>
                    
                        <script>
                            $(function() {
                                //move join Group button from hidden lithium component, rename it to our claim badge button.
                                //only way to get join group to work

                                var joinGroupBtn = $("#joinGroup");

                                if (joinGroupBtn.length > 0) {
                                    $("#joinGroup").text("Claim badge");
                                    $("#joinGroup").detach().insertAfter("#claimBadgeText");

                                    $("#badgetAlreadyClaimedText").hide();
                                    $("#claimBadgeText").show();
                                } else {
                                    $("#claimBadgeText").hide();
                                    $("#badgetAlreadyClaimedText").show();
                                }
                            });
                        </script>
                    <#else>
                        <div class="lia-panel-content pug-claim-badge-ct">
                            <p>
                                You must be signed in to claim a badge.
                            </p>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
        <div class="lia-decoration-border-bottom">
            <div> </div>
        </div>
    </div>
</div>



                    