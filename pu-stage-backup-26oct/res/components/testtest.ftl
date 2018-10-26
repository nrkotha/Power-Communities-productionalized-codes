<#assign currentYear = .now?string("yyyy")>
<#assign dateFormat = "dd.mm.yy">
<input name="profilebday">
<@liaAddScript>
;(function ($){
	if ( $('input[name="profilebday"]').length ){
		$.getScript("/html/assets/ui.datepicker.js",function(){
			$.getScript("/html/assets/SimpleDatePicker.js",function(){
				LITHIUM.DatePicker('input[name="profilebday"]', '#lia-profileBirthdayFormat', '${skin.images.button_calendar.url}', -1, -1, -1, '${text.format("text.datepicker.description")}', '${currentYear?number-80}:${currentYear}');
				LITHIUM.DatePicker.setDefaultsAndFormat('en','${dateFormat}');
			});
		});
	}
	if ( $('.lia-form-date-picker-creator-entry').length ){
		$('.lia-form-date-picker-creator-entry').hide();
	}
}(LITHIUM.jQuery));
</@liaAddScript>