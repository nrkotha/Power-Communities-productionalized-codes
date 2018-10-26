<p>
<#if user.registered && !user.anonymous>
<#assign x = rest("2.0b","/search?q=" + "SELECT first_name FROM users where id = '${user.id}'"?url) />
  <#if x.data.items[0].first_name??>
    <h1><span style="font-size: 22px;line-height: 32px;font-family:'Segoe UI','Segoe WP',Tahoma,Arial,sans-serif;font-weight: 100;-webkit-margin-before: 0.83em;-webkit-margin-after: 0.83em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;display:block;">Welcome, ${x.data.items[0].first_name}. Congratulations on joining the Power BI community!</span></h1>
  <#else>
    <h1><span style="font-size: 22px;line-height: 32px;font-family:'Segoe UI','Segoe WP',Tahoma,Arial,sans-serif;font-weight: 100;-webkit-margin-before: 0.83em;-webkit-margin-after: 0.83em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;display:block;">Welcome! Congratulations on joining the Power BI community!</span></h1>
  </#if>
<#else>
	<h1><span style="font-size: 22px;line-height: 32px;font-family:'Segoe UI','Segoe WP',Tahoma,Arial,sans-serif;font-weight: 100;-webkit-margin-before: 0.83em;-webkit-margin-after: 0.83em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;display:block;">Welcome! Congratulations on joining the Power BI community!</span></h1>
</#if>
</p>



<p>You're now a part of a vibrant group of peers and industry experts who are here to network, share knowledge, and even have a little fun.</p>
<p>Now that you're a member, you can enjoy the following resources:</p>
<p><a href="https://aka.ms/pbi/community/forums">The Power BI Community Forum</a><br /> If you're looking for support with any part of Power BI, our forums are the place to go. There are thousands of business intelligence and data professionals with years of experience who are ready and eager to answer your question. Ask away!</p>
<p><a href="https://aka.ms/pbi/community/ideas">Power BI Ideas</a><br /> Do you have an idea to improve Power BI, or a feature request for future updates? The Ideas section is where you can contribute your suggestions and vote for ideas posted by other members. We constantly look to the most voted Ideas when planning updates, so your suggestions and votes will always make a difference.</p>
<p><a href="https://aka.ms/pbi/community/welcomeparticipation">Participation Center</a><br /> Ready to have some fun? The Power BI Community Welcome &amp; Participation Center is your stop to meet the Power BI community team, leave feedback about our forums, and participate in the latest events, games, contests, and Block Parties. You could win a custom profile badge, a sweet Power BI Prize Pack, or sometimes even a grand prize of up to $5000!&nbsp;</p>
<p><a href="https://aka.ms/pbi/community/blog">Community Blog</a><br /> Our community members have learned some excellent tips and have keen insights on the future of business analysis. Head on over to the Community Blog to read their latest posts from around the world. Let us know if you'd like to become an author and contribute your own writing &mdash; everyone is welcome.</p>
<p>And that&rsquo;s not all, we have <a href="https://aka.ms/pbi/community/webinars">Webinars</a>, <a href="https://aka.ms/pbiamapost">live events</a> and <a href="https://aka.ms/dsg">Power BI Showcases</a> and more, to motivate, educate and inspire you.&nbsp; &nbsp;</p>
<p>Again, welcome to the Power BI community family, we are so happy you have joined us!&nbsp; Whether you are brand new to the world of data and BI or you are a seasoned veteran - our goal is to shape the community to be your &lsquo;go to&rsquo; for support, networking, education, inspiration and encouragement as we enjoy this adventure <strong>together</strong>! &nbsp;Let us know in the Participation Center if you have any questions or comments about your community experience, but for now &ndash; head on over to the <a href="https://aka.ms/pbi/community/gettingstarted">Getting Started with the Power BI Community</a> post in the Community Welcome and Participation Center and dive right in!</p>
<p>We look forward to seeing you around the community!</p>
<p><a href="https://aka.ms/pbi/community/meettheteam">The Power BI Community Team</a></p>
<table style="width: 580px;" cellpadding="5">
<tbody>
<tr style="border-bottom:0;">
<td style="width: 200px; text-align:left;padding:18px 0px 0px 0px;"><img src="${asset.get('/html/assets/HS_Sandy_160x160.png')}" height="160" width="160" border="0"></td>
<td style="width: 200px; text-align:left;padding:18px 0px 0px 0px;"><img src="${asset.get('/html/assets/HS_Siva_160x160.png')}" height="160" width="160" border="0"></td>
<td style="width: 180px; text-align:left;padding:18px 0px 0px 0px;"><img src="${asset.get('/html/assets/HS_Miguel_160x160.png')}" height="160" width="160" border="0"></td>
</tr>
<tr>
<td style="width: 200px;padding:10px 20px 0px 0px;">
<p><span style="color: #be9a27;"><strong><a href="https://aka.ms/pbi/community/meettheteam">Sandy Rivas</a></strong></span></p>
<p><h5>Role:</h5> Community Manager</p>
</td>
<td style="width: 200px;padding:10px 20px 0px 0px;">
<p><span style="color: #be9a27;"><strong><a href="https://aka.ms/pbi/community/meettheteam">Siva Harinath</a></strong></span></p>
<p><h5>Role:</h5> Principal Program Manager</p>
</td>
<td style="width: 180px;padding:10px 0px 0px 0px;">
<p><span style="color: #be9a27;"><strong><a href="https://aka.ms/pbi/community/meettheteam">Miguel Martinez</a></strong></span></p>
<p><h5>Role:</h5> Sr. Product Marketing Manager</p>
</td>
</tr>
<tr style="border-bottom:0;">
<td style="width: 200px; text-align:left;padding:18px 0px 0px 0px;"><img src="${asset.get('/html/assets/HS_Charles_160x160.png')}" height="160" width="160" border="0"></td>
<!--Start: This code is commented by iTalent as part of iTrack MC-461-->
<!--<td style="width: 200px; text-align:left;padding:18px 0px 0px 0px;"><img src="${asset.get('/html/assets/HS_Mackenzie_160x160.png')}" height="160" width="160" border="0"></td>
<td style="width: 180px; text-align:left;padding:18px 0px 0px 0px;"><img src="${asset.get('/html/assets/HS_Jessica_160x160.png')}" height="160" width="160" border="0"></td>-->
<!--End: End of commenting the code for MC-461 -->
</tr>
<tr style="border-bottom: 1px solid #a6a6a6;">
<td style="width: 200px;padding:10px 20px 0px 0px;">
<p><span style="color: #be9a27;"><strong><a href="https://aka.ms/pbi/community/meettheteam">Charles Sterling</a></strong></span></p>
<p><h5>Role:</h5> Senior Program Manager</p>
</td>
<!--Start: This code is commented by iTalent as part of iTrack MC-461-->
<!--<td style="width: 200px;padding:10px 20px 0px 0px;">
<p><span style="color: #be9a27;"><strong><a href="https://aka.ms/pbi/community/meettheteam">Mackenzie Lyng</a></strong></span></p>
<p><h5>Role:</h5> Community Administrator</p>
</td>
<td style="width: 180px;padding:10px 0px 0px 0px;">
<p><span style="color: #be9a27;"><strong><a href="https://aka.ms/pbi/community/meettheteam">Jessica Cook</a></strong></span></p>
<p><h5>Role:</h5> Community Content Manager</p>
</td>-->
<!--End: End of commenting the code for MC-461 -->
</tr>
</tbody>
</table>
<br>
<br>
<br>
<br>