<#include "common_utils.ftl" />

<#if (page.name=="PostPage" || page.name=="EditPage" ) && isTopicMessage()>
    <@liaAddScript>
function getAdditionalData(html, tagId) {
    var div = $('<div>').html(html);

    if (div.find('span.' + tagId).length > 0) {
        return div.find('span.' + tagId).html();
    } else {
        return "";
    }
}

function removeAdditionalData(html, tagId) {
    var div = $('<div>').html(html);

    div.find('span.' + tagId).remove();

    return div.html();
}

(function ($) {
    $('.lia-breadcrumb .lia-breadcrumb-node.final-crumb span').html("New Submission");
    $('.lia-form-subject-entry label').html('Title').show();
    $('.lia-form-body-entry label').html('Description').show();
    $('.lia-form-attachments-fieldset-toggle legend').html('Thumbnail image').show();
    $('.lia-form-submit .lia-button-primary.lia-button-Submit-action').val('Publish').show();
    $(".lia-form-fieldset label").append('<span class="field-required">*</span>');
    $('.lia-form-attachments-fieldset-toggle legend').append('<span class="field-required">*</span>');

<#-- Power BI Desktop file -->
    $('.lia-new-attachments-field .lia-new-attachment.lia-js-hidden').removeClass('lia-js-hidden').addClass('lia-js-visible');
    $('.lia-new-attachments-field .lia-new-attachment:eq(1)').before('<legend class="lia-fieldset-title">Power BI Desktop file</legend>');
    $('.lia-new-attachments-field .lia-remove-new-attachment').remove();
    $('.lia-form-attachments-fieldset-toggle .lia-add-new-attachment').removeAttr('checked');
    $('.lia-new-attachments-field input.lia-form-type-file:eq(0)').attr('accept', '.jpg,.png');
    $('.lia-new-attachments-field input.lia-form-type-file:eq(1)').attr('accept', '.pbix');

    $('#microsoftmsg_category').val($('#lia-labels').val());
    setMultiselectOptions($('#microsoftmsg_category'));
    $('.lia-form-row.lia-form-microsoftmsg-category-entry').insertAfter('form .lia-form-fieldset .MessageEditor').show();

    try {
        var reportUrl = getAdditionalData($('#tinyMceEditor').val(), 'reportid');
        if (reportUrl != "") {
            $('#microsoftmsg_report_url').val('https://app.powerbi.com/view?r=' + reportUrl);
        }
        $('#tinyMceEditor').val(removeAdditionalData($('#tinyMceEditor').val(), 'reportid'));
    } catch (err) {
        // comments is not a valid JSON
    }
    $('.lia-form-row.lia-form-microsoftmsg-report-url-entry').insertAfter('form .lia-form-fieldset .lia-form-subject-entry').show();
    
    /* Commenting following code as part of MC-5 by iTalent. Unable to save post when there is Rich Text elements in the body.
	Replacing form submit with publish button click event. Since lithium is firing form submit multiple times before actual submission 
	$('#form').submit(function (e) {
	*/
	$('.lia-button-Submit-action').bind('click', function(e) {

        var $btn = $(document.activeElement);
        if ($btn.length && $btn.is('input[type="submit"]') && $btn.val() == 'Cancel') {
            return true;
        }

          if ($('#lia-subject').val() == '') {
            $('.lia-form-subject-input .lia-autocomplete-input').addClass('lia-form-field-error');

            $('html, body').animate({
                scrollTop: $('.lia-form-subject-input .lia-autocomplete-input').offset().top
            }, 200);

            return false;
        }
        $('p#describedBy_microsoftmsg_category.lia-form-error-text').remove();
        $('p#describedBy_microsoftmsg_report_url.lia-form-error-text').remove();
        $('p#describedBy_microsoftmsg_attachments.lia-form-error-text').remove();

		var optional = $('#microsoftmsg_report_url').attr('optional');
        if(optional.toLowerCase() != "true" || $('#microsoftmsg_report_url').val() != "") {
			/* var urlValidatorRegex = /^(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?$/; */
			var urlValidatorRegex = /^(http|https):(\/\/app.powerbi.com\/view\?r=)([0-9a-zA-Z]+)$/;
			if (!urlValidatorRegex.test($('#microsoftmsg_report_url').val()) || $('#microsoftmsg_report_url').val().length > 2083) {
				$('.lia-form-microsoftmsg-report-url-input').addClass('lia-form-field-error');

				if ($('input.lia-form-microsoftmsg-report-url-input + p').length == 0) {
				  $('input.lia-form-microsoftmsg-report-url-input').after('<p role="alert" id="describedBy_microsoftmsg_report_url" class="lia-form-error-text">Please enter a valid Publish to Web URL for this field.</p>');
				}

				$('html, body').animate({
				  scrollTop: $('.lia-form-microsoftmsg-report-url-entry').offset().top
				}, 200);

				return false;
			}
        }

        if ($('#microsoftmsg_category').val() == '') {
            $('.lia-form-microsoftmsg-category-select').addClass('lia-form-field-error');

            if ($('dl.lia-form-microsoftmsg-category-select + p').length == 0) {
                $('dl.lia-form-microsoftmsg-category-select').after('<p role="alert" id="describedBy_microsoftmsg_category" class="lia-form-error-text">Please select a category.</p>');
            }

            $('html, body').animate({
                scrollTop: $('.lia-form-microsoftmsg-category-entry').offset().top
            }, 200);

            return false;
        }

        var imageAttached = false;
        var imageAttachedTester = /\.png|\.jpg/;
        $.each($('#existingAttachmentsField .lia-attachment-link:not(".lia-attachment-link-disabled")'), function (index, value) {
            if (imageAttachedTester.test($(value).text().toLowerCase())) {
                imageAttached = true;
            }
        });
        $.each($('#previewAttachmentsField .lia-attachment-link:not(".lia-attachment-link-disabled")'), function (index, value) {
            if (imageAttachedTester.test($(value).text().toLowerCase())) {
                imageAttached = true;
            }
        });

        if (!imageAttached) {
            if ($('.lia-form-attachments-fieldset-toggle .lia-add-new-attachment:eq(0):checked').length == 0) {
                $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(0)').addClass('lia-form-field-error');

                if ($('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(0) + p').length == 0) {
                    $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(0)').after('<p role="alert" id="describedBy_microsoftmsg_attachments" class="lia-form-error-text">Please add a thumbnail image.</p>');
                }

                $('html, body').animate({
                    scrollTop: $('.lia-form-attachments-fieldset-toggle').offset().top
                }, 200);

				return false;
            }
        }

        var thumbnailFile = $('.lia-form-attachments-fieldset-toggle .lia-form-type-file:eq(0)').val();
        if (thumbnailFile != "" && !imageAttachedTester.test(thumbnailFile.toLowerCase())) {
            $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(0)').addClass('lia-form-field-error');

            if ($('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(0) + p').length == 0) {
                $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(0)').after('<p role="alert" id="describedBy_microsoftmsg_attachments" class="lia-form-error-text">The Thumbnail image type must be \'.JPG\' or \'.PNG\'.</p>');
            }

            $('html, body').animate({
                scrollTop: $('.lia-form-attachments-fieldset-toggle').offset().top
            }, 200);

			return false;
        }

        var pbiDesktopAttachedTester = /\.pbix/;
        var pbiDesktopFile = $('.lia-form-attachments-fieldset-toggle .lia-form-type-file:eq(1)').val();
        if (pbiDesktopFile != "" && !pbiDesktopAttachedTester.test(pbiDesktopFile.toLowerCase())) {
            $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(1)').addClass('lia-form-field-error');

            if ($('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(1) + p').length == 0) {
                $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(1)').after('<p role="alert" id="describedBy_microsoftmsg_attachments" class="lia-form-error-text">The Power BI desktop file type must be \'.PBIX\'.</p>');
            }

            $('html, body').animate({
                scrollTop: $('.lia-form-attachments-fieldset-toggle').offset().top
            }, 200);

			return false;
        }

        $('#lia-labels').val($('#microsoftmsg_category').val());

        var matches = $('#microsoftmsg_report_url').val().match(urlValidatorRegex)
        var additionalData = '<span class="reportid hidden">' + matches[matches.length - 1] + '</span>';
		
		/* Commenting following code as part of MC-5 by iTalent. Removing additionalData before adding new data.
	
			$('#tinyMceEditor').val($('#tinyMceEditor').val() + additionalData);
			$('.mce-edit-area iframe').contents().find('body').html($('.mce-edit-area iframe').contents().find('body').html() + additionalData);
		
		*/
        $('#tinyMceEditor').val(removeAdditionalData($('#tinyMceEditor').val(), 'reportid') + additionalData);
        $('.mce-edit-area iframe').contents().find('body').html(removeAdditionalData($('.mce-edit-area iframe').contents().find('body').html(), 'reportid') + additionalData);
		

        window.onbeforeunload = null;

        return true;
    });

    $('#microsoftmsg_report_url').change(function () {
        $('.lia-form-microsoftmsg-report-url-input').removeClass('lia-form-field-error');
        $('input.lia-form-microsoftmsg-report-url-input + p').remove();
		
		$('form .lia-form-submit .lia-link-disabled').removeClass('lia-link-disabled');
		$('form .lia-form-submit .lia-button-overlay').remove();
    });

    $('.lia-form-attachments-fieldset-toggle .lia-form-type-file:eq(0)').change(function () {
        $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(0)').removeClass('lia-form-field-error');
        $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(0) + p').remove();
		
		$('form .lia-form-submit .lia-link-disabled').removeClass('lia-link-disabled');
		$('form .lia-form-submit .lia-button-overlay').remove();
    });

    $('.lia-form-attachments-fieldset-toggle .lia-form-type-file:eq(1)').change(function () {
        $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(1)').removeClass('lia-form-field-error');
        $('.lia-form-attachments-fieldset-toggle .lia-new-attachment:eq(1) + p').remove();
		
		$('form .lia-form-submit .lia-link-disabled').removeClass('lia-link-disabled');
		$('form .lia-form-submit .lia-button-overlay').remove();
    });
})(LITHIUM.jQuery);
	</@liaAddScript>
</#if>
