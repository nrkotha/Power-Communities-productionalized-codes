<html>
<head>
<style>
#lia-body .gdpr-links.privacy-flow:hover{
color: #0066FF !important;
}
#lia-body.lia-body .gdpr-wrapper h3 {
    margin: 20px 0;
    font-size: 17px;
}
#lia-body.lia-body .gdpr-headings h3 a{
       font-family: 'SegoeUI-Bold', 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif !important;
    font-size: 17px !important;
}
#lia-body.lia-body .gdpr-wrapper a{
font-size: 15px !important;
    font-family: 'SegoeUI', 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif !important;
}

/* WRAPPER */
#lia-body.lia-body .gdpr-wrapper {
	margin: 50px auto; 
	font-family: 'SegoeUI', 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif !important;
}

/* LIST */
#lia-body.lia-body .gdpr-wrapper .list ol { 
    list-style-type: decimal; 
	padding-left: 40px;
}
#lia-body.lia-body .gdpr-wrapper .list ol p { 
	line-height: 20px
}
#lia-body.lia-body .gdpr-wrapper .desc {
	line-height: 20px
}
#lia-body.lia-body .gdpr-wrapper .list img { 
	background-size: 100% 100%; 
	margin-bottom: 20px;
	border: 1px solid #e0e0e0;
	padding: 10px;
}
#lia-body.lia-body .gdpr-steps {
    margin: 30px 0;
}

#lia-body.lia-body .gdpr-wrapper .gdpr-desc {
	line-height: 20px
}
#lia-body.lia-body .list li {
    margin-left: 18px;
}
#lia-body.lia-body .gdpr-wrapper .gdpr-heading {
    font-weight: normal;
}
#lia-body.lia-body .gdpr-headings h3 {
	margin-bottom: 30px;
}
#lia-body.lia-body .list .num-list {
    line-height: 30px;
	font-size: 15px;
}
#lia-body.lia-body .gdpr-headings {
    margin-top: 50px;
}
#lia-body.lia-body .gdpr-wrapper .list .lower-romans {
    list-style-type: lower-roman;
}

#lia-body.lia-body .gdpr-wrapper .left-desc {
    margin-left: 45px;
	margin-top: 0;
}
#lia-body.lia-body .sub-headings {
    font-size: 15px;
}
#lia-body.lia-body .heading-links {
    text-decoration: none;
	pointer-events: none;
	color: #666;
}
#lia-body.lia-body .lower-romans img {
    margin-top: 10px;
}
#lia-body.lia-body .compressed-img{
    width: 71%;
}
#lia-body.lia-body .privacy-powerapps {
	color: #742774;
}
#lia-body.lia-body .privacy-flow {
	color: #0072C6;
}
</style>
</head>
<body>
<div class="gdpr-headings">
	<h3>Index:</h3>
	<h3><a class="gdpr-links privacy-powerapps" href="#privacy_powerapps">PowerApps Community and Privacy</a></h3>
	<h3><a class="gdpr-links privacy-flow" href="#privacy_flow">Flow Community and Privacy</a></h3>
