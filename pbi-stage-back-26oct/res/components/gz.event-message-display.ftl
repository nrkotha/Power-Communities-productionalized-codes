<!-- gz.event-message-display --> 
<#assign msgid = page.context.message.uniqueId />

<#if env.context.message?? && msgid == env.context.message.uniqueId>

  <#assign query = "SELECT subject,body,view_href,author.login, author.rank.name, author.rank.icon_left, author.avatar.profile, author.view_href,c_event_summary,c_event_location,c_event_street,c_event_city,c_event_state,c_event_country, c_start_date, c_end_date, c_event_metadata FROM messages where id = '${msgid}'"?url('utf-8') />
  <#attempt>
    <#assign event = rest("2.0","/search?q="+query).data.items[0] />
  <#recover>
    <#assign event = "">
  </#attempt>
 
  <#assign start_date = "">
  <#assign end_date = "">
  
  <#if event?? && event?has_content && event.c_event_metadata??>
    <#assign customDateFormat = "MM/dd/yyyy h:mm:a" />
    
    <#attempt>
      <#assign eventsMetaData = event.c_event_metadata?eval />

    <#recover>
      <#assign eventsMetaData = {} />

    </#attempt>
  
    <div class="events_information max-width-class">
      <div class="lia-quilt-column-24">
        <div class="lia-quilt-column-24">
          <div class="lia-quilt-column-24 event_description">
            <#if event.c_event_metadata??>${event.body}</#if>
          </div>
          <div class="lia-quilt-column-24 event_top_section">
            <div class="message-display-wrapper">
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Event owner</div>
                <div class="event_details">
                  <div class="user_image lia-message-author lia-component-author">
                    <div class="lia-message-author-avatar">
                      <div class="UserAvatar lia-user-avatar lia-component-common-widget-user-avatar">
                        <a class="UserAvatar lia-link-navigation" href="${event.author.view_href}">
                          <img class="lia-user-avatar-message" title="${event.author.login}" src="${event.author.avatar.profile}">
                        </a>
                      </div>
                    </div>
                  </div>
                  <div class="event_text event_username"><a href="${event.author.view_href}" >${event.author.login}</a></div>
                  <div class="event_text">${event.author.rank.name}</div>
                </div>
              </div>
              <div class="event_fields lia-quilt-column-06">
                <#if event.c_event_location??>
                  <div class="event_label">Location</div>
                  <div class="event_details">
                    <div class="event_text">${event.c_event_location}</div>
                    <!--
                    <div class="event_text">
                      <span><#if event.c_event_street??>${event.c_event_street},</#if> <#if event.c_event_city??>${event.c_event_city}</#if></span>
                    </div>
                    -->
                  </div>
                </#if>
              </div>
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Registration status</div>
                <div class="event_details">
                  <div class="event_text">
                  <#if event.c_start_date?? && event.c_start_date?trim?matches("^[0-9]*") > 
                    ${event.c_start_date?trim?number?number_to_datetime?string['MMMM yy']}
                  </#if>
                  </div>
                  <div class="event_text event_time">
                    <span class="event_start_date">
                    <#if event.c_start_date?? && event.c_start_date?trim?matches("^[0-9]*") > 
                      ${event.c_start_date?trim?number?number_to_datetime?string['hh:mma']} -
                    </#if>
                    </span> 
                    <span class="event_end_date">
                    <#if event.c_end_date?? && event.c_end_date?trim?matches("^[0-9]*") >
                      ${event.c_end_date?trim?number?number_to_datetime?string['hh:mma']}
                    </#if>
                    </span>
                  </div>
                </div>
              </div>
              <!--
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Type</div>
                <div class="event_details">
                  <div class="event_text">${eventsMetaData.Category!''}</div>
                </div>
              </div>
              --> 
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Time</div>
                <div class="event_details">
                  <div class="event_text">
                  <#if event.c_start_date?? && event.c_start_date?trim?matches("^[0-9]*") > 
                    ${event.c_start_date?trim?number?number_to_datetime?string['MMMM yy']}
                  </#if>
                  </div>
                  <div class="event_text event_time">
                    <span class="event_start_date">
                    <#if event.c_start_date?? && event.c_start_date?trim?matches("^[0-9]*") > 
                      ${event.c_start_date?trim?number?number_to_datetime?string['hh:mma']} -
                    </#if>
                    </span> 
                    <span class="event_end_date">
                    <#if event.c_end_date?? && event.c_end_date?trim?matches("^[0-9]*") >
                      ${event.c_end_date?trim?number?number_to_datetime?string['hh:mma']}
                    </#if>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="message-display-wrapper">
              <!--
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Time</div>
                <div class="event_details">
                  <div class="event_text">
                  <#if event.c_start_date?? && event.c_start_date?trim?matches("^[0-9]*") > 
                    ${event.c_start_date?trim?number?number_to_datetime?string['MMMM yy']}
                  </#if>
                  </div>
                  <div class="event_text event_time">
                    <span class="event_start_date">
                    <#if event.c_start_date?? && event.c_start_date?trim?matches("^[0-9]*") > 
                      ${event.c_start_date?trim?number?number_to_datetime?string['hh:mma']} -
                    </#if>
                    </span> 
                    <span class="event_end_date">
                    <#if event.c_end_date?? && event.c_end_date?trim?matches("^[0-9]*") >
                      ${event.c_end_date?trim?number?number_to_datetime?string['hh:mma']}
                    </#if>
                    </span>
                  </div>
                </div>
              </div>
              -->
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Cost</div>
                <div class="event_details">
                  <div class="event_text cost_text">${eventsMetaData.RegistrationFee!''}</div>
                </div>
              </div>
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Target audience</div>
                <div class="event_details">
                  <div class="event_text">${eventsMetaData.PrimaryTargetAudience!''}</div>
                </div>
              </div> 
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Product</div>
                <div class="event_details">
                  <div class="event_text">${eventsMetaData.Product!''}</div>
                </div>
              </div>
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Primary Language</div>
                <div class="event_details">
                  <div class="event_text">${eventsMetaData.PrimaryLanguage!''}</div>
                </div>
              </div>
            </div>

            <!--
            <div class="message-display-wrapper">
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Primary Language</div>
                <div class="event_details">
                  <div class="event_text">${eventsMetaData.e_primary_lang!''}</div>
                </div>
              </div>
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Timezone</div>
                <div class="event_details">
                  <div class="event_text">${eventsMetaData.e_timezone!''}</div>
                </div>
              </div> 
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Registration open</div>
                <div class="event_details">
                  <div class="event_text">Business professionals</div>
                </div>
              </div>
              <div class="event_fields lia-quilt-column-06">
                <div class="event_label">Registration closed</div>
                <div class="event_details">
                  <div class="event_text">Power Bi Community</div>
                </div>
              </div>
            </div>
          </div>
          -->
          
          <div class="lia-quilt-column-24 event_tags">
            <@component id="tags"/>
          </div>
          <#if event.c_event_location?? && eventsMetaData.Category?? && eventsMetaData.Category != 'Online'  >
            <div class="lia-quilt-column-24 event_map">
              <div class="event_label">Location</div>
              <div id="event-bing-map" style="width: 588px;height: 383px;"></div>
            </div>
          </#if>
        </div>
      </div>
    </div>
  </div>
  <script src="//www.bing.com/api/maps/mapcontrol?callback=loadMapScenario" async defer" ></script>
  <script type='text/javascript'>
    var map;
        // console.log(lat,long);
        function loadMapScenario() {
            var lat = ${eventsMetaData.Latitude!''};
            var long = ${eventsMetaData.Longitude!''};
           if(lat != '' && long != ''){
              map = new Microsoft.Maps.Map(document.getElementById('event-bing-map'), {
                  credentials: 'AsUSWo8roLrVtgCsFdMVfwMHHRc_0iom_vxaznJANj4KthDp_R71Zxr--oqxG4MG',
                  center: new Microsoft.Maps.Location(lat,long)
              });
              var pushpin = new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(lat,long));
              map.entities.push(pushpin);
            } 
        }
                 
  </script>
	</#if>
	<style>
    #lia-body.ForumTopicPage .lia-button.lia-button-secondary.reply-action-link.lia-action-quick-reply.lia-custom-event {
      display: none;
    }
    .cost_text{
      text-transform: uppercase;
    }
    .button-container {
      margin: 10px 0px;
      text-align: right;
    }
    #lia-body .button-container input.lia-button.lia-button-primary.lia-button-Submit-action {
      display: inline-block;
    }
    .ajax_loader{
        display: inline-block;
            padding-right: 40px;
    }
    .c-progress.f-indeterminate-local.f-progress-large {
      z-index: 9999;
    }
    .c-progress.f-indeterminate-local {
    }
    .c-progress {
    }
    .c-progress.f-indeterminate-local span {
      animation: orbit 6s infinite;
      position: absolute;
      transform: rotate(225deg);
    }
    .c-progress.f-indeterminate-local span::after {
      background: #232323 none repeat scroll 0 0;
      border-radius: 100%;
      content: "";
      position: absolute;
    }
    .c-progress.f-indeterminate-local span:nth-child(2) {
      animation-delay: 120ms;
    }
    .c-progress.f-indeterminate-local span:nth-child(3) {
      animation-delay: 240ms;
    }
    .c-progress.f-indeterminate-local span:nth-child(4) {
      animation-delay: 480ms;
    }
    .c-progress.f-indeterminate-local span:nth-child(5) {
      animation-delay: 720ms;
    }
    .c-progress.f-indeterminate-local.f-progress-large {
      height: 20px;
      width: 20px;
    }
    .c-progress.f-indeterminate-local.f-progress-large span {
      height: 20px;
      width: 20px;
    }
    .c-progress.f-indeterminate-local.f-progress-large span::after {
      height: 5px;
      width: 5px;
    }
    .c-progress.f-indeterminate-local.f-progress-small {
      height: 20px;
      width: 20px;
    }
    .c-progress.f-indeterminate-local.f-progress-small span {
      height: 25px;
      width: 25px;
    }
    .c-progress.f-indeterminate-local.f-progress-small span::after {
      height: 6px;
      width: 6px;
    }
    @keyframes orbit {
      0% {
        animation-timing-function: ease-out;
        opacity: 1;
        transform: rotate(225deg);
      }
      7% {
        animation-timing-function: linear;
        transform: rotate(345deg);
      }
      30% {
        animation-timing-function: ease-in-out;
        transform: rotate(455deg);
      }
      39% {
        animation-timing-function: linear;
        transform: rotate(690deg);
      }
      70% {
        animation-timing-function: ease-out;
        opacity: 1;
        transform: rotate(815deg);
      }
      75% {
        animation-timing-function: ease-out;
        transform: rotate(945deg);
      }
      76% {
        opacity: 0;
        transform: rotate(945deg);
      }
      100% {
        opacity: 0;
        transform: rotate(945deg);
      }
    }
    .done_message {
      display: inline-block;
      float: left;
    }
    .success{
      color:green;
    }
    .error {
      color:red;
    }

  </style>
  <@liaAddScript>
    (function( $ ) {
      $(document).on('click','.lia-button-Submit-action',function(){
        var content_iframe = $('.post_message').val();
        var message_id = '${page.context.message.uniqueId}';
        var message_subject = "RE: ${page.context.message.subject}"; 
        var post_message_ep_url = "/plugins/custom/microsoft/microsoftbi/custom-post-message";
        $('.ajax_loader').show();
        $('.done_message').hide();
        $('.done_message').html("");
        if($('.done_message').hasClass('success')){
          $('.done_message').removeClass('success');
        }else{
          $('.done_message').removeClass('error');
        }
        if(content_iframe != '' && content_iframe.length > 10){
          $(".event-custom-quicky-reply .lia-button-Submit-action").addClass("lia-btn-disabled");
          $.ajax({
            url: post_message_ep_url,
            method: 'POST',
            data: { message_id: message_id, post_message: content_iframe, message_subject: message_subject},
            dataType: "html"
          }).done(function(response) {
              var response = JSON.parse(response);
	            var done_message = "";
	            var response_class = "";
	            if(response.status == 'success'){
	              done_message = "Message Posted Successfully. Page will be refreshed in few seconds";
	              response_class = "success";
	              $('.post_message').val('');
	              setTimeout(function(){ location.reload(); }, 10000);
	            }else{
	              done_message = "There was some error while posting. Please try again later.";
	              response_class = "error";
	            }
	             $('.ajax_loader').hide();
	            $('.done_message').html(done_message);
	            $('.done_message').addClass(response_class);
	            $(".event-custom-quicky-reply .lia-button-Submit-action").removeClass("lia-btn-disabled");
	            $('.done_message').show();
          });
        }
        else{
                $('.done_message').html("Please enter more than 10 characters");
            $('.done_message').addClass("error");
            $('.done_message').show();
            $('.ajax_loader').hide();
        }
      })
    })(LITHIUM.jQuery);
  </@liaAddScript>
</#if>