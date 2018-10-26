<!-- gz.event-message-banner-title --> 
 <#assign msgid = page.context.message.uniqueId />
  <#if msgid??>

  <#assign query = "SELECT subject,view_href,c_event_summary,c_event_state,c_event_country,c_start_date,c_end_date,c_event_metadata FROM messages where id = '${msgid}'"?url('utf-8') />
  <#attempt>
    <#assign event = rest("2.0","/search?q="+query).data.items[0] />
  <#recover>
    <#assign event = "">
  </#attempt>
  <#assign start_date = "">
  <#assign end_date = "">
  
<#if event?? && event?has_content && event.c_event_summary??>
<div class="events_banner_details">
    <div class="events_banner max-width-class">
      <div class="lia-quilt-column-24 event-listing">
        <div class="lia-quilt-column-04 event-section-left event_calendar_card">
          <a href="" class="">
            <div class="events_info">
						   <#assign eventsMetaData = {} />
              <#if event?? && event?has_content && event.c_event_metadata??>
                <#assign eventsMetaData = event.c_event_metadata?eval />
              </#if>
              <div class="event_icon ${eventsMetaData.Category!''}"></div>

              <div class="event_date">
                <#if event.c_start_date?? && event.c_start_date?trim?matches("^[0-9]*") > 
                  <#assign start_dateMonth = event.c_start_date?trim?number?number_to_datetime?string['MMM'] />
                  <#assign start_date = event.c_start_date?trim?number?number_to_datetime?string['dd'] />   
                </#if>

                <#if event.c_end_date?? && event.c_end_date?trim?matches("^[0-9]*") >
                  <#assign end_dateMonth = "" />
                  <#assign end_date = event.c_end_date?trim?number?number_to_datetime?string['dd'] />
                  
                    <#assign end_dateMonthData = event.c_end_date?trim?number?number_to_datetime?string['MMM'] />
                    <#if start_dateMonth?trim != end_dateMonthData?trim >
                    <#assign end_dateMonth = end_dateMonthData />
                    </#if>

                </#if>

                <#if end_dateMonth != "">
                  ${start_dateMonth} ${start_date}-${end_dateMonth} ${end_date}
                  <style>#lia-body .event_calendar_card .event_date{font-size:26px}</style>
                <#else>
                  ${start_dateMonth} ${start_date}-${end_date}
                </#if>

              </div>
            </div>
          </a>
        </div>
        <div class="lia-quilt-column-14 event-section-middle event_calendar_info">
          <div class="event_title" style="margin-top: -48px">
            <a href="${event.view_href}">${event.subject}</a>
          </div>
          <div class="event_info">
            <div class="event_place">
              <span class="event_city"></span>
              <span class="event_state"><#if event.c_event_state??>${event.c_event_state}, </#if></span>
              <span class="event_Country"><#if event.c_event_country??>${event.c_event_country}</#if></span>
            </div>
          </div>
        </div>
        <div class="lia-quilt-column-06 event-section-right event_calendar_thumb">
          <img src="/html/assets/thumb_events.PNG" />
        </div>
      </div>
    </div>
  </div>
  </#if>
</#if>
