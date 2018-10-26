<#assign liql = "SELECT * FROM messages WHERE board.id = 'DataStories'" />

<#assign resp = restadmin("2.0", "/search?q=" + liql?url) />

${apiv2.toJson(resp)}