</div>
<hr/>
<div class="gdpr-wrapper">
	<h3><a name="privacy_powerapps" class="heading-links privacy-powerapps">PowerApps Community and Privacy</a></h3>
	<p class="powerApps-desc">When data is collected, we want to make sure it’s the right choice for you. To help you as an end user and a participant of this community to exercise your Data Subject Request (DSRs) rights under General Data Protection Regulation we provide the following functionalities. The below sections explain step by step process on how you can view, edit and delete your personal information (customer data). To learn more about the data collected by Microsoft and it’s use please view the Microsoft <a class="privacy-powerapps" target="_blank" href="https://privacy.microsoft.com/en-us/PrivacyStatement">Privacy Statement.</a></p>
	
	<div class="list gdpr-steps">
		<h3 class="sub-headings">View and Export personal data</h3>
		<p class="desc gdpr-desc"> To view all your data collected by PowerApps Community:  </p>
		<div class="list">
			<ol role="list">
				<li><p>Navigate to PowerApps Community (<a class="gdpr-links privacy-powerapps"  href="https://powerusers.microsoft.com/t5/PowerApps-Community/ct-p/PowerApps1">https://powerusers.microsoft.com/t5/PowerApps-Community/ct-p/PowerApps1</a>).</p></li>
				
				<li><p>Sign in by clicking “Sign In” link.</p></li>
				
				<li><p>Once logged in, click on User Name and select “Profile” link.  </p></li>
				<img src="${asset.get("/html/assets/GDPR_Profile.png")}" alt="GDPR Profile Page"/>
				
				<li><p>You can view all information related to your activity with the PowerApps Community.</p></li>
				<img class="compressed-img" src="${asset.get("/html/assets/GDPR_ViewProfilePage.png")}" alt="GDPR View Profile Page"/>
				
				<li><p>You can navigate and edit items or save the pages through browser as needed.</p></li>
				
				<li><p>User can also export their personal data in json format using below steps:</p>
				    <ol class="lower-romans" role="list">
					  <li>Navigate to "My Settings".</li>
					  <img src="${asset.get("/html/assets/GDPR_MySettingsOption.png")}" alt="GDPR MySettings"/>
					  
					  <li>Select “Personal information” from the left menu. </li>
					  <img class="compressed-img" src="${asset.get("/html/assets/GDPR_PersonalInfo.png")}" alt="GDPR Personal Information"/>
					  
					  <li>Scroll to bottom of the page and click on Downloads links as indicated below:</li>
					  <img src="${asset.get("/html/assets/GDPR_DownloadInfo.png")}" alt="GDPR Download Information"/>
					</ol>
				
				</li>
				
			</ol>
		</div>
	</div>
	
	<div class="list gdpr-steps">
		<h3 class="sub-headings">
In addition to personal data collected here, we also capture end user’s interaction with the service, which includes the following:
		</h3>
		<div class="list">
			<ol class="num-list" role="list">
				<li>Visits</li>
				
				<li>Visits per Geo</li>
				
				<li>Registration Date</li>
				
				<li>Most recent sign in</li>
				
				<li>Total sign ins</li>
				
				<li>Total minutes online</li>
				
				<li>Last visit IP address</li>
				
				<li>Last logged in IP address</li>
				
				<li>Roles</li>
				
				<li>Search Terms</li>
				
				<li>Device Type</li>
				
				<li>OS/Browser config data</li>
				
				<li>Page views</li>
				
				<li>Bulk Data Location</li>
				
				<li>Rank</li>
				
				<li>Badges earned</li>
				
			</ol>
		</div>
		<p style="margin-top:20px">Personal data described above is controlled by the organization that owns your domain. You need to contact your organizational administrator to manage these personal data. Admins can put in export request through Microsoft provided Admin portal and a link will be available to them to download your data in less than 30 days.</p>
	</div>
	
	
	<div class="list gdpr-steps">
		<h3 class="gdpr-desc sub-headings">Delete personal data</h3>
		<p>Personal data can be edited as mentioned above, but cannot be deleted unless you request for account closure for your Azure Active Directory account.</p>
	</div>
	
	<div class="list gdpr-steps">
		<h3 class="gdpr-desc sub-headings">Account Closure</h3>
		<p>Upon closure of Azure Active Directory account, done by your organizational administrator, your account with PowerApps Community is also closed and all personally identifiable data is deleted permanently.</p>
	</div>
		
	<p><b>Note: </b>If you have questions or concerns around your personal data, you can always contact Microsoft by using our <a target="_blank" class="gdpr-links privacy-powerapps" href="https://privacy.microsoft.com/en-ca/privacy-questions?ln=EN-US">web form</a>. We will respond to requests within 30 days.</p>
</div>




<div class="gdpr-wrapper">
	<h3><a name="privacy_flow" class="privacy-flow">Flow Community and Privacy</a></h3>
	<p class="desc">When data is collected, we want to make sure it’s the right choice for you. To help you as an end user and a participant of this community to exercise your Data Subject Request (DSRs) rights under General Data Protection Regulation we provide the following functionalities. The below sections explain step by step process on how you can view, edit and delete your personal information (customer data). To learn more about the data collected by Microsoft and it’s use please view the Microsoft <a class="privacy-flow gdpr-links"  target="_blank" href="https://privacy.microsoft.com/en-us/PrivacyStatement">Privacy Statement.</a></p>
	
	<div class="list gdpr-steps">
		<h3 class="sub-headings">View and Export personal data</h3>
		<p class="desc gdpr-desc"> To view all your data collected by Flow Community:   </p>
		<div class="list">
			<ol role="list">
				<li><p>Navigate to Flow Community (<a class="gdpr-links privacy-flow" href="https://powerusers.microsoft.com/t5/Microsoft-Flow-Community/ct-p/FlowCommunity">https://powerusers.microsoft.com/t5/Microsoft-Flow-Community/ct-p/FlowCommunity</a>).</p></li>
				
				<li><p>Sign in by clicking “Sign In” link.</p></li>
				
				<li><p>Once logged in, click on User Name and select “Profile” link.  </p></li>
				<img src="${asset.get("/html/assets/GDPR_FlowProfile.png")}" alt="GDPR Flow Mysettings Option"/>
				
				<li><p>You can view all information related to your activity with the Flow Community.</p></li>
				<img class="compressed-img" src="${asset.get("/html/assets/GDPR_ViewProfilePage.png")}" alt="GDPR View Profile Page"/>
				
				<li><p>You can navigate and edit items or save the pages through browser as needed.</p></li>
				
				<li><p>User can also export their personal data in json format using below steps:</p>
				    <ol class="lower-romans" role="list">
					  <li>Navigate to "My Settings".</li>
					  <img src="${asset.get("/html/assets/GDPR_FlowMySettingsOption.png")}" alt="GDPR Navigate Mysettings"/>
					  
					  <li>Select “Personal information” from the left menu. </li>
					  <img class="compressed-img" src="${asset.get("/html/assets/GDPR_PersonalInfo.png")}" alt="Personal Information"/>
					  
					  <li>Scroll to bottom of the page and click on Downloads links as indicated below:</li>
					  <img src="${asset.get("/html/assets/GDPR_DownloadInfo.png")}" alt="Download Information"/>
					</ol>
				
				</li>
				
			</ol>
		</div>
	</div>
	
	<div class="list gdpr-steps">
		<h3 class="sub-headings">
In addition to personal data collected here, we also capture end user’s interaction with the service, which includes the following:
		</h3>
		<div class="list">
			<ol class="num-list" role="list">
				<li>Visits</li>
				
				<li>Visits per Geo</li>
				
				<li>Registration Date</li>
				
				<li>Most recent sign in</li>
				
				<li>Total sign ins</li>
				
				<li>Total minutes online</li>
				
				<li>Last visit IP address</li>
				
				<li>Last logged in IP address</li>
				
				<li>Roles</li>
				
				<li>Search Terms</li>
				
				<li>Device Type</li>
				
				<li>OS/Browser config data</li>
				
				<li>Page views</li>
				
				<li>Bulk Data Location</li>
				
				<li>Rank</li>
				
				<li>Badges earned</li>
				
			</ol>
		</div>
		<p style="margin-top:20px">In order to retrieve these information, users are encouraged to do the following based on their account type:</p>
	</div>
	
	
	<div class="list gdpr-steps">
		<h3 class="gdpr-desc sub-headings">Azure Active Directory Users</h3>
		<p>Personal data described above is controlled by the organization that owns your domain. You need to contact your organizational administrator to manage these personal data. Admins can put in export request through Microsoft provided Admin portal and a link will be available to them to download your data in less than 30 days.</p>
	</div>
	
	<div class="list gdpr-steps">
		<h3 class="gdpr-desc sub-headings">Microsoft Account</h3>
		<p>Navigate to Microsoft Privacy Portal <a class="privacy-flow gdpr-links" target="_blank" href="https://account.microsoft.com/privacy/">https://account.microsoft.com/privacy/.</a></p>
	</div>
	
	<div class="list gdpr-steps">
		<h3 class="sub-headings">Edit and Delete personal data: </h3>
		<p class="desc gdpr-desc"> To edit your data collected by Flow Community: </p>
		<div class="list">
			<ol role="list">
				<li><p>Navigate to Flow Community (<a class="privacy-flow gdpr-links" href="https://powerusers.microsoft.com/t5/Microsoft-Flow-Community/ct-p/FlowCommunity">https://powerusers.microsoft.com/t5/Microsoft-Flow-Community/ct-p/FlowCommunity</a>).</p></li>
				
				<li><p>Sign in by clicking “Sign In” link.</p></li>
				
				<li><p>Once logged in, click on User Name and select “My Settings” link.  </p></li>
				<img src="${asset.get("/html/assets/GDPR_FlowMySettingsOption.png")}" alt="Profile"/>
				
				<li><p>You can edit/remove information related to your activity with the Flow Community. </p></li>
				<img class="compressed-img" src="${asset.get("/html/assets/GDPR_EditProfile.png")}" alt="Edit Profile"/>
				
				<li><p>You can navigate and edit items or save the pages as needed.</p></li>
			</ol>
		</div>
	</div>
	
	<div class="list gdpr-steps left-desc">
		<h3 class="gdpr-desc">* Please note: </h3>
		<p>Delete request received from Microsoft Privacy Portal will be considered as discontinuation of your service with Flow Community. Your account with Flow Community is closed and all personally identifiable data is deleted permanently.</p>
	</div>
	
	<h3 class="sub-headings">Account Closure</h3>
	<div class="list gdpr-steps left-desc">
		<h3 class="gdpr-desc sub-headings">Azure Active Directory Users</h3>
		<p>Upon closure of AAD account, done by your Tenant administrator, your account with Flow Community is also closed and all PII data is deleted permanently.</p>
	</div>
	
	<div class="list gdpr-steps left-desc">
		<h3 class="gdpr-desc sub-headings">Microsoft Account</h3>
		<p>Upon closure of MSA account, which can be done from Microsoft Privacy Portal, your account with Flow Community is also closed and all PII data is deleted permanently. </p>
	</div>
	<p><b>Note: </b>If you have questions or concerns around your personal data, you can always contact Microsoft by using our <a class="privacy-flow gdpr-links" target="_blank" href="https://privacy.microsoft.com/en-ca/privacy-questions?ln=EN-US"> web form</a>. We will respond to requests within 30 days.</p>

</div>
</body>
</html>