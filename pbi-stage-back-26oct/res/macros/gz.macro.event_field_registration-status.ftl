<div class="registration_mandatory">
      <div class="event-label">
       <label>**Registration Mandatory</label>
    </div>
    <div class="event-field">
      <select id="e_registration_mandatory">
        <option value="yes" <#if article_teaser != '' && article_teaser?eval['RegistrationMandatory'] == "yes">SELECTED</#if>>Yes</option>
        <option value="no" <#if article_teaser != '' && article_teaser?eval['RegistrationMandatory'] == "no">SELECTED</#if>>No</option>
      </select>
    </div>
    </div>
  <div class="registration_status">
      <div class="event-label">
       <label>**Registration Status</label>
    </div>
    <div class="event-field">
      <select id="registration_status">
        <option value="open" <#if article_teaser != '' && article_teaser?eval['RegistrationStatus'] == "open">SELECTED</#if>>Open</option>
        <option value="waitlist" <#if article_teaser != '' && article_teaser?eval['RegistrationStatus'] == "waitlist">SELECTED</#if>>Waitlist</option>
        <option value="closed" <#if article_teaser != '' && article_teaser?eval['RegistrationStatus'] == "closed">SELECTED</#if>>Closed</option>
        <option value="cancelled" <#if article_teaser != '' && article_teaser?eval['RegistrationStatus'] == "cancelled">SELECTED</#if>>Cancelled</option>
        <option value="no-registration" <#if article_teaser != '' && article_teaser?eval['RegistrationStatus'] == "no-registration">SELECTED</#if>>No Registration</option>
      </select>
    </div>
    </div>