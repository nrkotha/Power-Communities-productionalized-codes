<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Start: Freemarker Part -->
<#assign dataObjects = []/>
<#assign cType = env.context.component.getParameter("type")!"" />
<#assign carouselData = coreNode.settings.name.get("customcontent.4_text")!""/>
<#if carouselData =="">
<#assign carouselData  = []/>
<#else>
<#assign carouselData  = carouselData?eval/>
</#if>
<#attempt>
<#assign now = .now/>
  <#assign currentDate = now?date>
  <#list carouselData as data> <#-- Loop the object data through freemarker list. -->
    <#if ((data.startDate!="" && (currentDate<data.startDate?date("yyyy-MM-dd"))) || (data.endDate!="" && (currentDate > data.endDate?date("yyyy-MM-dd"))))>
    <#else>
      <#assign dataObjects = dataObjects + [data]/>
    </#if>
  </#list>
<#recover>
    <#assign dataObjects = [{
  "imageURL":"/html/assets/Carousel_Default.jpg",
  "title":"Error",
  "description":"Please check JSON object syntax in Custom Content 4",
  "actionURL":"#",
  "startDate":"",
  "endDate":""
}]/>
</#attempt>
<!-- End: Freemarker Part -->
<#assign carousalClass = 'custom-announcement-carousal'/>
<#if cType == "halfBanner">
<#assign carousalClass = 'custom-half-announcement-carousal'/>
</#if>


<!-- Start: HTML Part -->
<div class="${carousalClass}">
<section id="bg-widgets">
   <article>
    <#if (dataObjects?size >0)>
      <div id="carousel-example-generic" class="carousel slide" data-keyboard="true" data-ride="carousel">
        <!-- Indicators -->
        <#assign dotCount = 0/>
		<div class="carousal-dots">
		 <ul class="carousel-indicators">
        <#list dataObjects as obj>
         
           
            <button data-target="#carousel-example-generic" data-slide-to="${dotCount}" >
            </button>
         
          <#assign dotCount = dotCount+1/>
          
        </#list>
		  <div style="clear:both"></div>
		 </ol>
        </div>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
		
          <#assign dotCount = 0/>
          <#list dataObjects as obj>
            <div class="item 
              <#if dotCount == 0>
                active
                </#if>
                ">
                <img src="${obj.imageURL}"/>
				<div class="container" style="
					<#if obj.textColor?? && obj.textColor !="">
					color:${obj.textColor};
					</#if>
				"><!-- Container -->
				  <div class="carousalData">
					<h1>${obj.title}</h1>
					<p class="bg-widgets-para">${obj.description}</p>
					<div class="take-the-tour"><a href="${obj.actionURL}" target="_blank">
						<#if obj.action?? && (obj.action!="")>
							${obj.action}
						<#else>
							Learn more
						</#if>
					
					</a></div>
				  </div>
				</div>
            </div>
            <#assign dotCount = dotCount+1/>
          </#list>
        </div>

        <!-- Controls -->
		<div class="container"> <!-- container -->
			<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
				<img src="/html/assets/left.png"/>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
				<img src="/html/assets/right.png"/>
			</a>
			<div style="clear:both"></div>
	    </div>
      </div>
    </#if>
   </article>
</section>
</div>
<div style="clear:both"></div>
<style>
.carousel-control:focus, .carousel-indicators li:focus, .carousel-indicators a:focus{
outline-width: 1px;
outline-offset: -1px;
outline: 5px auto -webkit-focus-ring-color;
}
#lia-body .lia-page .custom-announcement-carousal .carousel-indicators li{
border-radius: 0px;
border: 0px solid #fff;
}
#lia-body .lia-page .custom-announcement-carousal h1 {
    font-weight: 500;
    font-size: 36px;
    margin-bottom: 12px;
}

#lia-body .lia-page .custom-announcement-carousal .carousel-indicators button{
    display: inline-block;
    width: 12px;
    padding: 0px;
    height: 12px;
    margin: 1px;
    text-indent: -999px;
    cursor: pointer;
    background-color: #000\9;
    background-color: rgba(0,0,0,0);
    border: 1px solid #fff;
    border-radius: 50%;
}
#lia-body .lia-page .custom-announcement-carousal .carousel-indicators button.active{
background-color:#fff;
}
.carousel-indicators button:focus{
outline-width: 1px;
outline-offset: -1px;
outline: 5px auto -webkit-focus-ring-color;
}
div.active:focus {
	outline:dotted 1px #000
}
</style>
<script>
    $(function(){

        $('.carousel-control').click(function(e){
            e.preventDefault();
            $('#carousel-example-generic').carousel( $(this).data() );
        });

    

    });//END document.ready
$(document).keydown(function(e) {
    if (e.keyCode === 37) {
       // Previous
       $(".carousel-control.left").click();
	   
       return false;
    }
    if (e.keyCode === 39) {
       // Next
       $(".carousel-control.right").click();
       return false;
    }
	
});
 $("#carousel-example-generic").keyup(function(){
    $('#carousel-example-generic').carousel('pause');      
 
})
 $("#carousel-example-generic").keydown(function(){
    $('#carousel-example-generic').carousel('cycle');      
 
})

</script>
<!-- End: HTML Part -->
