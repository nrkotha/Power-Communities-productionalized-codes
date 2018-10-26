  <!-- SlidesJS Required: -->

<div class="lia-panel lia-panel-standard custom-widget-announcement-carousal">
	<div class="lia-decoration-border">
		<div class="lia-decoration-border-top"><div></div></div>
		<div class="lia-decoration-border-content">
			<div>
				<div class="lia-panel-heading-bar-wrapper">
					<div class="lia-panel-heading-bar">
						<span role="heading" class="lia-panel-heading-bar-title">Upcoming Events</span>
					</div>
				</div>
				<div class="lia-panel-content-wrapper">
					<div class="lia-panel-content">
						<!-- The container is used to define the width of the slideshow -->
						<div class="slider-container">
							<div id="slides">
							  <img src="${asset.get('/html/assets/example-slide-1.jpg')}" alt="">
							  <img src="${asset.get('/html/assets/example-slide-2.jpg')}" alt="">
							  <img src="${asset.get('/html/assets/example-slide-3.jpg')}" alt="">
							</div>

						</div>

						<div class="lia-view-all"><a class="lia-link-navigation view-all-link" rel="nofollow" href="#">View All</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="lia-decoration-border-bottom"><div> </div></div>
</div>

<script>
$(function() {
  $('#slides').slidesjs({
    width: 940,
    height: 528,
    play: {
      active: true,
      auto: true,
      interval: 4000,
      swap: true
    }
  });
var pagination =$('ul.slidesjs-pagination')
pagination .insertAfter('a.slidesjs-next')
});

</script>
