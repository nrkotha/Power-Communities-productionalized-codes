<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<#-- Following code is related for cookie compliance, to show banner and to grant consent -->
<style>
#cookie-banner svg.cc-icon.cc-v-center {
    fill: none;
}
</style>
<@liaAddScript>
;(function ($) {
	var consentOnClick = function () {
		var allLinks = document.links;
		// Bind the event handler to each link individually
		for (var i = 0, n = allLinks.length; i < n; i++) {
			 allLinks[i].onclick = function () {
				 console.log('link clicked!');
				 mscc.setConsent();
			 };
		}
$("input[type='submit']").click(function(){
			console.log('Submit clicked!');
			mscc.setConsent();
    	});
	};

	$(document).ready(function() {
	var mscc_eudomain =  ((location.search).indexOf('mscc_eudomain=true') != -1) ? true : ((location.hash.indexOf("mscc_eudomain=true") != -1) ? true : false);	// to verify if mscc_eudomain was parameter 

        $.ajax({
        	url: "https://uhf.microsoft.com/en-gb/shell/api/mscc",
                cache: true,
                data:{'sitename':location.hostname,
                'domain':document.domain,
                'mscc_eudomain':mscc_eudomain
            	},
                success: function(data) {
					if (data.IsConsentRequired){

							
						try {
							var css_link = document.createElement("link");
							css_link.href = data.Css[0];
							css_link.rel = "stylesheet";
							css_link.type = "text/css";
							$("head").append(css_link);
							$.ajax({
					            dataType: "script",
					            cache: true,
					            url: data.Js[0]
					        }).done(function() {
								if (mscc && mscc.hasConsent()) {
										
								} else if (mscc) {
														
									consentOnClick();
									var banerMarkup = data.Markup;
									$("#cookie-banner").prepend(banerMarkup);
									document.getElementById("cookie-banner").style.display = "block";
									document.getElementById("msccBanner").style.display = "block";
								}
							});
						} catch(Error){

						}
					}
                },
                error:
                function (xhr, status, error) {
                	console.log(error);
                }
         });
	});
})(LITHIUM.jQuery);
</@liaAddScript>