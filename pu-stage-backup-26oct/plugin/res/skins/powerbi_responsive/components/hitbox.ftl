<script>
	/* $(function () {
        var today = new Date();
        $('.announcement-carousel .announcement').filter(function(i) { return today < new Date($(this).attr('start-date')) }).remove();
        $('.announcement-carousel .announcement').filter(function(i) { return today > new Date($(this).attr('end-date')) }).remove();
        
		if($('.announcement-carousel .announcement').length > 1) {
			$(".announcement-carousel").owlCarousel({
				autoplay: 5000,
				items: 1,
				stagePadding: 0,
				loop: true,
				nav: true,
				navText: [
					'<span class="icon"><img src="${asset.get("/html/assets/left.svg")}" /></span>',
					'<span class="icon"><img src="${asset.get("/html/assets/right.svg")}" /></span>'
				]
			});
		} 
	});*/
</script>
<script type="text/javascript">
        var varAutoFirePV=1;
        var varClickTracking=1;
        var varCustomerTracking=1;
        var Route = "32152";
        var Ctrl = "SD100";
        document.write("<script type='text/javascript' src='" + (window.location.protocol) +
        "//c.microsoft.com/ms.js'" + "'><\/script>");

</script>



<script>
  // alter search select dropdown functionality:

 /* (function searchSelect() {

    // get select element:
    var select = $('#searchGranularity');

    // create dropdownList:
    var dropdownList = document.createElement('ul');
    $(dropdownList).attr('class', 'dropdownList');

    // create options, append to dropdownList
    var optionArray = select.children();
    for (var i = 0; i<optionArray.length; i++) {
      var option = document.createElement('li');
      $(option).text($(optionArray[i]).attr('title'))
      .attr('value', $(optionArray[i]).attr('title'))
      .attr('class', 'option');
      $(option).appendTo(dropdownList);
    }

    var dropdownButton = document.createElement('div');
    $(dropdownButton).attr('class', 'dropdownButton').text('Community');


    // insert button and list to the DOM:
    $(dropdownButton).insertAfter(select);
    $(dropdownList).insertAfter(dropdownButton);

    // get dropdownList height:
    var height = dropdownList.scrollHeight+'px';

    // hide original select element
    $(select).addClass('hide');

    var showOptions = function() {
      $(dropdownList).css('height', height).addClass('show');
    }

    var hideOptions = function() {
      $(dropdownList).css('height', '0px').removeClass('show');
    }


    $(dropdownButton).on('click', function() {
      if ( $(dropdownList).css('height') !== height ) {
        showOptions();
      } else {
        hideOptions();
      }
    });

    $(dropdownList).on('click', function(event) {
      var title = $(event.target).attr('value');

      for (var i = 0; i<optionArray.length; i++) {
        if ( $(optionArray[i]).attr('title') === title ) {
          $(optionArray[i]).attr('selected', 'selected');
        } else {
          $(optionArray[i]).removeAttr('selected');
        }
      }
      $(dropdownButton).text( title );
      hideOptions();
    });

    $(window).on('click', function(event) {
      var target = event.target;
      if ( !$(target).hasClass('dropdownButton') && !$(target).hasClass('option')) {
        hideOptions();
      }
    })


  }());
*/
</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-76985843-1', 'auto');
  ga('send', 'pageview');

</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-70385950-1', 'auto');
  ga('send', 'pageview');

</script>
