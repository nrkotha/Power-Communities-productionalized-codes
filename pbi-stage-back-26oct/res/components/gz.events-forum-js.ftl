<!-- gz.events-forum-js --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<#--assign oauth = http.session.attributes.name.get("oauth", '') />
<#assign token = "Bearer ${oauth?eval['access_token']}" /-->
<#assign token = "" />

<#assign enviroment = "" />

<#if config.getString("phase", "prod") == "stage">
  <#assign enviroment = "stage" />
  <#assign baseURL = "https://geteventsservice.one.microsoft.com" />
<#else> 
  <#assign baseURL = "https://geteventsservicetest.one.microsoft.com" />
  <#assign enviroment = "production" />
</#if>

<@liaAddScript>
  (function($) { 
  $(document).ready(function(){
    var limit = 9; /*setting the limit*/
    var RequestId = guid(); /*getting random request id*/
    var page_no = 1; /*on first load page should be 1*/
    var tabRaw = window.location.hash;
    if(tabRaw){
      var tab = window.location.hash.substr(5).trim();
      console.log(tab,tabRaw);
      if($.inArray(tab, ['community','microsoft']) == -1)
        tab = "microsoft";

      $(".portal_type li").removeClass("active");
      var elmnt = "a[href=#evn-"+tab+"]";
      //alert(elmnt);
      $(elmnt).parent("li").addClass("active");

    }else{
      var tab = "microsoft"; /*On load microsoft tab is selected*/
    }
    var action = "";

    params = {'RequestId':RequestId, 'ResultCount': limit};
    getEvents(params,tab,'');

    $(document).on("click",".event-pagination a", function(){
      if($(this).hasClass('deactArrow'))
        return false;

      var tab = $(".event-type .active a").attr("href").substr(5);
      var offset = ((eval($(this).attr('data')) - 1)  * limit );
      // var offset = $(".event-listing-wrapper#tab-"+tab+" .event-listing").length;
      page_no = $(this).attr('data');
      var RequestId = guid();
      if(tab  == "all"){
        var params = {'SkipCount':offset, 'RequestId':RequestId, 'ResultCount': limit};
      }else if(tab  == "online")
        var params = {'category':'Online','SkipCount':offset, 'RequestId':RequestId, 'ResultCount': limit};
      else{
        var params = {'SkipCount':offset,'RequestId':RequestId, 'ResultCount': limit};
      }
      getEvents(params,tab, "newPagination");
    });

    var ChkType = '';
    //console.log(ChkType);
    $(document).on("change",".event_days", function(){
      if($(this).val() == ""){
        $('#dateFloor').val('');
      }else{
        var dateFloor = $('#dateFloor').attr('data-value');
        $('#dateFloor').val(dateFloor);
      }
    });
    $(document).on("change","#event_form input", function(){

      var action = '';
      var RequestId = guid();
      var params = '';
      
      if($(this).closest("ul").hasClass("portal_type")){
        $('.portal_type li').removeClass("active");  
        action = 'ClearFilter';
      }else if($(this).closest("ul").hasClass("type_listing")){
        $('.type_listing li').removeClass("active");  
        action = 'ClearFilter';
      }
      
      $(this).closest("li").addClass("active");   
      
      $(".event-listing-wrapper").hide();
      var tab    = $('.searchPortal:checked').val();
      var selVal = $('.view_type:checked').val();
      
      $("#events_container").attr('class', selVal);       
      
      if(selVal=="location_view"){
        var category = 'In Person';
        action = 'ClearFilter';
        $(".event-listing-wrapper#tab-"+selVal).show();
        params = {'RequestId':RequestId, 'category': category};
      }else{
        $(".event-listing-wrapper#tab-"+tab).show();
        params = {'RequestId':RequestId, 'ResultCount': limit};
      }       
      
      if(ChkType!="location_view"){   
        if(!($(this).hasClass('action_form'))){
          return false;
        }
      }  
      
      //var tab = $(".event-type .active a").attr("href").substr(5);
      
      if($(this).val() == "Online" && $(this).is(":checked"))
      $(".type_listing li").eq(2).addClass("disabled");
      else
      $(".type_listing li").eq(2).removeClass("disabled");

      var listingTypeTab = $(".type_listing li.active a").attr("href");
      
      getEvents(params,tab,action);
      ChkType = $('.view_type:checked').val();
    });
    
    var _changeInterval = null;
    $("#event-search-box").keyup(function(){
      var city = $(this).val();

      if(city.length > 0){
         $("#event-search-btn").addClass('disabled');
      }else{
         $("#event-search-btn").removeClass('disabled');
      }

      clearInterval(_changeInterval);
      _changeInterval = setInterval(function() {
        clearInterval(_changeInterval);
        if(city.length > 3){
          var settings = {
            "async": true,
            "crossDomain": true,
            "url": "${baseURL}/api/SuggestCity",
            "method": "GET",
            "data":{'query':city},
            "headers": {
              "content-type": "application/json",
              "authorization": "${token}",
            }
          }
          $.ajax(settings).done(function (response,status) {
            var SuggestCityHtml = "";
            if(response.length > 0){
              for (var i = response.length - 1; i >= 0; i--) {
                response[i]
                SuggestCityHtml +="<li class='suggestion-item' data-lat='"+response[i].GeoLocation.Latitude+"' data-long='"+response[i].GeoLocation.Longitude+"' data-city='"+response[i].Tag+"'>"+response[i].City+"</li>"; 
              }
            }else{
              SuggestCityHtml +="<li>No matches found</li>"; 
            }
            $(".SuggestCity-wrapper ul").html(SuggestCityHtml);
          }).fail(function(xhr, status, error) {
              //alert(error);
              //location.reload();
          }); 
        }else{
            $(".SuggestCity-wrapper ul").html('');
            $("input[name=nearestCity]").val('');
            $("input[name=latitude]").val('');
            $("input[name=longitude]").val('');
            $("input[name=SortBy]").val('StartDate');
        }
      }, 700);
    });

    $(document).on('click','.SuggestCity-wrapper .suggestion-item',function(){
      $("#event-search-btn").removeClass('disabled');
      $("input[name=nearestCity]").val($(this).data('city'));
      $("input[name=latitude]").val($(this).data('lat'));
      $("input[name=longitude]").val($(this).data('long'));
      $("input[name=SortBy]").val('GeoLocation');
      $("#event-search-box").val($(this).text());
      $(".SuggestCity-wrapper ul").html('');
    });

    $("#event-search-btn").click(function(){
      var tab = $(".event-type .active a").attr("href").substr(5);
      var RequestId = guid();
      var listingTypeTab = $(".type_listing li.active a").attr("href");
      var params = {'RequestId':RequestId, 'ResultCount': limit};
      if(listingTypeTab == "#evn-location_view"){
        params = {'RequestId':RequestId};
      }
      getEvents(params,tab,'');
     
    });

    function normalizeFormDate(x){
      if(x.length != 0){
        return '&'+x
      }
      return '';
    }

    function getEvents(params,tab,action){
      //console.log("tab",tab);
      //console.log("action",action);
      
      $(".pageLoad").show();

      if(action == "ClearFilter"){
        //var FiltetParams = '';
        $("#event_form").find('input:checkbox').removeAttr('checked');
      } /* else {
        var FiltetParams = $("#event_form").serialize();
            FiltetParams = normalizeFormDate(FiltetParams);
      } */
      
      var FiltetParams = $("#event_form").serialize();
      FiltetParams = normalizeFormDate(FiltetParams);
      
      //console.log("FiltetParams",FiltetParams);

      //var searchParams = $(".event-search form").serialize().replace(/[^&]+=\.?(?:&|$)/g, '');
      var searchParams = $('.event-search form').serializeArray();
      var loginFormObject = {};
      $.each(searchParams, function(i, v) {
        
          if(v.value)
            loginFormObject[v.name] = v.value;
      });

      // var params = Object.assign(loginFormObject, params);
      var paramsRaw = [loginFormObject, params],
             result = paramsRaw.reduce(function (r, o) {
                        Object.keys(o).forEach(function (k) {
                          r[k] = o[k];
                        });
                        return r;
                      }, {});
      var params = result;
      //console.log("params",params);
      
      //var url   = "https://postpage.azurewebsites.net/stageV3/Search/Search.php?";
      //var url   = "https://postpage.azurewebsites.net/stage/stageV4/Search/Search.php?action=authorizeMe&Token=UVdSdGFXNDZRV1J0YVc0eE1qTTZUV0ZyWlVsMFRHRnlaMlU9";
      var url   = "https://postpage.azurewebsites.net/stage/stageV4/Search/SearchStable.php?action=authorizeMe&Token=UVdSdGFXNDZRV1J0YVc0eE1qTTZUV0ZyWlVsMFRHRnlaMlU9";

     //console.log("FiltetParams",FiltetParams);
     
     var settings = {
        "async": true,
        "crossDomain": true,
        "url": url+FiltetParams,
        "method": "GET",
        "data":params,
        "headers": {
          "authorization": "${token}",
          "content-type": "application/json",
          "cache-control": "no-cache",
        }
      }

      $.ajax(settings).done(function (response) {       
        
        try {
            var response = jQuery.parseJSON(response);
        }
        catch(err){
            var response = response;
        } 
        //console.log("response",response);
        
        if(response.TotalResults > 0){
          var listingTypeTab = $(".type_listing li.active a").attr("href");
          if(listingTypeTab == "#evn-location_view"){
            loadMapScenario(response,tab);
            $(".event-pagination").hide();
          }else{
            generateEventsHtml(response,tab,action);
          }
          generateFilters(response.Facets);
        }else{
          getErrorMessage('.er1','.er2', tab);
          $(".events_facets").html(' ');//clearing the filters
        }

      }).fail(function(xhr, status, error) {
        //alert(error);
        //location.reload();
        getErrorMessage('.er2','.er1');
      }); 
    }

    function generateEventsHtml(eventData,tab,action){
      var events = eventData.Events;
      var totalEvents = eventData.TotalResults;
      var html="";
      for (var i = events.length - 1; i >= 0; i--) {
        var eventCity = "";
        var eventState = "";
        var eventCountry = "";
        var startDate = getDate(events[i].StartDate);
        var endDate = getDate(events[i].EndDate);
        var eventDate = startDate;
        var eventDescription = events[i].Description.replace(/<(?:.|\n)*?>/gm, '');

        if (eventDescription.length > 150)
        eventDescription = eventDescription.substring(0, 150)+'...';

        if( startDate != endDate)
        eventDate = startDate+'-'+endDate;
        
       /*  console.log('City',events[i].City);
        console.log('State',events[i].State);
        console.log('Country',events[i].Country); */
      
        if(events[i].City){
          eventCity = '<span class="event_city">'+events[i].City+',</span>';        
        }
        if(events[i].hasOwnProperty('State') && events[i].State){
          eventState = '<span class="event_state">'+events[i].State+',</span>';
        }
        if(events[i].Country){
          eventCountry = '<span class="event_Country">'+events[i].Country+'</span></div>';
        } 
        
        if(getMonth(events[i].StartDate) != getMonth(events[i].EndDate))
        eventDate = startDate+'-'+getMonth(events[i].EndDate)+' '+endDate;
    
    
        if(i == events.length - 1)
         var totalEventsHtml =  '<div class="total-result">Search result: '+totalEvents+'</div>';
       else
         var totalEventsHtml =  '';
       html +=  totalEventsHtml+'<div class="lia-quilt-column-24 event-listing event-'+events[i].EventID+'">'+
                 '<div class="lia-quilt-column-06 event-section-left event_calandar_card">'+
                   '<div class="event_card">'+
                     '<div class="events_info">'+               
                       '<div class="event_icon '+events[i].Category+' "></div>'+
                       '<div class="event_date">'+getMonth(events[i].StartDate)+" "+eventDate+'</div>'+
                     '</div>'+
                   '</div>'+
                 '</div>'+
                 '<div class="lia-quilt-column-18 event-section-right event_calandar_info">'+
                   '<div class="event_title"><a href="'+events[i].URL+'">'+events[i].Title+'</a></div>'+
                   '<div class="event_desc">'+eventDescription+'</div>'+
                   '<div class="event_info">'+
                     '<div class="event_cat lia-quilt-column-08"><span>'+ events[i].Category +'</span></div>'+
                     '<div class="event-grid-date lia-quilt-column-08">'+getMonth(events[i].StartDate)+" "+eventDate+', '+getYear(events[i].StartDate)+'</div><div class="event_timing lia-quilt-column-08"><span class="event_start">'+getTime(events[i].StartDate)+'</span>-<span class="event_end">'+getTime(events[i].EndDate)+'</span></div>'+
                     '<div class="event_place lia-quilt-column-08">'+ eventCity + eventState + eventCountry +'</div>'+
                 '</div>'+genereateModalHtml(events[i], tab)+
               '</div>';
      }
      $(".event-listing-wrapper#tab-"+tab).html(html);
      
      if(totalEvents > limit){
        if(action == "newPagination")
        pagination_var(eventData.TotalResults, limit, page_no, "event-pagination");
        else
        pagination_var(eventData.TotalResults, limit, 1, "event-pagination");
      $(".event-pagination").show();
      }else{
        $(".event-pagination").hide();
      }


      $(".row.noResults").hide();
      $("#events_container #tab-"+tab).show();
      var offset = $(".event-listing-wrapper#tab-"+tab+" .event-listing").length + limit;

      if(action == "newPagination"){
        $('html, body').animate({
             scrollTop: $(".event-listing-conatiner").offset().top - 150
        }, 500);
      }

      $(".pageLoad").hide();

    }

    function generateFilters(filterJson){

      var filterFormData = decodeURIComponent($("#event_form").serialize());
      var listingTypeTab = $(".type_listing li.active a").attr("href");

      var filter = Object.keys(filterJson);
      
      //console.log('filterFormData',filterFormData);
      //console.log('filter',filter);
      
      var filterHtml = "";
      for (var i = filter.length - 1; i >= 0; i--) {

        //if(filter[i].indexOf('Campaign') != -1 || filter[i].indexOf('PrimaryLanguage') != -1 ||  filter[i].indexOf('Product') != -1 || filter[i].indexOf('City') != -1)
        if(filter[i].indexOf('Campaign') != -1 || filter[i].indexOf('PrimaryLanguage') != -1 || filter[i].indexOf('City') != -1)
        continue;

        var filterInnerHtml = "";
        var activeClass = "";
        var innerFilter = filterJson[filter[i]];

        var filterNameUpperCase = filter[i];
        if(filterNameUpperCase == "PrimaryLanguage")
        filterNameUpperCase = "Language";
      
        var filterName = filter[i].toLowerCase();
        if(filterName == "primarylanguage")
        filterName = "language";
        for (var j = innerFilter.length - 1; j >= 0; j--) {

          if(filter[i] == "PrimaryLanguage")
          var productItem = innerFilter[j].LanguageName;
          else
          var productItem = innerFilter[j].ItemName;

          //console.log('productItem',productItem);
          
          var isChecked = "";
          if(filterFormData.indexOf(filterName+"="+productItem.replace(/\s+/g,"+")) !== -1 || (listingTypeTab == "#evn-location_view" && productItem == "In Person") ){
            var isChecked = "CHECKED";
            var activeClass = "active opened";
          }
          
          //console.log('filterName',filterFormData.indexOf(filterName+"="+productItem));

          filterInnerHtml += '<li class="checkbox">'+
                                '<input value="'+productItem+'" '+isChecked+' name="'+filterName+'" class="action_form custCheckBox '+filterName+'" id="'+filterName+'_'+j+'" type="checkbox">'+
                                '<label class="productItem" for="'+filterName+'_'+j+'">'+productItem+'</label> '+
                                '<span class="productCount">('+innerFilter[j].Count+')</span>'+
                              '</li>';
        }

       filterHtml += '<div class="events_type '+filterName+' '+activeClass+'">'+
                       '<div class="facets_type">'+
                         '<span class="facets_title">'+filterNameUpperCase+'</span>'+
                         '<span class="show_filter"><span class="view_icon"><span class="plus_icon">+</span><span class="minus_icon">-</span></span></span>'+
                       '</div>'+
                       '<div class="facets_list">'+
                         '<ul class="filters">'+filterInnerHtml+'</ul>'+        
                       '</div>'+
                     '</div>';
      }

      $(".events_facets").html(filterHtml);
    }

    $(document).on('click','.facets_type',function(){
      // $(this).toggleClass("opened").next('.facets_list').slideToggle();
      var elem = $(this).parent();
      elem.toggleClass("opened").find('.facets_list').slideToggle();
    });

    $(document).on('click','.event-listing .event_title',function(e){
      e.preventDefault();
      $(this).parents('.event-listing').find('.event-modal').show();
      $('.event-modal-wrapper').show();
    });

    $(document).on('click','.event-modal .close',function(e){
      $(this).parents('.event-modal').hide();
      $('.event-modal-wrapper').hide();
    });

    function getFormattedDate(d){
      return getMonth(d)+" "+getDate(d)+", "+getYear(d)+" "+getTime(d);
    }

    function getMonth(date){
      var dt = new Date(date);
      var monthNames = ["Jan", "Feb", "March", "April", "May", "June",
        "July", "Aug", "Sep", "Oct", "Nov", "Dec"
      ];
      return monthNames[dt.getMonth()];
    }

    function getDate(date){
      var dt = new Date(date);
      return dt.getDate();
    }
    function getYear(date){
      var dt = new Date(date);
      return dt.getFullYear();
    }

    function getTime(date) {
      var date = new Date(date);
      var hours = date.getHours();
      var minutes = date.getMinutes();
      var ampm = hours >= 12 ? 'pm' : 'am';
      hours = hours % 12;
      hours = hours ? hours : 12; // the hour '0' should be '12'
      minutes = minutes < 10 ? '0'+minutes : minutes;
      var strTime = hours + ':' + minutes + ' ' + ampm;
      return strTime;
    }

    /*get uid*/
    function guid() {
      function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
          .toString(16)
          .substring(1);
      }
      return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
        s4() + '-' + s4() + s4() + s4();
    }

    function getErrorMessage(elemTOshow,elemTohide,tab){

      $("#events_container .event-listing-wrapper").hide().html('');
      $(".event-pagination").hide();
      $(".row.noResults").show();
      $(elemTOshow).show();
      $(elemTohide).hide();
      $(".pageLoad").hide();
    }

    function genereateModalHtml(evnt, tab){
      var EventsFor = [];

      for (var i = evnt.EventsFor.length - 1; i >= 0; i--) {
        EventsFor.push(evnt.EventsFor[i]);
      }

      var PrimaryLanguage = [];
      for (var i = evnt.PrimaryLanguage.length - 1; i >= 0; i--) {
        PrimaryLanguage.push(evnt.PrimaryLanguage[i]);
      }

      var Product = [];
      for (var i = evnt.Product.length - 1; i >= 0; i--) {
        Product.push(evnt.Product[i]);
      }


      var eventCity = "";
      var eventState = "";
      var eventCountry = "";
      var LocationName = "";
      var btn = "REGISTER NOW";
      var hyper_link = "";

      if(evnt.City)
       eventCity = evnt.City+',';

      if(evnt.hasOwnProperty('State') && evnt.State)
       eventState = evnt.State+',';

      if(evnt.LocationName)
       LocationName = evnt.LocationName

      if(evnt.Country)
        eventCountry = evnt.Country

      if(tab=="community")
        hyper_link = "<a class='community_link' href='${community.urls.frontPage}'>Visit the community to learn more ></a>";



      var html = '<div class="event-modal lia-quilt-column-24 event-modal-'+evnt.EventID+'" style="display:none">'+
                  '<div class="event-modal-content">'+
                    '<span class="close">&times;</span>'+
                    '<div class="lia-quilt-column-06 modal-left">'+
                      '<div class=""><img src="'+evnt.Icon+'"></div>'+
                      '<div class="event-section">'+
                        '<div class="modal-left-title">EVENT LOCATION</div>'+
                        '<div class="modal-left-value">'+eventCountry+'</div>'+
                      '</div>'+
                      '<div class="event-section">'+
                        '<div class="modal-left-title">EVENT FOR</div>'+
                        '<div class="modal-left-value">'+EventsFor.join(',')+'</div>'+
                      '</div>'+
                      '<div class="event-section">'+
                        '<div class="modal-left-title">CATEGORY</div>'+
                        '<div class="modal-left-value">'+evnt.Category+'</div>'+
                      '</div>'+
                      '<div class="event-section">'+
                        '<div class="modal-left-title">PRODUCTS</div>'+
                        '<div class="modal-left-value">'+Product.join(',')+'</div>'+
                      '</div>'+
                      '<div class="event-section">'+
                        '<div class="modal-left-title">EVENT LANGUAGE</div>'+
                        '<div class="modal-left-value">'+PrimaryLanguage.join(',')+'</div>'+
                      '</div>'+
                    '</div>'+
                    '<div class="lia-quilt-column-18 modal-right">'+
                      '<div class="modal-right-inner">'+
                        '<div class="modal-right-title"><a href="">'+evnt.Title+'</a></div>'+
                        '<div class="modal-right-date">'+getFormattedDate(evnt.StartDate)+'-'+getFormattedDate(evnt.EndDate)+'</div>'+
                        '<div class="modal-description">'+evnt.Description+'</div>'+
                      '</div>'+
                      '<a href="'+evnt.URL+'" class="event-reg-btn">'+btn+'</a>'+
                      '<br>'+hyper_link+
                    '</div>'+
                  '</div>'+
                '</div>';

              return html;
    }

    window.icon = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA/wD/AP+gvaeTAAACNklEQVQ4jbWSwUtUYRTFf/f73gSB4ELnPVMIoiLMoBbhKiLJaBVZiRAFLaTFELToL4jAaGNFIERgy5BBEwpXtQnaBBFIa7FFBPNEhxZu5Hv3tmhmHN/MmBSd1bv33HPeufc9oQ3mk+Qd0KdbW2cmqtWfzdxCkowavBJ4eK1SeZrXunyjXCx2AaPACb9v32CeNzgPFBUutQsTAdwHNxTHNwWGJYpeWpYBkJnJQpJMGfTW5j/v2CSOL+LcZVNd7k3T2REIEcBQHN8WkecAqrokjfwuM7PrwKFap1tgxQABNedOiVlJRFhPkl4qlSkHICJnt3eyAeCFwZvI7BvQ1xTqcObca+CTwayYHW3iRppv6OtdgUcmsiwwpzAH7G8SnXaqJUQei8ggcKtJFzVumEOPmM206dcxidlkJ7LlK/8r8glXvdmFK2m6shdxuadnwEXREnCyk+H7vFm5v/+gC2EcQKNovqDqMtWrAFIolDWEt9LJUEBbVgjhmIpM156/Zs4VqNWaZV8QyTBrzP/3G7YgFIsfSNMDABrHGwD1mjjekPX1c7salovFI877e7Vyhmo1w/u7AFSrz1D1eH+nZvzEvN+hb03o/QBmJQARWZIQtlSkBOBCWFTnCnXevC//eeUsy3BuE8BUA84FzH7XzgVTFRHZbMzullAhnlhb+wh05V7TsV5IkhvWROR/m7H5JFkE0pbk7dFtMN4u4Y9tT8b2aJbH94ahhjDtomhY4PjfOJnZqqg+APgFWULUhQesTDgAAAAASUVORK5CYII=";
    var eventData = "";
    
    function loadMapScenario(eventData,tab) {
        //var eventData = { "Events": [{"EventId":10, "Latitude": "30.704113", "Longitude": "76.8368725", "Description": "MadanPuri" }, {"EventId":20, "Latitude": "30.6827888", "Longitude": "76.8335404", "Description": "Urban State" }] };
        var locationData = [];
        var map = new Microsoft.Maps.Map(document.getElementById('eventMap'), {
          credentials: 'AsUSWo8roLrVtgCsFdMVfwMHHRc_0iom_vxaznJANj4KthDp_R71Zxr--oqxG4MG',
          zoom: 3
        });
        Microsoft.Maps.loadModule('Microsoft.Maps.Clustering', function () {
          var events = eventData.Events;
          var pins=[];
          var infobox = new Microsoft.Maps.Infobox(null, { visible: false });

      for (var i = events.length - 1; i >= 0; i--) {
      if (events[i].Latitude === null || events[i].Longitude === null) { continue; }
      
            if (locationData.indexOf(events[i].Latitude+''+events[i].Longitude) != -1){
             var lat = events[i].Latitude + Math.floor((Math.random()*100) + 1)
             var long = events[i].Longitude + Math.floor((Math.random()*100) + 1)
            }else{
              var lat = events[i].Latitude;
              var long = events[i].Longitude;
              locationData.push(events[i].Latitude+''+events[i].Longitude);
            }

            var center = new Microsoft.Maps.Location(lat, long);
            var pin = new Microsoft.Maps.Pushpin(center,{icon: icon});
            pins.push(pin);
            
            var EventId = events[i].EventID;
            
            pin.metadata = {
              title: 'Pushpin ' + i,
              description: events[i].Longitude,
              id: EventId,
              eventIndex: i
            };
           
            Microsoft.Maps.Events.addHandler(pin, 'mouseover', function (args) {

                var infoboxTemplate = '{html}';

                infobox.setOptions({
                    location: args.target.getLocation(),
                    htmlContent: infoboxTemplate.replace('{html}', generateEventHoverCard(args.target.metadata.eventIndex)),
                    visible: true
                });
            });
            Microsoft.Maps.Events.addHandler(pin, 'mouseout', function (args) {
                infobox.setOptions({
                    visible: false
                });
            });

            Microsoft.Maps.Events.addHandler(pin, 'click', function (args) {
                var html =  genereateModalHtml(eventData.Events[args.target.metadata.eventIndex]);
                $(".event-modal-wrapper").show();
                var elm = "#tab-location_view .event-modal-"+args.target.metadata.id;
                if($(elm).length){
                  $(elm).show();
                }else{
                  $("#tab-location_view").append(html);
                  $(elm).show();
                }
            });
              
          }


          infobox.setMap(map);
          clusterLayer = new Microsoft.Maps.ClusterLayer(pins, {
              clusteredPinCallback: createCustomClusteredPin,
              gridSize: 10
            });
          map.layers.insert(clusterLayer);
        });

        function generateEventHoverCard(eventIndex){
            var cardHTML = "";
            // alert(eventData);
            var event = eventData.Events[eventIndex];
            var Sdate = new Date(event.StartDate);
            var Edate = new Date(event.EndDate);


            cardHTML = '<div id="InfoboxCustom" class="event-hover-card" style="">'+
                    '<div>'+
                        '<div id="infoBoxTab" class="info-box-wrap" tabindex="0">'+
                            '<a target="_blank" href="'+event.URL+'">'+
                                '<div class="lia-quilt-column-04">'+
                                    '<img src="'+event.Icon+'">'+
                                '</div>'+
                                '<div class="lia-quilt-column-20">'+
                                    '<div class="info-box-text-wrap">'+
                                        '<h6 class="title">'+event.Title+'</h6>'+
                                        '<p class="locationName" aria-label="">'+event.LocationName+'</p>'+
                                        '<p class="location" aria-label="">'+event.City+' '+event.Country+'</p>'+
                                        '<p class="locationStartEnd">'+getFormattedDate(Sdate)+'-'+getFormattedDate(Edate)+'</p>'+
                                    '</div>'+
                                '</div>'+
                            '</a>'+
                        '</div>'+
                    '</div>'+
                '</div>';

            return cardHTML;
        }

        function createCustomClusteredPin(cluster) {

          /*adding click*/
          Microsoft.Maps.Events.addHandler(cluster, 'click', clusterClicked);

          //Define variables for minimum cluster radius, and how wide the outline area of the circle should be.
          var minRadius = 10;
          var outlineWidth = 2;
          //Get the number of pushpins in the cluster
          var clusterSize = cluster.containedPushpins.length;
          //Calculate the radius of the cluster based on the number of pushpins in the cluster, using a logarithmic scale.
          var radius = Math.log(clusterSize) / Math.log(10) * 5 + minRadius;
          //Default cluster color is red.
          var fillColor = 'rgb(172,23,23)';
          var fillColor2 = 'rgb(242,200,17)';
          if (clusterSize < 10) {
            //Make the cluster green if there are less than 10 pushpins in it.
            //fillColor = 'rgba(20, 180, 20, 0.5)';
          }
          else if (clusterSize < 100) {
            //Make the cluster yellow if there are 10 to 99 pushpins in it.
            //fillColor = 'rgba(255, 210, 40, 0.5)';
          }
          //Create an SVG string of two circles, one on top of the other, with the specified radius and color.
          var svg = ['<svg xmlns="http://www.w3.org/2000/svg" width="', (radius * 2), '" height="', (radius * 2), '">',
            '<circle cx="', radius, '" cy="', radius, '" r="', radius, '" fill="', fillColor2, '"/>',
            '<circle cx="', radius, '" cy="', radius, '" r="', radius - outlineWidth, '" fill="', fillColor, '"/>',
            '</svg>'];
          //Customize the clustered pushpin using the generated SVG and anchor on its center.
          cluster.setOptions({
            icon: svg.join(''),
            anchor: new Microsoft.Maps.Point(radius, radius),
            textOffset: new Microsoft.Maps.Point(0, radius - 8) //Subtract 8 to compensate for height of text.
          });
        }

        /* Pagination code ends */

        function clusterClicked(e) {
            if (e.target.containedPushpins) {
                var locs = [];
                for (var i = 0, len = e.target.containedPushpins.length; i < len; i++) {
                    //Get the location of each pushpin.
                    locs.push(e.target.containedPushpins[i].getLocation());
                }

                //Create a bounding box for the pushpins.
                var bounds = Microsoft.Maps.LocationRect.fromLocations(locs);

                //Zoom into the bounding box of the cluster. 
                //Add a padding to compensate for the pixel area of the pushpins.
                map.setView({ bounds: bounds, padding: 100 });
            }
        }

        $(".pageLoad").hide();
        // $(".load-more-btn").hide();
        
    }

    /* Pagingation code starts */
      function pagination_var(totalResults, show_per_page, PagerNumber, Classname){
        
          var paginationHtml = '';      
          var number_of_pages = Math.ceil(totalResults/show_per_page);    
          var _pagesCurrent = parseInt(PagerNumber);

          var current_link = 0; 
          
          if(number_of_pages>1 && _pagesCurrent>1){
            var activeClass= "page_link actArrow "+Classname+"_page";
          }else{
            var activeClass= "deactArrow";
          }
          if(number_of_pages>1){
            var PreLink = _pagesCurrent-1;
            paginationHtml += '<a class="jp-previous '+activeClass+'" data="'+ PreLink +'" id="jp-previous" href="javascript:void(0)"></a>';
          }
          while(number_of_pages > current_link){
            var pageNumActive = current_link + 1;  
            paginationHtml += '<a class="page_link '+Classname+'_page" data="'+ pageNumActive +'" id="'+ Classname +'_'+ pageNumActive +'" href="javascript:void(0)">'+ pageNumActive +'</a>';      
            current_link++; 
          }
          if(number_of_pages>1 && _pagesCurrent<(number_of_pages)){
            var activeClass= "page_link actArrow "+Classname+"_page";
          }else{
            var activeClass= "deactArrow";
          }
          if(number_of_pages>1){
            var NextLink = _pagesCurrent+1;
            paginationHtml += '<a class="jp-next '+activeClass+'" data="'+ NextLink +'" id="jp-next" href="javascript:void(0)"></a>';
          }     
          
        $('.'+Classname).html(paginationHtml);      
        $('#'+Classname+'_'+parseInt(PagerNumber)).addClass( 'active' );  
        
        var _bulletsCenter = 3; 
        var _bulletsSide = 2;
        
        var _bullets = $('.'+Classname).children();
        _bullets.removeClass( 'hidden' ).remove( 'ellipsis' );
        
        if (number_of_pages > _bulletsCenter + (_bulletsSide * 2) + 2) {

          //  1 2 3 |4| 5 6 7 8 .. 14 15  
          if (_pagesCurrent < Math.floor(_bulletsCenter / 2) + _bulletsSide + 2) {
            var start = _bulletsSide + _bulletsCenter + 1;
            var end = number_of_pages - _bulletsSide - 1;
            hideBullets( _bullets, start, end );
            //_bullets.eq( end ).addClass( 'ellipsis_before' );
            _bullets.eq( end ).before('<span class="ellipsis_before">...</span>');
          
          //  1 2 .. 8 9 10 |11| 12 13 14 15  
          } else if (_pagesCurrent > number_of_pages - (Math.ceil(_bulletsCenter / 2) + _bulletsSide) - 2) {
            var start = _bulletsSide + 1;
            var end = number_of_pages - (_bulletsSide + _bulletsCenter + 1);
            hideBullets( _bullets, start, end );
            _bullets.eq( start - 1 ).after('<span class="ellipsis">...</span>');
        
          //  1 2 .. 6 7 |8| 9 10 .. 14 15  
          } else {
            var start = _bulletsSide + 1;
            var end = _pagesCurrent - Math.floor(_bulletsCenter / 2);
            hideBullets( _bullets, start, end );
            //_bullets.eq( start - 1 ).addClass( 'ellipsis' );
            _bullets.eq( start - 1 ).after('<span class="ellipsis">...</span>');
            
            var _pagesCurrent =  parseInt(_pagesCurrent);
            var math_start =  parseInt(Math.ceil(_bulletsCenter / 2));
            var start =  _pagesCurrent + math_start;
            var end = number_of_pages - (_bulletsSide - 1);
            hideBullets( _bullets, start, end );
            //_bullets.eq( start - 1 ).addClass( 'ellipsis' );
            _bullets.eq( start - 1 ).after('<span class="ellipsis">...</span>');
          }
        }
        return paginationHtml;
      } 
      function hideBullets( bullets, start, end ) {
        for ( var a = start; a < end; a++ ) {
          bullets.eq( a ).addClass( 'hidden' );
        }
      }
  });  

 })(LITHIUM.jQuery);
</@liaAddScript>