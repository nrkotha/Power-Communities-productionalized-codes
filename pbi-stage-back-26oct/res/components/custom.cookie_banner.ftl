<#-- Following code is related for cookie compliance, to show banner and to grant consent -->
<@liaAddScript>
;(function ($) {
	var consentOnClick = function () {
		/* var allLinks = document.links;
		// Bind the event handler to each link individually
		for (var i = 0, n = allLinks.length; i < n; i++) {
			 allLinks[i].onclick = function () {
				 console.log('link clicked!');
				 mscc.setConsent();
			 };
		} */

		$(document).on("click", "a", function() {
			mscc.setConsent();
		});

	 	$("input[type='submit']").click(function(){
			mscc.setConsent();
    	});

    $("#meControl .msame_Header_name").on("click",function(e){
			mscc.setConsent();
		})



    	$("select").change(function() {
			mscc.setConsent();
			return true;
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
									
									var cookie_css_link = document.createElement("link");
									cookie_css_link.href = "/plugins/custom/microsoft/microsoftbi/cookie_banner_css";
									cookie_css_link.rel = "stylesheet";
									cookie_css_link.type = "text/css";
									$("head").append(cookie_css_link);

									consentOnClick();
									var banerMarkup = data.Markup;
									$("#cookie-banner").prepend(banerMarkup);
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