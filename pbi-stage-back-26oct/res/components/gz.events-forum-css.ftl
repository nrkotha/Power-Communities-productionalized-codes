<!-- gz.events-forum-css --> 
<style>
#lia-body .lia-content a:active, 
#lia-body.lia-body .lia-content a:focus{
  outline: none;
}

.event_icon {
  height: 70px;
  margin: 0 auto;
  width: 90px;
}

.event_icon.Person{
  background: rgba(0, 0, 0, 0) url("/html/assets/inPerson.png") no-repeat scroll 50% center / 100% auto;
}
.event_icon.Online{
  background: rgba(0, 0, 0, 0) url("/html/assets/online.png") no-repeat scroll 50% center / 100% auto;
}


.event-search{
  margin-left: auto;
  margin-right: auto;
  max-width: 1221px;
  padding-bottom: 10px;
  padding-left: 1.66667%;
  padding-right: 1.66667%;
}
.label_text {
  display: inline-block;
  font-size: 18px;
  font-weight: 300;
  line-height: 24px;
  vertical-align: middle;
}
.lia-quilt-row.lia-quilt-row-header-row .header-event-search{
  background: #f2f2f2 none repeat scroll 0 0;
  padding: 35px 0;
}
.search_events {
  display: inline-block;
  margin: 0 25px;
  vertical-align: middle;
  position:relative;
}
.form_fields.label_event_query {
  position: relative;
  width: 390px;
}
.SuggestCity-wrapper {
  background: #efefef none repeat scroll 0 0;
  border-style: none solid solid;
  border-width: 0;
  box-shadow: 0 1px 3px #a6a6a6;
  box-sizing: border-box;
  margin-top: 2px;
  position: absolute;
  width: 364px;
  left: 0px;
  z-index: 1;
}

#lia-body .lia-content .suggestion-item:hover {
  background: #3399ff none repeat scroll 0 0;
  color: #fff;
}
#lia-body .lia-content .suggestion-item {
  color: #767676;
  cursor: pointer;
  font-size: 16px;
  padding: 10px 13px;
}
.label_event_city,
.label_event_days,
.label_event_distance {
  width: 183px;
}
#lia-body .lia-content .form_fields input, 
#lia-body .lia-content .form_fields select {
  background: #fff;
  border: 1px solid #ccc;
  border-radius: 0;
  color: #767676;
  font-size: 18px;
  height: 44px;
  margin: 0;
  padding: 0 12px;
