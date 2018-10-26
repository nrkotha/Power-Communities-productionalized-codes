<#include "common_utils.ftl" />

<#assign nodeId=coreNode.id />
<#if nodeId=="jgvjg48436"> <!-- for preview only -->
    <#assign nodeId="PowerAppsForum1" />
</#if>

<#attempt>
    <#assign moderatorRole=env.context.component.getParameter("moderatorRole") />
<#recover>
    <#assign moderatorRole="moderator" />
</#attempt>

<#attempt>
    <#assign featured=env.context.component.getParameter("featuredCategory") />
<#recover>
    <#assign featured="featured" />
</#attempt>

<#if featured?has_content >
	<#assign featured=featured?lower_case />
</#if>

<#assign moderator = false />
<#if user.registered && moderatorRole?has_content >
	<#assign moderatorRole=moderatorRole?lower_case />
	<#list restadmin("/users/id/" + user.id + "/roles").roles.role as role>
		<#if role.name?? && (role.name?lower_case == moderatorRole)>
		   <#assign moderator = true />
		</#if>
	</#list>
</#if>

<#assign labels=restadmin("/boards/id/${nodeId}/settings/name/label.predefined_labels").value />

<#if (page.name=="PostPage" || page.name=="EditPage" ) && isTopicMessage()>
	<div class="lia-form-row lia-form-microsoftmsg-category-entry" style="display: none;">
        <div class="lia-form-label-wrapper lia-custom-tooltip-container">
            <label for="microsoftmsg_category" class="lia-form-label">Category
            <span class="field-required">*</span>
            </label>
        </div>
        <div class="lia-quilt-row lia-quilt-row-standard">
            <div class="lia-quilt-column lia-quilt-column-24 lia-quilt-column-single">
                <div class="lia-quilt-column-alley lia-quilt-column-alley-single">
                    <div class="lia-form-microsoftmsg-category-select">
                        <dl class="lia-form-multiselect lia-form-microsoftmsg-category-select"> 
						<dt>
							<a class="lia-form-multiselect-text">Select categories</a>
							<input id="microsoftmsg_category" name="microsoftmsg_category" class="lia-form-multiselect-value" type="hidden" />
						</dt>
						<dd>
							<div class="lia-form-multiselect-list">
								<ul>
								<#list labels?split(",") as value>
									<#if value?trim?lower_case?contains(featured) == false || moderator == true >
										<li><input type="checkbox" value="${value?trim}" />${value?trim}</li>
									</#if>
								</#list>
								</ul>
							</div>
						</dd>
                      </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<@liaAddScript>
$(".lia-form-multiselect dt a").on('click', function (event) {
    event.preventDefault();
    if (!$(".lia-form-multiselect dd ul").is(":visible")) {
        $(".mce-edit-area iframe").contents().on('click', hideMultiselect);
    } else {
        $(".mce-edit-area iframe").contents().off('click', hideMultiselect);
    }

    $(".lia-form-multiselect dd ul").slideToggle('fast');
});

$(document).on('click', hideMultiselect);

$('.lia-form-multiselect .lia-form-multiselect-list input[type="checkbox"]').on('click', function (event) {
    event.stopPropagation();
    setMultiselectValue(this);
});

$('.lia-form-multiselect .lia-form-multiselect-list li').on('click', function () {
    var option = $(this).find('input[type="checkbox"]');
    option.prop("checked", !option.prop("checked"));
    setMultiselectValue(option);
});

function hideMultiselect(e) {
    var $clicked = $(e.target);
    if (!$clicked.parents().hasClass("lia-form-multiselect")) {
        $(".mce-edit-area iframe").contents().off('click', hideMultiselect);
        $(".lia-form-multiselect dd ul").hide();
    }
}

function setMultiselectValue(option) {
    var options = $(option).closest('.lia-form-multiselect-list').find('input[type="checkbox"]:checked');
    var selected = "";
    options.each(function () {
        selected += $(this).attr('value') + ', ';
    });

    $(option).closest('.lia-form-multiselect').find('.lia-form-multiselect-value').val(selected);
    $(option).closest('.lia-form-multiselect').find('.lia-form-multiselect-value').change();

    if (selected == "") {
        selected = "Select categories";
    }
    $(option).closest('.lia-form-multiselect').find('.lia-form-multiselect-text').text(selected);

    $('.lia-form-microsoftmsg-category-select').removeClass('lia-form-field-error');
    $('dl.lia-form-microsoftmsg-category-select + p').remove();
    $('form .lia-form-submit .lia-link-disabled').removeClass('lia-link-disabled');
    $('form .lia-form-submit .lia-button-overlay').remove();
}

function setMultiselectOptions(input) {
    var value = $(input).val();

    if (value != '') {
        var options = $(input).closest('.lia-form-multiselect').find('input[type="checkbox"]');

        var array = value.split(",");
        $.each(array, function (i) {
            options.filter('[value="' + $.trim(array[i]) + '"]').prop("checked", true);
        });

        setMultiselectValue(options[0]);
    }
}
</@liaAddScript>
</#if>
