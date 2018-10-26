<#include "common_utils.ftl" />

<#assign showLabel = false />
<#if (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >
	
			<#assign showLabel = true />

			<#assign initalStyle = "" />
			<#assign initalSelect = "" />
			<#if ( ((env.context.form.field.control.value)!"") == "") >
				<#assign initalStyle = "style='color:grey;'" />
				<#assign initalSelect = "selected" />
			</#if>

			<#assign event_custimization = http.session.attributes.name.get("event_custimization", '') />
     		<#if event_custimization == 'true'>	

				<#attempt>
				  <#assign message_details = rest("2.0","/search?q=" + "Select c_event_metadata FROM messages WHERE id = '${page.context.thread.topicMessage.uniqueId}'"?url).data.items[0] />
				  <#assign article_teaser = message_details.c_event_metadata?replace("<[^>]*>","", "r") />
				<#recover>
				  <#assign article_teaser = "" />
				</#attempt>

	            <input placeholder="zip" class="e_zip" type="text" id="e_zip" <#if article_teaser != '' && article_teaser?eval['PostalCode']??>value="${article_teaser?eval['PostalCode']}"</#if> >

            </#if>

			<select class="lia-form-microsoftmsg-event-country-input" id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" ${initalStyle} onchange="if (this.selectedIndex == '0') this.style.color='grey'; else this.style.color='black';"/>
				<option disabled default ${initalSelect}>${text.format("microsoft.msg_event_country.placeholder")}</option>
				<#list text.format("microsoft.country_list")?split(",") as code>
					<#assign isSelected = "" />
					<#if ( ((env.context.form.field.control.value)!"") == code) >
						<#assign isSelected = "selected" />
					</#if>
					<option data-value="${text.format("microsoft.msg_event_country." + code + ".title")}" value="${code}" ${isSelected}>${text.format("microsoft.msg_event_country." + code + ".title")}</option>
				</#list>
			</select>

</#if>
<#if !showLabel>
	<style>
          .lia-form-microsoft-msg-event-country-entry { display: none }
        </style>
<#else>
	<style>
          .lia-form-microsoft-msg-event-country-entry .lia-form-label-wrapper{ display: none }
        </style>
</#if>