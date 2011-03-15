<cfparam name="rc.$" type="any" />
<cfparam name="rc.productSmartList" type="any" />

<cfoutput>
<ul id="navTask">
    <cf_ActionCaller action="admin:product.create" type="list">
</ul>

<div class="svoadminproductlist">
	<form method="post">
		<input name="Keyword" value="#rc.Keyword#" /> <button type="submit">Search</button>
	</form>

	<table id="ProductList" class="stripe">
		<tr>
			<!---<th>Search Score</th>--->
			<th>#rc.$.Slatwall.rbKey("entity.brand")#</th>
			<th class="varWidth">#rc.$.Slatwall.rbKey("entity.product.productName")#</th>
			<th>#rc.$.Slatwall.rbKey("entity.product.productYear_title")#</th>
			<!---<th>Product Code</th>--->
			<th>#rc.$.Slatwall.rbKey("entity.product.qoh")#</th>
			<th>#rc.$.Slatwall.rbKey("entity.product.qoo")#</th>
			<th>#rc.$.Slatwall.rbKey("entity.product.qc")#</th>
			<th>#rc.$.Slatwall.rbKey("entity.product.qia")#</th>
			<th>#rc.$.Slatwall.rbKey("entity.product.qea")#</th>
			<th>&nbsp</th>
		</tr>
	<!--- since we are looping through an array, not a recordset, I'll use a counter do the alternate row table formatting --->		
		<cfloop array="#rc.ProductSmartList.getPageRecords()#" index="Local.Product">
			<tr>
				<!---<td>#Local.Product.getSearchScore()#</td>--->
				<td>#Local.Product.getBrand().getBrandName()#</td>
				<td class="varWidth">#Local.Product.getProductName()#</td>
				<td>#Local.Product.getProductYear()#</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td class="administration">
					<cfset local.productID = Local.Product.getProductID() />
		          <ul class="four">
                      <cf_ActionCaller action="admin:product.edit" querystring="productID=#local.productID#" class="edit" type="list">            
					  <cf_ActionCaller action="admin:product.detail" querystring="productID=#local.productID#" class="viewDetails" type="list">
					  <li class="preview"><a href="#local.product.getProductURL()#">Preview Product</a></li>
					  <cf_ActionCaller action="admin:product.delete" querystring="productID=#local.productID#" class="delete" type="list" disabled="false" confirmrequired="true">
		          </ul>     						
				</td>
			</tr>
		</cfloop>
	</table>
</div>
</cfoutput>
