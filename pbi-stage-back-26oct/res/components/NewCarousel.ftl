<#--

  Carousel: A carousel to display announcements given by admin in custom content. 
  iTrack : It is created to address iTrack PBI – 1987. 

 -->
<#--
 
  Description: 
    This component is created to display a Carousel in the sidebar of the Power Bi community. 
  Activities:
      1. Get object data from parameter. 
      2. Loop the object data through Freemarker list. 
      3. Display a default image if not mentioned in JSON object in custom content.
      4. Previous and Next option to navigate the announcement carousel. 
      5. Bubbles to display the number of slides and to navigate to specific slide.  

-->


<#assign dataObjects = []/>
<#attempt>

<#-- Get object data from input parameters. -->
  <#assign carouselData = env.context.component.getParameter("carouselData")!"" />
  <#assign defaultImageURL = env.context.component.getParameter("defaultImageURL")!"" />  <#-- Display a default image if not mentioned in JSON object in custom content. -->
  <#assign displayInCategory = env.context.component.getParameter("displayInCategory")!""/> 
  <#assign dataObjects = []/>
  <#if (displayInCategory =="")||(displayInCategory == coreNode.id)>
	  <#assign now = .now/>
	  <#assign currentDate = now?date>
	  <#list carouselData as data> <#-- Loop the object data through freemarker list. -->
		<#if ((data.startDate!="" && (currentDate<data.startDate?date("yyyy-MM-dd"))) || (data.endDate!="" && (currentDate > data.endDate?date("yyyy-MM-dd"))))>
		<#else>
		  <#assign dataObjects = dataObjects + [data]/>
		</#if>
	  </#list>
	</#if>
<#recover>
    <#assign dataObjects = []/>
</#attempt>
<#if (dataObjects?size >0)>
<html>

  <head>
    <style>

  .slideshow-container-1987 {
    max-width: 352px;
    position: relative;
    margin: auto;
    display: none;
  }

.slideshow-container-1987 .prev,.slideshow-container-1987 .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -40px;
  padding: 16px;
  color: #000 !important;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.slideshow-container-1987 .next {
right: 0px;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.slideshow-container-1987 .prev:hover,.slideshow-container-1987 .next:hover {
  background-color: #000000;
  opacity: 0.2;
}

/* Caption text */
.slideshow-container-1987 .text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.slideshow-container-1987 .numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}


/* Fading animation */
.slideshow-container-1987 .fade-custom {
  -webkit-animation-name: fade-custom;
  -webkit-animation-duration: 1.5s;
  animation-name: fade-custom;
  animation-duration: 1.5s;
}

@-webkit-keyframes .slideshow-container-1987 .fade-custom {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes .slideshow-container-1987 .fade-custom {
  from {opacity: .4} 
  to {opacity: 1}
}
.slideshow-container-1987 .cards {
      background: #efefef;
      width: 100%;
     height: 350px;
      margin:0px;
    }
	
	.slideshow-container-1987 .fullImageCard {
      background: #efefef;
      width: 100%;
     max-height: 500px;
      margin:0px;
    }
	
	.slideshow-container-1987 a:hover, .slideshow-container-1987 a:active {
		text-decoration:none !important;
	}
	

    .slideshow-container-1987 .p {color :white;}


    .slideshow-container-1987 .card-desc {
        background: #efefef;
        height: 121px;
        padding: 15px;
    }
    .slideshow-container-1987 .main-text {
      margin: 0px;
      padding: 13px;
      display:inline-block;
      width:100%;
      white-space: nowrap;
      overflow:hidden !important;
      text-overflow: ellipsis;
    }

    .slideshow-container-1987 .description {
      padding: 12px;
      margin: 0px;
    }

    .slideshow-container-1987 .action{
      height: 50px;
      background: #efefef;
      padding-left: 18px !important;
        padding: 6px;
        color: red;
    }

    .slideshow-container-1987 .action-text {

      padding: 30px;
    }

    .slideshow-container-1987 .slideHalfImage {
    height: 175px;
    width: 352px;
  }

  .slideshow-container-1987 .desc {

      height: 10px;
}

/* The dots/bullets/indicators */
.slideshow-container-1987 .pagination-dot {
  cursor:pointer;
  height: 10px;
  width: 10px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
  float: left;
}

.slideshow-container-1987 .active, .slideshow-container-1987 .pagination-dot:hover {
  background-color: #717171;
}

.slideshow-container-1987 .pagination-dots {
text-align: center;
    display: block;
    margin: 0 auto;
    width: 100%;    
  margin-top: 10px;
    margin-bottom: 20px;
}

</style>

  </head>
  <body>
    
    <div class="slideshow-container-1987" id="slideshowContainer">
      <#list dataObjects as obj>
        <div class="mySlides fade-custom" start-date="${obj.startDate}" end-date="${obj.endDate}">
            
			<#assign imageUrl = defaultImageURL/>
			<#if obj.imageURL != "">
				<#assign imageUrl = obj.imageURL/>
			</#if>
			<#if obj.imageType?? && obj.imageType == "full">
				<#assign imageCSSClass = "slideFullImage"/>
				<div class="fullImageCard" >
				<a href="${obj.actionURL}">
					<img class ="${imageCSSClass}" src = "${obj.imageURL}"/>
				</a>
			<#else>
				<div class="cards" >
				<#assign imageCSSClass = "slideHalfImage"/>
				<img class ="${imageCSSClass}" src = "${obj.imageURL}"/>
				<div class = "card-desc">
					<h3 class= "main-text"> ${obj.title} </h3>
					<p class="description"> ${obj.description} </p>
				</div>
      
              <div class="action">
                <h3 class = "action-text"><a href= "${obj.actionURL}">Call to action></a></h3>
              </div>
			</#if>
			
          </div>
        </div>
      </#list>   

<#-- Previous and Next option to navigate the announcement carousel. -->

      <a class="prev" id="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" id="next" onclick="plusSlides(1)">&#10095;</a>

      <#-- Bubbles to display the number of slides and to navigate to specific slide. -->

      <div style="text-align:center;" class="pagination-dots">
        <div style="display:inline-block;margin:0 auto;">  
          <#assign count = 1/>
          <#list dataObjects as data>
            <span class="pagination-dot" onclick="currentSlide(${count?string})"></span>
              <#assign count = count + 1/>
          </#list>
        </div>
      </div>
    </div>
<br>

<script>
  var slideIndex = 1;
  showSlides(slideIndex);

  function plusSlides(n) {
      showSlides(slideIndex += n);
  }

  function currentSlide(n) {
      showSlides(slideIndex = n);
  }

  function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("pagination-dot");
      if (n > slides.length) {slideIndex = 1} 
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
      }
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none"; 
    }
  
    slides[slideIndex-1].style.display = "block"; 
    dots[slideIndex-1].className += " active";
  }
    </script>
<Script>

  var slideIndex = 0;
showAutoSlides();

function showAutoSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("pagination-dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showAutoSlides, 6000); // Change image every 2 seconds
}

/* Display Caraousel on JS load */
document.getElementById("slideshowContainer").style.display = "block";
</Script>
  </body>

</html>
</#if>