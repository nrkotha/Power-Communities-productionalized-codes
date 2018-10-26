<div class="registration-date-container">
 
    <div class="register_start_date">
      <input type="hidden" id="e_registration_start_date"  <#if article_teaser != '' && article_teaser?eval['RegistrationOpen']?? && article_teaser?eval['RegistrationOpen'] != ''>value="${article_teaser?eval['RegistrationOpen']?number}"</#if> >
      <div class="date-container">
        <div class="event-label">
           <label>**Registration Open Date</label>
        </div>
        <div class="event-field">
           <input autocomplete="off" style="width:220px" id="e_register_start_date" <#if article_teaser != '' && article_teaser?eval['RegistrationOpen']?? && article_teaser?eval['RegistrationOpen'] != ''>value="${article_teaser?eval['RegistrationOpen']?number?number_to_date?string('dd/MM/yyyy')}"</#if> class="lia-form-type-text lia-form-input-horizontal" type="text" placeholder="Select Register Start Date" />
        </div>
      </div>
      <div class="time-container">
        <select id="e_reg_open_date_hour">
            <#list 1..12 as int >
              <option value="${int}" <#if article_teaser != '' && article_teaser?eval['RegistrationOpen'] != '' && article_teaser?eval['RegistrationOpen']?number?number_to_date?string('hh')?number == int >SELECTED</#if>>${int}</option>
            </#list> 
        </select>
        <select id="e_reg_open_date_min">
            <option value="00" <#if article_teaser != '' && article_teaser?eval['RegistrationOpen'] != '' && article_teaser?eval['RegistrationOpen']?number?number_to_date?string('mm') == "00">SELECTED</#if>>00</option>
            <option value="15" <#if article_teaser != '' && article_teaser?eval['RegistrationOpen'] != '' && article_teaser?eval['RegistrationOpen']?number?number_to_date?string('mm')== "15">SELECTED</#if>>15</option>
            <option value="30" <#if article_teaser != '' && article_teaser?eval['RegistrationOpen'] != '' && article_teaser?eval['RegistrationOpen']?number?number_to_date?string('mm') == "30">SELECTED</#if>>30</option>
            <option value="45" <#if article_teaser != '' && article_teaser?eval['RegistrationOpen'] != '' && article_teaser?eval['RegistrationOpen']?number?number_to_date?string('mm') == "45">SELECTED</#if>>45</option>
        </select>
        <select id="e_reg_open_date_ampm">
            <option value="AM" <#if article_teaser != '' && article_teaser?eval['RegistrationOpen'] != '' && article_teaser?eval['RegistrationOpen']?number?number_to_date?string('am') == "AM">SELECTED</#if>>AM</option>
            <option value="PM" <#if article_teaser != '' && article_teaser?eval['RegistrationOpen'] != '' && article_teaser?eval['RegistrationOpen']?number?number_to_date?string('am') == "PM">SELECTED</#if>>PM</option>
        </select>
      </div>
    </div>

    <div class="register_end_date">
      <input type="hidden" id="e_registration_end_date" <#if article_teaser != '' && article_teaser?eval['RegistrationClose'] != '' && article_teaser?eval['RegistrationOpen']??>value="${article_teaser?eval['RegistrationClose']?number}"</#if>  >
      <div class="date-container">
        <div class="event-label">
           <label>**Registration End Date</label>
        </div>
        <div class="event-field">
           <input autocomplete="off" style="width:220px" id="e_register_end_date" <#if article_teaser != '' && article_teaser?eval['RegistrationClose'] != '' && article_teaser?eval['RegistrationOpen']??>value="${article_teaser?eval['RegistrationClose']?number?number_to_date?string('dd/MM/yyyy')}"</#if> class="lia-form-type-text lia-form-input-horizontal" type="text" placeholder="Select Register End Date" />
        </div>
      </div>
      <div class="time-container">
        <select id="e_reg_end_date_hour">
            <#list 1..12 as int >
                <option value="${int}" <#if article_teaser != '' && article_teaser?eval['RegistrationClose'] != '' && article_teaser?eval['RegistrationClose']?number?number_to_date?string('hh')?number == int >SELECTED</#if>>${int}</option>
            </#list>
        </select>
        <select id="e_reg_end_date_min">
            <option value="00" <#if article_teaser != '' && article_teaser?eval['RegistrationClose'] != '' && article_teaser?eval['RegistrationClose']?number?number_to_date?string('mm') == "00">SELECTED</#if>>00</option>
            <option value="15" <#if article_teaser != '' && article_teaser?eval['RegistrationClose'] != '' && article_teaser?eval['RegistrationClose']?number?number_to_date?string('mm') == "15">SELECTED</#if>>15</option>
            <option value="30" <#if article_teaser != '' && article_teaser?eval['RegistrationClose'] != '' && article_teaser?eval['RegistrationClose']?number?number_to_date?string('mm') == "30">SELECTED</#if>>30</option>
            <option value="45" <#if article_teaser != '' && article_teaser?eval['RegistrationClose'] != '' && article_teaser?eval['RegistrationClose']?number?number_to_date?string('mm') == "45">SELECTED</#if>>45</option>
        </select>
        <select id="e_reg_end_date_ampm">
            <option value="AM" <#if article_teaser != '' && article_teaser?eval['RegistrationClose'] != '' && article_teaser?eval['RegistrationClose']?number?number_to_date?string('am') == "AM">SELECTED</#if>>AM</option>
            <option value="PM" <#if article_teaser != '' && article_teaser?eval['RegistrationClose'] != '' && article_teaser?eval['RegistrationClose']?number?number_to_date?string('am') == "PM">SELECTED</#if>>PM</option>
        </select>
      </div>
    </div>
  </div>