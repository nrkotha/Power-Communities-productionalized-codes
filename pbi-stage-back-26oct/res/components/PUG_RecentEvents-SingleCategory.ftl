<#if coreNode.id == "Community" || coreNode.id == "Microsoft" || coreNode.id == "PastEvents" || coreNode.id == "OnDemandEvents" || coreNode.id == "Events" >

	<#if http.request.parameters.name.page?? >
		<#assign pageNumber = http.request.parameters.name.page?number />
	<#else>
		<#assign pageNumber = 1 />
	</#if>
	<#assign noOfPostsToDisplay = 10 />
	<#assign eventsToSort = [] />
	<#assign allEventsSortedByStartDate = appcache.get("allEventsSortedByStartDate-${coreNode.id}-${pageNumber}")![] />
	<#assign eventsToSortSize = appcache.get("eventsToSortSize")!0 />
	<#assign customDateFormat = "MM/dd/yyyy h:mm:a" />
	<#if (!allEventsSortedByStartDate?? || !(allEventsSortedByStartDate?size gt 0)) || !(eventsToSortSize gt 0) >
		<#assign noOfPostsToFetch = 1000 />
		<#assign sourceBoards = "'${coreNode.id}'"/>
		<#assign query = "SELECT id, subject, body, view_href, c_event_summary, c_event_location, c_event_street, c_event_city, c_event_state, c_event_country, c_start_date, c_end_date FROM messages WHERE board.id IN (${sourceBoards}) AND depth=0 ORDER BY post_time DESC LIMIT ${noOfPostsToFetch}" />
		<#assign queryResult = restadmin("2.0", "/search?q=" + query?url("UTF-8")) />
		<#if queryResult.status == "success" && queryResult.data?? && queryResult.data?has_content && queryResult.data.items?? && queryResult.data.items?has_content>
			<#list queryResult.data.items as event>
				<#if event.c_start_date?? && event.c_start_date?has_content && event.c_start_date?length gt 0 && event.c_end_date?? && event.c_end_date?has_content && event.c_end_date?length gt 0>
					<#assign eventsToSort = eventsToSort + [event] />
				</#if>
			</#list>
			<#assign allEventsSortedByStartDate = eventsToSort?sort_by("c_start_date")?chunk(noOfPostsToDisplay)[pageNumber-1] />
			<#assign allEventsSortedByStartDate = appcache.put("allEventsSortedByStartDate-${coreNode.id}-${pageNumber}", allEventsSortedByStartDate)/>
			<#assign eventsToSortSize = eventsToSort?size />
			<#assign eventsToSortSize = appcache.put("eventsToSortSize", eventsToSort?size)/>
		</#if>
	</#if>

	<#assign totalPages = (eventsToSortSize / noOfPostsToDisplay)?ceiling />

	<#if allEventsSortedByStartDate?? || !(allEventsSortedByStartDate?size gt 0)>
		<div class="lia-component-custom-most-recent-events">
			
			<#list allEventsSortedByStartDate as event>
				<#assign event_image = "" />
				<#attempt>
					<#-- <#assign image_attachments = rest("/messages/id/${event.id}/uploads/attachments").attachments /> -->
					<#assign image_attachments = restadmin("/messages/id/${event.id}/uploads/images/index/0").image />
				<#recover>
				</#attempt>
					<#if image_attachments?? && image_attachments.url?? >
						<#assign event_image = image_attachments.url />
					<#else>
						<#-- <#assign event_image = skin.images.image_not_found.url /> -->
						<#assign event_image = "" />
					</#if>
				<div class="event">
					<div class="event-title"><a href="${event.view_href}">${event.subject}</a></div>
					<#if event_image?has_content>
						<div class="event-image"><a href="${event.view_href}"><img src="${event_image}" title="${event.subject}" alt="${event.subject}" height="150" width="150" /></a></div>
					<#else>	
						<div class="event-image"><a href="${event.view_href}"><img src="${asset.get('/html/assets/event_placeholder_image.png')}" title="${event.subject}" alt="${event.subject}" height="140" width="150" /></a></div>
					</#if>
					<div class="event-details">
						<div class="what">
							<div class="section-title">${text.format("custom-most-recent-events.what")}</div>
							<div class="section-desc">
								<div class="title"><a href="${event.view_href}">${event.subject}</a></div>
								<div class="summary">${event.c_event_summary!""}</div>
							</div>
						</div>
						<div class="when">
							<div class="section-title">${text.format("custom-most-recent-events.when")}</div>
							<div class="section-desc">
								<#if event.c_start_date?? && event.c_end_date??>
									<#attempt>
										<#if event.c_start_date?trim?matches("^[0-9]*")>
											<#assign eventStartDate = event.c_start_date?trim?number?number_to_datetime?string['${customDateFormat}'] />
										<#else>
											<#assign eventStartDate = text.format("custom-most-recent-events.no-dates-available") />
										</#if>
									<#recover>
										<#assign eventStartDate = text.format("custom-most-recent-events.no-dates-available") />
										<!-- ${.error} -->
									</#attempt>
	                            	<div class="start-time">${eventStartDate}</div>
								<#else>
									<div class="dates-not-available">${text.format("custom-most-recent-events.no-dates-available")}</div>
								</#if>
							</div>
						</div>
						<div class="where">
							<div class="section-title">${text.format("custom-most-recent-events.where")}</div>
							<div class="section-desc">
								<#if event.c_event_location?? && event.c_event_street?? && event.c_event_city?? && event.c_event_state?? && event.c_event_country??>
									<div class="address"><span>${event.c_event_location!""}</span> <span>${event.c_event_street!""}</span></div>
									<div class="city">${event.c_event_city!""}</div>
									<div class="state">${event.c_event_state!""}</div>
									<div class="country">${event.c_event_country!""}</div>
								<#else>
									<div class="location-not-available">${text.format("custom-most-recent-events.no-location-available")}</div>
								</#if>
							</div>
						</div>
					</div>
				</div>
			</#list>
		</div>
		<div class="pagination">
			<#if pageNumber gt 1 >
				<a href="${coreNode.webUi.url}/name?page=${pageNumber-1}" class="pagination-buttons"><i class="fa fa-chevron-left"></i></a>
			<#else>
				<span id="back" class="pagination-buttons disabled"><i class="fa fa-chevron-left"></i></span>
			</#if>

			<#list 1..totalPages as p>
			  <#if pageNumber == p>
			  	<#assign status = "active" />
			  <#else>
			  	<#assign status = "not-active" />
			  </#if >
			  <a href="${coreNode.webUi.url}/name?page=${p}" class="page-num ${status} pagination-buttons" background=>${p}</a>
			</#list>

			<#if pageNumber lt totalPages >
				<a href="${coreNode.webUi.url}/name?page=${pageNumber+1}" class="pagination-buttons"><i class="fa fa-chevron-right"></i></i></a>
			<#else>
				<span id="next" class="pagination-buttons disabled"><i class="fa fa-chevron-right"></i></span>
			</#if>
		</div>

	</#if>

	<style>
	    #messageList{
            display: none !important;
        }
        .pagination {
        	text-align: center;
			display: block;
        }
        .pagination-buttons {
        	height: 35px;
        	width: 35px;
        	border-radius: 2px;
        	line-height: 35px;
        	margin: 3px;
        }
        .pagination-buttons i {
        	font-size: 1.4em;
        	vertical-align: middle;
        	padding-bottom: 2px;
        }
        .page-num {
        	border: 1px solid #ccc;
        	padding: 5px 10px;
        }
        .lia-body .lia-content .page-num:hover,
        .lia-body .lia-content .page-num:active,
        .lia-body .lia-content .page-num:focus {
        	border-color: #BE9A27;
        	text-decoration: none;
        }
        .active {
        	border-color: #BE9A27;
        }
        .disabled {
        	color: #cecece;
        }

 	</style>

</#if>
