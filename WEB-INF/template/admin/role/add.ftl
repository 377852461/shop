[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.role.add")} - Powered By kuanda</title>
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.role.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Role.name")}:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Role.description")}:
				</th>
				<td>
					<input type="text" name="description" class="text" maxlength="200" />
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
							<input type="checkbox" name="authorities" value="admin:product" />${message("admin.role.product")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:productCategory" />${message("admin.role.productCategory")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:parameterGroup" />${message("admin.role.parameterGroup")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:attribute" />${message("admin.role.attribute")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:specification" />${message("admin.role.specification")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:brand" />${message("admin.role.brand")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:productNotify" />${message("admin.role.productNotify")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:audit" />${message("admin.main.audit")}
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
							<input type="checkbox" name="authorities" value="admin:order" />${message("admin.role.order")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:print" />${message("admin.role.print")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:payment" />${message("admin.role.payment")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:refunds" />${message("admin.role.refunds")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:shipping" />${message("admin.role.shipping")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:returns" />${message("admin.role.returns")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryCenter" />${message("admin.role.deliveryCenter")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryTemplate" />${message("admin.role.deliveryTemplate")}
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
							<input type="checkbox" name="authorities" value="admin:member" />${message("admin.role.member")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:memberRank" />${message("admin.role.memberRank")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:memberAttribute" />${message("admin.role.memberAttribute")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:review" />${message("admin.role.review")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:consultation" />${message("admin.role.consultation")}
						</label>
					</span>
				</td>
			</tr>
			<!-- 内容 权限  开始  -->
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.contentGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:navigation" />${message("admin.role.navigation")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:article" />${message("admin.role.article")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:articleCategory" />${message("admin.role.articleCategory")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:tag" />${message("admin.role.tag")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:friendLink" />${message("admin.role.friendLink")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:adPosition" />${message("admin.role.adPosition")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:ad" />${message("admin.role.ad")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:template" />${message("admin.role.template")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:cache" />${message("admin.role.cache")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:static" />${message("admin.role.static")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:index" />${message("admin.role.index")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:tagProduct" />${message("admin.main.tagProduct")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:adApply" />${message("admin.role.adApply")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:tagProductApply" />${message("admin.role.tagProductApply")}
						</label>
					</span>
				</td>
			</tr>
			<!-- 内容 权限  结束  -->
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.marketingGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:promotion" />${message("admin.role.promotion")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:groupon" />${message("admin.groupon.manage")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:coupon" />${message("admin.role.coupon")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:seo" />${message("admin.role.seo")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:sitemap" />${message("admin.role.sitemap")}
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
							<input type="checkbox" name="authorities" value="admin:statistics" />${message("admin.role.statistics")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:sales" />${message("admin.report.orderReport")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:memberActivity" />${message("admin.main.systemMemberState")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:salesRanking" />${message("admin.report.saleReport")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:memberRanking" />${message("admin.report.memberReport")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:purchaseRanking" />${message("admin.report.favoriteReport")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:deposit" />${message("admin.main.deposit")}
						</label>
						<!-- zlm 2014-11-19 
						<label>
							<input type="checkbox" name="authorities" value="admin:reconciliation" />${message("admin.main.reconciliation")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:difference" />${message("admin.main.difference")}
						</label>-->
						<!--
						<label>
							<input type="checkbox" name="authorities" value="admin:createFile_qfls" />${message("admin.main.createFile_qfls")}
						</label>
						-->
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
							<input type="checkbox" name="authorities" value="admin:setting" />${message("admin.role.setting")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:area" />${message("admin.role.area")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:paymentMethod" />${message("admin.role.paymentMethod")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryCorp" />${message("admin.role.deliveryCorp")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:paymentPlugin" />${message("admin.role.paymentPlugin")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:storagePlugin" />${message("admin.role.storagePlugin")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:admin" />${message("admin.role.admin")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:role" />${message("admin.role.role")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:message" />${message("admin.role.message")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:log" />${message("admin.role.log")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:nodArea" />${message("admin.main.nodArea")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:reviewTool" />${message("admin.shop.review")}
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
							<input type="checkbox" name="authorities" value="admin:factory" />${message("admin.role.merchant")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryShippingMethod" />${message("admin.role.factoryShippingMethod")}
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
							<input type="checkbox" name="authorities" value="admin:factoryViewStroe" />${message("admin.main.storeView")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryDecoration" />${message("admin.main.storeDecoration")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryClassManager" />${message("admin.main.storeClassManager")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factorySettingStore" />${message("admin.main.storeSetting")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryProclamation" />${message("admin.main.factoryProclamationSetting")}
						</label
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
							<input type="checkbox" name="authorities" value="admin:employeeManager" />${message("admin.main.EmployeeManager")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:departmentManager" />${message("admin.main.DepartmentManager")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:employeeJob" />${message("admin.main.employeeJob")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:assignment" />${message("admin.main.assignment")}
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
							<input type="checkbox" name="authorities" value="admin:pProduct" />${message("admin.main.pProductManager")}
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:exchangeDetails" />${message("admin.main.exchangeDetails")}
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
							<input type="checkbox" name="authorities" value="admin:product" />${message("admin.role.product")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:productCategory"]
						<label>
							<input type="checkbox" name="authorities" value="admin:productCategory" />${message("admin.role.productCategory")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:parameterGroup"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:parameterGroup" />${message("admin.role.parameterGroup")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:attribute"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:attribute" />${message("admin.role.attribute")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:specification"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:specification" />${message("admin.role.specification")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:brand"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:brand"/>${message("admin.role.brand")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:productNotify"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:productNotify" />${message("admin.role.productNotify")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:audit"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:audit" />${message("admin.main.audit")}
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
							<input type="checkbox" name="authorities" value="admin:order" />${message("admin.role.order")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:print"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:print" />${message("admin.role.print")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:payment"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:payment" />${message("admin.role.payment")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:refunds"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:refunds" />${message("admin.role.refunds")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:shipping"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:shipping" />${message("admin.role.shipping")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:returns"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:returns" />${message("admin.role.returns")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:deliveryCenter"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryCenter"/>${message("admin.role.deliveryCenter")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:deliveryTemplate"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryTemplate" />${message("admin.role.deliveryTemplate")}
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
							<input type="checkbox" name="authorities" value="admin:member" />${message("admin.role.member")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:memberRank"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:memberRank" />${message("admin.role.memberRank")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:memberAttribute"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:memberAttribute" />${message("admin.role.memberAttribute")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:review"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:review" />${message("admin.role.review")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:consultation"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:consultation" />${message("admin.role.consultation")}
						</label>
						[/@shiro.hasPermission]					
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]
				<!--内容管理-->
				[#list ["admin:navigation", "admin:article", "admin:articleCategory", "admin:tag", "admin:friendLink", "admin:adPosition", "admin:ad", "admin:template", "admin:cache", "admin:static", "admin:index","admin:tagProduct"] as permission]
					[@shiro.hasPermission name = permission]							
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="${message("admin.role.selectAll")}">${message("admin.role.contentGroup")}</a>
				</th>
				<td>
					<span class="fieldSet">
						[@shiro.hasPermission name="admin:navigation"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:navigation" />${message("admin.role.navigation")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:article"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:article" />${message("admin.role.article")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:articleCategory"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:articleCategory" />${message("admin.role.articleCategory")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:tag"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:tag" />${message("admin.role.tag")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:friendLink"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:friendLink" />${message("admin.role.friendLink")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:adPosition"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:adPosition" />${message("admin.role.adPosition")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:ad"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:ad" />${message("admin.role.ad")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:template"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:template" />${message("admin.role.template")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:cache"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:cache" />${message("admin.role.cache")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:static"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:static" />${message("admin.role.static")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:index"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:index" />${message("admin.role.index")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:tagProduct"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:tagProduct" />${message("admin.main.tagProduct")}
						</label>
						[/@shiro.hasPermission]		
						[@shiro.hasPermission name="admin:adApply"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:adApply" />${message("admin.role.adApply")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:tagProductApply"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:tagProductApply" />${message("admin.role.tagProductApply")}
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
							<input type="checkbox" name="authorities" value="admin:promotion"/>${message("admin.role.promotion")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:groupon"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:groupon" />${message("admin.groupon.manage")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:coupon"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:coupon" />${message("admin.role.coupon")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:seo"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:seo" />${message("admin.role.seo")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:sitemap"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:sitemap" />${message("admin.role.sitemap")}
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
							<input type="checkbox" name="authorities" value="admin:statistics" />${message("admin.role.statistics")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:sales"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:sales" />${message("admin.report.orderReport")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:salesRanking"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:salesRanking" />${message("admin.report.saleReport")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:memberActivity"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:memberActivity" />${message("admin.main.systemMemberState")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:memberRanking"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:memberRanking"  />${message("admin.report.memberReport")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:purchaseRanking"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:purchaseRanking"  />${message("admin.report.favoriteReport")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:deposit"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:deposit"  />${message("admin.main.deposit")}
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
							<input type="checkbox" name="authorities" value="admin:setting" />${message("admin.role.setting")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:area"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:area" />${message("admin.role.area")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:paymentMethod"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:paymentMethod" />${message("admin.role.paymentMethod")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:deliveryCorp"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:deliveryCorp" />${message("admin.role.deliveryCorp")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:paymentPlugin"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:paymentPlugin" />${message("admin.role.paymentPlugin")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:storagePlugin"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:storagePlugin" />${message("admin.role.storagePlugin")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:admin"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:admin" />${message("admin.role.admin")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:role"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:role" />${message("admin.role.role")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:message"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:message" />${message("admin.role.message")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:log"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:log" />${message("admin.role.log")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:nodArea"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:nodArea" />${message("admin.main.nodArea")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:reviewTool"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:reviewTool" />${message("admin.shop.review")}
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
							<input type="checkbox" name="authorities" value="admin:factory" />${message("admin.role.merchant")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factoryShippingMethod"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryShippingMethod" />${message("admin.role.factoryShippingMethod")}
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
							<input type="checkbox" name="authorities" value="admin:factoryViewStroe" />${message("admin.main.storeView")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factoryDecoration"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryDecoration" />${message("admin.main.storeDecoration")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factoryClassManager"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryClassManager" />${message("admin.main.storeClassManager")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factorySettingStore"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factorySettingStore" />${message("admin.main.storeSetting")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:factoryProclamation"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:factoryProclamation" />${message("admin.main.factoryProclamationSetting")}
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
							<input type="checkbox" name="authorities" value="admin:employeeManager" />${message("admin.main.EmployeeManager")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:departmentManager"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:departmentManager" />${message("admin.main.DepartmentManager")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:employeeJob"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:employeeJob" />${message("admin.main.employeeJob")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:assignment"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:assignment" />${message("admin.main.assignment")}
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
							<input type="checkbox" name="authorities" value="admin:pProduct"  />${message("admin.main.pProductManager")}
						</label>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name="admin:exchangeDetails"]						
						<label>
							<input type="checkbox" name="authorities" value="admin:exchangeDetails" />${message("admin.main.exchangeDetails")}
						</label>
						[/@shiro.hasPermission]
					</span>
				</td>
			</tr>
						[#break /]
					[/@shiro.hasPermission]
				[/#list]						
			
			[/#if]
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>