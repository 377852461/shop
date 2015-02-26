<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-

transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.order.list")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<style>
	.btn{progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649', endColorstr='#df3134', GradientType='0'); PADDING-BOTTOM: 4px; LINE-HEIGHT: 18px; BACKGROUND-COLOR: #e74649; PADDING-LEFT: 15px; PADDING-RIGHT: 15px; DISPLAY: inline-block; HEIGHT: 18px; COLOR: #fff; PADDING-TOP: 3px; border-radius: 2px; -webkit-border-radius: 2px; -moz-border-radius: 2px}
</style>
<script type="text/javascript">
$().ready(function() {
	
	[@flash_message /]

});
function takeOver(sn){
	if(confirm("请你确认收到货以后再点击“确定”按钮，确认收货，否则可能人财两空。")){
		$.ajax({
             type: "GET",
             url: "takeOver.jhtml",
             data: {sn:sn},
             success: function(data){
                         if(data){
                         	location.reload();
                         }else{
                         	alert("确认失败");
                         }
                      }
         });
	}
}
</script>
</head>
<body>
	[#assign current = "orderList" /]
	[#include "/shop/include/header.ftl" /]
	<div class="container member">
		[#include "/shop/member/include/navigation.ftl" /]
		<div class="span18 last">
			<div class="list">
				<div class="title">${message("shop.member.order.list")}</div>
				<table class="list">
					<tr>
						<th>
							${message("Order.sn")}
						</th>
						<th>
							${message("shop.member.order.product")}
						</th>
						<th>
							${message("Order.consignee")}
						</th>
						<th>
							${message("Order.amount")}
						</th>
						<th>
							${message("shop.common.createDate")}
						</th>
						<th>
							${message("shop.member.order.status")}
						</th>
						<th>
							${message("shop.member.handle")}
						</th>
					</tr>
					[#list page.content as order]
						<tr[#if !order_has_next] class="last"[/#if]>
							<td rowspan=${order.orderItems?size}>
								<a href="view.jhtml?sn=${order.sn}">${order.sn}</a>
							</td>														
							[#list order.orderItems as orderItem]
								[#if orderItem_index==0]
									<td style="border-bottom-style:none">
										<a href="view.jhtml?sn=${order.sn}"><img src="
											[#if orderItem.thumbnail??]${orderItem.thumbnail}
											[#else]${setting.defaultThumbnailProductImage}[/#if]" 
											class="thumbnail" alt="${orderItem.fullName}" />
										</a>																			
										[#if orderItem.refundss?size==0]
											[#if order.paymentStatus!="unpaid"&&order.orderStatus!="completed"&&order.orderStatus!="refunded"]	
												[#if order.shippingStatus=="unshipped"]
													<a href="addRefunds.jhtml?id=${orderItem.id}">[${message("shop.member.handle.refundsOnly")}]</a>
												[#else]
													<a href="returns.jhtml?id=${orderItem.id}">[${message("shop.member.handle.returns")}]</a>
												[/#if]	
											[/#if]																				
										[#else]
											[#list orderItem.refundss as refunds]
												[#if refunds.refundsStatus=="unExpired"]												
													<a href="viewRefunds.jhtml?sn=${refunds.sn}">${message("Refunds.Status."+ refunds.status)}</a>
												[/#if]
											[/#list]										
										[/#if]
									</td>
								[/#if]
							[/#list]							
							<td rowspan=${order.orderItems?size}>
								${order.consignee}
							</td>
							<td rowspan=${order.orderItems?size}>
								${currency(order.amount, true)}
							</td>
							<td rowspan=${order.orderItems?size}>
								<span title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${order.createDate}</span>
							</td>
							<td rowspan=${order.orderItems?size}>
								[#if order.orderStatus!="completed"]
									[#if order.orderStatus=="partialrefunded"||order.orderStatus=="refunded"]
										${message("Order.OrderStatus." + order.orderStatus)}
									[#elseif order.orderStatus == "cancelled"]
										已取消
									[#else]
										${message("Order.PaymentStatus." + order.paymentStatus)}
										${message("Order.ShippingStatus."+ order.shippingStatus)}
									[/#if]
								[#else]
								           已完成
								[/#if]							
															
							</td>
							<td rowspan=${order.orderItems?size}>
								<a href="view.jhtml?sn=${order.sn}">[${message("shop.member.handle.view")}]</a>	
								
								[#if order.orderStatus!="completed"&&order.orderStatus!="refunded"]
									[#if order.paymentStatus == "unpaid" &&!order.expired && order.orderStatus != "cancelled"]
										<a href="payment.jhtml?sn=${order.sn}" target="_blank" class="btn"><s></s>付&nbsp;款</a></span>
									[/#if]
									[#if order.paymentStatus=="paid"&&order.shippingStatus=="shipped"]
										<a href="#" onClick="takeOver(${order.sn})">[${message("shop.member.handle.confirm")}]</a>					
									[/#if]	
								[#elseif order.orderStatus=="completed"]
									[#if order.review==0]
										<a href="${base}/member/order/add/${order.sn}.jhtml" id="addReview">[评价]</a>
									[#else]
										[已评价]	
									[/#if]																											
								[/#if]														                           
                              <input type="hidden" name="order_status" value="${order.orderStatus}"  >
                              <input type="hidden" name="order_paymentStatus" value="${order.paymentStatus}"  >
                              <input type="hidden" name="order_shippingStatus" value="${order.shippingStatus}"  >
							</td>
						</tr>
						[#list order.orderItems as orderItem]
							[#if orderItem_index!=0]
								<tr>
									<td>
										<a href="view.jhtml?sn=${order.sn}"><img src="
											[#if orderItem.thumbnail??]${orderItem.thumbnail}
											[#else]${setting.defaultThumbnailProductImage}[/#if]" 
											class="thumbnail" alt="${orderItem.fullName}" />
										</a>
										[#if orderItem.refundss?size==0]
											[#if order.paymentStatus!="unpaid"&&order.orderStatus!="completed"&&order.orderStatus!="completed"&&order.orderStatus!="refunded"]	
												[#if order.shippingStatus=="unshipped"]
													<a href="addRefunds.jhtml?id=${orderItem.id}">[${message("shop.member.handle.refundsOnly")}]</a>
												[#else]
													<a href="returns.jhtml?id=${orderItem.id}">[${message("shop.member.handle.returns")}]</a>
												[/#if]	
											[/#if]																				
										[#else]
											[#list orderItem.refundss as refunds]
												[#if refunds.refundsStatus=="unExpired"]												
													<a href="viewRefunds.jhtml?sn=${refunds.sn}">${message("Refunds.Status."+ refunds.status)}</a>
												[/#if]
											[/#list]										
										[/#if]
									</td>
								</tr>
							[/#if]
						[/#list]											
					[/#list]
				</table>
				[#if !page.content?has_content]
					<p>${message("shop.member.noResult")}</p>
				[/#if]
			</div>
			[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "?pageNumber={pageNumber}"]
				[#include "/shop/include/pagination.ftl"]
			[/@pagination]
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>