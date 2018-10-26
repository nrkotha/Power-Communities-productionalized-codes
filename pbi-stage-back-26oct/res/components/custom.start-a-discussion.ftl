<div class="post-topic-wrapper">
	<span class="post-topic-text">${text.format("custom.dont-see-topic")}</span>
	<span class="lia-button-wrapper lia-button-wrapper-primary">
		<span class="primary-action message-post">
			<a class="lia-button lia-button-primary" id="post-question-link" href="javascript:void(0)">
				<span>${text.format("custom.post-your-question")}</span>
			</a>
		</span>
	</span>
</div> 
 <@liaAddScript>
(function($) {
	$(document).ready(function() {
		$('#post-question-link').click(function(){
			window.location.href='/t5/forums/postpage/choose-node/true?message-subject='+$('.lia-component-search-encapsulation .lia-search-input-message').val();
		});
		
	});
})(LITHIUM.jQuery);
</@liaAddScript>
 