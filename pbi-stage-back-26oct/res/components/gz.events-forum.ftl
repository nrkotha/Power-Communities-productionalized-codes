 <!-- gz.events-forum -->
<form id="event_form" name="event_form" >
 <div class="" id="events_container">   
  <div class="left_column lia-quilt-column lia-quilt-column-18 lia-quilt-column-left"> 
    <div class="lia-quilt-column-row events_row">
      <div class="event-type">
        <ul class="portal_type" >
          <!-- <li class="active"><a href="#evn-all">All</a></li> -->
          <li class="active">
            <a href="#evn-microsoft">
              <label for="microsoft_tab">Microsoft</label>
              <input id="microsoft_tab" name="searchPortal" value="microsoft" type="radio" class="searchPortal hidden_field action_form" checked>
            </a>
          </li>
          <li>
            <a href="#evn-community">
              <label for="community_tab">Community</label>
              <input id="community_tab" name="searchPortal" value="community" type="radio" class="searchPortal hidden_field action_form" >
            </a>
          </li>          
        </ul>
        <ul class="type_listing" >
          <li class="active">
            <a class="" href="#listing">
              <label for="view_list" class="list_icon"></label>
              <input id="view_list" name="view_type" value="list" type="radio" class="view_type hidden_field" checked >
            </a>
          </li>
          <li>
            <a class="" href="#grid">
              <label for="view_grid" class="grid_icon"></label>
              <input id="view_grid" name="view_type" value="grid" type="radio" class="view_type hidden_field" >
            </a>
          </li>
          <li>
            <a class="" href="#evn-location_view">
              <label for="view_map" class="location_icon"></label>
              <input id="view_map" name="view_type" value="location_view" type="radio" class="view_type hidden_field action_form" >
            </a>
          </li>
        </ul>  
      </div>
      <div class="event-listing-conatiner">
        <div class="event-listing-wrapper " id="tab-all"></div>        
        <div class="event-listing-wrapper" id="tab-microsoft" ></div>
        <div class="event-listing-wrapper" id="tab-community" ></div>
        <div class="event-listing-wrapper" id="tab-location_view" style='display:none'>
          <div id='eventMap' style='width: 100%; height: 90vh;'></div>
        </div>
        <div class="load-more-btn">Load more events...</div>
        <div class="event-pagination"></div>
      </div>
    </div>  
  </div>

  <div class="right_column lia-quilt-column lia-quilt-column-06 lia-quilt-column-right">
    <div class="lia-quilt-column-row events_filter_row">
      <div class="events_facets">
        <#--form id="filterForm"></form-->
      </div>
    </div>
  </div>
</div>
</form>

<div class="row noResults" style="display: none">
  <div class="lia-quilt-column-08">
    <img ng-src="https://moderneventsimages.azureedge.net/images/errormessage_icon.gif" alt="" src="https://moderneventsimages.azureedge.net/images/errormessage_icon.gif">
  </div>
  <div class="lia-quilt-column-16">
    <p class="er1" style="display: none;">Sorry, there are currently no events for that search.  Please <a href="" class="noEventsError">click here to clear the search criteria</a>.</p>
    <p class="er2" style="display: none">Sorry, your session has expired.  Please <a href="" class="noEventsError">refresh this page</a>.</p>
  </div>
</div>

<div class="pageLoad" id="pageLoad" >
  <div class="c-progress f-indeterminate-local f-progress-large" role="progressbar" tabindex="0">
    <span></span>
    <span></span> 
    <span></span> 
    <span></span> 
    <span></span> 
  </div>
  <div class="sr-only" aria-live="assertive" aria-atomic="true" id="pageHidden" style="display: block;"></div>
</div>
<div class="event-modal-wrapper"></div>
<script type='text/javascript' src='https://www.bing.com/api/maps/mapcontrol' async defer></script>
<@component id="gz.events-forum-js" />

<style>
.hidden_field {
  display: none;
}
.type_listing img {
	width: 18px;
}
</style>