<#--

    Endpoint for Idea Page Enhancements. 
    iTrack :MC – 7. 

 -->
<#--
 
    Description: 
        This endpoint is created to collect message Ids from the messages in Idea EmainThreadchange Page and make API calls to them, process required data and send it to the component. 

    Activities:
        1. Get ThreadIds from the component.
        2. Making API call to each thread.            
        3. Gathering the required information from the API response.
        4. Sending JSON response to the component. 
-->

<#attempt>
  <#compress>
    <response>
		<#-- 1. Get ThreadIds from the component -->
		<#assign articleIds= http.request.parameters.name.get("ArticleId", "") />  
		<#if articleIds =="">
		<status>error</status>
		<#else>
		<status>success</status>
		<#list articleIds?split(",") as mainThread>
			<#-- 2. Making API call to each thread. -->
			<#assign messageCall = restadmin("/threads/id/${mainThread}?page_size=1000").thread/>
			<#assign linearObj = messageCall.messages.linear.message/>
			
			<#assign gtTime= ""/>
			<#assign author= ""/>
			<#-- 3. Gathering the required information from the API response. -->
			<#list linearObj as item>
				<#if "${item.subject}"?contains("Status changed to")>
					<#if gtTime == "">
						<#assign gtTime = item.post_time/>
						<#assign author = item.author/>
					<#else>
						<#if item.post_time?datetime('iso') gt gtTime?datetime('iso')>
							<#assign gtTime = item.post_time/>
							<#assign author = item.author/>
						</#if>
					</#if>
					<#assign PostTime="${item.post_time}"/>
				</#if>
			</#list>
			<#if author?has_content>
				<#assign query="SELECT * FROM users WHERE login = '${author.login}'"/>
				<#assign authorCall=restadmin("2.0", "/search?q=" + query?url("UTF-8")) />    
				<#assign author = authorCall.data.items[0]/>
				<thread id="${mainThread}">
				  <authorName>${author.login}</authorName>
				  <authorProfile>${author.view_href}</authorProfile>
				  <authorAvatar>${author.avatar.message}</authorAvatar>
				  <authorRank>${author.rank.name}</authorRank>
				</thread>  
			</#if>
		</#list>
		</#if>
    </response>
  </#compress>
<#recover>
	<errorURI>${http.request.url}</errorURI>
</#attempt>
