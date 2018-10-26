<#include "common_utils.ftl" />
<#assign customDateFormat = "MM/dd/yyyy h:mm:a" />
<#assign showLabel = false />
<#if (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >
    
    <#assign event_custimization = http.session.attributes.name.get("event_custimization", '') />
    <#if event_custimization == 'true'> 

      <#attempt>
        <#assign message_details = rest("2.0","/search?q=" + "Select c_event_metadata FROM messages WHERE id = '${page.context.thread.topicMessage.uniqueId}'"?url).data.items[0] />
        <#assign article_teaser = message_details.c_event_metadata?replace("<[^>]*>","", "r") />
      <#recover>
        <#assign article_teaser = "" />
      </#attempt>

        <#assign style = "" />
        <#if page.name == "EditPage" && article_teaser!= '' && article_teaser?eval['Category']?? && article_teaser?eval['Category'] == "Online">
              <#assign style = "display:block">
        </#if> 

      <div class ="field-absolute" style="${style}">

  		<div class="online_url">
  		    <div class="event-label">
  			   <label>URL for Online Event</label>
  			</div>
  			<div class="event-field">
  				<input id="online_event_url" <#if article_teaser != '' && article_teaser?eval['OnlineEventUrl']??>value="${article_teaser?eval['OnlineEventUrl']}"</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="Enter Online Event Url" />
  			</div>
  	 </div>


  	   <div class="special-permissions">

    			<div class="webinar_gallary">
    				<div class="event-field">
    				   <label>Publish to Webinar Gallery?</label>
    				   <input value="True" id="publish_to_community" <#if article_teaser != '' && article_teaser?eval['PublishToWebinar']??>CHECKED</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="checkbox" />
    				</div>
    			</div>

  		</div>

      <div class="online_url">
          <div class="event-label">
           <label>Webinar gallery URL</label>
        </div>
        <div class="event-field">
          <input id="WebinarGalleryUrl" <#if article_teaser != '' && article_teaser?eval['WebinarGalleryUrl']??>value="${article_teaser?eval['WebinarGalleryUrl']}"</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="Enter WebinarGalleryUrl Gallery Url" />
        </div>
     </div>

  	</div>
    
      <div class="timezone">
        <div class="event-label">
           <label>Timezone</label>
        </div>
        <div class="event-field">
          <select id="e_timezone">
            <#assign timezoneArray = ["International Date Line West (GMT-12:00)","Midway Island, Samoa (GMT-11:00)","Hawaii (GMT-10:00)","Alaska (GMT-09:00)","Pacific Time (US &amp; Canada) (GMT-08:00)","Tijuana, Baja California (GMT-08:00)","Chihuahua, La Paz, Mazatlan - Old (GMT-07:00)","Mountain Time (US &amp; Canada) (GMT-07:00)","Chihuahua, La Paz, Mazatlan - New (GMT-07:00)","Arizona (GMT-07:00)","Guadalajara, Mexico City, Monterrey - Old (GMT-06:00)","Saskatchewan (GMT-06:00)","Central America (GMT-06:00)","Central Time (US &amp; Canada) (GMT-06:00)","Guadalajara, Mexico City, Monterrey - New (GMT-06:00)","Eastern Time (US &amp; Canada) (GMT-05:00)","Bogota, Lima, Quito, Rio Branco (GMT-05:00)","Indiana (East) (GMT-05:00)","Caracas (GMT-04:30)","La Paz (GMT-04:00)","Santiago (GMT-04:00)","Manaus (GMT-04:00)","Atlantic Time (Canada) (GMT-04:00)","Newfoundland (GMT-03:30)","Greenland (GMT-03:00)","Montevideo (GMT-03:00)","Brasilia (GMT-03:00)","Buenos Aires, Georgetown (GMT-03:00)","Mid-Atlantic (GMT-02:00)","Azores (GMT-01:00)","Cape Verde Is. (GMT-01:00)","Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London (GMT)","Casablanca, Monrovia, Reykjavik (GMT)","Brussels, Copenhagen, Madrid, Paris (GMT+01:00)","Belgrade, Bratislava, Budapest, Ljubljana, Prague (GMT+01:00)","Sarajevo, Skopje, Warsaw, Zagreb (GMT+01:00)","West Central Africa (GMT+01:00)","Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna (GMT+01:00)","Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius (GMT+02:00)","Cairo (GMT+02:00)","Harare, Pretoria (GMT+02:00)","Jerusalem (GMT+02:00)","Amman (GMT+02:00)","Beirut (GMT+02:00)","Windhoek (GMT+02:00)","Athens, Bucharest, Istanbul (GMT+03:00)","Moscow, St. Petersburg, Volgograd (GMT+03:00)","Tbilisi (GMT+03:00)","Minsk (GMT+03:00)","Nairobi (GMT+03:00)","Kuwait, Riyadh (GMT+03:00)","Baghdad (GMT+03:00)","Tehran (GMT+03:30)","Yerevan (GMT+04:00)","Abu Dhabi, Muscat (GMT+04:00)","Baku (GMT+04:00)","Caucasus Standard Time (GMT+04:00)","Kabul (GMT+04:30)","Ekaterinburg (GMT+05:00)","Islamabad, Karachi, Tashkent (GMT+05:00)","Chennai, Kolkata, Mumbai, New Delhi (GMT+05:30)","Sri Jayawardenepura (GMT+05:30)","Kathmandu (GMT+05:45)","Almaty, Novosibirsk (GMT+06:00)","Astana, Dhaka (GMT+06:00)","Yangon (Rangoon) (GMT+06:30)","Bangkok, Hanoi, Jakarta (GMT+07:00)","Krasnoyarsk (GMT+07:00)","Irkutsk, Ulaan Bataar (GMT+08:00)","Kuala Lumpur, Singapore (GMT+08:00)","Taipei (GMT+08:00)","Beijing, Chongqing, Hong Kong, Urumqi (GMT+08:00)","Perth (GMT+08:00)","Yakutsk (GMT+09:00)","Osaka, Sapporo, Tokyo (GMT+09:00)","Seoul (GMT+09:00)","Darwin (GMT+09:30)","Adelaide (GMT+09:30)","Canberra, Melbourne, Sydney (GMT+10:00)","Brisbane (GMT+10:00)","Hobart (GMT+10:00)","Guam, Port Moresby (GMT+10:00)","Vladivostok (GMT+10:00)","Magadan, Solomon Is., New Caledonia (GMT+11:00)","Fiji, Kamchatka, Marshall Is. (GMT+12:00)","Auckland, Wellington (GMT+12:00)"] />
            <option value="">Select a timezone</option>
            <#list timezoneArray as timezone >
              <option value="${timezone}" <#if article_teaser != '' && article_teaser?eval['Timezone']?? && article_teaser?eval['Timezone'] == "${timezone}">SELECTED</#if>>${timezone}</option>
            </#list>
          </select>
        </div>
      </div>

    </#if>

      <#assign showLabel = true />
    <#attempt>
      <#assign startDate = env.context.form.field.control.value?number?number_to_datetime?string['${customDateFormat}'] />  
    <#recover>
      <#assign startDate = "" />
    </#attempt>
    
        <#if event_custimization == 'true'> 
        	<div class="lia-form-label-wrapper" style="display:block">
        		<label for="microsoftmsg_start_date" class="lia-form-label">** Required: Start date</label>	
        	</div>
        </#if>

      <input class="lia-form-microsoftmsg-start-datetime-input lia-form-type-text lia-form-input-horizontal" 
        id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" 
        value="${(env.context.form.field.control.value)!""}"  type="text" style="display:none" /> 
      <input id="s_dateid1" onchange="update_s_e2();" value="${decompose(startDate,1)}" 
        class="lia-form-type-text lia-form-input-horizontal" type="text" />
      <select id="s_hourid1" onchange="update_s_e2();" >
        <#list 1..12 as x>
          <option ${decompose( startDate,2, x)} >${x}</option>
        </#list>
      </select>
      <select id="s_minid1" onchange="update_s_e2();" >
        <option ${decompose(startDate,3, 1)} >00</option>
        <option ${decompose(startDate,3, 2)} >15</option>
        <option ${decompose(startDate,3, 3)} >30</option>
        <option ${decompose(startDate,3, 4)} >45</option>
      </select>
      <select id="s_amid1" onchange="update_s_e2();" >
       <option ${decompose(startDate,4, 1)} >AM</option>
       <option ${decompose(startDate,4, 2)} >PM</option>
      </select>
</#if>
<#if !showLabel>
  <style>
    .lia-form-microsoft-msg-start-date-entry { display: none }
  </style>
</#if>