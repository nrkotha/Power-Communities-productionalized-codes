
<#assign userInfoCookie = http.request.cookies.name.get("LithiumUserInfo")?html />
${userInfoCookie}
------
<#assign userInfoCookie1 = http.request.cookies.name.get("LiSESSIONIDasdsadsd")?html />
${userInfoCookie1}