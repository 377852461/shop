<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.order.view")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

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
			<div class="input order"  style="height:800px;">
                 <div id="dialog" class="dialog">
					<div id="close" class="close"></div>
					
					<div id="deliveryContent" class="deliveryContent"></div>
				</div>
				<div class="title">${message("shop.member.order.view")}</div>
				<div class="top" style="height:180px;">
					<span>${message("Order.sn")}: ${order.sn}</span>
					<span>
						${message("shop.member.order.status")}: 
						<strong>
							${message("Refunds.Status."+ refunds.status)}
						</strong>
					</span>
					<div class="tips">
					[#if type==1]
					${message("shop.order.viewName")}${returnes.modifyDate?string("yyyy-MM-dd HH:mm:ss")} 因${returnes.returnReason.cause}
					${message("shop.order.viewContent1")}
					如果${betweenTime}${message("shop.order.viewContent2")}
					[#else]
					  ${message("shop.order.viewConfName")}${returnes.modifyDate?string("yyyy-MM-dd HH:mm:ss")}因
					  ${returnes.returnReason.cause}
					  ${message("shop.order.viewConfContent1")}
					如果${betweenTime}${message("shop.order.viewConfContent2")}
					[/#if]
					</div>
							
			  </div>
			  <div align="center">
			   <input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
			  </div>	
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>