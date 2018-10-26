<#macro designCarousal>

<div class="lia-panel lia-panel-standard custom-widget-announcement-carousal">
  <div class="lia-decoration-border">
    <div class="lia-decoration-border-top"><div></div></div>
    <div class="lia-decoration-border-content">
      <div>
        <div class="lia-panel-heading-bar-wrapper slider">
          <div class="lia-panel-heading-bar" aria-label="Up coming events">
            <span aria-level="3" role="heading" class="lia-panel-heading-bar-title">Announcements</span>
          </div>
        </div>
        <div class="lia-panel-content-wrapper">
          <div class="lia-panel-content">
            <!-- The container is used to define the width of the slideshow -->
            <div class="slider-container">
              <div id="slides">
                <#nested/>
              </div>
              <div id="slider-dots">
              </div>
              <img class="spinner" src="/html/assets/spinner-slide.gif?version=preview" alt="spinner"/>
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
        interval: 6000,
        swap: true,
        pauseOnHover: true,
        restartDelay: 2500
      }
    });
    try {
    $( ".slidesjs-container" ).before("<div class='pagination_sec'></div>");
	$( ".slidesjs-pagination" ).prependTo(".pagination_sec");
    } catch(e){
    }
    
        $(".slidesjs-previous.slidesjs-navigation").attr('tabindex', '-1');
        $(".slidesjs-next.slidesjs-navigation").attr('tabindex', '-1');
    $('.slidesjs-pagination a').on('keyup', function(e) {
    if (e.which == 9) {
        e.preventDefault();
        $(".slidesjs-stop.slidesjs-navigation").trigger('click');
    }
  
});
$('.slidesjs-play.slidesjs-navigation').on('keydown', function(e) {
    if (e.which == 9) {
        e.preventDefault();
        $(".slidesjs-play.slidesjs-navigation").trigger('click');
    } 
});
$('.slidesjs-pagination-item a').on('keyup', function(e) {
    if(e.which == 13 ) {
			
      	$('.item.slidesjs-slide > a').attr('tabindex', '-1');
		$('.slidesjs-pagination-item > a').attr('tabindex', '-1');
        $('.item.slidesjs-slide.active > a').attr('tabindex', '0');
		$('.slidesjs-pagination-item').children('.active').attr('tabindex', '0')
        
    } else if(e.which == 9){
	$('.slidesjs-pagination-item > a').attr('tabindex', '0');
	}
});

$('.slidesjs-pagination-item a').on('keyup', function(e) {
                $(this).trigger( "click");
				$(this).addClass("active");
				$(".item.slidesjs-slide").addClass("active");
          

  });
  $('.slidesjs-pagination-item a').on('keydown', function(e) {
                
				$(this).addClass("remove");
				$(".item.slidesjs-slide").addClass("remove");
          

  });

  });
$(document).ready(function() {
     if($("#slides .item").length < 2 )
     {
     /* Fixing Single Slide click issue (commented following code)*/
// $(".item").css("left","0px");
          $(".item.slidesjs-slide").attr('style',  'left:0px !important');	  
		  $(".slidesjs-stop.slidesjs-navigation").trigger('click');
		  $(".slidesjs-previous").css("display", "none");
          $(".slidesjs-next").css("display", "none");

		  
     }      
});
</script>


</#macro>
<#macro slide image url buttonName imageName>
 <div class="item">
 <a href="${url}" target=”_blank” tabindex="-1"><img src="${image}" alt="${imageName}"/></a>
  
</div>
</#macro>