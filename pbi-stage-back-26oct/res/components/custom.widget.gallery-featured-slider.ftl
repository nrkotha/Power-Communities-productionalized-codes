    <#include "common_utils.ftl" />
<link rel="stylesheet/less" type="text/css" href="/plugins/custom/microsoft/microsoftbi/2017_srlesscss" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js"></script>

            <#assign scope=env.context.component.getParameter("scope")!"recent" />
            <#assign limit=env.context.component.getParameter("limit")!"10" />
            <#assign featured=env.context.component.getParameter("label")!"" />

            <#if scope = "kudos">
                <#assign orderBy = "kudos.sum(weight)"/>
            <#else>
                <#assign orderBy = "conversation.last_post_time"/>
            </#if>

    <#-- <#attempt>
        <#assign featured=env.context.component.getParameter("label") />
    <#recover>
        <#assign featured="featured" />
    </#attempt> -->
        <#assign featuredLabels=[featured] />
        <#assign featuredPosts=[] />
        <#assign sourceBoard=coreNode.id />
        <#-- <#if featured!="">
            <#assign labels=restadmin("/boards/id/${sourceBoard}/settings/name/label.predefined_labels").value />
            <#list labels?split(",") as value>
                <#if value?trim?lower_case?contains(featured)==true>
                    <#assign featuredLabels=featuredLabels + [value?trim] />
                </#if>
            </#list>
        </#if>  -->
        <#assign liqlFeatured = ""/>
        <#if (featuredLabels?size>0)>
            <#assign liqlFeatured="AND labels.text in ('" + featuredLabels?join("', '") + "' )" />
        </#if>
        <#assign query="SELECT id, subject, view_href, kudos.sum(weight), author.view_href, author.login, conversation.messages_count, metrics.views FROM messages WHERE board.id = '${sourceBoard}' AND depth=0 ${liqlFeatured} ORDER BY ${orderBy} DESC  LIMIT ${limit}" />
        <#assign queryResult=restadmin("2.0", "/search?q=" + query?url("UTF-8")) />
        <#if queryResult.status=="success" && queryResult.data?? && queryResult.data?has_content && queryResult.data.items?? && queryResult.data.items?has_content>
        <#assign featuredThreads = queryResult.data.items/>
        <!-- <@generateComponentContent componentTitle="" className="custom-gallery-featured-slider" > -->
        <div class="custom-gallery-featured-slider">

        <!-- Slider -->
                <section id="msSlider">
                    <div class="msSlider-content"> <!-- container -->
                        <p class="featured-stories">Featured stories</p>
                        <div class="col-md-12 center-block">
                           
                            <div class="carousel slide feature-carousal custom-feature-image-slider" id="custom_image_carousel">
                                <div class="carousel-inner">
                                    <#assign dataCount = 0/>

                                    <#-- Getting all images -->
                                    <#assign imageArray = {}/>
                                    <#list featuredThreads as post>
                                        
                                        <#attempt>
                                            <#assign attachmentUrl=getAttachedImage(post.id) />
                                        <#recover>
                                        </#attempt>
                                    
                                        <#if attachmentUrl?? && attachmentUrl?has_content>
                                            <#assign post_image=attachmentUrl />
                                        <#else>
                                            <#attempt>
                                                <#assign image=restadmin("/messages/id/${post.id}/uploads/images/index/0").image />
                                            <#recover>
                                            </#attempt>
                                            <#if image?? && image.url??>
                                                <#assign post_image=image.url />
                                            <#else>
                                                <#assign post_image="${asset.get('/html/assets/image_unavailable.png')}"/>
                                            </#if>
                                        </#if>
                                        <#assign imageArray = imageArray + {
                                        post.id:post_image
                                    }/>
                                    </#list>
                                    <#assign size = featuredThreads?size/>

                                    <#list featuredThreads as post>
                                        <div class="item <#if dataCount == 0>active</#if>">
                                            <#assign iteamIndex = []/>
                                            <#-- assign previous  item -->
                                            <#if (size>2)>
                                                <#if post?index = 0>
                                                    <#assign iteamIndex = iteamIndex+[size-1]/>
                                                <#else>
                                                    <#assign iteamIndex = iteamIndex+[post?index-1]/>
                                                </#if>
                                            </#if>
                                             <#if (size==2) && (post?index == 1)>
                                                 <#assign iteamIndex = iteamIndex+[post?index-1]/>
                                             </#if>
                                            <#-- assign current  item -->
                                            <#assign iteamIndex = iteamIndex+[post?index]/>
                                            
                                            <#if (size>1)>

                                                <#if !((size==2) && (post?index == 1))>
                                                <#-- assign next  item -->
                                                <#if post?index+1 == size>
                                                    <#assign iteamIndex = iteamIndex+[0]/>
                                                <#else>
                                                    <#assign iteamIndex = iteamIndex+[post?index+1]/>
                                                </#if>
                                            </#if>
                                            </#if>
                                            <#if (size==1) || (size==2 && post?index ==0)>
                                                <div class="col-md-4 col-sm-4 col-xs-4 img-carousels" >

                                                </div>
                                            </#if>
                                            <#list iteamIndex as ind>
                                                <#assign post_l = featuredThreads[ind]/>
                                                <div class="col-md-4 col-sm-4 col-xs-4 img-carousels" >
                                                    <a href="${post_l.view_href}">
                                                        <img class="slider-images" src="${imageArray[post_l.id]}"/>
                                                    </a>
                                                </div>
                                            </#list>
                                            

                                            
                                        </div>
                                        <#assign dataCount = dataCount+1/>
                                    </#list>
                                </div>
                            </div>
                            <div id="custom_feature_text" class="carousel feature-carousal custom-feature-text">
                                <div class="carousel-inner ">
                                    <#assign textCount = 0/>

                                    <#list featuredThreads as post>
                                        <div class="item <#if textCount == 0>active</#if>">
                                            <h6 class="gallery-sub">${post.subject}</h6>
                                            <p class="username">
                                                <span>by </span><a href="${post.author.view_href}">${post.author.login}</a>
                                                <img class="slider-layer" src="${asset.get('/html/assets/likes.png')}">
                                                <span>${post.kudos.sum.weight}</span>
                                            </p>
                                        </div>
                                        <#assign textCount = textCount+1/>
                                    </#list>
                                </div>
				<ol class="carousel-indicators">
                                    <#assign dotCount = 0/>
                                    <#list featuredThreads as obj>
                         
                                        <button data-target="#custom_image_carousel" data-slide-to="${dotCount}"
                                        <#if (dotCount== 0)>
                                            class="active"
                                        </#if>
                                        ></button>
                                        <#assign dotCount = dotCount+1/>
                                    </#list>
                                </ol>
                            </div>
                            <a class="left carousel-control hi" href="#custom_image_carousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"><img src="/html/assets/gallery_left_arrow.png"></i></a>
                            <a class="right carousel-control" href="#custom_image_carousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"><img src="/html/assets/gallery_right_arrow.png"></i></a>
                            <!-- Bottom Carousel Indicators -->
                        </div>
                    </div>
                 </section>
                <!-- Slider /-->
                

                <script>
                $(document).ready(function () {
                   
                    // Instantiate the Bootstrap carousel
                    $('#custom_image_carousel').carousel({
                    interval: 3000
                    });
                    $('.custom-feature-text').carousel({
                    interval: false
                    });

                    // for every slide in carousel, copy the next slide's item in the slide.
                    /*// Do the same for the next, next item.
                    $('.custom-feature-image-slider .item').each(function(){
                        var prev = $(this).prev();
                        if (prev.length == 0) {
                        prev = $(this).siblings(':last');
                        prev.children(':first-child').clone().prependTo($(this));

                        } else {
                            prev.children(':nth-child(2)').clone().prependTo($(this));

                        }
                        
                        if ($(this).next().length>0) {
                        $(this).next().children(':first-child').clone().appendTo($(this));
                        } else {
                        $(this).siblings(':first').children(':nth-child(2)').clone().appendTo($(this));
                        }
                        // var next = $(this).next();
                        // if (!next.length) {
                        // next = $(this).siblings(':first');
                        // }
                        // next.children(':first-child').clone().appendTo($(this));

                        // if (next.next().length>0) {
                        // next.next().children(':first-child').clone().appendTo($(this));
                        // } else {
                        // $(this).siblings(':first').children(':first-child').clone().appendTo($(this));
                        // } 
                    }); */


                    /* AUTOPLAY NAV HIGHLIGHT */
                    var carousel1 = $('#custom_image_carousel').carousel();

                    var carousel2= $('#custom_feature_text').carousel();
                    carousel1.on('slide.bs.carousel', function(event) {
                        var to = $(event.relatedTarget).index();
                        carousel2.carousel(to);
                    });


                });
                </script>
        </div>
            <!-- </@generateComponentContent> -->
     </#if>
<style>
.carousel-control:focus, .carousel-indicators li:focus, .carousel-indicators a:focus{
outline-width: 1px;
outline-offset: -1px;
outline: 5px auto -webkit-focus-ring-color;
}
#lia-body .lia-page .custom_feature_text .carousel-indicators li{
border-radius: 0px;
border: 0px solid #fff;
}

ol.carousel-indicators button {
    display: inline-block;
    width: 12px;
    padding: 0px;
    height: 12px;
    margin: 1px;
    text-indent: -999px;
    cursor: pointer;
    background-color: #000\9;
    background-color: rgba(0,0,0,0);
    border: 1px solid #949494;
    border-radius: 50%;
}
#lia-body .lia-page .custom_feature_text .carousel-indicators button.active{
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
 $("#custom_image_carousel").keyup(function(){
    $('#custom_image_carousel').carousel('pause');      
 
})
 $("#custom_image_carousel").keydown(function(){
    $('#custom_image_carousel').carousel('cycle');      
 
})

</script>