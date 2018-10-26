<#include "common_utils.ftl" />

<#assign showLabel = false />
<#if user.registered && (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >
  
      <#assign showLabel = true />
      <input class="lia-form-microsoftmsg-end-datetime-input lia-form-type-text lia-form-input-vertical" id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" value="${(env.context.form.field.control.value)!""}"  type="text" style="display:none" />

      <input id="e_dateid" onchange="update_e_el();" value="${decompose( (env.context.form.field.control.value)!"",1)}" class="lia-form-type-text lia-form-input-horizontal" type="text" />

      <select id="e_hourid" onchange="update_e_el();" >
        <#list 1..12 as x>
          <option ${decompose( (env.context.form.field.control.value)!"",2, x)} >${x}</option>
        </#list>
      </select>

      <select id="e_minid" onchange="update_e_el();" >
        <option ${decompose( (env.context.form.field.control.value)!"",3, 1)} >00</option>
        <option ${decompose( (env.context.form.field.control.value)!"",3, 2)} >15</option>
        <option ${decompose( (env.context.form.field.control.value)!"",3, 3)} >30</option>
        <option ${decompose( (env.context.form.field.control.value)!"",3, 4)} >45</option>
      </select>

      <select id="e_amid" onchange="update_e_el();" >
       <option ${decompose( (env.context.form.field.control.value)!"",4, 1)} >AM</option>
       <option ${decompose( (env.context.form.field.control.value)!"",4, 2)} >PM</option>
      </select>      
      

</#if>
<#if !showLabel>
  <style>
    .lia-form-microsoft-msg-end-datetime-entry { display: none }
  </style>
<#else>
  <@liaAddScript>
  ;(function ($){
    if ( $("#e_dateid").length ){
      $.getScript("/html/assets/ui.datepicker.js",function(){
        $("#s_dateid").datepicker({
          showOn: "button",
          buttonImage: "${skin.images.button_calendar.url}",
          buttonImageOnly: true,
          buttonText: "Select start date"
        });

        $("#e_dateid").datepicker({
          showOn: "button",
          buttonImage: "${skin.images.button_calendar.url}",
          buttonImageOnly: true,
          buttonText: "Select end date"
        });

      });
    }
  }(LITHIUM.jQuery));

  function update_el(outId, inId1, inId2, inId3, inId4) 
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
  function update_s_el() { update_el("microsoftmsg_start_datetime", "s_dateid", "s_hourid", "s_minid", "s_amid"); }
  function update_e_el() { update_el("microsoftmsg_end_datetime", "e_dateid", "e_hourid", "e_minid", "e_amid"); }
  </@liaAddScript>
</#if>