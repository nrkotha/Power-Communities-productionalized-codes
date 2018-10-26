<div class="lia-panel lia-panel-standard pug-announcement-panel-header">
    <div class="lia-decoration-border">
        <div class="lia-decoration-border-top">
            <div> </div>
        </div>
        <div class="lia-decoration-border-content">
            <div>
                <div class="lia-panel-heading-bar-wrapper">
                    <div class="lia-panel-heading-bar"><span class="lia-panel-heading-bar-title">Announcements</span></div>
                </div>
                <div id="pugAnnoucementHeaderContent" class="lia-panel-content-wrapper"></div>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            //move menu bar buttons to under Annoucements section

            var menuBarButtons = $(".lia-component-menu-bar .lia-menu-bar-buttons");

            if(menuBarButtons.length > 0){
                menuBarButtons.detach().appendTo("#pugAnnoucementHeaderContent");  
            }
        });
    </script>
</div>


