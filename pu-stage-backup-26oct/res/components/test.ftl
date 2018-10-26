		               
<#assign userDetails = rest("2.0","/search?q=" + "SELECT first_name,last_name,email FROM users WHERE id = '${user.id?c}'"?url).data.items[0] />

						firstName: ${userDetails.first_name}, 
		                lastName: ${userDetails.last_name}, 
		                memberName: ${userDetails.email}