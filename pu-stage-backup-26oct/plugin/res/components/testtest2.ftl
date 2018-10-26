<#assign currentYear = .now?string("yyyy")>
<#assign dateFormat = "dd.mm.yy">
<input id="startday" name="startday" onchange="alert(1);">
<input id="endday" name="endday">
<@liaAddScript>
;(function ($){
	if ( $('input[name="startday"]').length ){
		$.getScript("/html/assets/ui.datepicker.js",function(){
			$("#startday").datepicker({
				showOn: "button",
				buttonImage: "${skin.images.button_calendar.url}",
				buttonImageOnly: true,
				buttonText: "Select date"
			});

			$("#endday").datepicker({
				showOn: "button",
				buttonImage: "${skin.images.button_calendar.url}",
				buttonImageOnly: true,
				buttonText: "Select date"
			});

		});
	}
}(LITHIUM.jQuery));
</@liaAddScript>
