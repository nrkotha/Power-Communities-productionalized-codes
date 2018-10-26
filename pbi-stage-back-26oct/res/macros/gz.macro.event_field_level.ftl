<div class="level">
  <div class="event-label">
  <label>**Level</label>
</div>
<div class="event-field">
  <select id="e_level">
    <option value="">Select Level</option>
    <option value="100" <#if article_teaser != '' && article_teaser?eval['Level']?? && article_teaser?eval['Level'] == "100">SELECTED</#if>>100</option>
    <option value="200" <#if article_teaser != '' && article_teaser?eval['Level']?? && article_teaser?eval['Level'] == "200">SELECTED</#if>>200</option>
    <option value="300" <#if article_teaser != '' && article_teaser?eval['Level']?? && article_teaser?eval['Level'] == "300">SELECTED</#if>>300</option>
    <option value="400" <#if article_teaser != '' && article_teaser?eval['Level']?? && article_teaser?eval['Level'] == "400">SELECTED</#if>>400</option>
  </select>
</div>
</div>