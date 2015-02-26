[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.main.title")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/admin/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<style type="text/css">
*{
	font: 12px tahoma, Arial, Verdana, sans-serif;
}
html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $nav = $("#nav a:not(:last)");
	var $menu = $("#menu dl");
	var $menuItem = $("#menu a");
	
	var $firstMenu = $("#nav").find("ul li a").eq(0);
	var leftName = $firstMenu.attr("href");
	var $leftMenu = $(leftName);
	$menu.hide();
	$leftMenu.show();
	
	$nav.click(function() {
		var $this = $(this);
		$nav.removeClass("current");
		$this.addClass("current");
		var $currentMenu = $($this.attr("href"));
		$menu.hide();
		$currentMenu.show();
		return false;
	});
	
	$menuItem.click(function() {
		var $this = $(this);
		$menuItem.removeClass("current");
		$this.addClass("current");
	});

});
</script>
</head>
<body>
	<script type="text/javascript">
		if (self != top) {
			top.location = self.location;
		};
	</script>
	<table class="main">
		<tr>
			<th class="logo">
				<a href="main.jhtml">
					<img src="${base}/upload/image/logo.jpg" alt="蛐蛐网电商">
				</a>
			</th>
			<!-- nav begin -->
			<th>
				<div id="nav" class="nav">
					<ul>
						[#list ["admin:factory","admin:factoryShippingMethod"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#factory">${message("admin.main.factoryNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:product", "admin:productCategory", "admin:parameterGroup", "admin:attribute", "admin:specification", "admin:brand", "admin:productNotify","admin:audit"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#product">${message("admin.main.productNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:order", "admin:payment", "admin:refunds", "admin:shipping", "admin:returns", "admin:deliveryCenter", "admin:deliveryTemplate","admin:reconciliation","admin:createFile_qfls"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#order">${message("admin.main.orderNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:member", "admin:memberRank", "admin:memberAttribute", "admin:review", "admin:consultation"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#member">${message("admin.main.memberNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:factoryViewStroe","admin:factoryDecoration","admin:factoryClassManager","admin:factorySettingStore","admin:factoryProclamation"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#store">${message("admin.main.StoreNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:navigation", "admin:article", "admin:articleCategory", "admin:tag", "admin:friendLink", "admin:adPosition", "admin:ad", "admin:template", "admin:cache", "admin:static", "admin:index","admin:tagProduct","admin:adApply","admin:tagProductApply"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#content">${message("admin.main.contentNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:promotion", "admin:groupon", "admin:coupon", "admin:seo", "admin:sitemap"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#marketing">${message("admin.main.marketingNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:statistics", "admin:sales", "admin:memberActivity","admin:salesRanking", "admin:purchaseRanking","admin:memberRanking", "admin:deposit"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#statistics">${message("admin.main.statisticsNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:setting", "admin:area", "admin:paymentMethod","admin:deliveryCorp", "admin:paymentPlugin", "admin:storagePlugin", "admin:admin", "admin:role","admin:log", "admin:message", "admin:log","admin:nodArea","admin:reviewTool"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#system">${message("admin.main.systemNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						<!-- employees Management start -->
						[#list ["admin:employeeManager","admin:departmentManager","admin:employeeJob","admin:assignment"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#employees">${message("admin.main.employeeNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						<!-- employees Management End -->
						[#list ["admin:pProduct","admin:exchangeDetails"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#pProcut">${message("admin.main.pProduct")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						<li>
							<a href="${base}/" target="_blank">${message("admin.main.home")}</a>
						</li>
					</ul>
				</div>
				<div class="link">
					<a href="http://www.kuanda.net" target="_blank">${message("admin.main.official")}</a>|
					<a href="http://bbs.kuanda.net" target="_blank">${message("admin.main.bbs")}</a>|
					<a href="http://www.kuanda.net/about.html" target="_blank">${message("admin.main.about")}</a>
				</div>
				<div class="link">
					<strong>[@shiro.principal /]</strong>
					${message("admin.main.hello")}!
					<a href="../profile/edit.jhtml" target="iframe">[${message("admin.main.profile")}]</a>
					<a href="../logout.jsp" target="_top">[${message("admin.main.logout")}]</a>
				</div>
			</th>
			<!-- nav end -->
		</tr>
		<!-- menu begin -->
		<tr>
			<td id="menu" class="menu">
				<dl id="product">
					<dt>${message("admin.main.productGroup")}</dt>
					[@shiro.hasPermission name="admin:product"]
						<dd>
							<a href="../product/list.jhtml?type=product" target="iframe">${message("admin.main.product")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:productCategory"]
						<dd>
							<a href="../product_category/list.jhtml" target="iframe">${message("admin.main.productCategory")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:parameterGroup"]
						<dd>
							<a href="../parameter_group/list.jhtml" target="iframe">${message("admin.main.parameterGroup")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:attribute"]
						<dd>
							<a href="../attribute/list.jhtml" target="iframe">${message("admin.main.attribute")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:specification"]
						<dd>
							<a href="../specification/list.jhtml" target="iframe">${message("admin.main.specification")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:brand"]
						<dd>
							<a href="../brand/list.jhtml" target="iframe">${message("admin.main.brand")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:productNotify"]
						<dd>
							<a href="../product_notify/list.jhtml" target="iframe">${message("admin.main.productNotify")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:audit"]
						<dd>
							<a href="../product/list.jhtml?type=audit" target="iframe">${message("admin.main.audit")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<dl id="order">
					<dt>${message("admin.main.orderGroup")}</dt>
					[@shiro.hasPermission name="admin:order"]
						<dd>
							<a href="../order/list.jhtml" target="iframe">${message("admin.main.order")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:payment"]
						<dd>
							<a href="../payment/list.jhtml" target="iframe">${message("admin.main.payment")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:refunds"]
						<dd>
							<a href="../refunds/list.jhtml" target="iframe">${message("admin.main.refunds")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:shipping"]
						<dd>
							<a href="../shipping/list.jhtml" target="iframe">${message("admin.main.shipping")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:returns"]
						<dd>
							<a href="../returns/list.jhtml" target="iframe">${message("admin.main.returns")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:deliveryCenter"]
						<dd>
							<a href="../delivery_center/list.jhtml" target="iframe">${message("admin.main.deliveryCenter")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:deliveryTemplate"]
						<dd>
							<a href="../delivery_template/list.jhtml" target="iframe">${message("admin.main.deliveryTemplate")}</a>
						</dd>
					[/@shiro.hasPermission]														
				</dl>
				<!-- StoreMenu Begin -->
				<dl id="store">
					<dt>${message("admin.main.storeManager")}</dt>
					[@shiro.hasPermission name="admin:factoryViewStroe"]
						<dd>
							<a href="${base}/store.jhtml?factoryId=${admin.factory.id}" target="_blank">${message("admin.main.storeView")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:factoryDecoration"]
						<dd>
							<a href="../store_ad/list.jhtml" target="iframe">${message("admin.main.storeDecoration")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:factoryClassManager"]
						<dd>
							<a href="../store_product_category/list.jhtml" target="iframe">${message("admin.main.storeClassManager")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:factorySettingStore"]
						<dd>
							<a href="../storeSetting/edit.jhtml" target="iframe">${message("admin.main.storeSetting")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:factoryProclamation"]
						<dd>
							<a href="../storeAffiche/list.jhtml" target="iframe">${message("admin.main.factoryProclamationSetting")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<!-- StoreMenu End -->
				<dl id="member">
					<dt>${message("admin.main.memberGroup")}</dt>
					[@shiro.hasPermission name="admin:member"]
						<dd>
							<a href="../member/list.jhtml" target="iframe">${message("admin.main.member")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:memberRank"]
						<dd>
							<a href="../member_rank/list.jhtml" target="iframe">${message("admin.main.memberRank")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:memberAttribute"]
						<dd>
							<a href="../member_attribute/list.jhtml" target="iframe">${message("admin.main.memberAttribute")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:review"]
						<dd>
							<a href="../review/list.jhtml" target="iframe">${message("admin.main.review")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:consultation"]
						<dd>
							<a href="../consultation/list.jhtml" target="iframe">${message("admin.main.consultation")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<!-- ContentMenu Begin -->
				<dl id="content">
					<dt>${message("admin.main.contentGroup")}</dt>
					[@shiro.hasPermission name="admin:navigation"]
						<dd>
							<a href="../navigation/list.jhtml" target="iframe">${message("admin.main.navigation")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:article"]
						<dd>
							<a href="../article/list.jhtml" target="iframe">${message("admin.main.article")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:articleCategory"]
						<dd>
							<a href="../article_category/list.jhtml" target="iframe">${message("admin.main.articleCategory")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:tag"]
						<dd>
							<a href="../tag/list.jhtml" target="iframe">${message("admin.main.tag")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:tagProduct"]
						<dd>
							<a href="../tag_product/list.jhtml" target="iframe">${message("admin.main.tagProduct")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:tagProductApply"]
						<dd>
							<a href="../tag_product/list.jhtml" target="iframe">${message("admin.role.tagProductApply")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:friendLink"]
						<dd>
							<a href="../friend_link/list.jhtml" target="iframe">${message("admin.main.friendLink")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:adPosition"]
						<dd>
							<a href="../ad_position/list.jhtml" target="iframe">${message("admin.main.adPosition")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:ad"]
						<dd>
							<a href="../ad/list.jhtml" target="iframe">${message("admin.main.ad")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:adApply"]
						<dd>
							<a href="../ad/list.jhtml" target="iframe">${message("admin.role.adApply")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:template"]
						<dd>
							<a href="../template/list.jhtml" target="iframe">${message("admin.main.template")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:cache"]
						<dd>
							<a href="../cache/clear.jhtml" target="iframe">${message("admin.main.cache")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:static"]
						<dd>
							<a href="../static/build.jhtml" target="iframe">${message("admin.main.static")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:index"]
						<dd>
							<a href="../index/build.jhtml" target="iframe">${message("admin.main.index")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<!-- ContentMenu End -->
				<dl id="marketing">
					<dt>${message("admin.main.marketingGroup")}</dt>
					[@shiro.hasPermission name="admin:promotion"]
						<dd>
							<a href="../promotion/list.jhtml" target="iframe">${message("admin.main.promotion")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:groupon"]
						<dd>
							<a href="../groupon/list.jhtml" target="iframe">团购管理</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:coupon"]
						<dd>
							<a href="../coupon/list.jhtml" target="iframe">${message("admin.main.coupon")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:seo"]
						<dd>
							<a href="../seo/list.jhtml" target="iframe">${message("admin.main.seo")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:sitemap"]
						<dd>
							<a href="../sitemap/build.jhtml" target="iframe">${message("admin.main.sitemap")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<dl id="statistics">
					<dt>${message("admin.main.statisticsGroup")}</dt>
					[@shiro.hasPermission name="admin:statistics"]
						<dd>
							<a href="../statistics/view.jhtml" target="iframe">${message("admin.main.statistics")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:statistics"]
						<dd>
							<a href="../statistics/setting.jhtml" target="iframe">${message("admin.main.statisticsSetting")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:memberActivity"]
						<dd>
							<a href="../report/memberActivity.jhtml" target="iframe">${message("admin.main.systemMemberState")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:sales"]
						<dd>
							<a href="../report/order_report.jhtml" target="iframe">${message("admin.report.orderReport")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:salesRanking"]
						<dd>
							<a href="../report/sale_list.jhtml" target="iframe">${message("admin.report.saleReport")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:memberRanking"]
						<dd>
							<a href="../report/member_list.jhtml" target="iframe">${message("admin.report.memberReport")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:purchaseRanking"]
						<dd>
							<a href="../report/favorite_report.jhtml" target="iframe">${message("admin.report.favoriteReport")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:deposit"]
						<dd>
							<a href="../deposit/list.jhtml" target="iframe">${message("admin.main.deposit")}</a>
						</dd>
					[/@shiro.hasPermission]
					<!--
					[@shiro.hasPermission name="admin:reconciliation"]
						<dd>
							<a href="../dzqs/dz.jhtml" target="iframe">${message("admin.main.reconciliation")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:difference"]
						<dd>
							<a href="../dzqs/cy.jhtml" target="iframe">${message("admin.main.difference")}</a>
						</dd>
					[/@shiro.hasPermission]	
					[@shiro.hasPermission name="admin:createFile_qfls"]
						<dd>
							<a href="../dzqs/qfls.jhtml" target="iframe">${message("admin.main.createFile_qfls")}</a>
						</dd>
					[/@shiro.hasPermission]
					-->						
				</dl>
				<dl id="system">
					<dt>${message("admin.main.systemGroup")}</dt>
					[@shiro.hasPermission name="admin:setting"]
						<dd>
							<a href="../setting/edit.jhtml" target="iframe">${message("admin.main.setting")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:area"]
						<dd>
							<a href="../area/list.jhtml" target="iframe">${message("admin.main.area")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:paymentMethod"]
						<dd>
							<a href="../payment_method/list.jhtml" target="iframe">${message("admin.main.paymentMethod")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:deliveryCorp"]
						<dd>
							<a href="../delivery_corp/list.jhtml" target="iframe">${message("admin.main.deliveryCorp")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:paymentPlugin"]
						<dd>
							<a href="../payment_plugin/list.jhtml" target="iframe">${message("admin.main.paymentPlugin")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:storagePlugin"]
						<dd>
							<a href="../storage_plugin/list.jhtml" target="iframe">${message("admin.main.storagePlugin")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:admin"]
						<dd>
							<a href="../admin/list.jhtml" target="iframe">${message("admin.main.admin")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:role"]
						<dd>
							<a href="../role/list.jhtml" target="iframe">${message("admin.main.role")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:message"]
						<dd>
							<a href="../message/send.jhtml" target="iframe">${message("admin.main.send")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:message"]
						<dd>
							<a href="../message/list.jhtml" target="iframe">${message("admin.main.message")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:message"]
						<dd>
							<a href="../message/draft.jhtml" target="iframe">${message("admin.main.draft")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:log"]
						<dd>
							<a href="../log/list.jhtml" target="iframe">${message("admin.role.log")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:nodArea"]
						<dd>
							<a href="../nodArea/list.jhtml" target="iframe">${message("admin.main.nodArea")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:reviewTool"]
						<dd>
							<a href="../reviewTool/tool.jhtml" target="iframe">${message("admin.shop.review")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<dl id="factory">
					<dt>${message("admin.main.factoryGroup")}</dt>
					[@shiro.hasPermission name="admin:factory"]
						<dd>
							<a href="../factory/list.jhtml" target="iframe">${message("admin.main.factory")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:factoryShippingMethod"]
						<dd>
							<a href="../factoryShippingMethod/list.jhtml" target="iframe">${message("admin.main.shippingMethod")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<!-- EmployeeManager Start  -->
				<dl id="employees">
					<dt>${message("admin.main.EmployeeManager")}</dt>
					[@shiro.hasPermission name="admin:employeeManager"]
						<dd>
							<a href="../employee/list.jhtml" target="iframe">${message("admin.main.EmployeeManager")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:departmentManager"]
						<dd>
							<a href="../department/list.jhtml" target="iframe">${message("admin.main.DepartmentManager")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:employeeJob"]
						<dd>
							<a href="../employee_level/list.jhtml" target="iframe">${message("admin.main.employeeJob")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:assignment"]
						<dd>
							<a href="../assignment/list.jhtml" target="iframe">${message("admin.main.assignment")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<!-- EmployeeManager End  -->
				<dl id="pProcut">
					<dt>${message("admin.main.pointExchangeManager")}</dt>
					[@shiro.hasPermission name="admin:pProduct"]
						<dd>
							<a href="../exchange/list.jhtml" target="iframe">${message("admin.main.pProductManager")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:exchangeDetails"]
						<dd>
							<a href="../point/list.jhtml" target="iframe">${message("admin.main.exchangeDetails")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
			</td>
			<td>
				<iframe id="iframe" name="iframe" src="index.jhtml" frameborder="0"></iframe>
			</td>
		</tr>
		<!-- menu end -->
	</table>
</body>
</html>