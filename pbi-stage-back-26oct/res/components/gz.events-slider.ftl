<!-- gz.events-slider --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
  .custom-announcement-carousal .event_calandar_card .event_card {
    display: table;
    background-color: rgba(255, 255, 255, 0.4);
    border-radius: 5px;
  }
  .custom-announcement-carousal .take-the-tour{
    width: 100%;
  }
  .custom-announcement-carousal .event_calandar_card{
    width:20%;
	display:inline-block;
	vertical-align: top;
  }
  .custom-announcement-carousal .event_info{
    width: 70%;
	display:inline-block;
	vertical-align: top;
  }
  .custom-announcement-carousal .event_info .title,
  .custom-announcement-carousal .event_info .description {
	width: 85%;
  }
  .custom-announcement-carousal .event_calandar_card .event_month,
  .custom-announcement-carousal .event_calandar_card .event_date {
    color: #000;
    text-align: center;
    vertical-align: middle;
    width: 100%;
    font-weight: 400;
  }
  #lia-body .lia-content .register-container a {
    margin-top: 20px;
    padding: 0px 40px;
  }
</style>
<!-- Start: Freemarker Part -->
<#assign carouselGetData = coreNode.settings.name.get("customcontent.4_text")!""/>
<#assign EventsArray = [] />
<#assign carousalClass = 'custom-announcement-carousal'/>
<#attempt>
<#assign carouselData = carouselGetData?split(',') />
<#assign now = .now/>
<#assign currentDate = now?date>
<#list carouselData as data>
	<#assign message_details_external = rest("/messages/id/${data}?restapi.response_style=view").message />
	<#assign message_details_internal = rest("2.0","/search?q=" + "Select c_start_date,c_end_date FROM messages WHERE id = '${data}'"?url).data.items[0] />
	<#assign title = message_details_external.subject />
	<#assign description = message_details_external.body?replace("\\s\\s+", "","r") />
	<#assign author = message_details_external.author.login />
	<#assign view_href = message_details_external.@view_href />
	<#assign event_start_date = message_details_internal.c_start_date />
	<#assign event_end_date = message_details_internal.c_end_date />
	<#if description?length &gt; 170>
	 <#assign description = description?substring(0, 170) />
	</#if>
	<#assign dataObjects = '{"imageURL":"https://c.s-microsoft.com/en-us/CMSImages/Home_Seattle_Hero_1920_600.jpg?version=2c23d574-7340-45da-0dcb-3eb48907a398","title":"${title}","description":"${description}","actionURL":"${view_href}","startDate":"${event_start_date}","endDate":"${event_end_date}","author":"${author}"}' />
	<#assign EventsArray = EventsArray + [dataObjects]/>
</#list>
<#recover>
 <#assign EventsArray = [] />
</#attempt>
<!-- End: Freemarker Part -->
<!-- Start: HTML Part -->
<div class="${carousalClass}">
<section id="bg-widgets">
   <article>
    <#if (EventsArray?size >0)>
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <#assign dotCount = 0/>
		<div class="carousal-dots">
			<ul class="carousel-indicators">
				<#list EventsArray as obj>
				  <li data-target="#carousel-example-generic" data-slide-to="${dotCount}"<#if dotCount == 0>class="active"</#if></li>
				  <#assign dotCount = dotCount+1/>
				</#list>
				<div style="clear:both"></div>
			</ul>
        </div>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
		  <#assign dotCount = 0/>
          <#list EventsArray as obj>
            <div class="item <#if dotCount == 0>active</#if>">
                <img src="${obj?eval.imageURL}"/>
				<div class="container">
				<!-- Container -->
				  <div class="carousalData">
					<div class="take-the-tour">
						<div class="event_calandar_card">
							<div class="event_card">
								<div class="events_info">
								  <div class="event_icon In Person"></div>
								  <#assign eventDate = obj?eval.startDate?trim?number?number_to_datetime?string['MMM']+" "+obj?eval.startDate?trim?number?number_to_datetime?string['dd'] />
								  <#if obj?eval.startDate?trim?number != obj?eval.endDate?trim?number>
                                    <#assign eventDate = obj?eval.startDate?trim?number?number_to_datetime?string['MMM']+" "+obj?eval.startDate?trim?number?number_to_datetime?string['dd']+' - '+obj?eval.endDate?trim?number?number_to_datetime?string['dd'] />
                                  </#if>
								  <#if obj?eval.startDate?trim?number?number_to_datetime?string['MM']?number != obj?eval.endDate?trim?number?number_to_datetime?string['MM']?number >
									<#assign eventDate = obj?eval.startDate?trim?number?number_to_datetime?string['MMM']+" "+obj?eval.startDate?trim?number?number_to_datetime?string['dd']+' - '+obj?eval.endDate?trim?number?number_to_datetime?string['MMM']+' '+obj?eval.endDate?trim?number?number_to_datetime?string['dd'] />
								  </#if>
								  <div class="event_date">${eventDate}</div>
								</div>
							</div>
						</div>
						<div class="event_info">
						  <div class="title"><h2>${obj?eval.title}</h2></div>
						  <div class="description">${obj?eval.description}</div>
						  <div class="author"><span>by </span><span>${obj?eval.author}</span></div>
						  <div class="register-container"><a href="${obj?eval.actionURL}" target="_blank" ms.pgarea="" ms.cmpgrp="" ms.cmptyp="link" ms.cmpnm="REGISTER" ms.title="" km.title="" ms.interactiontype="1">REGISTER</a></div>
						</div>
					</div>
				  </div>
				</div>
            </div>
            <#assign dotCount = dotCount+1/>
          </#list>
        </div>

        <!-- Controls -->
		<div class="container"> <!-- container -->
			<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
				<img src="/html/assets/left.png"/>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
				<img src="/html/assets/right.png"/>
			</a>
			<div style="clear:both"></div>
	    </div>
      </div>
    </#if>
   </article>
</section>
</div>
<div style="clear:both"></div>

<!-- End: HTML Part -->