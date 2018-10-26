<#if coreNode.id == 'Events'>
<!-- gz.events.fields --> 
<script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDHxfYgiuc2AOOkXOMmwNahsbUeI0UWS9Q" type="text/javascript" ></script>
<script type="text/javascript">
  function initialize() {
      var input = document.getElementById('microsoftmsg_event_location');
      var autocomplete = new google.maps.places.Autocomplete(input);
      google.maps.event.addListener(autocomplete, 'place_changed', function () {
          var place = autocomplete.getPlace(); 
    document.getElementById("e_lat").value = place.geometry.location.lat();
    document.getElementById("e_long").value = place.geometry.location.lng();
    document.getElementById("microsoftmsg_event_street").value = place.vicinity;
    for(i=0; i < place.address_components.length; i++){
      if(place.address_components[i].types[0] == 'administrative_area_level_2'){
      document.getElementById("microsoftmsg_event_city").value = place.address_components[i].long_name;
      }
      else if(place.address_components[i].types[0] == "administrative_area_level_1"){ 
      document.getElementById("microsoftmsg_event_state").value = place.address_components[i].long_name;
      }
      else if(place.address_components[i].types[0] == "country"){
      //console.log('country',place.address_components[i].long_name);
      document.getElementById("microsoftmsg_event_country").value = place.address_components[i].long_name;
      }
      else if(place.address_components[i].types[0] == "postal_code"){
      document.getElementById("e_zip").value = place.address_components[i].long_name;
      }

    }
    });
  }
  google.maps.event.addDomListener(window, 'load', initialize); 
</script>

  <#assign product_options_array = [{'value':'cloud_platform','title':'Cloud Platform'},{'value':'developer_tools','title':'Developer Tools'},{'value':'Enterprise Solutions','title':'Enterprise Solutions'},{'value':'hololens','title':'Hololens'},{'value':'microsoft_azure','title':'Microsoft Azure'},{'value':'microsoft_dynamics','title':'Microsoft Dynamics'},{'value':'server_and_management','title':'Server And Management'},{'value':'small_business_solutions','title':'Small Business Solutions'},{'value':'surface','title':'Surface'},{'value':'windows','title':'Windows'},{'value':'xbox','title':'Xbox'}] />
  <#assign audience_array = [{'value':'business_professionals','title':'Business Professionals'},{'value':'developers','title':'Developers'},{'value':'educators','title':'Educators'},{'value':'government','title':'Government'},{'value':'it_professionals','title':'It Professionals'},{'value':'partners','title':'Partners'},{'value':'students','title':'Students'},{'value':'for_home','title':'For Home'}] />

  <#attempt>
    <#assign message_details = rest("2.0","/search?q=" + "Select c_event_metadata FROM messages WHERE id = '${page.context.thread.topicMessage.uniqueId}'"?url).data.items[0] />
    <#assign article_teaser = message_details.c_event_metadata?replace("<[^>]*>","", "r") />
  <#recover>
    <#assign article_teaser = "" />
  </#attempt>

  <#attempt>
    <#assign rolesA = [] />

    <#if !user.anonymous>
    <#assign userRole = restadmin("/users/id/${user.id}/roles").roles.role />
    <#list userRole as role >
    <#assign rolesA = rolesA + [role.name] />
    </#list>
    </#if>  
  <#recover>
    <#assign rolesA = [] />
  </#attempt>

  <input type="hidden" id="tab_details" value="In Person" />
  <input type="hidden" id="e_lat" <#if article_teaser != '' && article_teaser?eval['Latitude']??>value="${article_teaser?eval['Latitude']}"</#if>/>
  <input type="hidden" id="e_long" <#if article_teaser != '' && article_teaser?eval['Longitude']??>value="${article_teaser?eval['Longitude']}"</#if>/>
