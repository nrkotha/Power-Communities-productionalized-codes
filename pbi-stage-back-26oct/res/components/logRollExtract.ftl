<!-- This Component will extracts the list of Blogs from Listly list and display them in PowerBI custom page --> 
<script src="${asset.get('/html/assets/angular.min.js')}"></script>
<style>

@font-face {
  font-family: 'SegoeUISemiLight';
  src: url('${asset.get("/html/assets/SegoeUISemiLight.eot")}');
  src: local('☺'), url('${asset.get("/html/assets/SegoeUISemiLight.woff")}') format('woff'), url('${asset.get("/html/assets/SegoeUISemiLight.ttf")}') format('truetype'), url('${asset.get("/html/assets/SegoeUISemiLight.svg")}') format('svg');
  font-weight: 300;
  src: url('${asset.get("/html/assets/SegoeUISemiLight.otf")}');
  
  font-style: normal;
}
  .blog-bgColor{
		background:#2b2b2b;
		float: left;
		margin-top: 0; 
		width: 100%;
		background-repeat: no-repeat;
		background-size: 100%;
	}
   
   #lia-body .lia-content .lia-quilt-row-header{
    margin-bottom:0px;
    margin-top:0px; 
     } 
  
#lia-body .lia-content .lia-quilt-column-16{
     width:100%
  }
  #lia-body .MinimumWidthContainer .lia-content {
    width: 100%;
    min-width: 100%;
    margin: 0px;
    padding: 0px;
}
#lia-body .lia-content .lia-quilt-column-16 {
    padding-right: 0;
}


  .blogroll .row {
    max-width: 100%;
    margin-left: auto;
    margin-right: auto;
margin-top:0px;
}
  .blogroll .blogrollcontainer{
     background-color:transparent;
   padding:0 15px;
   max-width: 1170px;
   margin: 0 auto;
  }
  
  
  .load-moreData {
   font-family: 'Segoe UI Condensed','Segoe UI','Segoe WP',Tahoma,Arial,sans-serif;
  font-size: 18px;
  text-align: center;
  color: #2b2b2b;
   margin: 0 0px;
  background:#e6e6e6;
  float: left;
    width: 100%;
margin-bottom:30px;
  }
   .load-moreData a{
  padding: 10px 0 !important;
    float: left;
    text-align: center;
     
    width: 100%;
     background:#e6e6e6;
    color: #2b2b2b !important;
     }
   .load-moreData a:hover{text-decoration:none !important}
 .blogEle{
    border-bottom: 1px solid #ccc;
   margin: 0 0px;
    padding: 48px 0px;
    float: left;
  width: 100%; 
    height:220px;  
    box-sizing: border-box !important;
 }
 .blog-bgColor h1 {
font-family: wf_segoe-ui_semibold, HelevticaNeue-light, 'Helvetica Neue', Helvetica, Arial, sans-serif;
    font-size: 36px !important;
    font-weight: 300 !important;
    color: #ffffff;
    margin: 48px 0px 48px 0px !important;
  line-height:45px !important;
}
.align-right{text-align:right;}

.blog-bgColor p {
 margin:60px 0px 60px 0px !important;

  font-family: 'Segoe UI Condensed','Segoe UI','Segoe WP',Tahoma,Arial,sans-serif;
    font-size: 18px !important;
    color: #ffffff;   
    line-height: 1.5;
    font-weight: 400;
}
.block-with-text {
overflow: hidden;
max-height: 60px; 
position: relative; 
line-height: 20px;
margin-right:-10px;
}
.block-with-text:before {
  content: '...';  
  position: absolute; 
  right: 0;
  bottom: 0;
}
.block-with-text:after {
  content: '';  
  position: absolute; 
  right: 0;
  width: 1em; 
  height: 1em;
  margin-top: 0.2em;
  background: white;
}
.Blog-roll {

font-family: 'SegoeUISemiLight';
  font-size: 20px;
  font-weight: 300;
  color: #2b2b2b;
margin:32px 0 33px
}
.blogroll_error{
width:100%;
padding:50px 0;
text-align:center;
color:#f2c811;
font-family: 'SegoeUISemiLight';;
font-size:18px;
  }
.Subscribe_btn{
   font-family: 'Segoe UI','Segoe WP',Tahoma,Arial,sans-serif;
   font-size: 18px;
  color: #2b2b2b;
  text-align:center;
  line-height:44px;
   width: 117px;
  height: 44px;
  background-color: #f2c811;  
  float:right;
  margin-top:23px;
  }

