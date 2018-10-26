<#assign env = config.getString("phase", "prod") />
<#if env == "stage">
    <#-- Add Stage categories here to enable Hero Banner -->
    <#assign catHeroBanList = ["D365MicrosoftTalent"]/>
<#else>
    <#-- Add Prod Categories here to enable Hero banner -->
    <#assign catHeroBanList = ["MicrosoftHCM2"]/>
</#if>

<style>

#lia-body .lia-hero-section.lia-content{
    margin-top:70px
}

</style>
<center><#-- ${settings.name.get("layout.urlfetcher_header_d365tc")} -->
<#include "layout.urlfetcher_header_d365tc.ftl"/>
</center>

<div class="shell-category-header cat-theme-white menu" ms.pgarea="categoryheader">
    <!--<![endif]-->
    <div role="navigation" aria-label="Category level navigation" class="shell-category-nav" ms.cmpgrp="cat nav" data-bi-area="CategoryHeader-" data-bi-view="C0">
        <div class="c-nav-pagination c-nav-pagination-prev" style="display: none;"><i class="shell-icon-dropdown facing-left"></i>
        </div>
        <ul class="shell-category-top-level shell-category-brand">
            <li class="c-logo-item"><a id="shell-cat-header-logo" class="c-logo c-top-nav-link" href="https://www.microsoft.com/en-us/dynamics365/home" title="" ms.title="" data-bi-name="Category logo" tabindex="70"><span class="logo-text-label">Dynamics 365</span></a><a id="shell-cat-header-logo-mobile" aria-expanded="false" role="button" aria-haspopup="true" class="c-logo-mobile c-top-nav-link c-nav-dropdown" href="javascript:void(0);" ms.title="" ms.interactiontype="14" data-bi-name="Mobile category logo" tabindex="70"><span class="logo-text-label">Dynamics 365</span><i class="shell-icon-dropdown"></i></a>
                <ul class="c-nav-dropdown-menu" role="menu" data-bi-area="CategoryHeader-" data-bi-view="C1">
                    <li class="c-top-nav-item" id="shellmenu_74-mobilelist"><a id="shellmenu_74-mobile" tabindex="70" aria-haspopup="true" aria-expanded="false" class="c-top-nav-link c-nav-link c-nav-dropdown" href="javascript:void(0);" ms.title="Solutions" role="button" ms.interactiontype="14" data-bi-name="Solutions" data-bi-slot="1" data-show-cta="True"><span>Solutions<i class="shell-icon-dropdown"></i></span></a>
                        <ul aria-hidden="true" class="c-nav-dropdown-menu" data-bi-area="CategoryHeader-" data-bi-view="Solutions-C2" ms.cmpnm="Solutions" role="menu">
                            <li class="c-nav-item "><a id="shellmenu_75-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/sales" ms.title="Sales" data-bi-name="Sales" data-bi-slot="1" tabindex="70"><span>
                    Sales
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_76-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/customer-service" ms.title="Customer Service" data-bi-name="Customer Service" data-bi-slot="2" tabindex="70"><span>
                    Customer Service
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_77-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/operations" ms.title="Operations" data-bi-name="Operations" data-bi-slot="3" tabindex="70"><span>
                    Operations
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_78-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/financials" ms.title="Financials" data-bi-name="Financials" data-bi-slot="4" tabindex="70"><span>
                    Financials
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_79-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/field-service" ms.title="Field Service" data-bi-name="Field Service" data-bi-slot="5" tabindex="70"><span>
                    Field Service
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_80-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/project-service-automation" ms.title="Project Service Automation" data-bi-name="Project Service Automation" data-bi-slot="6" tabindex="70"><span>
                    Project Service Automation
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_81-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/marketing" ms.title="Marketing" data-bi-name="Marketing" data-bi-slot="7" tabindex="70"><span>
                    Marketing
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_82-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/customer-insights" ms.title="Customer Insights" data-bi-name="Customer Insights" data-bi-slot="8" tabindex="70"><span>
                    Customer Insights
                </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="c-top-nav-item" id="shellmenu_83-mobilelist"><a id="shellmenu_83-mobile" tabindex="70" class="c-top-nav-link c-nav-link" href="https://www.microsoft.com/en-us/dynamics365/pricing" ms.title="pricing" data-bi-name="Pricing" data-bi-slot="2" data-show-cta="True" ms.index="2" ms.cmptyp="link" ms.interactiontype="1" ms.cmpgrp="contact us" ms.cmpnm="pricing" ms.pgarea="body" ms.ea_action="ask" ms.ea_offer="prd" ms.ea_name="pricing"><span>Pricing</span></a>
                    </li>
                    <li class="c-top-nav-item" id="shellmenu_84-mobilelist"><a id="shellmenu_84-mobile" tabindex="70" class="c-top-nav-link c-nav-link" href="https://www.microsoft.com/en-us/dynamics365/partners" ms.title="Partners" data-bi-name="Partners" data-bi-slot="3" data-show-cta="True"><span>Partners</span></a>
                    </li>
                    <li class="c-top-nav-item" id="shellmenu_85-mobilelist"><a id="shellmenu_85-mobile" tabindex="70" class="c-top-nav-link c-nav-link" href="https://explore.dynamics.com/" ms.title="Resources" data-bi-name="Resources" data-bi-slot="4" data-show-cta="True"><span>Resources</span></a>
                    </li>
                    <li class="c-top-nav-item" id="shellmenu_86-mobilelist"><a id="shellmenu_86-mobile" tabindex="70" aria-haspopup="true" aria-expanded="false" class="c-top-nav-link c-nav-link c-nav-dropdown" href="javascript:void(0);" ms.title="Support" role="button" ms.interactiontype="14" data-bi-name="Support" data-bi-slot="5" data-show-cta="True"><span>Support<i class="shell-icon-dropdown"></i></span></a>
                        <ul aria-hidden="true" class="c-nav-dropdown-menu" data-bi-area="CategoryHeader-" data-bi-view="Support-C2" ms.cmpnm="Support" role="menu">
                            <li class="c-nav-item "><a id="shellmenu_87-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/contact-us" ms.title="link to contact us" data-bi-name="Contact us" data-bi-slot="1" tabindex="70" ms.index="6" ms.cmptyp="link" ms.interactiontype="1" ms.cmpgrp="link to contact us" ms.cmpnm="contact us" ms.pgarea="body" ms.ea_action="lrn" ms.ea_offer="ser" ms.ea_name="link to contact us"><span>
                    Contact us
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_88-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/paid-support" ms.title="Paid support" data-bi-name="Paid support" data-bi-slot="2" tabindex="70"><span>
                    Paid support
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_89-mobile" class="c-nav-dropdown-item c-nav-link " href="https://docs.microsoft.com/en-us/dynamics365/" ms.title="Documentation" data-bi-name="Documentation" data-bi-slot="3" tabindex="70"><span>
                    Documentation
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_90-mobile" class="c-nav-dropdown-item c-nav-link " href="https://roadmap.dynamics.com/" ms.title="Roadmap" data-bi-name="Roadmap" data-bi-slot="4" tabindex="70"><span>
                    Roadmap
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_91-mobile" class="c-nav-dropdown-item c-nav-link " href="https://docs.microsoft.com/en-us/dynamics365/#pivot=developer" ms.title="Developer resources" data-bi-name="Developer resources" data-bi-slot="5" tabindex="70"><span>
                    Developer resources
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_92-mobile" class="c-nav-dropdown-item c-nav-link " href="https://community.dynamics.com" ms.title="Community forums" data-bi-name="Community forums" data-bi-slot="6" tabindex="70"><span>
                    Community forums
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_93-mobile" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/trustcenter/default.aspx" ms.title="Microsoft Trust Center" data-bi-name="Microsoft Trust Center" data-bi-slot="7" tabindex="70"><span>
                    Microsoft Trust Center
                </span></a>
                            </li>
                            <li class="c-nav-item "><a id="shellmenu_94-mobile" class="c-nav-dropdown-item c-nav-link " href="http://fasttrack.microsoft.com/dynamics" ms.title="FastTrack" data-bi-name="FastTrack" data-bi-slot="8" tabindex="70"><span>
                    FastTrack
                </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="c-top-nav-item" id="shellmenu_95-mobilelist"><a id="shellmenu_95-mobile" tabindex="70" class="c-top-nav-link c-nav-link" href="https://community.dynamics.com/b/msftdynamicsblog" ms.title="Blog" data-bi-name="Blog" data-bi-slot="6" data-show-cta="True"><span>Blog</span></a>
                    </li>
                </ul>
            </li>
        </ul>
        <ul class="c-menu-container shell-category-top-level shell-category-nav-wrapper" role="menu" data-bi-area="CategoryMenuItems-" data-bi-view="C1">
            <li class="c-top-nav-item" id="shellmenu_74list" style="margin-left: -5px;"><a id="shellmenu_74" tabindex="70" aria-haspopup="true" aria-expanded="false" class="c-top-nav-link c-nav-link c-nav-dropdown" href="javascript:void(0);" ms.title="Solutions" role="button" ms.interactiontype="14" data-bi-name="Solutions" data-bi-slot="1" data-show-cta="True"><span>Solutions<i class="shell-icon-dropdown"></i></span></a>
                <ul aria-hidden="true" class="c-nav-dropdown-menu" data-bi-area="CategoryHeader-" data-bi-view="Solutions-C2" ms.cmpnm="Solutions" role="menu">
                    <li class="c-nav-item "><a id="shellmenu_75" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/sales" ms.title="Sales" data-bi-name="Sales" data-bi-slot="1" tabindex="70"><span>
                    Sales
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_76" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/customer-service" ms.title="Customer Service" data-bi-name="Customer Service" data-bi-slot="2" tabindex="70"><span>
                    Customer Service
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_77" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/operations" ms.title="Operations" data-bi-name="Operations" data-bi-slot="3" tabindex="70"><span>
                    Operations
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_78" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/financials" ms.title="Financials" data-bi-name="Financials" data-bi-slot="4" tabindex="70"><span>
                    Financials
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_79" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/field-service" ms.title="Field Service" data-bi-name="Field Service" data-bi-slot="5" tabindex="70"><span>
                    Field Service
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_80" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/project-service-automation" ms.title="Project Service Automation" data-bi-name="Project Service Automation" data-bi-slot="6" tabindex="70"><span>
                    Project Service Automation
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_81" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/marketing" ms.title="Marketing" data-bi-name="Marketing" data-bi-slot="7" tabindex="70"><span>
                    Marketing
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_82" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/customer-insights" ms.title="Customer Insights" data-bi-name="Customer Insights" data-bi-slot="8" tabindex="70"><span>
                    Customer Insights
                </span></a>
                    </li>
                </ul>
            </li>
            <li class="c-top-nav-item" id="shellmenu_83list"><a id="shellmenu_83" tabindex="70" class="c-top-nav-link c-nav-link" href="https://www.microsoft.com/en-us/dynamics365/pricing" ms.title="pricing" data-bi-name="Pricing" data-bi-slot="2" data-show-cta="True" ms.index="3" ms.cmptyp="link" ms.interactiontype="1" ms.cmpgrp="contact us" ms.cmpnm="pricing" ms.pgarea="body" ms.ea_action="ask" ms.ea_offer="prd" ms.ea_name="pricing"><span>Pricing</span></a>
            </li>
            <li class="c-top-nav-item" id="shellmenu_84list"><a id="shellmenu_84" tabindex="70" class="c-top-nav-link c-nav-link" href="https://www.microsoft.com/en-us/dynamics365/partners" ms.title="Partners" data-bi-name="Partners" data-bi-slot="3" data-show-cta="True"><span>Partners</span></a>
            </li>
            <li class="c-top-nav-item" id="shellmenu_85list"><a id="shellmenu_85" tabindex="70" class="c-top-nav-link c-nav-link" href="https://explore.dynamics.com/" ms.title="Resources" data-bi-name="Resources" data-bi-slot="4" data-show-cta="True"><span>Resources</span></a>
            </li>
            <li class="c-top-nav-item" id="shellmenu_86list"><a id="shellmenu_86" tabindex="70" aria-haspopup="true" aria-expanded="false" class="c-top-nav-link c-nav-link c-nav-dropdown" href="javascript:void(0);" ms.title="Support" role="button" ms.interactiontype="14" data-bi-name="Support" data-bi-slot="5" data-show-cta="True"><span>Support<i class="shell-icon-dropdown"></i></span></a>
                <ul aria-hidden="true" class="c-nav-dropdown-menu" data-bi-area="CategoryHeader-" data-bi-view="Support-C2" ms.cmpnm="Support" role="menu">
                    <li class="c-nav-item "><a id="shellmenu_87" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/contact-us" ms.title="link to contact us" data-bi-name="Contact us" data-bi-slot="1" tabindex="70" ms.index="7" ms.cmptyp="link" ms.interactiontype="1" ms.cmpgrp="link to contact us" ms.cmpnm="contact us" ms.pgarea="body" ms.ea_action="lrn" ms.ea_offer="ser" ms.ea_name="link to contact us"><span>
                    Contact us
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_88" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/dynamics365/paid-support" ms.title="Paid support" data-bi-name="Paid support" data-bi-slot="2" tabindex="70"><span>
                    Paid support
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_89" class="c-nav-dropdown-item c-nav-link " href="https://docs.microsoft.com/en-us/dynamics365/" ms.title="Documentation" data-bi-name="Documentation" data-bi-slot="3" tabindex="70"><span>
                    Documentation
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_90" class="c-nav-dropdown-item c-nav-link " href="https://roadmap.dynamics.com/" ms.title="Roadmap" data-bi-name="Roadmap" data-bi-slot="4" tabindex="70"><span>
                    Roadmap
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_91" class="c-nav-dropdown-item c-nav-link " href="https://docs.microsoft.com/en-us/dynamics365/#pivot=developer" ms.title="Developer resources" data-bi-name="Developer resources" data-bi-slot="5" tabindex="70"><span>
                    Developer resources
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_92" class="c-nav-dropdown-item c-nav-link " href="https://community.dynamics.com" ms.title="Community forums" data-bi-name="Community forums" data-bi-slot="6" tabindex="70"><span>
                    Community forums
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_93" class="c-nav-dropdown-item c-nav-link " href="https://www.microsoft.com/en-us/trustcenter/default.aspx" ms.title="Microsoft Trust Center" data-bi-name="Microsoft Trust Center" data-bi-slot="7" tabindex="70"><span>
                    Microsoft Trust Center
                </span></a>
                    </li>
                    <li class="c-nav-item "><a id="shellmenu_94" class="c-nav-dropdown-item c-nav-link " href="http://fasttrack.microsoft.com/dynamics" ms.title="FastTrack" data-bi-name="FastTrack" data-bi-slot="8" tabindex="70"><span>
                    FastTrack
                </span></a>
                    </li>
                </ul>
            </li>
            <li class="c-top-nav-item" id="shellmenu_95list"><a id="shellmenu_95" tabindex="70" class="c-top-nav-link c-nav-link" href="https://community.dynamics.com/b/msftdynamicsblog" ms.title="Blog" data-bi-name="Blog" data-bi-slot="6" data-show-cta="True"><span>Blog</span></a>
            </li>
        </ul>
        <div class="shell-category-header-cta-wrapper" ms.cmpnm="Category cta button"><a id="shell-category-header-cta" class="category-cta-button " ms.title="link to contact us" href="https://www.microsoft.com/en-us/dynamics365/contact-us" data-id="" data-cta-targets="[{&quot;Id&quot;:&quot;&quot;,&quot;ElementName&quot;:&quot;&quot;,&quot;Text&quot;:&quot;Contact us&quot;,&quot;Url&quot;:&quot;https://www.microsoft.com/en-us/dynamics365/contact-us&quot;,&quot;Image&quot;:null,&quot;MobileText&quot;:&quot;Contact us&quot;,&quot;ClassName&quot;:&quot;&quot;,&quot;Lang&quot;:&quot;&quot;}]" data-bi-name="" tabindex="70" ms.index="8" ms.cmptyp="link" ms.interactiontype="1" ms.cmpgrp="link to contact us" ms.cmpnm="contact us" ms.pgarea="body" ms.ea_action="lrn" ms.ea_offer="ser" ms.ea_name="link to contact us"><span class="shell-cta-text">Contact us</span><span class="shell-cta-mobile-text">Contact us</span></a>
        </div>
        <div class="c-nav-pagination c-nav-pagination-next" style="display: none;"><i class="shell-icon-dropdown facing-right"></i>
        </div>
    </div>