width:100%;
}
#lia-body .lia-content .form_fields .event_days,
#lia-body .lia-content .form_fields .event_distance {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background: #fff url("/html/assets/down_arrow.png") no-repeat scroll 95% center / 10px 10px;
  border-left: none;
  font-weight: normal;
}
#lia-body .lia-content button.event-search-btn {
  background: #f2c811 none repeat scroll 0 0;
  border: medium none;
  display: inline-block;
  font-size: 18px;
  height: 44px;
  padding: 0 20px;
  vertical-align: middle;
}
#lia-body .lia-content button.event-search-btn.disabled {
  pointer-events: none;
  opacity: 0.3;
}
.search_events .form_fields {
  display: inline-block;
  float: left;
  vertical-align: middle;
  position: relative;
}
#events_container {
  padding: 35px 0;
}
#events_container .lia-quilt-column-row.events_row {
  max-width: calc(100% - 45px);
}
.event-type {
  background-color: #ffffff;
  border-bottom: 1px solid #e6e6e6;
  height: 50px;
  width: 100%;
}
.event-listing-wrapper {
  clear: both;
}
#lia-body .lia-content ul.portal_type > li, 
#lia-body .lia-content ul.type_listing > li {
  display: inline-block;
  height: 50px;
  margin-right: 15px;
}
.event-type li.active a, 
.event-type li a:hover {
  border-bottom: 2px solid #f2c811;
  text-decoration: none !important;
}
.portal_type {
  float: left;
}
.portal_type li a {
  float: left;
  font-size: 18px;
  height: 50px;
  line-height: 22px;
  padding: 10px 0;
}
.type_listing {
  float: right;
  height: 50px;
}
#lia-body .lia-content ul.portal_type > li, 
#lia-body .lia-content ul.type_listing > li {
  display: inline-block;
  height: 50px;
  margin-right: 15px;
}
#lia-body .lia-content .type_listing li label {
  display: inline-block;
  font-size: 16px;
  line-height: 20px;
  padding: 14px 5px;
  outline: none;
  margin-bottom: -2px;
  width: 18px;
  background-size: 100%;
  background-repeat: no-repeat;
  background-position: center 18px;
  height: 48px;
}
.lia-quilt-column-24.event-listing {
  border-bottom: 1px solid #eaeaea;
  padding: 48px 0;
}
.lia-quilt-column-24.event-listing:last-child {
  border-bottom: none;
}
#tab-upcoming .lia-quilt-column-24.event-listing:last-child {
  border-bottom: medium none;
}
.event_calandar_card .event_card {
  display: table;
} 
.event_calandar_card .events_info {
  display: table-cell;
  height: 156px;
  vertical-align: middle;
  width: 168px;
}
.event_calandar_card .event_month, 
.event_calandar_card .event_date {
  color: #000000;
  text-align: center;  
  vertical-align: middle;
  width: 100%;
}
.event_calandar_card .event_month{
  font-size: 18px;
  line-height: 30px;
}
.event_calandar_card .event_date {
  font-size: 20px;
  line-height: 60px;
  font-weight: 300;
}
#lia-body .lia-content .event_title a:link{
  color: #2b2b2b;
  font-family: "Segoe UI semibold","Segoe UI",Arial,sans-serif;
  font-size: 24px;
  font-weight: 400;
  line-height: 30px;
}
.event_desc {
  color: #767676;
  font-family: "Segoe UI",Arial,sans-serif;
  font-size: 15px;
  font-weight: normal;
  line-height: 21px;
  margin: 15px 0;
}
.event-listing-conatiner .event_info{
    font-size: 18px;
    line-height: 26px;
    color: #2b2b2b;
    font-weight: 400;
    font-family: "Segoe UI semibold","Segoe UI",Arial,sans-serif;
    width: 100%
}
.event_city {
  text-transform: capitalize;
}
.facets_type {
  border-bottom: 1px solid #eaeaea;
  color: #2b2b2b;
  cursor: pointer;
  font-family: "Segoe UI semibold","Segoe UI",Arial,sans-serif;
  padding: 12px 0;
  font-size: 20px;
  line-height: 26px;
  font-weight: 400;
}
.facets_title {
  
}
.show_filter {
  float: right;
}
#lia-body .lia-content .filters {
  padding: 20px 0;
}
#lia-body .lia-content .checkbox {
  color: #202020;
  font-size: 18px;
  line-height: 24px;
  padding-bottom: 10px;
}
#lia-body .lia-content .custCheckBox {
  position: relative;
}
.view_icon .minus_icon,
.events_type.opened .plus_icon{
  display: none;
}
.events_type.opened .minus_icon {
  display: block;
}
.facets_list {
  display: none;
}
.events_type.active .facets_list {
  display: block;
}
.productCount {
  color: #767676;
  font-size: 15px;
}
.show_filter {
  cursor: pointer;
  line-height: 15px;
  padding: 5px;
}

.pageLoad {
  background: #e5e5e5 none repeat scroll 0 0;
  height: 25%;
  left: 0;
  opacity: 0.9;
  position: fixed;
  text-align: center;
  top: 0;
  width: 100%;
  z-index: 100;
}
.pstnNone {
  position: inherit;
}
.load-more-btn:hover {
  opacity: 0.75;
}
.load-more-btn {
  background: #e6e6e6 none repeat scroll 0 0;
  clear: both;
  color: #2b2b2b;
  cursor: pointer;
  display: none;
  font-size: 18px;
  height: 44px;
  line-height: 44px;
  margin: 10px auto 25px;
  text-align: center;
  width: 100%;
}
#lia-body .lia-content .total-result {
    font-size: 14px;
}