.blogEle h2{font-family: 'SegoeUISemiLight';;
  font-size: 24px;
  font-weight:500;
  line-height:25px !important;
  color: #2b2b2b;}
 .blogEle h2 a{ font-family: 'SegoeUISemiLight';
  font-size: 24px;
  font-weight: 400;
  color: #2b2b2b !important;}
 .blogEle h2 a:hover{text-decoration:underline !important}
  .no-padding{
   padding-left:0px;
   padding-right:0px; 
    }
.sec-img img{width:264px;height:124px;}
 .blogEle p{   font-family: 'Segoe UI','Segoe UI Condensed','Segoe WP',Tahoma,Arial,sans-serif;
  font-size: 15px;
word-break: break-all;
padding-right: 10px !important;
  margin-bottom: 0 !important;

  color: #767676;margin-top:12px !important;}
.no-padding3 {
    padding-left: 0px;
    padding-right:0px;
}
.displayblog_left{width:744px;float:left; margin-right:120px;}
.displayblog_right{width:20%;}
.blogrow{width:100%;}
.loadingimg{width:100%;margin:-115px 0; text-align:center;float:left;}
.loadingimg img{text-align:center;display: initial; margin-top:0px;}
.blogroll_top_left{width:50%;float:left;}
.blogroll_top_right{width:50%;float:left;}
.blogroll_bg_left{width:502px;float:left; margin-right:74px;}
.blogroll_bg_right{width:552px;float:left;}
@media screen and (max-width: 1150px) {
	.blogroll_bg_left{width:47%;float:left; margin-right:3%;}
.blogroll_bg_right{width:50%;float:left;}
.displayblog_left{width:75%;float:left; margin-right:3%;}	
	}
@media screen and (max-width: 993px) {
   .blogEle p {margin-bottom: 20px !important;}
   .align-right {
    text-align: left !important;
}
.block-with-text {   
    max-height: initial;   
}
.blogEle{height:auto;}
.pull-right {
    float: left !important;
}

}
@media screen and (max-width: 768px) {
  .displayblog_right {
    width: 100%;
}
.blogroll_bg_left{width:100%;float:left;}
.blogroll_bg_right{width:100%;float:left;}
.displayblog_left {
    width: 100%;
    float: left;
}
.blog-bgColor p {
    margin: 0px 0px 30px 0px !important
   
} 
}
@media screen and (min-width: 3840px){
	#lia-body .blog-bgColor {
		height: 576px !important;
	}
}
@media screen and (max-width: 3839px) and (min-width: 2560px){
	#lia-body.lia-body .blog-bgColor {
		height: 384px;
	}
}
@media screen and (max-width: 2559px) and (min-width: 1280px){
	.blog-bgColor {
		height: 192px;
		background-size: 100% 100%;
	}
}
@media screen and (max-width: 1279px){
	.blog-bgColor {
		height: 192px;
        background-size: 100% 100%;
	}
}
</style>
<!-- Component design starts here -->

  <div ng-app="blogRollExtract" ng-controller="listlyBlogExtract" class="blogroll">
  <div ng-include="blogroll"></div>  
  <script id="blogroll.html" type="text/ng-template">
  <div class="row">
	  <div class="blogrollcontainer">
		  <div class="blogroll_top_left no-padding">
			<div class="Blog-roll">Blog roll</div>
		  </div>
		  <div class="blogroll_top_right no-padding">
			<div class="Subscribe_btn" style="display:none">Subscribe</div>
		  </div>
	  </div>
  </div>
  <div class="row">

 <#--    ${coreNode.settings.name.get("customcontent.7_text")!""} -->
    <@component id="common.widget.custom-content" name="7" panel="false"/>

    </div>
     <div class="row">
     <div class="blogrollcontainer">
     <div class="blogroll_error" style="display:none" ng-if="dispError">Unable to load blogs at this time. Please refresh the page after some time.</div>
    <div ng-repeat="items in displayBlog track by $index" class="blogEle">
      <div class="blog-subject displayblog_left no-padding3">
        <h2 ><a href = "{{items.item.url}}" target="_blank" >{{items.item.name}}</a></h2>
        <p class="blog-desc block-with-text">{{items.item.raw_note}}</p>
      </div> 
   
     <div class="blog-img displayblog_right no-padding pull-right align-right sec-img"> <img src= "{{items.item.gallery_image}}"> </div>
      <div style="clear:both"></div>
    </div>
    <div style="clear:both"></div>
    <section class="load-moreData" ng-if="dispMore"><a ng-click="loadMoreClick()">Load more...</a></section>
     <div class="loadingimg"><img class="loading-img" ng-if="dispSpin" ng-src="${skin.images.twitterloading.url}"></div>
    </div>
    </div>
    
    
    </script>
  </div>

<!-- Component design ends here --> 
<script>
    var app = angular.module('blogRollExtract', []);
    app.controller('listlyBlogExtract', function($scope, $http ,listlyAPICall) {
        var count=0;
        $scope.displayBlog = [];
        /* Executing the function on clicking Load more button */
    $scope.dispMore = false;
    $scope.dispError = false;
    $scope.dispSpin = false;
    $scope.blogroll = "blogroll.html";
        $scope.loadMoreClick = function () {
          if(count!=0) {
       $scope.dispSpin = true;
          }
            /* Incrementing the count on button click */
            count = count +1;
            /* Making JSONP request to listly by calling service */
            listlyAPICall.getResponse(count,function(callback) {
       $scope.dispSpin = false;
               /* Looping through each item and adding to existing array */
               try {
                angular.forEach(callback.response,function(items,key){
                $scope.displayBlog.push(items);
                })
                if(count == callback.pagevalue){
                    $scope.dispMore = false;
                  } else {
                    $scope.dispMore = true;
                  }
                } catch (e) {
                    $scope.dispError = true;  
                }
                });
            }
            $scope.loadMoreClick();
    });
    app.service('listlyAPICall', function($http){
        var Service={};
        Service.getResponse = function (count,callback) {
            var responseObj={};
            var response=[];
            /* Making JSONP request to listly */
            $http({
                method : "JSONP",
                url : "https://list.ly/api/v3/list/1AiL.json?type=published&sort=newest&filter=&page="+count+"&per_page=5&callback=JSON_CALLBACK"
            }).then(function Succes(response) {
                responseObj.pagevalue=response.data.pagination.total_pages;
                responseObj.response=response.data.list.items;
                callback(responseObj);
            }, function Error(response) {
                callback(response);
            });
          }
        return Service;
    });
</script>
