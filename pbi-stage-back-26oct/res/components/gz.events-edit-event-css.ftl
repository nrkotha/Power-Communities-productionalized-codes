<!-- gz.events-edit-event-css --> 
<style>

<#if page.name == "EditPage" && article_teaser!= '' && article_teaser?eval['Category']?? && article_teaser?eval['Category'] == "Online">
#lia-body .lia-content input.lia-form-microsoftmsg-event-location-input.lia-form-type-text.lia-form-input-vertical,
.lia-form-row.lia-form-microsoft-msg-event-street-entry,
.lia-form-row.lia-form-microsoft-msg-event-city-entry,
.lia-form-row.lia-form-microsoft-msg-event-state-entry,
.lia-form-row.lia-form-microsoft-msg-event-country-entry{
  display: none;
}
</#if>

  .lia-quilt-column.lia-quilt-column-06.lia-quilt-column-right.lia-input-edit-form-column{
      display: none;
  }
  
  #lia-body .lia-content label {
    cursor: default;
  }
  input[disabled],
  select[disabled] {
      opacity: 0.5;
      cursor: no-drop !important;
  }
    #lia-body .lia-content .special-permissions input[type="checkbox"] {
      width: 15px;
      height: 15px;
      margin-left: 15px;
  }

    #lia-body .lia-content .lia-inline-ajax-feedback.lia-inline-ajax-feedback-persist.lia-saved-autosave-feedback,
  #lia-body .lia-content .InfoMessage.lia-panel-feedback-banner-note.lia-autosave-options {
    display: none;
  }
  #lia-body.PostPage .lia-content .events_fields select:last-child,
  #lia-body.EditPage .lia-content .events_fields select:last-child,
  #lia-body.PostPage .lia-content .event-field select#e_timezone,
  #lia-body.EditPage .lia-content .event-field select#e_timezone,
  #lia-body .lia-content input[type='text'].lia-form-type-text.lia-form-input-horizontal.full-width {
    width:500px;
  }
    
  
  #lia-body.PostPage .lia-content .lia-component-editor .lia-form-fieldset textarea,
  #lia-body.EditPage .lia-content .MessageEditorForm .lia-form-fieldset textarea {
    border: 1px solid #cccccc;
  }

  #lia-body.PostPage .lia-content .lia-component-editor .lia-form-fieldset input[type='text'],
  #lia-body.EditPage .lia-content .MessageEditorForm .lia-form-fieldset input[type='text'] {
    border: 1px solid #cccccc;
    height: 43px;
  }

  #lia-body.EditPage .lia-content .MessageEditorForm .lia-form-fieldset select,
  #lia-body.PostPage .lia-content .lia-component-editor .lia-form-fieldset select{
    border: 1px solid #cccccc;
    height: 43px;
  }

  .register_start_date, 
  .register_end_date {
    float: left;
    width: 32%;
  }
  #lia-body.lia-body.PostPage .lia-content .MessageEditorForm .time-container > select {
      float: left;
      width: 67px;
      margin-top: 20px;
  }
  #lia-body.lia-body.EditPage .lia-content .MessageEditorForm .time-container > select {
      float: left;
      width: 67px;
      margin-top: 20px;
  }
  .registration-date-container {
    display: inline-block;
    float: left;
    width: 100%;
  }
  #lia-body.PostPage .lia-content .registration-date-container .event-field input[type='text'],
  #lia-body.EditPage .lia-content .registration-date-container .event-field input[type='text'] {
    width: 200px;
  }

  #lia-body .lia-content .lia-form select{
    margin: 0px 0 0 0;
  }
  input.lia-form-microsoftmsg-start-date-input,
  input.lia-form-microsoftmsg-end-date-input,
  select#s_hourid1,
  select#s_minid1,
  select#s_amid1,
  select#e_hourid1,
  select#e_minid1,
  select#e_amid1{
    display: inline-block;
    float: left;
  }
  #lia-body .event-tab-list {
    border-bottom: 1px solid #e8e8e8;
    margin: 15px 0 1px;
  }
  #lia-body .event-tab-list li {
    display: inline-block;
    padding: 0 30px 8px;
    cursor: pointer;
    font-size: 18px;
  }
  #lia-body .event-tab-list li.active {
    border-bottom: 2px solid #F2C811;
    pointer-events: none;
  }
  #lia-body .lia-form-microsoft-msg-event-location-entry .lia-form-label-wrapper {
    display: none;
  }
  #lia-body .event-list-tabs {
    margin: 20px 0px;
  }
  .lia-form-row.lia-form-teaser-entry {
    display: none;
  }
  #lia-body .lia-form-microsoft-msg-event-additional-entry,
  #lia-body .lia-form-microsoft-msg-event-metadata-entry,
  #lia-body .lia-form-microsoft-msg-event-status-entry{
    display:none;
  }
  #lia-body.lia-body.PostPage .lia-content .MessageEditorForm .lia-form-fieldset .required,
  #lia-body.lia-body.EditPage .lia-content .MessageEditorForm .lia-form-fieldset .required,
  #lia-body .lia-content .mce-tinymce.mce-container.mce-panel.required {
    border: 1px solid #ff0039;
      box-shadow: 0px 0px 4px #ff0039;
  }
  #lia-body.PostPage .lia-content .lia-component-editor .lia-form-fieldset #microsoftmsg_event_country,
  #lia-body.EditPage .lia-content .MessageEditorForm .lia-form-fieldset #microsoftmsg_event_country{
    display: inline-block;
    width: 235px;
  }
  #lia-body.PostPage .lia-content .lia-component-editor .lia-form-fieldset .e_zip,
  #lia-body.EditPage .lia-content .MessageEditorForm .lia-form-fieldset .e_zip{
    display: inline-block;
      width: 140px;
  }
  #lia-body .lia-content .lia-form input[type="file"]{
    padding-top:0px;
  }

  .lia-form-row.lia-form-microsoft-msg-start-date-entry .lia-form-label-wrapper {
      display: none;
  }
  .field-absolute{
    display:none;
  }
</style>