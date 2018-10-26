</center>${settings.name.get("layout.microsoftbi_header")}<center>
<#-- MC-171 dynamic changing powerbi embeded link -->
<@liaAddScript>
;(function($){
	try {
		<#assign env = config.getString("phase", "prod") />
		<#if env == "stage">
			var powerBiEmbedURL = "https://powerbi-staging.microsoft.com/en-us/power-bi-embedded/";
		<#else>
			var powerBiEmbedURL = "https://powerbi.microsoft.com/en-us/power-bi-embedded/";
		</#if>
		$(".navigation .menu-drop li:contains('Power BI Embedded') a").attr("href",powerBiEmbedURL);
	}catch(e) {
		
	}
})(LITHIUM.jQuery);
</@liaAddScript>
<@liaBody /><div class="custom-community-switcher">
<section id="businessAppComm">
  <article class="">
     	<article class="col-md-6 businessAppComm">
           <p tabindex="0">Business Application communities</p>
		   <span>Powered by Lithium</span>
		</article>
		<div class="col-md-6 searchbar footerbtn" > 
      <div class="btn-group">
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true">Power BI community <span class="caret"></span>
      </button>
        <ul class="dropdown-menu" role="menu" aria-expanded="false">
          <li><a href="https://community.powerbi.com/">Power BI community</a></li>
          <li><a target="_blank" href="https://powerusers.microsoft.com/t5/Power-Apps-Community/ct-p/PowerApps1">PowerApps community</a></li>
          <li><a target="_blank" href="https://powerusers.microsoft.com/t5/Microsoft-Flow-Community/ct-p/FlowCommunity">Microsoft Flow community</a></li>
          <li><a target="_blank" href="https://techcommunity.microsoft.com/t5/Microsoft-Stream/ct-p/MicrosoftStream">Microsoft Stream community</a></li>
          <li><a target="_blank" href="https://powerbi.microsoft.com/en-us/developers/">Developer</a></li>
        </ul>
        </div>
    </div>
  </article>
</section>
</div>
<center>${settings.name.get("layout.microsoftbi_footer")}</center>

<link type="text/css" rel="stylesheet" href="/html/assets/jquery.qtip.min.css" />
<!--<script type="text/javascript" src="/html/assets/jquery.min.js"></script> -->
<script type="text/javascript" src="/html/assets/jquery.qtip.min.js"></script>
<script type="text/javascript">
	jQuery.noConflict();

	;(function($) {
		$(document).ready(function() {

		try{

$(".lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Search Community...").val("").focus().blur();
$(".custom-community-help .lia-form-type-text.lia-autocomplete-input.search-input.lia-search-input-message").attr("placeholder", "Ask the Community...").val("").focus().blur();
				$(".lia-form-type-text.lia-search-input-tkb-article").attr("placeholder", "Search Knowledge Base...").val("").focus().blur();
				$(".lia-form-type-text.UserSearchField.lia-search-input-user").attr("placeholder", "Search Users...").val("").focus().blur();
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
                        url: "/plugins/custom/microsoft/microsoftbi/custom-html-userdescription",
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
<style>
.footerbtn .btn-group{
float:right;
}
.footerbtn button{
border: 1px solid #fff;
    float: right;
    height: 44px;
    width: 221px;
    position: relative;
    top: 0;
    background: transparent;
    font-size: 18px;
    color: #fff;
    border-radius: 0px;
    box-shadow: none;
    margin-top: 10px;}
.footerbtn .btn-default:hover, .footerbtn .btn-default:focus, .footerbtn .btn-default:active {
    color: #fff !important;
    background-color: transparent !important;
    border-color: #fff !important;
}	
.footerbtn .dropdown-menu{
	margin-top:0;
	}
.footerbtn .dropdown-menu li{
padding:3px 0;
}
</style>
<script type="text/javascript">
// On dropdown open
$(document).ready(function(){
$('.footerbtn .dropdown').on('shown.bs.dropdown', function(event) {
    var dropdown = $(event.target);
    
    // Set aria-expanded to true
    dropdown.find('.dropdown-menu').attr('aria-expanded', true);
    
    // Set focus on the first link in the dropdown
    setTimeout(function() {
        dropdown.find('.dropdown-menu li:first-child a').focus();
    }, 10);
});

// On dropdown close
$('.footerbtn .dropdown').on('hidden.bs.dropdown', function(event) {
    var dropdown = $(event.target);
    
    // Set aria-expanded to false        
    dropdown.find('.dropdown-menu').attr('aria-expanded', false);
    
    // Set focus back to dropdown toggle
    dropdown.find('.dropdown-toggle').focus();
});

$(".section.section-footer").keyup(function(){
    $(".footerbtn .btn-group").removeClass('open');
});
});
	jQuery.noConflict();
</script>