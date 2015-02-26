<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.order.returns")}[#if systemShowPowered] - Powered By SHOP++[/#if]</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.column-main{overflow:hidden;border-top:1px solid #ddd;zoom:1;width:685px;height:100%;float:right;min-height:300px}
</style>	
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>

<script type="text/javascript">


$().ready(function() {

	var $inputForm = $("#inputForm");
	var $browserButton = $("#browserButton");
	[@flash_message /]
	$browserButton.browser();
	
	
});
</script>
</head>
<body>
	<div id="dialogOverlay" class="dialogOverlay"></div>
	[#assign current = "orderList" /]
	[#include "/shop/include/header.ftl" /]
	<div class="container member">
		[#include "/shop/member/include/navigation.ftl" /]
		<div class="span18 last">
		   <div class="input">
		   
		 	<div class="title">${message("shop.orderRefunds.viewRefunds")}</div>
			 <form id="inputForm" action="save.jhtml?sn=${order.sn}" method="post">
		      <table class="input tabContent">
		      	<tr>
		      		<th>
						${message("shop.orderRefunds.viewRefundsSn")}:
					</th>
		      		<td>
		      			${refunds.sn}
					</td>
		      	</tr>
		      	<tr>
		      		<th>
						${message("shop.orderRefunds.order")}:
					</th>
		      		<td>
		      			${refunds.orderItem.order.sn}
					</td>
		      	</tr>
		      	[#list refunds.orderItem.refundsLogs as refundsLog]
			      	<tr>
			      		<th>
			      			退款操作：
						</th>
			      		<td>
			      			${refundsLog.type}${refundsLog.operator}于${refundsLog.createDate?string("yyyy-MM-dd HH:mm:ss")}${refundsLog.content}
						</td>
			      	</tr>		      		
		      	[/#list]		      				      
				<!--<tr class="roles">
					<th>
						${message("shop.orderRefunds.upload")}:
					</th>
					<td>
						<input type="text" name="uploadImages" class="text" maxlength="200" />
						<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
					</td>

				</tr>-->
				<tr>
					<th>
					</th>
					<td>
						[#if order.orderStatus!="completed"]
							[#if refunds.status=="agreenreturn"&&refunds.returns.trackingNo==null]									
								<input type="button" class="button" value="${message("shop.member.handle.returnsCorp")}" onclick="location.href='addCorp.jhtml?id=${refunds.id}&day=7'" />
							[#elseif refunds.status=="refundsFaild"||refunds.status=="concelrefunded"]
								[#if order.shippingStatus=="unshipped"]
									<input type="button" class="button" value="${message("shop.member.handle.refundsOnly")}" onclick="location.href='addRefunds.jhtml?id=${refunds.orderItem.id}'" />
								[#else]
									<input type="button" class="button" value="${message("shop.member.handle.returns")}" onclick="location.href='returns.jhtml?id=${refunds.orderItem.id}'" />
								[/#if]																																	
							[/#if]
						[/#if]						
						<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
						<input type="button" class="button" value="申请客服介入" onclick="location.href='list.jhtml'" />
						<span style="color:orange">*如遇退款失败，请即时联系商家，或申请客服介入*</span>
					</td>
				</tr>
			</table>
		</form>								
				  </div>
			  </div>	
			</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>