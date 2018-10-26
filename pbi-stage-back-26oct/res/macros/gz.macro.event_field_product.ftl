<div class="product">
  <div class="event-label">
   <label>**Product</label>
</div>
<div class="event-field">
  <select id="e_product" multiple style="height: 92px;">
    <option value="">Select Product</option>
    <#list product_options_array as product_option>
      <#assign selected = "" />
      <#if article_teaser != ''> 
      <#assign e_product_array = article_teaser?eval['Product']?split(',')/>
      <#list e_product_array as e_product>
        <#if e_product == product_option.title>
        <#assign selected = "selected" />
        <#break>
      </#if>
      </#list>
      </#if>
     <option value="${product_option.title}" ${selected}>${product_option.title}</option>
    </#list>
  </select>
</div>
</div>