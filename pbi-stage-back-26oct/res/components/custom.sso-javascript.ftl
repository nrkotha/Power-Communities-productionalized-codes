<style>
  .InfoMessage div {
     display: none;
  }
  #lia-body.UserSsoRegistrationPage  .lia-content .lia-form .lia-form-label-wrapper {
      text-align: left;
  }
</style>
<@liaAddScript>
(function($) {
	$(document).ready(function() {
		if($('#describedBy_lia-login_1').text() === 'The account has been linked already.'){
  $('.InfoMessage div').html('This community account is already associated with a different organization account. <a href="mailto:PBICommunityAdmin@microsoft.com">Contact us for further assistance</a>');
$('#describedBy_lia-login_1').hide();
}

$('.InfoMessage div').show();
		
	});
})(LITHIUM.jQuery);
</@liaAddScript>
 