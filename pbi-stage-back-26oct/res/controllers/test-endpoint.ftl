     <#assign data = "grant_type=client_credentials%20%20&client_id=ce371927-e793-4cc8-af6d-083ecf2b912c&client_secret=vmOTW4Ot7taJbjesK24oL1Bauvmk0G5e/zeNHgaG6Kw=&resource=https%3A%2F%2Fgeteventsservice.one.microsoft.com%2Fgeteventservice" />

    
    <#assign http_client_request = http.client.request("https","login.microsoftonline.com","/microsoft.onmicrosoft.com/oauth2/token").body(data,"application/x-www-form-urlencoded").post() />
    <#if http_client_request.hasError>
      ${http_client_request.error.message}
    <#else>
        ${http_client_request}
		</#if> 