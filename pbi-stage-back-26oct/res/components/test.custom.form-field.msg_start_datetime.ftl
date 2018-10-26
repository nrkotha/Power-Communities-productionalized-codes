<div>
<input type="text" id="datepicker55">
</div>
<@liaAddScript>
;(function($){
  	$.getScript("${asset.get("/html/assets/jquery-ui.js")}").done(function(){	
        $("#datepicker55" ).datepicker();
  });
 })(LITHIUM.jQuery);
</@liaAddScript>