<div class="events_fields">

  <!-- language macro field -->
  <#--include "gz.macro.event_field_language.ftl" /-->
    <!-- product macro field -->
    <#include "*/gz.macro.event_field_product.ftl" />  

    <!-- level macro field -->
    <#include "*/gz.macro.event_field_level.ftl" />

    <p style="margin-top: 40px;width: 500px;margin-bottom: 0px;"> The following require special permissions. Click <a target="_blank" href="https://aka.ms/CommunityEventPermissions"> here </a> to learn how you can earn these permissions? </p>

    <div class="special-permissions">

      <!-- featured-event macro field -->
      <#include "*/gz.macro.event_field_featured-event.ftl" />

      <!-- publishable macro field -->
      <#include "*/gz.macro.event_field_publishable.ftl" />

      <!-- assistance macro field -->
      <#include "*/gz.macro.event_field_request-assistance.ftl" />   

      <!-- assistance-details macro field -->
      <#include "*/gz.macro.event_field_assistance-details.ftl" />

      <!-- survey-url macro field -->
      <#include "*/gz.macro.event_field_survey-url.ftl" />

      <!-- survey-results-url macro field -->
      <#include "*/gz.macro.event_field_survey-results-url.ftl" />  

    </div>

    <!-- audience macro field -->
    <#include "*/gz.macro.event_field_audience.ftl" />

    <!-- event-cost macro field -->
    <#include "*/gz.macro.event_field_event-cost.ftl" />    

    <!-- event-status macro field -->
    <#include "*/gz.macro.event_field_status.ftl" />

    <!-- gz.macro.event_field_registration-status macro field -->
    <#include "*/gz.macro.event_field_registration-status.ftl" />

    <!-- gz.macro.event_field_registration-date macro field -->
    <#include "*/gz.macro.event_field_registration-date.ftl" />   

  </div>
