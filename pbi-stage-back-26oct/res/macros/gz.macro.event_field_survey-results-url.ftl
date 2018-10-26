<div class="survey_results_url">
  <div class="event-label">
   <label>**Survey Results URL</label>
  </div>
  <div class="event-field">
    <input <#if rolesA?seq_contains("Event Survey") || rolesA?seq_contains("Administrator")><#else>disabled</#if> id="survey_results_url" <#if article_teaser != '' && article_teaser?eval['SurveyResultsUrl']??>value="${article_teaser?eval['SurveyResultsUrl']}"</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="Survey Results URL" />
  </div>
</div>