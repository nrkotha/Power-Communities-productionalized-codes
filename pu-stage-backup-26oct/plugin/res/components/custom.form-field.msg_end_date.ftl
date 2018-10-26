<#include "common_utils.ftl" />
<#assign customDateFormat = "MM/dd/yyyy h:mm:a" />
<#assign showLabel = false />
<#if (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >
      <#assign showLabel = true />
		<#attempt>
			<#assign endDate = env.context.form.field.control.value?number?number_to_datetime?string['${customDateFormat}'] />	
		<#recover>
			<#assign endDate = "" />
		</#attempt>

      <input class="lia-form-microsoftmsg-end-datetime-input lia-form-type-text lia-form-input-vertical" 
      	id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" 
      	value="${(env.context.form.field.control.value)!""}"  type="text" style="display:none" />

      <input id="e_dateid1" onchange="update_e_e2();" value="${decompose(endDate,1)}" class="lia-form-type-text lia-form-input-horizontal" type="text"  />

      <select id="e_hourid1" onchange="update_e_e2();" >
        <#list 1..12 as x>
          <option ${decompose( endDate,2, x)} >${x}</option>
        </#list>
      </select>

      <select id="e_minid1" onchange="update_e_e2();" >
        <option ${decompose(endDate,3, 1)} >00</option>
        <option ${decompose(endDate,3, 2)} >15</option>
        <option ${decompose(endDate,3, 3)} >30</option>
        <option ${decompose(endDate,3, 4)} >45</option>
      </select>

      <select id="e_amid1" onchange="update_e_e2();" >
       <option ${decompose(endDate,4, 1)} >AM</option>
       <option ${decompose(endDate,4, 2)} >PM</option>
      </select>      
      

</#if>
<#if !showLabel>
  <style>
    .lia-form-microsoft-msg-end-date-entry { display: none }
  </style>
<#else>
  <@liaAddScript>
  ;(function ($){
    if ( $("#e_dateid1").length ){
      $.getScript("/html/assets/ui.datepicker.js",function(){
        $("#s_dateid1").datepicker({
          showOn: "both",
          buttonImage: "${skin.images.button_calendar.url}",
          buttonImageOnly: true,
          buttonText: "Select start date",
          dateFormat: "mm/dd/yy"
        });

        $("#e_dateid1").datepicker({
          showOn: "both",
          buttonImage: "${skin.images.button_calendar.url}",
          buttonImageOnly: true,
          buttonText: "Select end date",
          dateFormat: "mm/dd/yy"
        });

      });
    }
  }(LITHIUM.jQuery));

  function update_e2(outId, inId1, inId2, inId3, inId4) 
  {
    if (document.getElementById(inId1).value == "") 
    {
      document.getElementById(outId).value = "";
    } 
    else
    {
      document.getElementById(outId).value = 
        document.getElementById(inId1).value +  " " +
        document.getElementById(inId2).value +  ":" +
        document.getElementById(inId3).value +  ":" +      
        document.getElementById(inId4).value;
		jQuery.ajax({
			type: "POST",
			async: false,
			url: "/plugins/custom/microsoft/microsoftbi/datetomillisconvertor?dateToConvert="+document.getElementById(outId).value,
			success:function(data){
						document.getElementById(outId).value =  data;
					}
		});
     }
  }
  function update_s_e2() { update_e2("microsoftmsg_start_date", "s_dateid1", "s_hourid1", "s_minid1", "s_amid1"); }
  function update_e_e2() { update_e2("microsoftmsg_end_date", "e_dateid1", "e_hourid1", "e_minid1", "e_amid1"); }
  </@liaAddScript>
</#if>