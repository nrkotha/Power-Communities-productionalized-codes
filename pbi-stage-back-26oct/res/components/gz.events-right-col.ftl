<!-- gz.events-right-col --> 
<#if !user.anonymous && page.name != 'BizAppsPage'>
    <#assign user_email = rest('/users/id/${user.id}/email').value />
    <#assign first_name = rest('/users/id/${user.id}/profiles/name/name_first').value />
    <#assign last_name = rest('/users/id/${user.id}/profiles/name/name_last').value />
    <#assign enviroment = "" />
	<#if config.getString("phase", "prod") == "stage">
      <#assign enviroment = "stage" />
	<#else> 
      <#assign enviroment = "production" />
	</#if>
    <style>
	    #lia-body .lia-content input[type='number'] {
			-moz-appearance:textfield;
			border: 2px solid #eaeaea;
			color: #757575;
			font-weight: 300;
		}

		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
			-webkit-appearance: none;
		}
	    #lia-body .lia-content .form-sub_title span {
			font-size: 14px;
			line-height: 40px;
		}
		#lia-body .lia-content .form-container {
			padding: 12px;
		}
		#lia-body .lia-content .form-title span {
			line-height: 33px;
		}
		#lia-body .lia-content .lia-form-type-text.lia-form-input-horizontal.full-width {
			float: left;
			display: inline-block;
			width: 97%;
			padding: 5px;
		}
		#lia-body .lia-content .lia-form-microsoftmsg-event-country-input {
			float: left;
			display: inline-block;
			width: 97%;
			background-color: #fff;
			border: none;
			color: #757575;
			font-weight: 300;
			padding: 5px;
			border: 2px solid #eaeaea;
		}
		#lia-body .lia-content .form-container .form-field {
			margin: 25px 0px;
		}
		#lia-body .lia-content span.asterix {
			line-height: 10px;
			font-size: 16px;
		}
		.ajax_loader {
			display: inline-block;
			position: absolute;
			top: 50%;
			z-index: 999;
			left:40%;
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
		  height: 40px;
		  width: 40px;
		}
		.c-progress.f-indeterminate-local.f-progress-large span {
		  height: 40px;
		  width: 40px;
		}
		.c-progress.f-indeterminate-local.f-progress-large span::after {
		  height: 10px;
		  width: 10px;
		}
		.c-progress.f-indeterminate-local.f-progress-small {
		  height: 40px;
		  width: 40px;
		}
		.c-progress.f-indeterminate-local.f-progress-small span {
		  height: 50px;
		  width: 50px;
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
		#lia-body .lia-content button.register_button.disabled-btn {
			background: #ccc;
			pointer-events: none;
		}
		#lia-body .lia-content .lia-quilt-column-24.event_right_section {
			position: relative;
		}
		#lia-body .lia-content .required {
			border: 1px solid #ff0039;
            box-shadow: 0px 0px 4px #ff0039;
		}
	</style>
	<div class="lia-quilt-column-24 event_right_section">
	   <div class="ajax_loader" style="display:none;">
			<div class="c-progress f-indeterminate-local f-progress-large" role="progressbar" tabindex="0">
			  <span></span><span></span><span></span><span></span><span></span> 
		   </div>
       </div>
	   <div class="successfully-registered-user-container" style="display:none;">
	      <div class="message">Thank you for registering for this event.</div>
	   </div>
	   <div class="already-registered-user-container" style="display:none;">
	      <div class="message">You are already registered for this event.</div>
	   </div>
	   <div class="error-in-registration" style="display:none;">
	      <div class="message">There was an error in completeing your request. Please try again later.</div>
	   </div>
	   <div id="user_registration_form" class="form-container" style="display:none;">
		  <div class="form-title">
			<span> Register Now </span>
		  </div>
		  <div class="form-sub_title">
			<span> Fill out this form to register for the webinar </span>
		  </div>
		  <div class="form-fields">
			<div class="first_name form-field">
				<div class="event-field">
					<input id="first_name" <#if first_name != ''>value="${first_name}"</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="First Name *" />
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="last_name form-field">
				<div class="event-field">
					<input id="last_name" <#if last_name != ''>value="${last_name}"</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="Last Name *" />
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="country form-field">
				<div class="event-field">
					<select id="country" class="lia-form-microsoftmsg-event-country-input">
						<option disabled default >${text.format("microsoft.msg_event_country.placeholder")}</option>
						<#list text.format("microsoft.country_list")?split(",") as code>
							<option value="${code}">${text.format("microsoft.msg_event_country." + code + ".title")}</option>
						</#list>
					</select>
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="linked-in form-field">
				<div class="event-field">
					<input id="linked-in" class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="Linked In *" />
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="email form-field">
				<div class="event-field">
					<input <#if user_email != ''>value="${user_email}"</#if> id="email" class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="Work Email *" />
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="Phone form-field">
				<div class="event-field">
					<input type="number" id="phone" class="lia-form-type-text lia-form-input-horizontal full-width" placeholder="Work Phone *" />
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="company_name form-field">
				<div class="event-field">
					<input id="company_name" class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="Company Name *" />
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="job_title form-field">
			    <div class="event-field">
				    <select class="lia-form-microsoftmsg-event-country-input" id="job_title">
					  <option value="">Job Role *</option>
					  <option value="Accountant">Accountant</option>
					  <option value="Accounts Payable">Accounts Payable</option>
					  <option value="Accounts Receivable">Accounts Receivable</option>
					  <option value="Agent / Representative">Agent / Representative</option>
					  <option value="Analyst">Analyst</option>
					  <option value="Applications Administrator">Applications Administrator</option>
					  <option value="Assistant">Assistant</option>
					  <option value="Banker">Banker</option>
					  <option value="Billing Contact">Billing Contact</option>
					  <option value="Board Member">Board Member</option>
					  <option value="Bookkeeper">Bookkeeper</option>
					  <option value="Business Architect">Business Architect</option>
					  <option value="Business Development Manager">Business Development Manager</option>
					  <option value="Business Intelligence Manager">Business Intelligence Manager</option>
					  <option value="Chief Architect IT">Chief Architect IT</option>
					  <option value="Chief Executive Officer">Chief Executive Officer</option>
					  <option value="Chief Financial Officer">Chief Financial Officer</option>
					  <option value="Chief Information Officer">Chief Information Officer</option>
					  <option value="Chief Knowledge Officer">Chief Knowledge Officer</option>
					  <option value="Chief Marketing Officer">Chief Marketing Officer</option>
					  <option value="Chief Medical Officer">Chief Medical Officer</option>
					  <option value="Chief Operations Officer">Chief Operations Officer</option>
					  <option value="Chief Purchase/Procurmnt Offcr">Chief Purchase/Procurmnt Offcr</option>
					  <option value="Chief Security Officer">Chief Security Officer</option>
					  <option value="Chief Technology Officer">Chief Technology Officer</option>
					  <option value="CIO Business Unit">CIO Business Unit</option>
					  <option value="Contract Specialist">Contract Specialist</option>
					  <option value="Controller">Controller</option>
					  <option value="Creative Director/Manager">Creative Director/Manager</option>
					  <option value="Customer Satisfaction">Customer Satisfaction</option>
					  <option value="Database Administrator">Database Administrator</option>
					  <option value="Desktop Configuration Admin">Desktop Configuration Admin</option>
					  <option value="Desktop/End User Specialist">Desktop/End User Specialist</option>
					  <option value="Developer">Developer</option>
					  <option value="Director">Director</option>
					  <option value="Editor">Editor</option>
					  <option value="Emergency Response Lead">Emergency Response Lead</option>
					  <option value="Enrolled Agent">Enrolled Agent</option>
					  <option value="Environmntl Sustainblty Lead">Environmntl Sustainblty Lead</option>
					  <option value="Executive">Executive</option>
					  <option value="Faculty">Faculty</option>
					  <option value="File/Storage Administrator">File/Storage Administrator</option>
					  <option value="General Manager">General Manager</option>
					  <option value="General/Admiral/Commander">General/Admiral/Commander</option>
					  <option value="Governor">Governor</option>
					  <option value="Graphic Designer">Graphic Designer</option>
					  <option value="Head of IT Development">Head of IT Development</option>
					  <option value="Head of IT Infrastructure">Head of IT Infrastructure</option>
					  <option value="Head of Library/Info Services">Head of Library/Info Services</option>
					  <option value="Head of Teaching and Learning">Head of Teaching and Learning</option>
					  <option value="Helpdesk Support">Helpdesk Support</option>
					  <option value="Infrastructure Architect">Infrastructure Architect</option>
					  <option value="Infrastructure/Network Speclst">Infrastructure/Network Speclst</option>
					  <option value="Interactive Designer">Interactive Designer</option>
					  <option value="IT Director">IT Director</option>
					  <option value="IT Manager">IT Manager</option>
					  <option value="IT Operations Manager">IT Operations Manager</option>
					  <option value="IT Project Mgr-Applications">IT Project Mgr-Applications</option>
					  <option value="IT Project Mgr-Sys or Network">IT Project Mgr-Sys or Network</option>
					  <option value="Journalist">Journalist</option>
					  <option value="Judge">Judge</option>
					  <option value="Knowledge Manager">Knowledge Manager</option>
					  <option value="LOB/DOB Application Specialist">LOB/DOB Application Specialist</option>
					  <option value="Manager">Manager</option>
					  <option value="Marketing Professional">Marketing Professional</option>
					  <option value="Mayor">Mayor</option>
					  <option value="Media Buyer">Media Buyer</option>
					  <option value="Messaging Administrator">Messaging Administrator</option>
					  <option value="Minister/Secretary">Minister/Secretary</option>
					  <option value="Network Administrator">Network Administrator</option>
					  <option value="Office Manager">Office Manager</option>
					  <option value="Office Staff">Office Staff</option>
					  <option value="Owner">Owner</option>
					  <option value="Paperwork Recipient">Paperwork Recipient</option>
					  <option value="Partner/Managing Director">Partner/Managing Director</option>
					  <option value="Police/Fire Chief">Police/Fire Chief</option>
					  <option value="President">President</option>
					  <option value="Principal / Head of School">Principal / Head of School</option>
					  <option value="Procurement Mgr">Procurement Mgr</option>
					  <option value="Producer">Producer</option>
					  <option value="Project Director/Manager">Project Director/Manager</option>
					  <option value="Provost/Vice-Chancellor/Dean">Provost/Vice-Chancellor/Dean</option>
					  <option value="Public Official/Public Worker">Public Official/Public Worker</option>
					  <option value="Purchasing Manager">Purchasing Manager</option>
					  <option value="Referencing/Accessiblty Spclst">Referencing/Accessiblty Spclst</option>
					  <option value="Sales Director">Sales Director</option>
					  <option value="Sales Representative">Sales Representative</option>
					  <option value="Security Administrator">Security Administrator</option>
					  <option value="Security Executive">Security Executive</option>
					  <option value="Security TDM">Security TDM</option>
					  <option value="Server Operating System Admin">Server Operating System Admin</option>
					  <option value="Software Dev Manager/Director">Software Dev Manager/Director</option>
					  <option value="Solutions Architect">Solutions Architect</option>
					  <option value="Specialist/Professional">Specialist/Professional</option>
					  <option value="Sponsor">Sponsor</option>
					  <option value="Strategic Business Consultant">Strategic Business Consultant</option>
					  <option value="Strategy Architect">Strategy Architect</option>
					  <option value="Student">Student</option>
					  <option value="Subcontractor Signatory">Subcontractor Signatory</option>
					  <option value="Superintendent">Superintendent</option>
					  <option value="System Administrator">System Administrator</option>
					  <option value="Systems Engineer">Systems Engineer</option>
					  <option value="Technical Architect">Technical Architect</option>
					  <option value="Technical/Business Consultant">Technical/Business Consultant</option>
					  <option value="Technology Evaluator">Technology Evaluator</option>
					  <option value="Technology Trainer/Teacher">Technology Trainer/Teacher</option>
					  <option value="Tester">Tester</option>
					  <option value="Treasurer/Bursar">Treasurer/Bursar</option>
					  <option value="Vice President">Vice President</option>
					  <option value="VP of HR">VP of HR</option>
					  <option value="VP of Sales">VP of Sales</option>
					  <option value="Web Administrator/Master">Web Administrator/Master</option>
					  <option value="Web Developer/Designer">Web Developer/Designer</option>
					  <option value="Website Designer">Website Designer</option>
					  <option value="Other">Other</option>
					</select>
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="addition_requests form-field">
			    <div class="event-field">
				    <select class="lia-form-microsoftmsg-event-country-input" id="addition_requests">
					  <option value="">Any additional requests we may accommodate?*</option>
					  <option value="None">None</option>
					  <option value="Wheelchair">Wheelchair</option>
					  <option value="Visual Assistance">Visual Assistance</option>
					  <option value="Hearing Assistance">Hearing Assistance</option>
					  <option value="Other">Other (Event staff will contact you prior to the event)</option>
					</select>
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="public_sector form-field">
			    <div class="event-field">
				    <select class="lia-form-microsoftmsg-event-country-input" id="public_sector">
					  <option value="">Are you a Public Sector employee?*</option>
					  <option value="no">No</option>
					  <option value="yes">Yes</option>
					</select>
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="event_learn form-field">
			    <div class="event-field">
				    <select class="lia-form-microsoftmsg-event-country-input" id="event_learn">
					  <option value="">How did you learn about the event?*</option>
					  <option value="Invitation From Microsoft">Invitation From Microsoft</option>
					  <option value="Invitation From Account Executive">Invitation From Account Executive</option>
					  <option value="Community">Community</option>
					  <option value="User Group">User Group</option>
					  <option value="Social Media">Social Media</option>
					  <option value="Other">Other</option>
					</select>
					<span class="asterix">*</span>
				</div>
			</div>
			<div class="know_more form-field">
			    <div class="event-field">
				    <select class="lia-form-microsoftmsg-event-country-input" id="know_more">
					  <option value="">Product I’d like to know more about*</option>
					  <option value="PowerBI">PowerBI</option>
					  <option value="PowerApps">PowerApps</option>
					  <option value="Microsoft Flow">Microsoft Flow</option>
					  <option value="Dynamics 365">Dynamics 365</option>
					  <option value="SQL">SQL</option>
					</select>
					<span class="asterix">*</span>
				</div>
			</div>
		  </div>
		  
		  <div class="form-submit-button">
			<button class="register_button">Register</button>
		  </div>
	   </div>   
	</div>
	<@liaAddScript>
       ;(function ($){
	    var settings_get = {
            "async": true,
            "crossDomain": true,
            "url": "https://postpage.azurewebsites.net/${enviroment}/user_event_registration.php",
            "method": "GET",
            "data":{'action':'select','event_id':'${page.context.message.uniqueId}','user_id':'${user.id}'}
        }; 
	    $.ajax(settings_get).done(function (response,status) {
			var result = jQuery.parseJSON(response);
		    if(result.api_status == 'success'){
				if(result.response == ''){
					$('#user_registration_form').show();
					$('.already-registered-user-container').hide();
				}
				else{
					$('.already-registered-user-container').show();
					$('#user_registration_form').hide();
				}
			}
		});
		function ScrollToElement(elm){
			$('html, body').animate({
        			scrollTop: $(elm).offset().top - 100
   		   }, 500);
		}
		function ValidateEmail(mail)   
		{  
		 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  
		  {  
			return (true);  
		  }  
			return (false);  
		}  
		$(document).on('click','.register_button',function (){
			$('.lia-form-type-text.lia-form-input-horizontal.full-width').removeClass('required');
			$('.lia-form-microsoftmsg-event-country-input').removeClass('required');
			var FirstName = $('#first_name').val();
			var LastName = $('#last_name').val();
			var Email = $('#email').val();
			var Phone = $('#phone').val();
			var Country = $('#country option:selected').val();
			var CompanyName = $('#company_name').val();
			var JobTitle = $('#job_title option:selected').val();
			var LinkedIn = $('#linked-in').val();
			var AdditionalRequest = $('#addition_requests option:selected').val();
			var PublicSector = $('#public_sector option:selected').val();
			var EventLearn = $('#event_learn option:selected').val();
			var KnowMore = $('#know_more option:selected').val();
			var LinkedIn = $('#linked-in').val();
			var execute_post_functionality = true;
			/* Validations Fields Order Wise Start */
				if(FirstName == ''){
					$('#first_name').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#first_name');
					console.log('#first_name');
				}else if(LastName == ''){
					$('#last_name').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#last_name');
					console.log('#last_name');
				}else if(Country == ''){
					$('#country').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#country');
					console.log('#country');
				}else if(LinkedIn == ''){
					$('#linked-in').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#linked-in');
					console.log('#linked-in');
				}else if(Email == '' || !ValidateEmail(Email)){
					$('#email').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#email');
					console.log('#email');
				}else if(Phone == ''){
					$('#phone').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#phone');
					console.log('#phone');
				}else if(CompanyName == ''){
					$('#company_name').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#company_name');
					console.log('#company_name');
				}
				else if(JobTitle == ''){
					$('#job_title').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#job_title');
					console.log('#job_title');
				}else if(AdditionalRequest == ''){
					$('#addition_requests').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#addition_requests');
					console.log('#addition_requests');
				}else if(PublicSector == ''){
					$('#public_sector').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#public_sector');
					console.log('#public_sector');
				}else if(EventLearn == ''){
					$('#event_learn').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#event_learn');
					console.log('#event_learn');
				}else if(KnowMore == ''){
					$('#know_more').addClass('required');
					execute_post_functionality = false;
					ScrollToElement('#know_more');
					console.log('#know_more');
				}
			/* Validations Fields Order Wise End */
		  if(execute_post_functionality){
			$('#user_registration_form').css('opacity','0.3');
			$('.ajax_loader').show();
			$('.register_button').addClass('disabled-btn');
			$.ajax({
				"async": true,
				"crossDomain": true,
				"url": "https://postpage.azurewebsites.net/${enviroment}/user_event_registration.php",
				"method": "POST",
				"data":{'action':'insert','event_id':'${page.context.message.uniqueId}', 'user_id':'${user.id}', 'user_login':'${user.login}', 'FirstName':FirstName, 'LastName':LastName, 'Email':Email, 'Phone':Phone, 'Country':Country, 'CompanyName':CompanyName,'LinkedIn':LinkedIn, 'JobTitle':JobTitle, 'AdditionalRequest':AdditionalRequest,'PublicSector':PublicSector,'EventLearn':EventLearn,'KnowMore':KnowMore}
			}).done(function (response,status) {
				$('#user_registration_form').css('opacity','1');
			    $('.ajax_loader').hide();
				$('#user_registration_form').hide();
				$('.register_button').removeClass('disabled-btn');
				var result = jQuery.parseJSON(response);
				if(result.api_status == 'success'){
					$('.successfully-registered-user-container').show();
				}
				else{
					$('.error-in-registration').show();
				}
			});
		  }
		});
	   }(LITHIUM.jQuery));
    </@liaAddScript>
</#if>