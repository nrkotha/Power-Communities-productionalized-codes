<html>
<head>
<style>

#lia-body.lia-body #gdpr-wrapper h3 {
    margin: 20px 0;
    color: #333;
    font-size: 22px;
	font-weight: 600;
}

/* WRAPPER */
#lia-body.lia-body #gdpr-wrapper {
	margin: 50px auto; 
	font-family: 'Segoe UI','Segoe WP',Tahoma,Arial,sans-serif;
}

/* LIST */
#lia-body.lia-body #gdpr-wrapper .list ol { 
    font-size: 16px;
    color: #333;
    list-style-type: decimal; 
	padding-left: 40px;
}
#lia-body.lia-body #gdpr-wrapper .list ol p { 
    padding: 8px;
    font-size: 16px;
    color: #333;
	line-height: 20px
}
#lia-body.lia-body #gdpr-wrapper .desc {
	font-size: 16px;
    color: #333;
	line-height: 20px
}
#lia-body.lia-body #gdpr-wrapper .list img { 
	width: 100%; 
	margin-bottom: 20px;
}
#lia-body.lia-body .gdpr-steps {
    margin:50px 0;
}
#lia-body.lia-body .gdpr-steps .list a,
#lia-body.lia-body #gdpr-wrapper .desc  a {
    color: #be9a27;
}
#lia-body.lia-body #gdpr-wrapper .gdpr-desc {
    font-size: 20px;
	line-height: 20px
}
#lia-body.lia-body .list li {
    margin-left: 18px;
}
#lia-body.lia-body #gdpr-wrapper .gdpr-heading {
    font-weight: normal;
	font-size: 20px;
}
</style>
</head>
<body>
<div id="gdpr-wrapper">
	<h3>Power BI Community and Privacy</h3>
	<!-- Start MC-408: Commenting following line and updating the text as per the ticket -->
  <!-- <p class="desc">Whenever we collect data, we want to make sure it’s the right choice for you. That’s why we provide choices, like the controls described on this page. For all the details about the data, we recommend reviewing this section of our <a target="_blank" href="https://privacy.microsoft.com/en-us/PrivacyStatement">Privacy Statement.</a></p> -->
	<p class="desc">Whenever we collect personal data, we want to make sure it’s the right choice for you. That’s why we provide choices, like the controls described on this page. For all the details about personal data collected in this site, we recommend reviewing our  <a target="_blank" href="https://privacy.microsoft.com/en-us/PrivacyStatement">Privacy Statement.</a></p>
  <!-- End MC-408 -->
  <div class="list gdpr-steps">
		<h3>How you can control data for Power BI Community</h3>
	  <!-- Start MC-408: Commenting following line and Updating the text as part of the ticket -->
 	  <!-- <p class="desc gdpr-desc">To turn off Power BI Community completely, which will stop all data collection by Power BI Community and clear data (PII) already collected: </p>  -->
<p>Management of your personal data in this website is limited to access, export and delete; selective deletion of personal data is not offered unless it is applied to correct profile information. Personal data collected in this website is not used for promotional communications or advertising.</p>
		<p class="desc gdpr-desc">To turn off Power BI Community completely, which will stop all data collection by Power BI Community and delete all personal data already collected:</p>
    <!-- End MC-408 -->
    <div class="list">
			<ol>
				<li><p>Navigate to Power BI Community (<a href="https://community.powerbi.com/">https://community.powerbi.com/</a>)</p></li>
				
				<li><p>Sign in by clicking “Sign In” link.</p></li>
				<img src="${asset.get('/html/assets/GDPR_SignIn.png')}" alt="Sign-In"/>
				
				<li><p>Once logged in, click on User Name and select “My Settings” link.</p></li>
				<img src="${asset.get('/html/assets/GDPR_MySettings.png')}" alt="My Settings"/>
				
				<li><p>Select ‘Close Account’.</p></li>
				<img src="${asset.get('/html/assets/GDPR_CloseAccount.png')}" alt="Close Account"/>
				
				<li><p>Click the ‘Close Account’ button. Your account with Power BI Community is closed and all personal data is deleted permanently.</p></li>
				
			</ol>
		</div>
	</div>
	
	<div class="list gdpr-steps">
		<p class="gdpr-desc">To view all data collected by Power BI Community: </p>
		<div class="list">
			<ol>
				<li><p>Navigate to Power BI Community (<a href="https://community.powerbi.com/">https://community.powerbi.com/</a> )</p></li>
				
				<li><p>Sign in by clicking “Sign In” link.</p></li>
				<img src="${asset.get('/html/assets/GDPR_SignIn.png')}" alt="Sign-In"/>
				
				<li><p>Once logged in, click on User Name and select “Profile” link.</p></li>
				<img src="${asset.get('/html/assets/GDPR_Profile.png')}" alt="Profile"/>
				
        <!-- Start MC-408: Commenting the following line and added the new text as part of the ticket -->
				<!-- <li><p>You can view all information related to your activity with the Power BI Community. You can navigate and save the pages as needed.</p></li> -->
        <li><p>You can view all information related to your activity with the Power BI Community. You can navigate and save the pages using “Save As” feature of the browser. By default this page will be saved as html on your local computer.</p></li>
        <!-- End MC-408 -->
				<img src="${asset.get('/html/assets/GDPR_DominoViewProfilePage.png')}" alt="Domino View Profile"/>
			  <!-- Start MC-408: Adding following note -->
        <p><b>Note: </b>If you cannot access certain personal data collected by Microsoft via the information provided in this document, you can always contact Microsoft by using our <a href="https://go.microsoft.com/fwlink/?LinkId=321116" target="_blank">web form</a>. We will respond to requests to access or delete your personal data within 30 days.</p>
        <!-- End MC-408 -->
      </ol>
		</div>
	</div>
</div>
</body>
</html>