<div class="tabs-container">
<h3>Tabs TESTING</h3>

<div class="tab-buttons-wrapper">

</div>
<!-- example of tab content -->
<!-- <div class="tab-content-wrapper">

  <div class="custom-tab-content active">Links to PUGs</div>
  <div class="custom-tab-content">Tab 2 Content</div>
  <div class="custom-tab-content">Tab 3 Content</div>
</div> -->

</div>

<style>

.tabs-container button{
    display: inline-block;
    border-radius: 2px;
    border: 1px solid #DECC93;
    background-color: #ffffff;
    color: #be9a27;
    padding: .5em 1em;
    line-height: 1em;
    padding: 0.5em;
    margin: 0 0.25em;
    text-align: center;
}
.tabs-container button:hover,
.tabs-container button:focus {
  color: #999;
  border: 1px solid #999;
}

.custom-tab-content:not(.active) {
  display: none;
}
.tabs-container button.active {
  color:#777;
  border: 1px solid #777;
}

.tabs-container div {
  margin: 5px;
}



</style>

<@liaAddScript>

;(function($){

function createTabs(){
  var tabNum = $('.custom-tab-content').length;
  for (i=0; i<tabNum; i++) {
    $('.tab-buttons-wrapper').append('<button class="tab">' + (i + 1) + '</button>');
  }
}

createTabs()
$('.custom-tab-content').first().addClass('active');
$('.tab').first().addClass('active');

$('.tab-buttons-wrapper').on('click','.tab',function(){

  $('.active').removeClass('active');

  var tabIndex = $(this).index(),
      activeButton = $(this),
      activeTab = $('.custom-tab-content')[tabIndex];

  $(activeButton).addClass('active');
  $(activeTab).addClass('active');
  
});

})(LITHIUM.jQuery);

</@liaAddScript>