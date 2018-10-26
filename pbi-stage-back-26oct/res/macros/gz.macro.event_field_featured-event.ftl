<div class="featured_event">
<div class="event-field">
   <label>Featured Event?</label>
   <input <#if rolesA?seq_contains("Event Publishing Author") || rolesA?seq_contains("Administrator")><#else>disabled</#if> id="featured_event" <#if article_teaser != '' && article_teaser?eval['IsFeatured']??>CHECKED</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="checkbox" />
</div>
</div>