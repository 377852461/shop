[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.role.edit")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<style type="text/css">
.authorities label {
	min-width: 120px;
	_width: 120px;
	display: block;
	float: left;
	padding-right: 4px;
	_white-space: nowrap;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $selectAll = $("#inputForm .selectAll");
	
	[@flash_message /]
	
	$selectAll.click(function() {
		var $this = $(this);
		var $thisCheckbox = $this.closest("tr").find(":checkbox");
		if ($thisCheckbox.filter(":checked").size() > 0) {
			$thisCheckbox.prop("checked", false);
		} else {
			$thisCheckbox.prop("checked", true);
		}
		return false;
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			authorities: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.role.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${role.id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Role.name")}:
				</th>
				<td>
					<input type="text" name="name" class="text" value="${role.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Role.description")}:
				</th>
				<td>
					<input type="text" name="description" class="text" value="${role.description}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					&nbsp;
				</td>
			</tr>
			[#if admin.username =="admin" ]
			<!--超级管理员开始 -->
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.productGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:product"[#if role.authorities?seq_contains("admin:product")] checked="checked"[/#if] />${message("admin.role.product")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:productCategory"[#if role.authorities?seq_contains("admin:productCategory")] checked="checked"[/#if] />${message("admin.role.productCategory")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:parameterGroup"[#if role.authorities?seq_contains("admin:parameterGroup")] checked="checked"[/#if] />${message("admin.role.parameterGroup")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:attribute"[#if role.authorities?seq_contains("admin:attribute")] checked="checked"[/#if] />${message("admin.role.attribute")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:specification"[#if role.authorities?seq_contains("admin:specification")] checked="checked"[/#if] />${message("admin.role.specification")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:brand"[#if role.authorities?seq_contains("admin:brand")] checked="checked"[/#if] />${message("admin.role.brand")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:productNotify"[#if role.authorities?seq_contains("admin:productNotify")] checked="checked"[/#if] />${message("admin.role.productNotify")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:audit"[#if role.authorities?seq_contains("admin:audit")] checked="checked"[/#if] />${message("admin.main.audit")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.orderGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:order"[#if role.authorities?seq_contains("admin:order")] checked="checked"[/#if] />${message("admin.role.order")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:print"[#if role.authorities?seq_contains("admin:print")] checked="checked"[/#if] />${message("admin.role.print")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:payment"[#if role.authorities?seq_contains("admin:payment")] checked="checked"[/#if] />${message("admin.role.payment")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:refunds"[#if role.authorities?seq_contains("admin:refunds")] checked="checked"[/#if] />${message("admin.role.refunds")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:shipping"[#if role.authorities?seq_contains("admin:shipping")] checked="checked"[/#if] />${message("admin.role.shipping")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:returns"[#if role.authorities?seq_contains("admin:returns")] checked="checked"[/#if] />${message("admin.role.returns")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryCenter"[#if role.authorities?seq_contains("admin:deliveryCenter")] checked="checked"[/#if] />${message("admin.role.deliveryCenter")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryTemplate"[#if role.authorities?seq_contains("admin:deliveryTemplate")] checked="checked"[/#if] />${message("admin.role.deliveryTemplate")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.memberGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:member"[#if role.authorities?seq_contains("admin:member")] checked="checked"[/#if] />${message("admin.role.member")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:memberRank"[#if role.authorities?seq_contains("admin:memberRank")] checked="checked"[/#if] />${message("admin.role.memberRank")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:memberAttribute"[#if role.authorities?seq_contains("admin:memberAttribute")] checked="checked"[/#if] />${message("admin.role.memberAttribute")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:review"[#if role.authorities?seq_contains("admin:review")] checked="checked"[/#if] />${message("admin.role.review")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:consultation"[#if role.authorities?seq_contains("admin:consultation")] checked="checked"[/#if] />${message("admin.role.consultation")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.contentGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:navigation"[#if role.authorities?seq_contains("admin:navigation")] checked="checked"[/#if] />${message("admin.role.navigation")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:article"[#if role.authorities?seq_contains("admin:article")] checked="checked"[/#if] />${message("admin.role.article")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:articleCategory"[#if role.authorities?seq_contains("admin:articleCategory")] checked="checked"[/#if] />${message("admin.role.articleCategory")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:tag"[#if role.authorities?seq_contains("admin:tag")] checked="checked"[/#if] />${message("admin.role.tag")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:friendLink"[#if role.authorities?seq_contains("admin:friendLink")] checked="checked"[/#if] />${message("admin.role.friendLink")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:adPosition"[#if role.authorities?seq_contains("admin:adPosition")] checked="checked"[/#if] />${message("admin.role.adPosition")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:ad"[#if role.authorities?seq_contains("admin:ad")] checked="checked"[/#if] />${message("admin.role.ad")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:template"[#if role.authorities?seq_contains("admin:template")] checked="checked"[/#if] />${message("admin.role.template")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:cache"[#if role.authorities?seq_contains("admin:cache")] checked="checked"[/#if] />${message("admin.role.cache")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:static"[#if role.authorities?seq_contains("admin:static")] checked="checked"[/#if] />${message("admin.role.static")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:index"[#if role.authorities?seq_contains("admin:index")] checked="checked"[/#if] />${message("admin.role.index")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:tagProduct"[#if role.authorities?seq_contains("admin:tagProduct")] checked="checked"[/#if] />${message("admin.main.tagProduct")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:tagProductApply"[#if role.authorities?seq_contains("admin:tagProductApply")] checked="checked"[/#if] />${message("admin.role.tagProductApply")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:adApply"[#if role.authorities?seq_contains("admin:adApply")] checked="checked"[/#if] />${message("admin.role.adApply")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.marketingGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:promotion"[#if role.authorities?seq_contains("admin:promotion")] checked="checked"[/#if] />${message("admin.role.promotion")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:groupon"[#if role.authorities?seq_contains("admin:groupon")] checked="checked"[/#if] />${message("admin.groupon.manage")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:coupon"[#if role.authorities?seq_contains("admin:coupon")] checked="checked"[/#if] />${message("admin.role.coupon")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:seo"[#if role.authorities?seq_contains("admin:seo")] checked="checked"[/#if] />${message("admin.role.seo")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:sitemap"[#if role.authorities?seq_contains("admin:sitemap")] checked="checked"[/#if] />${message("admin.role.sitemap")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.statisticsGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:statistics"[#if role.authorities?seq_contains("admin:statistics")] checked="checked"[/#if] />${message("admin.role.statistics")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:sales"[#if role.authorities?seq_contains("admin:sales")] checked="checked"[/#if] />${message("admin.report.orderReport")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:salesRanking"[#if role.authorities?seq_contains("admin:salesRanking")] checked="checked"[/#if] />${message("admin.report.saleReport")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:memberActivity"[#if role.authorities?seq_contains("admin:memberActivity")] checked="checked"[/#if] />${message("admin.main.systemMemberState")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:memberRanking" [#if role.authorities?seq_contains("admin:memberRanking")] checked="checked"[/#if] />${message("admin.report.memberReport")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:purchaseRanking" [#if role.authorities?seq_contains("admin:purchaseRanking")] checked="checked"[/#if] />${message("admin.report.favoriteReport")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:deposit" [#if role.authorities?seq_contains("admin:deposit")] checked="checked"[/#if] />${message("admin.main.deposit")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.systemGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:setting"[#if role.authorities?seq_contains("admin:setting")] checked="checked"[/#if] />${message("admin.role.setting")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:area"[#if role.authorities?seq_contains("admin:area")] checked="checked"[/#if] />${message("admin.role.area")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:paymentMethod"[#if role.authorities?seq_contains("admin:paymentMethod")] checked="checked"[/#if] />${message("admin.role.paymentMethod")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryCorp"[#if role.authorities?seq_contains("admin:deliveryCorp")] checked="checked"[/#if] />${message("admin.role.deliveryCorp")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:paymentPlugin"[#if role.authorities?seq_contains("admin:paymentPlugin")] checked="checked"[/#if] />${message("admin.role.paymentPlugin")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:storagePlugin"[#if role.authorities?seq_contains("admin:storagePlugin")] checked="checked"[/#if] />${message("admin.role.storagePlugin")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:admin"[#if role.authorities?seq_contains("admin:admin")] checked="checked"[/#if] />${message("admin.role.admin")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:role"[#if role.authorities?seq_contains("admin:role")] checked="checked"[/#if] />${message("admin.role.role")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:message"[#if role.authorities?seq_contains("admin:message")] checked="checked"[/#if] />${message("admin.role.message")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:log"[#if role.authorities?seq_contains("admin:log")] checked="checked"[/#if] />${message("admin.role.log")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:nodArea"[#if role.authorities?seq_contains("admin:nodArea")] checked="checked"[/#if] />${message("admin.main.nodArea")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:reviewTool"[#if role.authorities?seq_contains("admin:reviewTool")] checked="checked"[/#if] />${message("admin.shop.review")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.factoryGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:factory" [#if role.authorities?seq_contains("admin:factory")] checked="checked"[/#if]/>${message("admin.role.merchant")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryShippingMethod" [#if role.authorities?seq_contains("admin:factoryShippingMethod")] checked="checked"[/#if]/>${message("admin.role.factoryShippingMethod")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.main.storeManager")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryViewStroe" [#if role.authorities?seq_contains("admin:factoryViewStroe")] checked="checked"[/#if]/>${message("admin.main.storeView")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryDecoration" [#if role.authorities?seq_contains("admin:factoryDecoration")] checked="checked"[/#if]/>${message("admin.main.storeDecoration")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryClassManager" [#if role.authorities?seq_contains("admin:factoryClassManager")] checked="checked"[/#if]/>${message("admin.main.storeClassManager")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factorySettingStore" [#if role.authorities?seq_contains("admin:factorySettingStore")] checked="checked"[/#if]/>${message("admin.main.storeSetting")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryProclamation" [#if role.authorities?seq_contains("admin:factoryProclamation")] checked="checked"[/#if]/>${message("admin.main.factoryProclamationSetting")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.main.EmployeeManager")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:employeeManager" [#if role.authorities?seq_contains("admin:employeeManager")] checked="checked"[/#if]/>${message("admin.main.EmployeeManager")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:departmentManager" [#if role.authorities?seq_contains("admin:departmentManager")] checked="checked"[/#if]/>${message("admin.main.DepartmentManager")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:employeeJob" [#if role.authorities?seq_contains("admin:employeeJob")] checked="checked"[/#if]/>${message("admin.main.employeeJob")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:assignment" [#if role.authorities?seq_contains("admin:assignment")] checked="checked"[/#if]/>${message("admin.main.assignment")}
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.main.pointExchangeManager")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:pProduct" [#if role.authorities?seq_contains("admin:pProduct")] checked="checked"[/#if] />${message("admin.main.pProductManager")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:exchangeDetails" [#if role.authorities?seq_contains("admin:exchangeDetails")] checked="checked"[/#if] />${message("admin.main.exchangeDetails")}
						</label>
					</span>
				</td>
			</tr>
			<!--超级管理员结束 -->
			[#else]
				<!-- 商品管理 -->
				[#list ["admin:product", "admin:productCategory", "admin:parameterGroup", "admin:attribute", "admin:specification", "admin:brand", "admin:productNotify","admin:audit"] as permission]
					[@shiro.hasPermission name = permission]			
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.productGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:product"]
						<label>
							<input type="checkbox" name="authorities" value="admin:product"[#if role.authorities?seq_contains("admin:product")] checked="checked"[/#if] />${message("admin.role.product")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:productCategory"]
						<label>
							<input type="checkbox" name="authorities" value="admin:productCategory"[#if role.authorities?seq_contains("admin:productCategory")] checked="checked"[/#if] />${message("admin.role.productCategory")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:parameterGroup"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:parameterGroup"[#if role.authorities?seq_contains("admin:parameterGroup")] checked="checked"[/#if] />${message("admin.role.parameterGroup")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:attribute"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:attribute"[#if role.authorities?seq_contains("admin:attribute")] checked="checked"[/#if] />${message("admin.role.attribute")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:specification"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:specification"[#if role.authorities?seq_contains("admin:specification")] checked="checked"[/#if] />${message("admin.role.specification")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:brand"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:brand"[#if role.authorities?seq_contains("admin:brand")] checked="checked"[/#if] />${message("admin.role.brand")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:productNotify"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:productNotify"[#if role.authorities?seq_contains("admin:productNotify")] checked="checked"[/#if] />${message("admin.role.productNotify")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:audit"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:audit"[#if role.authorities?seq_contains("admin:audit")] checked="checked"[/#if] />${message("admin.main.audit")}
						</label>
						[/@shiro.hasPermission]					
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--订单管理-->
				[#list ["admin:order", "admin:payment", "admin:refunds", "admin:shipping", "admin:returns", "admin:deliveryCenter", "admin:deliveryTemplate","admin:reconciliation"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.orderGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:order"]
						<label>
							<input type="checkbox" name="authorities" value="admin:order"[#if role.authorities?seq_contains("admin:order")] checked="checked"[/#if] />${message("admin.role.order")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:print"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:print"[#if role.authorities?seq_contains("admin:print")] checked="checked"[/#if] />${message("admin.role.print")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:payment"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:payment"[#if role.authorities?seq_contains("admin:payment")] checked="checked"[/#if] />${message("admin.role.payment")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:refunds"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:refunds"[#if role.authorities?seq_contains("admin:refunds")] checked="checked"[/#if] />${message("admin.role.refunds")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:shipping"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:shipping"[#if role.authorities?seq_contains("admin:shipping")] checked="checked"[/#if] />${message("admin.role.shipping")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:returns"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:returns"[#if role.authorities?seq_contains("admin:returns")] checked="checked"[/#if] />${message("admin.role.returns")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:deliveryCenter"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryCenter"[#if role.authorities?seq_contains("admin:deliveryCenter")] checked="checked"[/#if] />${message("admin.role.deliveryCenter")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:deliveryTemplate"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryTemplate"[#if role.authorities?seq_contains("admin:deliveryTemplate")] checked="checked"[/#if] />${message("admin.role.deliveryTemplate")}
						</label>
						[/@shiro.hasPermission]						
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--会员管理-->
				[#list ["admin:member", "admin:memberRank", "admin:memberAttribute", "admin:review", "admin:consultation"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.memberGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:member"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:member"[#if role.authorities?seq_contains("admin:member")] checked="checked"[/#if] />${message("admin.role.member")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:memberRank"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:memberRank"[#if role.authorities?seq_contains("admin:memberRank")] checked="checked"[/#if] />${message("admin.role.memberRank")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:memberAttribute"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:memberAttribute"[#if role.authorities?seq_contains("admin:memberAttribute")] checked="checked"[/#if] />${message("admin.role.memberAttribute")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:review"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:review"[#if role.authorities?seq_contains("admin:review")] checked="checked"[/#if] />${message("admin.role.review")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:consultation"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:consultation"[#if role.authorities?seq_contains("admin:consultation")] checked="checked"[/#if] />${message("admin.role.consultation")}
						</label>
						[/@shiro.hasPermission]					
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--内容管理-->
				[#list ["admin:navigation", "admin:article", "admin:articleCategory", "admin:tag", "admin:friendLink", "admin:adPosition", "admin:ad", "admin:template", "admin:cache", "admin:static", "admin:index","admin:tagProduct","admin:tagProductApply","admin:adApply"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.contentGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:navigation"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:navigation"[#if role.authorities?seq_contains("admin:navigation")] checked="checked"[/#if] />${message("admin.role.navigation")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:article"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:article"[#if role.authorities?seq_contains("admin:article")] checked="checked"[/#if] />${message("admin.role.article")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:articleCategory"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:articleCategory"[#if role.authorities?seq_contains("admin:articleCategory")] checked="checked"[/#if] />${message("admin.role.articleCategory")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:tag"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:tag"[#if role.authorities?seq_contains("admin:tag")] checked="checked"[/#if] />${message("admin.role.tag")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:friendLink"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:friendLink"[#if role.authorities?seq_contains("admin:friendLink")] checked="checked"[/#if] />${message("admin.role.friendLink")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:adPosition"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:adPosition"[#if role.authorities?seq_contains("admin:adPosition")] checked="checked"[/#if] />${message("admin.role.adPosition")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:ad"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:ad"[#if role.authorities?seq_contains("admin:ad")] checked="checked"[/#if] />${message("admin.role.ad")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:template"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:template"[#if role.authorities?seq_contains("admin:template")] checked="checked"[/#if] />${message("admin.role.template")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:cache"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:cache"[#if role.authorities?seq_contains("admin:cache")] checked="checked"[/#if] />${message("admin.role.cache")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:static"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:static"[#if role.authorities?seq_contains("admin:static")] checked="checked"[/#if] />${message("admin.role.static")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:index"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:index"[#if role.authorities?seq_contains("admin:index")] checked="checked"[/#if] />${message("admin.role.index")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:tagProduct"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:tagProduct"[#if role.authorities?seq_contains("admin:tagProduct")] checked="checked"[/#if] />${message("admin.main.tagProduct")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:tagProductApply"]
						<label>
							<input type="checkbox" name="authorities" value="admin:tagProductApply"[#if role.authorities?seq_contains("admin:tagProductApply")] checked="checked"[/#if] />${message("admin.role.tagProductApply")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:adApply"]
						<label>
							<input type="checkbox" name="authorities" value="admin:adApply"[#if role.authorities?seq_contains("admin:adApply")] checked="checked"[/#if] />${message("admin.role.adApply")}
						</label>
						[/@shiro.hasPermission]
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--营销管理-->
				[#list ["admin:promotion", "admin:groupon", "admin:coupon", "admin:seo", "admin:sitemap"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.marketingGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:promotion"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:promotion"[#if role.authorities?seq_contains("admin:promotion")] checked="checked"[/#if] />${message("admin.role.promotion")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:groupon"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:groupon"[#if role.authorities?seq_contains("admin:groupon")] checked="checked"[/#if] />${message("admin.groupon.manage")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:coupon"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:coupon"[#if role.authorities?seq_contains("admin:coupon")] checked="checked"[/#if] />${message("admin.role.coupon")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:seo"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:seo"[#if role.authorities?seq_contains("admin:seo")] checked="checked"[/#if] />${message("admin.role.seo")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:sitemap"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:sitemap"[#if role.authorities?seq_contains("admin:sitemap")] checked="checked"[/#if] />${message("admin.role.sitemap")}
						</label>
						[/@shiro.hasPermission]
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--统计管理-->
				[#list ["admin:statistics", "admin:sales", "admin:memberActivity","admin:salesRanking", "admin:purchaseRanking","admin:memberRanking", "admin:deposit"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.statisticsGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:statistics"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:statistics"[#if role.authorities?seq_contains("admin:statistics")] checked="checked"[/#if] />${message("admin.role.statistics")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:sales"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:sales"[#if role.authorities?seq_contains("admin:sales")] checked="checked"[/#if] />${message("admin.report.orderReport")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:salesRanking"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:salesRanking"[#if role.authorities?seq_contains("admin:salesRanking")] checked="checked"[/#if] />${message("admin.report.saleReport")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:memberActivity"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:memberActivity"[#if role.authorities?seq_contains("admin:memberActivity")] checked="checked"[/#if] />${message("admin.main.systemMemberState")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:memberRanking"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:memberRanking" [#if role.authorities?seq_contains("admin:memberRanking")] checked="checked"[/#if] />${message("admin.report.memberReport")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:purchaseRanking"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:purchaseRanking" [#if role.authorities?seq_contains("admin:purchaseRanking")] checked="checked"[/#if] />${message("admin.report.favoriteReport")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:deposit"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:deposit" [#if role.authorities?seq_contains("admin:deposit")] checked="checked"[/#if] />${message("admin.main.deposit")}
						</label>
						[/@shiro.hasPermission]
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--系统设置-->
				[#list ["admin:setting", "admin:area", "admin:paymentMethod","admin:deliveryCorp", "admin:paymentPlugin", "admin:storagePlugin", "admin:admin", "admin:role","admin:log", "admin:message", "admin:log","admin:nodArea","admin:reviewTool"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.systemGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:setting"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:setting"[#if role.authorities?seq_contains("admin:setting")] checked="checked"[/#if] />${message("admin.role.setting")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:area"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:area"[#if role.authorities?seq_contains("admin:area")] checked="checked"[/#if] />${message("admin.role.area")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:paymentMethod"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:paymentMethod"[#if role.authorities?seq_contains("admin:paymentMethod")] checked="checked"[/#if] />${message("admin.role.paymentMethod")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:deliveryCorp"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryCorp"[#if role.authorities?seq_contains("admin:deliveryCorp")] checked="checked"[/#if] />${message("admin.role.deliveryCorp")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:paymentPlugin"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:paymentPlugin"[#if role.authorities?seq_contains("admin:paymentPlugin")] checked="checked"[/#if] />${message("admin.role.paymentPlugin")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:storagePlugin"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:storagePlugin"[#if role.authorities?seq_contains("admin:storagePlugin")] checked="checked"[/#if] />${message("admin.role.storagePlugin")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:admin"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:admin"[#if role.authorities?seq_contains("admin:admin")] checked="checked"[/#if] />${message("admin.role.admin")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:role"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:role"[#if role.authorities?seq_contains("admin:role")] checked="checked"[/#if] />${message("admin.role.role")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:message"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:message"[#if role.authorities?seq_contains("admin:message")] checked="checked"[/#if] />${message("admin.role.message")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:log"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:log"[#if role.authorities?seq_contains("admin:log")] checked="checked"[/#if] />${message("admin.role.log")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:nodArea"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:nodArea"[#if role.authorities?seq_contains("admin:nodArea")] checked="checked"[/#if] />${message("admin.main.nodArea")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:reviewTool"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:reviewTool"[#if role.authorities?seq_contains("admin:reviewTool")] checked="checked"[/#if] />${message("admin.shop.review")}
						</label>
						[/@shiro.hasPermission]
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--商户管理-->
				[#list ["admin:factory","admin:factoryShippingMethod"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.factoryGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:factory"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factory" [#if role.authorities?seq_contains("admin:factory")] checked="checked"[/#if]/>${message("admin.role.merchant")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factoryShippingMethod"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryShippingMethod" [#if role.authorities?seq_contains("admin:factoryShippingMethod")] checked="checked"[/#if]/>${message("admin.role.factoryShippingMethod")}
						</label>
						[/@shiro.hasPermission]
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--店铺管理-->	
				[#list ["admin:factoryViewStroe","admin:factoryDecoration","admin:factoryClassManager","admin:factorySettingStore","admin:factoryProclamation"] as permission]
					[@shiro.hasPermission name = permission]						
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.main.storeManager")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:factoryViewStroe"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryViewStroe" [#if role.authorities?seq_contains("admin:factoryViewStroe")] checked="checked"[/#if]/>${message("admin.main.storeView")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factoryDecoration"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryDecoration" [#if role.authorities?seq_contains("admin:factoryDecoration")] checked="checked"[/#if]/>${message("admin.main.storeDecoration")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factoryClassManager"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryClassManager" [#if role.authorities?seq_contains("admin:factoryClassManager")] checked="checked"[/#if]/>${message("admin.main.storeClassManager")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factorySettingStore"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factorySettingStore" [#if role.authorities?seq_contains("admin:factorySettingStore")] checked="checked"[/#if]/>${message("admin.main.storeSetting")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factoryProclamation"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryProclamation" [#if role.authorities?seq_contains("admin:factoryProclamation")] checked="checked"[/#if]/>${message("admin.main.factoryProclamationSetting")}
						</label>
						[/@shiro.hasPermission]
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--员工管理-->
				[#list ["admin:employeeManager","admin:departmentManager","admin:employeeJob","admin:assignment"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.main.EmployeeManager")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:employeeManager"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:employeeManager" [#if role.authorities?seq_contains("admin:employeeManager")] checked="checked"[/#if]/>${message("admin.main.EmployeeManager")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:departmentManager"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:departmentManager" [#if role.authorities?seq_contains("admin:departmentManager")] checked="checked"[/#if]/>${message("admin.main.DepartmentManager")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:employeeJob"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:employeeJob" [#if role.authorities?seq_contains("admin:employeeJob")] checked="checked"[/#if]/>${message("admin.main.employeeJob")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:assignment"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:assignment" [#if role.authorities?seq_contains("admin:assignment")] checked="checked"[/#if]/>${message("admin.main.assignment")}
						</label>
						[/@shiro.hasPermission]
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--积分兑换管理-->
				[#list ["admin:pProduct","admin:exchangeDetails"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.main.pointExchangeManager")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:pProduct"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:pProduct" [#if role.authorities?seq_contains("admin:pProduct")] checked="checked"[/#if] />${message("admin.main.pProductManager")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:exchangeDetails"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:exchangeDetails" [#if role.authorities?seq_contains("admin:exchangeDetails")] checked="checked"[/#if] />${message("admin.main.exchangeDetails")}
						</label>
						[/@shiro.hasPermission]
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]						
			[/#if]
			
			[#if role.isSystem]
				<tr>
					<th>
						&nbsp;
					</th>
					<td>
						<span class="tips">${message("admin.role.editSystemNotAllowed")}</span>
					</td>
				</tr>
			[/#if]
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}"[#if role.isSystem] disabled="disabled"[/#if] />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>