.c-progress.f-indeterminate-local.f-progress-large {
  left: 50%;
  margin: 0 -60px;
  position: absolute;
  top: 50%;
  z-index: 9999;
}
.c-progress.f-indeterminate-local {
}
.c-progress {
}
.c-progress.f-indeterminate-local span {
  animation: orbit 6s infinite;
  position: absolute;
  transform: rotate(225deg);
}
.c-progress.f-indeterminate-local span::after {
  background: #232323 none repeat scroll 0 0;
  border-radius: 100%;
  content: "";
  position: absolute;
}
.c-progress.f-indeterminate-local span:nth-child(2) {
  animation-delay: 120ms;
}
.c-progress.f-indeterminate-local span:nth-child(3) {
  animation-delay: 240ms;
}
.c-progress.f-indeterminate-local span:nth-child(4) {
  animation-delay: 480ms;
}
.c-progress.f-indeterminate-local span:nth-child(5) {
  animation-delay: 720ms;
}
.c-progress.f-indeterminate-local.f-progress-large {
  height: 60px;
  width: 60px;
}
.c-progress.f-indeterminate-local.f-progress-large span {
  height: 60px;
  width: 60px;
}
.c-progress.f-indeterminate-local.f-progress-large span::after {
  height: 10px;
  width: 10px;
}
.c-progress.f-indeterminate-local.f-progress-small {
  height: 20px;
  width: 20px;
}
.c-progress.f-indeterminate-local.f-progress-small span {
  height: 25px;
  width: 25px;
}
.c-progress.f-indeterminate-local.f-progress-small span::after {
  height: 6px;
  width: 6px;
}
@keyframes orbit {
  0% {
      animation-timing-function: ease-out;
      opacity: 1;
      transform: rotate(225deg);
  }
  7% {
      animation-timing-function: linear;
      transform: rotate(345deg);
  }
  30% {
      animation-timing-function: ease-in-out;
      transform: rotate(455deg);
  }
  39% {
      animation-timing-function: linear;
      transform: rotate(690deg);
  }
  70% {
      animation-timing-function: ease-out;
      opacity: 1;
      transform: rotate(815deg);
  }
  75% {
      animation-timing-function: ease-out;
      transform: rotate(945deg);
  }
  76% {
      opacity: 0;
      transform: rotate(945deg);
  }
  100% {
      opacity: 0;
      transform: rotate(945deg);
  }
}
.noResults img {
  float: right;
}
#lia-body .noResults p {
  border: 1px solid #ef8b8b;
  border-radius: 5px;
  float: left;
  margin-top: 100px;
  padding: 30px;
}

.event-type .disabled {
    pointer-events: none;
}
#lia-body .lia-content .event-type .disabled a {
    color: #ccc;
}
.event-modal-wrapper {
  background: rgba(0, 0, 0, 0.6) none repeat scroll 0 0;
  bottom: 0;
  left: 0;
  position: fixed;
  right: 0;
  top: 0;
  display:none;
}

.event-modal-content {
  animation-duration: 0.4s;
  animation-name: animatetop;
  background: #fff none repeat scroll 0 0;
  display: table;
  position: relative;
  width:100%;
}


.event-modal.lia-quilt-column-24 {
    left: 25%;
    max-width: 700px;
    position: fixed;
    right: 25%;
    top: 40%;
    z-index: 1111
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

#lia-body .lia-content .event-grid-date {
  display: none;
}
#lia-body .lia-content .event_timing{
  display: block;
}
#lia-body .lia-content .event_card .events_info .event_date{
  display: block;
}
/*grid view*/
#lia-body .lia-content .grid .event-grid-date {
  display: block;
  width: 100%;
}

#lia-body .lia-content .grid .event_card .events_info .event_date{
  display: none;
}
#lia-body .lia-content .grid .lia-quilt-column-24.event-listing {
  margin-top: 35px;
  padding: 25px 0px 15px 15px;
  width: calc(33%);
  max-height: 400px;
  min-height: 480px;
  border-top: none;
  border-bottom: 1px solid #eaeaea;
}
#lia-body .lia-content .grid .event-listing .event-section-left,
#lia-body .lia-content .grid .event-listing .event-section-right {
    border-right: 1px solid #eaeaea;
}
#lia-body.lia-body .lia-content .event-listing:nth-child(3n+1) .event-section-left,
#lia-body.lia-body .lia-content .event-listing:nth-child(3n+1) .event-section-right {
    border-right: none;
}
#lia-body .lia-content .type_listing li .grid_icon {
	background-image: url('/html/assets/event-grid.png');
}
#lia-body .lia-content .type_listing li .list_icon {
	background-image: url('/html/assets/event-list.png');
}
#lia-body .lia-content .type_listing li .location_icon {
	background-image: url('/html/assets/event-map.png');
}

#lia-body .lia-content .type_listing li.active .grid_icon,
#lia-body .lia-content .type_listing li .grid_icon:hover {
	background-image: url('/html/assets/event-grid_dark.png');
}
#lia-body .lia-content .type_listing li.active .list_icon,
#lia-body .lia-content .type_listing li .list_icon:hover {
	background-image: url('/html/assets/event-list_dark.png');
}
#lia-body .lia-content .type_listing li.active .location_icon,
#lia-body .lia-content .type_listing li .location_icon:hover{
	background-image: url('/html/assets/event-map_dark.png');
}

