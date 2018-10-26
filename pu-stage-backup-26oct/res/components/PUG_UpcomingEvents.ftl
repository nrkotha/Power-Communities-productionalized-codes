<#assign quoted_string_string = '"${coreNode.title}"'>
<#assign url= '/search/messages?q=tags:${quoted_string_string ?url}'>
<#assign userEvents = rest(url).messages />

<div class="lia-panel lia-panel-standard pug-upcoming-events">
    <div class="lia-decoration-border">
        <div class="lia-decoration-border-top">
            <div> </div>
        </div>
        <div class="lia-decoration-border-content">
            <div>
                <div class="lia-panel-heading-bar-wrapper">
                    <div class="lia-panel-heading-bar"><span class="lia-panel-heading-bar-title">Upcoming Events</span></div>
                </div>
                <div class="lia-panel-content-wrapper">
                    <div class="lia-panel-content">
                        <div class="BoardBrowserListTaplet">
                            <div class="CategoryListDisplay lia-browser-category-list lia-category-top lia-node-top lia-browser-category-show">
                                <div class="BoardList">
                                    <div class="t-data-grid">
                                        <table class="lia-list-wide">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="boardIconColumn lia-data-cell-tertiary lia-data-cell-icon t-first"></th>
                                                    <th scope="col" class="boardTitleColumn lia-data-cell-primary lia-data-cell-text">
                                                        Title
                                                    </th>
                                                    <th scope="col" class="newMessageCountColumn lia-data-cell-secondary lia-data-cell-integer t-last">
                                                        <!-- Date and time -->
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#list userEvents.message as message>
                                                    <#if message.board.@href == "/boards/id/Community">
                                                        
                                                        <#assign sourceBoards = "'Microsoft','Community'"/>
                                                        <#assign query = "SELECT id, subject, body, view_href, c_event_summary, c_event_location, c_event_street, c_event_city, c_event_state, c_event_country, c_start_date, c_end_date FROM messages WHERE id='${message.id}' ORDER BY post_time DESC" />

                                                        <#assign queryResult = rest("2.0", "/search?q=" + query?url("UTF-8")) />
                                                        <#if queryResult.status == "success" && queryResult.data?? && queryResult.data?has_content && queryResult.data.items?? && queryResult.data.items?has_content> 

                                                            <#assign eventData = queryResult.data.items[0] />
                                                            <#assign currentTime = .now>

                                                            <#if eventData.c_end_date?? && eventData.c_end_date?trim?matches("^[0-9]*")>
                                                                <#if currentTime?long < eventData.c_end_date?trim?number?long >
                                                                    <tr class="lia-list-row lia-node-welcome lia-row-odd t-first t-last">
                                                                        <td class="boardIconColumn lia-data-cell-tertiary lia-data-cell-icon">
                                                                            <div class="calendar-icon">
                                                                                <a class="lia-link-navigation" href='${rest("/messages/id/" + message.id + "/web_page_url").string}'><img class="lia-fa-icon" title="Forum" alt="There are no unread messages in this message board" aria-label="Forum" id="display_1" src="/html/assets/calendar_icon.png?version=preview"></a>
                                                                            </div>
                                                                        </td>
                                                                        <td class="boardTitleColumn lia-data-cell-primary lia-data-cell-text">
                                                                            <h3 class="board-title"><a class="lia-link-navigation lia-message-unread pug-event-title" href='${rest("/messages/id/" + message.id + "/web_page_url").string}'>${message.subject}</a></h3>
                                                                            <div class="board-list-latest">
                                                                                Location - <span class="lia-link-navigation lia-message-item mustard-yellow">${eventData.c_event_city!""},${eventData.c_event_state!""} ${eventData.c_event_country!""}</span>
                                                                            </div>
                                                                        </td>
                                                                        <td class="event-date-time lia-data-cell-secondary lia-data-cell-integer">
                                                                            <#if eventData.c_start_date?? && eventData.c_start_date?trim?matches("^[0-9]*") >
                                                                                ${eventData.c_start_date?trim?number?number_to_datetime?string["MMMM dd, yyyy, 'at' h:mm a"]}
                                                                            </#if>
                                                                        </td>
                                                                    </tr>
                                                                </#if>
                                                            </#if>
                                                        </#if>
                                                    </#if>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="lia-decoration-border-bottom">
            <div> </div>
        </div>
    </div>
</div>