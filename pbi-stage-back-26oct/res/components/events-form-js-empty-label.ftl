
<#include "common_utils.ftl" />
<#if (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >

<@liaAddScript>
; (function ($) {

	// $("input[type=submit]").click(function(e){
		
	// 	$("p#describedBy_microsoftmsg_labels.lia-form-error-text").remove();
	// 	if ($("input#lia-labels").val() == ""){
	// 		$("input#lia-labels").after('<p role="alert" id="describedBy_microsoftmsg_labels" class="lia-form-error-text">This board requires at least one label for each message.</p>');;
			
	// 		$('html, body').animate({
 //            	scrollTop: $("input#lia-labels").offset().top
 //            }, 200);
	// 		return false;
	// 	}
	// });

})(LITHIUM.jQuery);
</@liaAddScript>

</#if>

