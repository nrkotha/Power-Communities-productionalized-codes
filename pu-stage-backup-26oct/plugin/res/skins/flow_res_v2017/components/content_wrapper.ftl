<#include "layout.urlfetcher_header_flow.ftl" /><@liaBody /><div class="custom-community-switcher">
<section id="businessAppComm">
  <article class="">
     	<article class="col-md-6 businessAppComm">
           <p>Business Application communities</p>
		   <span>Powered by Lithium</span>
		</article>
		<article class="col-md-6 searchbar">
			<span class="dropdown">
				<span class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Power BI community
				<span class="caret"></span></span>
				<ul class="dropdown-menu">
					<li><a href="https://community.powerbi.com/">Power BI community</a></li>
					<li><a target="_blank" href="https://powerusers.microsoft.com/t5/Power-Apps-Community/ct-p/PowerApps1">PowerApps community</a></li>
					<li><a target="_blank" href="https://powerusers.microsoft.com/t5/Microsoft-Flow-Community/ct-p/FlowCommunity">Microsoft Flow community</a></li>
					<li><a target="_blank" href="https://techcommunity.microsoft.com/t5/Microsoft-Stream/ct-p/MicrosoftStream">Microsoft Stream community</a></li>
					<li><a target="_blank" href="https://powerbi.microsoft.com/en-us/developers/">Developer</a></li>
				</ul>
			</span>
		</article>
  </article>
</section>
</div>
<#--<center>${settings.name.get("layout.microsoftbi_footer")}</center>-->

<link type="text/css" rel="stylesheet" href="/html/assets/jquery.qtip.min.css" />
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript" src="/html/assets/jquery.qtip.min.js"></script>
<script type="text/javascript">
	jQuery.noConflict();

	;(function($) {
		$(document).ready(function() {

		try{

// $(".lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Search Community...").val("").focus().blur();
$(".custom-community-help .lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Ask a question").val("").focus().blur();
				// $(".lia-form-type-text.lia-search-input-tkb-article").attr("placeholder", "Search Knowledge Base...").val("").focus().blur();
				// $(".lia-form-type-text.UserSearchField.lia-search-input-user").attr("placeholder", "Search Users...").val("").focus().blur();
   /* $('.lia-user-avatar-message').each(function () {
        $(this).qtip({
            content: "<a href='/''>title</a>",
            hide: {
                fixed: true,
                delay: 2000
            }
             });
         }); */
		  
	 
	/* $(".lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Search Community...").val("").focus().blur();*/
	  $('.lia-user-avatar-message').each(function() {
// $('.lia-user-avatar-message').on('mouseover', function(event){
 	if($(this).closest(".UserNavigation ")[0] == undefined){

 	var uname = $(this).attr('title');
		      	$(this).attr('title', '');
         $(this).qtip({
            content: {
                text: function(event, api) {
                    $.ajax({
                        url: "/plugins/custom/microsoft/microsoftbidev2/custom-html-userdescription",
							data: {
								uname: uname
							}
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        api.set('content.text', content);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },

		position: {
				adjust: {
				 method: 'flip flip'
			},
      	at: "center left",
				my: "center right",
				viewport: $(window),
        // target: $(this),
			},
            hide: {
                fixed: true,
                delay: 300
            },
           style: {
				tip:false, 
				width: false, // No set width
        height: false, // No set height
				classes: "ui-tooltip-light custom-qtip2"
			}
         });
		}
     }); 
	 
		  
		}
		catch(e){
			console.log(e);
		}
		});
	})(jQuery);
</script>
<#include "layout.urlfetcher_footer_flow.ftl" />