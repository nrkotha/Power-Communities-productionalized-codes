;(function($LITH) {
	LITHIUM.DatePicker = function(dateFieldSelector, dateFormatSelector, imageUrl, year, month, day, dateDescriptionText, rangeOfYears) {		
		$LITH(function() {
			var datePickerElement = $LITH(dateFieldSelector);
			var dateFormatElement = $LITH(dateFormatSelector);
			
			datePickerElement.datepicker({
				beforeShow: function(input, inst) {
					inst.dpDiv.css("z-index", 3000);
					
					if ($LITH(input).data("shim") === true) {
						window.setTimeout(function() {
							inst.dpDiv.shim();
						}, 50); //timeout needs to wait until calendar has shown up, which we have set to 1ms 
					}
				},
				onClose: function(dateText, inst) {					
					if ($LITH(inst.input).data("shim") === true) {
						inst.dpDiv.shim(false);
					}
				},
				showOn: 'button', 
				buttonImage: imageUrl, 
				buttonImageOnly: true, 
				buttonText: dateDescriptionText, 
				changeMonth: true, 
				changeYear: true, 
				yearRange:rangeOfYears
			});
			
			dateFormatElement.val($LITH.datepicker._defaults.dateFormat);
			
			if ($LITH.trim(datePickerElement.val()) == "") {
				datePickerElement.val(extendYear(dateFormatElement.val()));
			}
			
			if (year > -1 && month > -1 && day > -1) {
				datePickerElement.datepicker("setDate", new Date(year, month, day));
			}
			
			datePickerElement.bind("focus", function(event){
				if(datePickerElement.val() == extendYear(dateFormatElement.val())){
					datePickerElement.val("");
				}
			});
			
			datePickerElement.bind("blur", function(event){
				var datePickerElementValue = datePickerElement.val(); 
				if(datePickerElementValue == null || $LITH.trim(datePickerElementValue) == ""){
					datePickerElement.val(extendYear(dateFormatElement.val()));
				}
			});
			
			// Extends the year format to display from 'yy' to 'yyyy'
			function extendYear(extendDateFormat) {
				return extendDateFormat.replace("yy","yyyy");
			}
		});		
	};
	
	LITHIUM.DatePicker.setDefaults = function(language) {
		$LITH(function() {
			// Both US and GB English should use the default
			language = (language == "en" || language == "en-gb") ? "" : language;
			
			// both portuguese and brazilian portuguese should use pt-BR, the only variant of
			// portuguese supported by jqueryui
			language = (language == "pt" || language == "pt-br") ? "pt-BR" : language;
			
			// Jqueryui does not understand Mexican Spanish. Default to spanish.
			language = (language == "es-mx") ? "es" : language;
			
			// Indonesia uses 'id' for jquery ui but 'in' everywhere else 
			language = (language == "in") ? "id" : language;
			
			/*
			 * LIA-24872 There is a bug with the date picker converting the
			 * date when MM is used, we convert it to mm.
			 */
			var langDefaults = $LITH.datepicker.regional[language];				
			langDefaults.dateFormat = langDefaults.dateFormat.replace("MM", "mm");
			$LITH.datepicker.setDefaults(langDefaults);
			
			
			var opts = $LITH.extend({showMonthAfterYear: false}, $LITH.datepicker.regional[language]);
			opts.duration = 1;
			opts.showAnim = "show";
			
			$LITH.datepicker.setDefaults(opts);
		});
	}
	
	LITHIUM.DatePicker.setDefaultsAndFormat = function(language, dateFormat) {
		$LITH(function() {
			// Both US and GB English should use the default
			language = (language == "en" || language == "en-gb") ? "" : language;
			
			// both portuguese and brazilian portuguese should use pt-BR, the only variant of
			// portuguese supported by jqueryui
			language = (language == "pt" || language == "pt-br") ? "pt-BR" : language;
			
			// Jqueryui does not understand Mexican Spanish. Default to spanish.
			language = (language == "es-mx") ? "es" : language;
			
			// Indonesia uses 'id' for jquery ui but 'in' everywhere else 
			language = (language == "in") ? "id" : language;
			
			/*
			 * LIA-24872 There is a bug with the date picker converting the
			 * date when MM is used, we convert it to mm.
			 */
			var langDefaults = $LITH.datepicker.regional[language];

			dateFormat = (dateFormat == "") ? langDefaults.dateFormat.replace("MM", "mm") : dateFormat;
			langDefaults.dateFormat = dateFormat;
			$LITH.datepicker.setDefaults(langDefaults);
			
			var opts = $LITH.extend({showMonthAfterYear: false}, $LITH.datepicker.regional[language]);
			opts.duration = 1;
			opts.showAnim = "show";
			
			$LITH.datepicker.setDefaults(opts);
		});
	}
	
})(LITHIUM.jQuery);
