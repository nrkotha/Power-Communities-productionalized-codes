.custom-feature-image-slider .carousel-inner > .item {
  -webkit-transition: 500ms ease-in-out left;
  transition: 500ms ease-in-out left;
}
.center-block .carousel {
	overflow: hidden;
}
#msSlider .carousel-control {
    filter: alpha(opacity=1) !important;
    opacity: 1 !important;
}
#msSlider .slider-images{
/*background-color: #ffffff;*/
  
}
.custom-feature-image-slider .carousel-inner {
	width: 150%;
	left: -25%;
	height: 312px;
    overflow: hidden;
    margin-top: 0px;
}
#lia-body #msSlider .featured-stories {
    
    font-weight: 600;
}
.custom-feature-image-slider .carousel-inner .carousel-control .glyphicon-chevron-left, .custom-feature-image-slider .carousel-inner .carousel-control .icon-prev {
    left: 0;
   
   
   
}
#msSlider .carousel-control .glyphicon-chevron-left, #msSlider .carousel-control .glyphicon-chevron-right, #msSlider .carousel-control .icon-next, #msSlider .carousel-control .icon-prev {
    position: absolute;
    top: 40%;
    z-index: 5;
    display: inline-block;
    margin-top: -10px;
}
.center-block .carousel-control .glyphicon-chevron-left, .center-block .carousel-control .icon-prev, .center-block .carousel-control .glyphicon-chevron-right, .center-block .carousel-control .icon-next {
    display: block;
    background-color: #333;
    height: 88px;
    width: 44px;
    font-size: 18px;
}
#msSlider .carousel-control .glyphicon-chevron-right{right:0; margin-right: 15px;}
#msSlider .carousel-control .glyphicon-chevron-left{left:0;margin-left: 15px;}
.custom-feature-image-slider .carousel-inner .active.left {
  left: -33%;

}
.carousel-control.left, .carousel-control.right {
   
   width:24.4%;
}
#msSlider .carousel-control.left{
background: rgb(242,242,242); /* Old browsers */
background: -moz-linear-gradient(left, rgba(242,242,242,1) 0%, rgba(255,255,255,.7) 100%) !important; 
background: -webkit-linear-gradient(left, rgba(242,242,242,1) 0%,rgba(255,255,255,.7) 100%) !important;  
background: linear-gradient(to right, rgba(242,242,242,1) 0%,rgba(255,255,255,.7) 100%) !important; 
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f2f2', endColorstr='#ffffff',GradientType=1 ) !important; 
height:300px;

}
#msSlider .carousel-control.right{
background: rgb(255,255,255); /* Old browsers */
background: -moz-linear-gradient(left, rgba(255,255,255,.7) 0%, rgba(242,242,242,1) 100%) !important;
background: -webkit-linear-gradient(left, rgba(255,255,255,.7) 0%,rgba(242,242,242,1) 100%) !important; 
background: linear-gradient(to right, rgba(255,255,255,.7) 0%,rgba(242,242,242,1) 100%)!important; 
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f2f2f2',GradientType=1 ) !important; 
height:300px;

}
.custom-feature-image-slider .carousel-inner .active.right {
  left: 25%;

}
.custom-feature-image-slider .carousel-inner .next {
  left: 25%;
}
.custom-feature-image-slider .carousel-inner .prev {
  left: -25%;
}
@media all and (transform-3d), (-webkit-transform-3d) {
  .custom-feature-image-slider .carousel-inner > .item {
    -webkit-transition: 500ms ease-in-out left;
    transition: 500ms ease-in-out left;
    -webkit-transition: 500ms ease-in-out all;
    transition: 500ms ease-in-out all;
    -webkit-backface-visibility: visible;
            backface-visibility: visible;
    -webkit-transform: none!important;
            transform: none!important;
  }
}
.custom-feature-image-slider .carouse-control.left,
.custom-feature-image-slider .carouse-control.right {
  background-image: none;
}

@media screen and (max-width: 1000px) {
  .center-block .carousel {
    overflow: initial;
}
#msSlider .carousel-control.left {
   
    top: 80px;
}
#msSlider .carousel-control.right {
   
    top: 80px;
}
#lia-body #msSlider .gallery-sub {
   
    width: 100%;
}
}
@media screen and (max-width: 480px) {
#msSlider .slider-images {
    height: 315px;
    width: 100%;
}
#msSlider .col-md-4{
   width:100%;
}
#msSlider .carousel-control.right {
    background: #ffffff;
 
    background: none !important;
   
}
#msSlider .carousel-control .glyphicon-chevron-right {
    right: 0;
    margin-right: 0;
}
#msSlider .carousel-control .glyphicon-chevron-left {
    left: 0;
    margin-left: 0;
}
#msSlider .carousel-control.left {
    background: #ffffff;
 
    background: none !important;
   
}
}
