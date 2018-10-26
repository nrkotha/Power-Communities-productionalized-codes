<#include "common_utils.ftl" />
<#if (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >

<@liaAddScript>
; (function ($) {
	$(".lia-form-subject-entry label").html("Event title").show();
	$(".lia-form-body-entry label").html("Event description").show();

	$("input[type=submit]").click(function(e){
		$("p#describedBy_microsoftmsg_start_datetime.lia-form-error-text").remove();
		$("p#describedBy_microsoftmsg_end_datetime.lia-form-error-text").remove();
		
		if ($("#s_dateid1").val() == ""){
			
			$(".lia-form-microsoftmsg-start-datetime-input").addClass("lia-form-field-error");
			if ($(".lia-form-microsoftmsg-start-datetime-input p").length == 0){
				//$(".lia-form-microsoftmsg-start-datetime-input").append('<p role="alert" id="describedBy_microsoftmsg_start_datetime" class="lia-form-error-text">Please enter a value for this field.</p>');
				$(".lia-form-microsoftmsg-start-datetime-input").after('<p role="alert" id="describedBy_microsoftmsg_start_datetime" class="lia-form-error-text">Please enter a value for this field.</p>');
			}
			
			$(".lia-button-Submit-action").removeClass("lia-link-disabled");
			$(".lia-button-wrapper-Submit-action").removeClass("lia-link-disabled");
			$(".lia-button-Cancel-action").removeClass("lia-link-disabled");
			$(".lia-button-wrapper-Cancel-action").removeClass("lia-link-disabled");
			$(".lia-button-wrapper-Submit-action .lia-button-overlay").hide();
			
			$('html, body').animate({
            	scrollTop: $("#s_dateid1").offset().top
            }, 200);
			
			return false;
		} else if ($("#e_dateid1").val() == ""){
			$(".lia-form-microsoftmsg-end-datetime-input").addClass("lia-form-field-error");
			if ($(".lia-form-microsoftmsg-end-datetime-input p").length == 0){
				//$(".lia-form-microsoftmsg-end-datetime-input").append('<p role="alert" id="describedBy_microsoftmsg_end_datetime" class="lia-form-error-text">Please enter a value for this field.</p>');
				$(".lia-form-microsoftmsg-end-datetime-input").after('<p role="alert" id="describedBy_microsoftmsg_end_datetime" class="lia-form-error-text">Please enter a value for this field.</p>');
			}
			
			$(".lia-button-Submit-action").removeClass("lia-link-disabled");
			$(".lia-button-wrapper-Submit-action").removeClass("lia-link-disabled");
			$(".lia-button-Cancel-action").removeClass("lia-link-disabled");
			$(".lia-button-wrapper-Cancel-action").removeClass("lia-link-disabled");
			$(".lia-button-wrapper-Submit-action .lia-button-overlay").hide();
			
			$('html, body').animate({
            	scrollTop: $("#e_dateid1").offset().top
            }, 200);
			
			return false;
		}
	});
	$("#s_dateid1").change(function(){
		$(".lia-form-microsoftmsg-start-datetime-input").removeClass("lia-form-field-error");
		$(".lia-form-microsoftmsg-start-datetime-input p").remove();
	
		$(".lia-button-Submit-action").removeClass("lia-link-disabled");
		$(".lia-button-wrapper-Submit-action").removeClass("lia-link-disabled");
		$(".lia-button-Cancel-action").removeClass("lia-link-disabled");
		$(".lia-button-wrapper-Cancel-action").removeClass("lia-link-disabled");
		$(".lia-button-wrapper-Submit-action .lia-button-overlay").hide();
	});
	$("#e_dateid1").change(function(){
		$(".lia-form-microsoftmsg-end-datetime-input").removeClass("lia-form-field-error");
		$(".lia-form-microsoftmsg-end-datetime-input p").remove();
	
		$(".lia-button-Submit-action").removeClass("lia-link-disabled");
		$(".lia-button-wrapper-Submit-action").removeClass("lia-link-disabled");
		$(".lia-button-Cancel-action").removeClass("lia-link-disabled");
		$(".lia-button-wrapper-Cancel-action").removeClass("lia-link-disabled");
		$(".lia-button-wrapper-Submit-action .lia-button-overlay").hide();
	});

})(LITHIUM.jQuery);
</@liaAddScript>

</#if>