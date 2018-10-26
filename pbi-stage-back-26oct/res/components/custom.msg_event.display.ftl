<#if env.context.message??>
	<#assign msgid = env.context.message.uniqueId />
	<#assign query = "SELECT c_event_summary,c_event_location,c_event_street,c_event_city,c_event_state,c_event_country, c_start_date, c_end_date FROM messages where id = '${msgid}'"?url('utf-8') />
	<#attempt>
		<#assign event = rest("2.0","/search?q="+query).data.items[0] />
	<#recover>
		<#assign event = "">
	</#attempt>
	
	<#if event?? && event?has_content && event.c_event_summary??>
		<#assign customDateFormat = "MM/dd/yyyy h:mm:a" />
		<div class="event-details">
		<div class="event-summary"><#if event.c_event_summary??>${event.c_event_summary}</#if></div>
		<div class="event-full-address">
			<div class="event-location"><#if event.c_event_location??>${event.c_event_location}</#if></div>
			<div class="event-street"><#if event.c_event_street??>${event.c_event_street}</#if></div>
			<div class="event-geography">
				<span class="event-city"><#if event.c_event_city??>${event.c_event_city}</#if></span>, 
				<span class="event-state"><#if event.c_event_state??>${event.c_event_state}</#if></span> 
				<span class="event-country"><#if event.c_event_country??>${event.c_event_country}</#if></span>
			</div>
			<div class="event-start">
				<span class="event-start-label">Start: </span> 
				<span class="datetime">
					<#if event.c_start_date?? && event.c_start_date?trim?matches("^[0-9]*") >		
						${event.c_start_date?trim?number?number_to_datetime?string['${customDateFormat}']}
					</#if>
				</span>
			</div>
			<div class="event-end">
				<span class="event-end-label">End: </span>
				<span class="datetime">
					<#if event.c_end_date?? && event.c_end_date?trim?matches("^[0-9]*") >
						${event.c_end_date?trim?number?number_to_datetime?string['${customDateFormat}']}
					</#if>
				</span>
			</div>
		</div>
		</div>
	</#if>
</#if>