</div>


<#list catHeroBanList as catid>
    <#if coreNode.id == catid >
        <div class="lia-hero-section lia-content">

        	<div class="container">
        		<h2 class="welcome-title">Welcome to the Community</h2>
        		<div class="banner-search-form">
        			<@component id="common.widget.search-form" />
        		</div>
        		
        	</div>
        </div>
    </#if>
</#list>

<script type="text/javascript">
// Create a clone of the menu, right next to original.
$('.menu').addClass('original').clone().insertAfter('.menu').addClass('cloned').css('position','fixed').css('top','0').css('margin-top','0').css('z-index','500').removeClass('original').hide();

scrollIntervalID = setInterval(stickIt, 10);


function stickIt() {

  var orgElementPos = $('.original').offset();
  orgElementTop = orgElementPos.top;               

  if ($(window).scrollTop() >= (orgElementTop)) {
    // scrolled past the original position; now only show the cloned, sticky element.

    // Cloned element should always have same left position and width as original element.     
    orgElement = $('.original');
    coordsOrgElement = orgElement.offset();
    leftOrgElement = coordsOrgElement.left;  
    widthOrgElement = orgElement.css('width');
    $('.cloned').css('left',leftOrgElement+'px').css('top',0).css('width',widthOrgElement).show();
    $('.original').css('visibility','hidden');
  } else {
    // not scrolled past the menu; only show the original menu.
    $('.cloned').hide();
    $('.original').css('visibility','visible');
  }
}
 </script>
<@liaBody /></center><#-- ${settings.name.get("layout.urlfetcher_footer_d365tc")} -->
 <#include "layout.urlfetcher_footer_d365.ftl"/>
 <center>