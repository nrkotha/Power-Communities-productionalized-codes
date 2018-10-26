<div class="e_status">
  <div class="event-label">
   <label>**Event Status</label>
</div>
<div class="event-field">
  <select id="e_status">
    <option value="">Select Event Status</option>
    <option value="active" <#if article_teaser != '' && article_teaser?eval['Status'] == "active">SELECTED</#if>>Active</option>
    <option value="cancelled" <#if article_teaser != '' && article_teaser?eval['Status'] == "cancelled">SELECTED</#if>>Cancelled</option>
  </select>
</div>
</div>