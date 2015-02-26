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
	.apply-selector{text-align:center;padding:60px 0 0}
	.apply-selector a{display:inline-block;*display:inline;*zoom:1;vertical-align:top;background:#f7f5f6;border:5px solid #eae5e1;margin:0 30px;padding-top:50px;width:260px;height:80px;color:#333;font-size:18px;font-weight:700;text-align:center;overflow:hidden}
	.apply-selector a:hover{text-decoration:none;background:#f0eceb;border-color:#816e67}
	.apply-selector span{color:#999;font-weight:400;font-size:12px;display:block}
	.thumbnail{margin-left: 20px; max-height:80px;}
</style>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">

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
					<div class="title">${message("shop.orderRefunds.refundsAndReturns")}</div>
					<div>
						<a href="${base}${orderItem.product.path}" target="_blank">
							<img src="[#if orderItem.thumbnail??]${orderItem.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" class="thumbnail" alt="${orderItem.fullName}" />
						</a>
						<span>${orderItem.fullName}[#if orderItem.product.shortIntroduction?has_content](${orderItem.product.shortIntroduction})[/#if]</span>
					</div>
                	<div class="apply-selector">
	                	<a href="addReturns.jhtml?id=${orderItem.id}" data-target="goods">我要退货</a>
	                	<a href="addRefunds.jhtml?id=${orderItem.id}" data-target="fee">我要退款</a>
	            	</div>
		            <table class="input tabContent">
		               <tr>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
						</tr>
		            	<tr>
							<td>
							</td>
							
							<td align="center">
								&nbsp;&nbsp;
								<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
							</td>
							<td>
							</td>
						</tr>
		            </table>
				</div>				              			                    	
			</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>