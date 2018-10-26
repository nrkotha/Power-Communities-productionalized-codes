<div class="cost">
  <#assign Currency = '' /> 
  <#assign Cost = '' /> 

  <#if article_teaser != '' && article_teaser?eval['RegistrationFee']??>
      <#assign RegistrationFee = article_teaser?eval['RegistrationFee']?split(' ') />
      <#assign Cost = RegistrationFee[0] />
      <#assign Currency = RegistrationFee[1] />
  </#if>

  <div class="event-label">
    <label>**Event Cost</label>
  </div>
  <div class="event-field">
     <input id="e_cost" value="${Cost}" class="lia-form-type-text lia-form-input-horizontal" type="text" placeholder="cost" />
     <select class="e_currency" id="e_currency" style="display: inline; width: 146px;">
        <option value="usd" <#if Currency == "USD">SELECTED</#if> >USD</option>
        <option value="euro" <#if Currency == "EUR">SELECTED</#if> >Euro</option>
        <option value="euro" <#if Currency == "AUD">SELECTED</#if> >AUD</option>
        <option value="usd" <#if Currency == "CAD">SELECTED</#if> >CAD</option>
        <option value="euro" <#if Currency == "GBP">SELECTED</#if> >GBP</option>
        <option value="usd" <#if Currency == "CHF">SELECTED</#if> >CHF</option>
      </select>
  </div>
</div>