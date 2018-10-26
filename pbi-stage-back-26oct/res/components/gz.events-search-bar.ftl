<!-- gz.events-search-bar --> 
<div class="header-event-search">
  <div class="event-search">
    <form>
      <span class="label_text">Find an event near you</span>
      <span class="search_events">

       <span class="form_fields label_event_query">
         <input name="query" type="text" class="event-query-search" id="event-query-search" placeholder="Search by role, category or product">
       </span>

        <span class="form_fields label_event_city">
          <input type="hidden" name="nearestCity" value="">
          <input type="hidden" name="latitude" value="">
          <input type="hidden" name="longitude" value="">
          <input type="hidden" name="SortBy" value="StartDate">
          <input type="hidden" name="SortOrder" value="asc">
          <input type="hidden" name="isPublishable" value="true">
          <input id="dateFloor" type="hidden" name="dateFloor" data-value="${.now?iso_utc}" value="${.now?iso_utc}" >
          <input type="text" class="event_city_search" id="event-search-box" placeholder="City">
          <div class="SuggestCity-wrapper">
            <ul></ul>
          </div>
        </span>
        <span class="form_fields label_event_days">
          <select class="event_days" name="dateCeil"> 
            <option value="">All</option>
            <option value="${(.now?long + (60*60*24*7*1000))?number_to_datetime?iso_utc}">Next 7 days</option>
            <option selected value="${(.now?long + (60*60*24*30*1000))?number_to_datetime?iso_utc}">Next 30 days</option>
            <option value="${(.now?long + (60*60*24*90*1000))?number_to_datetime?iso_utc}">Next 90 days</option>
          </select>
        </span>   
      </span>
      <button class="event-search-btn" id="event-search-btn" type="button" >Search events</button>
    </form>
  </div>
</div>