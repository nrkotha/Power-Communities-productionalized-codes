<div class="assistance_request">
        <div class="event-label">
         <label>Request Event Assistance?</label>
      </div>
      <div class="event-field">
        <select id="assistance_request" <#if rolesA?seq_contains("Event Assistance") || rolesA?seq_contains("Administrator")><#else>disabled</#if>>
          <option value="">Select Asistance Request</option>
          <option value="speaker" <#if article_teaser != '' && article_teaser?eval['AssistanceRequest']?? && article_teaser?eval['AssistanceRequest'] == "speaker">SELECTED</#if>>Speaker</option>
          <option value="swag" <#if article_teaser != '' && article_teaser?eval['AssistanceRequest']?? && article_teaser?eval['AssistanceRequest'] == "swag">SELECTED</#if>>Swag</option>
          <option value="food" <#if article_teaser != '' && article_teaser?eval['AssistanceRequest']?? && article_teaser?eval['AssistanceRequest'] == "food">SELECTED</#if>>Food</option>
          <option value="venue" <#if article_teaser != '' && article_teaser?eval['AssistanceRequest']?? && article_teaser?eval['AssistanceRequest'] == "venue">SELECTED</#if>>Venue</option>
          <option value="other" <#if article_teaser != '' && article_teaser?eval['AssistanceRequest']?? && article_teaser?eval['AssistanceRequest'] == "other">SELECTED</#if>>Other</option>
        </select>
      </div>
      </div>