<@liaAddScript>
  ;(function ($){
    $(document).ready(function(){

    var validate_event_location = true;
    var validate_event_streetAddress = true;
    var validate_event_city = true;
    var validate_event_state = true;
    var validate_event_zip = true;
    var validate_event_country = true;
    var online_event_url_check = false;

    var validate_registration_status = true;
    var validate_register_start_date = true;
    var validate_reg_open_date_hour = true;
    var validate_reg_open_date_min = true;
    var validate_reg_open_date_ampm = true;
    var validate_register_end_date = true;
    var validate_reg_end_date_hour = true;
    var validate_reg_end_date_min = true;
    var validate_reg_end_date_ampm = true;

    $('.event-tab-list li').click(function(){
      $('.event-tab-list li').removeClass('active');
      $(this).addClass('active');
      var id = $.trim($(this).attr('id'));
      if(id == 'online'){
        $('#tab_details').val("Online");
        $('input.lia-form-microsoftmsg-event-location-input.lia-form-type-text.lia-form-input-vertical,.lia-form-row.lia-form-microsoft-msg-event-street-entry,.lia-form-row.lia-form-microsoft-msg-event-city-entry,.lia-form-row.lia-form-microsoft-msg-event-state-entry,.lia-form-row.lia-form-microsoft-msg-event-country-entry').hide();
        $('div.field-absolute').show();
        validate_event_location = false;
        validate_event_streetAddress = false;
        validate_event_city = false;
        validate_event_state = false;
        validate_event_zip = false;
        validate_event_country = false;
        publish_to_community_check = true;
        online_event_url_check = true;
      }else{
    
        $('#tab_details').val("In Person");        
        $('input.lia-form-microsoftmsg-event-location-input.lia-form-type-text.lia-form-input-vertical,.lia-form-row.lia-form-microsoft-msg-event-street-entry,.lia-form-row.lia-form-microsoft-msg-event-city-entry,.lia-form-row.lia-form-microsoft-msg-event-state-entry,.lia-form-row.lia-form-microsoft-msg-event-country-entry').show();
          $('div.field-absolute').hide();
          validate_event_location = true;
          validate_event_streetAddress = true;
          validate_event_city = true;
          validate_event_state = true;
          validate_event_zip = true;
          validate_event_country = true;
          publish_to_community_check = false;
          online_event_url_check = false;
      }
    });


    $("select#e_registration_mandatory").change(function() {
      if($(this).val() == 'no'){
      $('div.registration_status').hide();  
      $('div.registration-date-container').hide();
        validate_registration_status = false;
        validate_register_start_date = false;
        validate_reg_open_date_hour = false;
        validate_reg_open_date_min = false;
        validate_reg_open_date_ampm = false;
        validate_register_end_date = false;
        validate_reg_end_date_hour = false;
        validate_reg_end_date_min = false;
        validate_reg_end_date_ampm = false; 
      } else{
      $('div.registration_status').show();  
      $('div.registration-date-container').show();
        validate_registration_status = true;
        validate_register_start_date = true;
        validate_reg_open_date_hour = true;
        validate_reg_open_date_min = true;
        validate_reg_open_date_ampm = true;
        validate_register_end_date = true;
        validate_reg_end_date_hour = true;
        validate_reg_end_date_min = true;
        validate_reg_end_date_ampm = true;  
      }
    });
    if($('#e_registration_mandatory option:selected').val() == 'no'){
      validate_registration_status = false;
      validate_register_start_date = false;
      validate_reg_open_date_hour = false;
      validate_reg_open_date_min = false;
      validate_reg_open_date_ampm = false;
      validate_register_end_date = false;
      validate_reg_end_date_hour = false;
      validate_reg_end_date_min = false;
      validate_reg_end_date_ampm = false;
      $('.registration-date-container').hide();
      $('.registration_status').hide();
    }
    var Elems = ".PostPage .lia-button-group .lia-button-Submit-action,.EditPage .lia-button-group .lia-button-Submit-action";
    $(document).on('click',Elems,function(e){
      $('#lia-body.PostPage .lia-content .event-field input[type="text"],#lia-body.PostPage .event-field input,#lia-body .lia-content .event-field select,#lia-body .lia-content .mce-tinymce.mce-container.mce-panel').removeClass('required');

      var e_product = $('#e_product').val();
      var e_level = $('#e_level').val();
      var e_target_audience = $('#e_target_audience').val();
      var e_cost = $('#e_cost').val();
      var e_status = $('#e_status').val();
      var e_registration_mandatory = $('#e_registration_mandatory').val();
      var e_summary = $('#microsoftmsg_event_summary');
      var e_currency = $('#e_currency').val();
      var e_zip = $('#e_zip').val();

      var e_register_start_date = $('#e_register_start_date').val();
      var e_register_end_date = $('#e_register_end_date').val();

      var e_registration_start_date = $("#e_registration_start_date").val();
      var e_registration_end_date = $("#e_registration_end_date").val();

      var tab_details = $('#tab_details').val();
            var e_timezone = $('#e_timezone').val();
            var e_long = $('#e_long').val();
            var e_lat = $('#e_lat').val();
      var execute_post_functionality = true;
      var event_country = $('#microsoftmsg_event_country option:selected').text();

      var assistance_request = $('#assistance_request').val();
      var assistance_details = $('#assistance_details').val();
      var survey_url = $('#survey_url').val();
      var survey_results_url = $('#survey_results_url').val();

      var featured_event = $('#featured_event:checked').length ? $('#featured_event').val() : 'false';
      var registration_status = $('#registration_status').val();
      var publish_to_community = $('#publish_to_community:checked').length ? $('#publish_to_community').val() : 'false';
      var WebinarGalleryUrl = $('#WebinarGalleryUrl').val();
      var online_event_url = $('#online_event_url').val();
      var IsPublishable = $('#IsPublishable:checked').length ? $('#IsPublishable').val() : 'false';

      /* Validations Fields Order Wise Start */
        /* if($('#lia-subject').val() == ''){
          $('#lia-subject').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#lia-subject');
        //console.log'#lia-subject');
        }else if(e_summary == ''){
          $('#microsoftmsg_event_summary').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#microsoftmsg_event_summary');
        //console.log'#microsoftmsg_event_summary');
        }else if($('#online_event_url').val() == '' && online_event_url_check){
          $('#online_event_url').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#online_event_url');
        //console.log'#online_event_url');
        }else if($('#publish_to_community').val() == '' && publish_to_community_check){
          $('#publish_to_community').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#publish_to_community');
        //console.log'#publish_to_community');
        }else if($('#microsoftmsg_event_location').val() == '' && validate_event_location){
          $('#microsoftmsg_event_location').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#microsoftmsg_event_location');
        //console.log'#microsoftmsg_event_location');
        }else if($('#microsoftmsg_event_street').val() == '' && validate_event_streetAddress){
          $('#microsoftmsg_event_street').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#microsoftmsg_event_street');
        //console.log'#microsoftmsg_event_street');
        }else if($('#microsoftmsg_event_city').val() == '' && validate_event_city){
          $('#microsoftmsg_event_city').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#microsoftmsg_event_city');
        //console.log'#microsoftmsg_event_city');
        }else if($('#microsoftmsg_event_state').val() == '' && validate_event_state){
          $('#microsoftmsg_event_state').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#microsoftmsg_event_state');
        //console.log'#microsoftmsg_event_state');
        }else if($('#microsoftmsg_event_country').val() == '' && validate_event_country){
          $('#microsoftmsg_event_country').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#microsoftmsg_event_country');
        //console.log'#microsoftmsg_event_country');
        }else if($('#e_timezone').val() == ''){
          $('#e_timezone').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_timezone');
        //console.log'#e_timezone');
        }else if($('#s_dateid1').val() == ''){
          $('#s_dateid1').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#s_dateid1');
        //console.log'#s_dateid1');
        }else if($('#e_dateid1').val() == ''){
          $('#e_dateid1').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_dateid1');
        //console.log'#e_dateid1');
        }else if(e_product == ''){
          $('#e_product').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_product');
        //console.log'#e_product');
        }else if(e_level == ''){
          $('#e_level').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_level');
        //console.log'#e_level');
        }else if($('#assistance_request').val() == '' && !$('#assistance_request').prop('disabled')){
          $('#assistance_request').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#assistance_request');
        //console.log'#assistance_request');
        }else if($('#assistance_details').val() == '' && !$('#assistance_details').prop('disabled')){
          $('#assistance_details').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#assistance_details');
        //console.log'#assistance_details');
        }else if($('#survey_url').val() == '' && !$('#survey_url').prop('disabled')){
          $('#survey_url').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#survey_url');
        //console.log'#survey_url');
        }else if($('#survey_results_url').val() == '' && !$('#survey_results_url').prop('disabled')){
          $('#survey_results_url').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#survey_results_url');
        //console.log'#survey_results_url');
        }else if(e_target_audience == ''){
          $('#e_target_audience').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_target_audience');
        //console.log'#e_target_audience');
        }else if($('#featured_event').val() == '' && !$('#featured_event').prop('disabled') ){
          $('#featured_event').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#featured_event');
        //console.log'#featured_event');
        }else if(e_cost == ''){
          $('#e_cost').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_cost');
        //console.log'#e_cost');
        }else if(e_status == ''){
          $('#e_status').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_status');
        //console.log'#e_status');
        }else if(e_registration_mandatory == ''){
          $('#e_registration_mandatory').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_registration_mandatory');
        //console.log'#e_registration_mandatory');
        }else if($('#registration_status').val() == ''){
          $('#registration_status').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#registration_status');
        //console.log'#registration_status');
        }else if(e_register_start_date == '' && validate_register_start_date){
          $('#e_register_start_date').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_register_start_date');
        //console.log'#e_register_start_date');
        }else if(e_register_end_date == '' && validate_register_end_date){
          $('#e_register_end_date').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#e_register_end_date');
        //console.log'#e_register_end_date');
        }else if(tinymce.get('tinyMceEditor').getContent({format: 'text'}).trim() == ''){
          $('#lia-body .lia-content .mce-tinymce.mce-container.mce-panel').addClass('required');
          execute_post_functionality = false;
          ScrollToElement('#lia-body .lia-content .mce-tinymce.mce-container.mce-panel');
        } */
      /* Validations Fields Order Wise End */


        if(!execute_post_functionality){
          e.preventDefault();
        } 

         var eventData = {};
         eventData.PrimaryLanguage       = "English";
         eventData.Product           = e_product.join(',');
         eventData.PrimaryTargetAudience   = e_target_audience.join(',');
         eventData.Status            = e_status;
         eventData.RegistrationOpen        = e_registration_start_date;
         eventData.RegistrationClose       = e_registration_end_date;
         eventData.PostalCode          = e_zip;
         eventData.Latitude          = e_lat;
         eventData.Longitude         = e_long;
         eventData.Category          = tab_details;
         eventData.Timezone          = e_timezone;
         eventData.AccountCode         = "PowerBi";
         eventData.Source          = "PowerBi";
         eventData.isActive          = 1;
         eventData.IsPublishable       = IsPublishable;
         eventData.RegistrationFee       = e_cost +" "+ e_currency;

         /*Community Related Fields*/
         eventData.Country                = event_country;
         eventData.Level                  = e_level;
         eventData.AssistanceRequest      = assistance_request;
         eventData.AssistanceDetails    = assistance_details;
         eventData.SurveyUrl        = survey_url;
         eventData.SurveyResultsUrl     = survey_results_url;
         eventData.IsFeatured       = featured_event;
         eventData.RegistrationStatus     = registration_status;
         eventData.PublishToWebinar     = publish_to_community;
         eventData.WebinarGalleryUrl      = WebinarGalleryUrl;
         eventData.OnlineEventUrl       = online_event_url;
         eventData.RegistrationMandatory  = e_registration_mandatory;

       //console.logeventData);

       // var text = '{"e_primary_lang":"'+e_primary_lang+'", "e_product":"'+e_product+'", "e_level":"'+e_level+'", "e_target_audience":"'+e_target_audience+'", "e_cost":"'+e_cost+'", "e_status":"'+e_status+'", "e_registration_mandatory":"'+e_registration_mandatory+'","e_registration_start_date":"'+e_registration_start_date+'", "e_registration_end_date":"'+e_registration_end_date+'", "e_zip":"'+e_zip+'", "e_currency":"'+e_currency+'", "tab_details":"'+tab_details+'", "e_timezone":"'+e_timezone+'", "e_lat":"'+e_lat+'", "e_long":"'+e_long+'","event_country":"'+event_country+'","assistance_request":"'+assistance_request+'","assistance_details":"'+assistance_details+'","survey_url":"'+survey_url+'","featured_event":"'+featured_event+'","registration_status":"'+registration_status+'","publish_to_community":"'+publish_to_community+'","online_event_url":"'+online_event_url+'","survey_results_url":"'+survey_results_url+'","IsPublishable":"'+IsPublishable+'"}';

      $('#microsoftmsg_event_metadata').val(JSON.stringify(eventData));
      });

        function ScrollToElement(elm){
      $('html, body').animate({
              scrollTop: $(elm).offset().top - 100
         }, 500);
    }

    $("textarea,input").keyup(function(){
      $(this).removeClass('required');
    });

    $("select").change(function(){
      $(this).removeClass('required');
    });

    function updateTimeStamp1(){
      var date = $('#e_register_start_date').val();
      var hour = $('#e_reg_open_date_hour').val();
      var min = $('#e_reg_open_date_min').val();
      var AMPM = $('#e_reg_open_date_ampm').val();
      var datetime = date+" "+hour+":"+min+":"+AMPM
      $.get('/plugins/custom/microsoft/microsoftbi/datetomillisconvertor', {'dateToConvert': datetime}, function(data,status){
        $("#e_registration_start_date").val(data);
      })
    }

    function updateTimeStamp2(){
      var date = $('#e_register_end_date').val();
      var hour = $('#e_reg_end_date_hour').val();
      var min = $('#e_reg_end_date_min').val();
      var AMPM = $('#e_reg_end_date_ampm').val();

      var datetime = date+" "+hour+":"+min+":"+AMPM
      $.get('/plugins/custom/microsoft/microsoftbi/datetomillisconvertor', {'dateToConvert': datetime}, function(data,status){
        $("#e_registration_end_date").val(data);
      })
    }


    $("#e_reg_open_date_hour, #e_reg_open_date_min, #e_reg_open_date_ampm").change(function(){
      updateTimeStamp1();
    })

    $("#e_reg_end_date_hour, #e_reg_end_date_min, #e_reg_end_date_ampm").change(function(){
      updateTimeStamp2();
    })

    $.getScript("${asset.get('/html/assets/jquery-ui.js')}").done(function(){
      if ( $("#e_register_start_date").length && $("#e_register_end_date").length ){
        $("#e_register_start_date").datepicker({
          showOn: "both",
          buttonImage: "${skin.images.button_calendar.url}",
          buttonImageOnly: true,
          buttonText: "Select registration start date",
          dateFormat: "mm/dd/yy",
          onSelect: function(date,d){
            $("#"+d.id).removeClass('required');
          //console.log'Start date: ',date);
            $("#e_register_end_date").datepicker("option",{ minDate: new Date(date)})
            updateTimeStamp1();
          }
        });
        $("#e_register_end_date").datepicker({
          showOn: "both",
          buttonImage: "${skin.images.button_calendar.url}",
          buttonImageOnly: true,
          buttonText: "Select registration End date",
          dateFormat: "mm/dd/yy",
          onSelect: function(date,d){
            $("#"+d.id).removeClass('required');
          //console.log'End date: ',date);
            updateTimeStamp2();
          }
        });
        /* $("#s_dateid1").datepicker({
          onSelect: function(date,d){
          //console.logdate);
            $("#e_dateid1").datepicker("option",{ minDate: new Date(date)})
          }
        }); */
      }
    });

    })
  }(LITHIUM.jQuery));
</@liaAddScript>

<!-- gz.events-edit-event-css -->
<#include "*/gz.events-edit-event-css.ftl" />
</#if>