#lia-body .lia-content .grid .lia-quilt-column-06.event-section-left.event_calandar_card{
  width: 100%;
}
#lia-body .lia-content .grid .event_calandar_card .event_card{
  margin: 0 auto;
  display: inherit;
}
#lia-body .lia-content .grid .event-section-right.event_calandar_info
{
  width: 100%;
	min-height: 300px;
}
#lia-body .lia-content .grid .event_title > a {
  display: block;
  max-height: 100px;
  overflow: hidden;
  padding-top: 10px;
	padding-right: 10px;
	font-family: inherit;
}
.grid .event_desc {
  max-height: 84px;
  min-height: 84px;
  overflow: hidden;
  margin: 12px 0px;
}
#lia-body .lia-content .grid .event_timing {
  float: left;
  font-size: 18px;
  width:100%;
}
#lia-body .lia-content .grid .event_place{
  font-size: 18px;
  width:100%;
}
.grid .event_calandar_card .events_info{
  height: 100px;
  width: 150px;
  display: inherit;
}
.grid .event_calandar_card .event_date{
  font-size: 36px;
}
.grid .event_info {
  min-height: 54px;
}
#lia-body .lia-content .grid .event_info .event_cat,
#lia-body .lia-content .grid .event_info .event_timing,
#lia-body .lia-content .grid .event_info .event_place{
  display: inline-block;
  clear: both;
}
.grid .event_icon{
  margin: 0;
}
/*grid view*/


.event-pagination  {
  padding: 50px 0;
  text-align: center;
  clear:both;
}
.event-pagination a {
  border-radius: 2.5px;
  color: #0081ba;
  display: inline-block;
  height: 22px;
  line-height: 22px;
  margin: 0 3px;
  overflow: hidden;
  padding: 0;
  text-align: center;
  text-decoration: none;
  vertical-align: middle;
  width: 26px;
}
.event-pagination a.jp-previous::before {
  content: "";
  font: 14px/1 FontAwesome;
  margin-left: 4px;
}
.event-pagination a.jp-next::after {
  content: "";
  font: 14px/1 FontAwesome;
  margin-left: 4px;
}
.page_link.event-pagination_page.active {
    color: #1b2126 !important;
}
#jp-previous.deactArrow, #jp-next.deactArrow {
    cursor: no-drop;
    opacity: 0.4;
}
span.ellipsis, span.ellipsis_before {
    border-color: rgba(0, 0, 0, 0);
    display: inline-block;
    margin-top: 2px;
    vertical-align: top;
}
</style>

<style>
.modal-left {
  background: #f2f2f2 none repeat scroll 0 0;
  max-height: 400px;
  min-height: 400px;
  overflow: hidden;
  padding: 20px;
}
.event-modal.lia-quilt-column-24 {
  left: 10%;
  max-width: 80%;
  position: fixed;
  right: 25%;
  top: 25%;
  z-index: 1111;
}
.modal-left img {
    margin-bottom: 15px;
    height: 85px;
}
.modal-left-title {
  font-size: 13px;
  font-weight: bold;
}
.modal-left-value {
  font-size: 13px;
}
.modal-right-title {
  margin-bottom: 15px;
  width:95%;
}
#lia-body .lia-content .event-modal .modal-right-title a {
  color: #000000;
  font-size: 24px;
}
.modal-right-date {
  color: #000000;
  font-size: 13px;
  margin-bottom: 15px;
}
.modal-description {
  font-size: 15px;
  max-height: 247px;
  overflow-y: auto;
}
.modal-right-inner{
   padding: 20px;
}
#lia-body .lia-content .event-modal a.event-reg-btn {
    background: #f2c811 none repeat scroll 0 0;
    color: #000000;
    padding: 10px 45px;
    text-align: center;
    margin-left: 20px;
  margin-top: 10px;
    display: inline-block;
}

#lia-body.lia-body .lia-content .event-modal a.community_link {
    margin-top: 25px;
    display: inline-block;
    font-size: 18px;
    color: #000;
    margin-left: 20px;
}

.event-section{
  margin-bottom: 5px;
}
</style>

<!-- hover card css -->

<style>
.event-hover-card {
  background: #fff none repeat scroll 0 0;
  overflow: hidden;
  padding-top: 5px;
  width: 400px;
}

.event-hover-card img{
  width: 70px;
}
.event-hover-card .lia-quilt-column-20 {
  padding-left: 10px;
}
#lia-body .event-hover-card .lia-quilt-column-20 .locationName,
#lia-body .event-hover-card .lia-quilt-column-20 .location,
#lia-body .event-hover-card .lia-quilt-column-20 .locationStartEnd{
  font-size: 10px;
  margin-bottom: 0;
}

.total-result {
  font-size: 18px;
 
  margin-top: 10px;
}
.header-event-search {
  background: #f2f2f2 none repeat scroll 0 0;
  padding: 34px 0;
}

</style>