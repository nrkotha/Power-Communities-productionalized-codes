<#macro displayCategorySquares>
	<div class="category-squares-wrapper">
		<#local result = rest("2.0","/search?q="+"select * from categories where hidden=false"?url("utf-8"))![] />
		<#if result?? && result.data?? && result.data.items??>
			<#list result.data.items as category>
				<div class="category-square board-${category.id}">
					<div class="board-content">
						<div class="board-title move-up"><#if category.short_title?has_content >${category.short_title}<#else>${category.title}</#if></div>
						<div class="board-desc move-up">${category.description}</div>
						<div class="board-links fade-in">
							<div class="zuora-button-wrapper">
								<a class="button-link" href="${category.view_href}">${text.format("community.view-all")}</a>
							</div>
						</div>
					</div>
				</div>
			</#list>
		</#if>
	</div>
</#macro>