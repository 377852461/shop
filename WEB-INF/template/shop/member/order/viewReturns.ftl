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

	var $dialogOverlay = $("#dialogOverlay");
	var $dialog = $("#dialog");
	var $close = $("#close");
	var $deliveryContent = $("#deliveryContent");
	var $cancel = $("#cancel");
	var $deliveryQuery = $("a.deliveryQuery");

	[@flash_message /]
	
	// 订单取消
	$cancel.click(function() {
		if (confirm("${message("shop.member.order.cancelConfirm")}")) {
			$.ajax({
				url: "cancel.jhtml?sn=${order.sn}",
				type: "POST",
				dataType: "json",
				cache: false,
				success: function(message) {
					if (message.type == "success") {
						location.reload(true);
					} else {
						$.message(message);
					}
				}
			});
		}
		return false;
	});
	
	// 物流动态
	$deliveryQuery.click(function() {
		var $this = $(this);
		$.ajax({
			url: "delivery_query.jhtml?sn=" + $this.attr("sn"),
			type: "GET",
			dataType: "json",
			cache: true,
			beforeSend: function() {
				$dialog.show();
				$dialogOverlay.show();
				$deliveryContent.html("${message("shop.member.order.loading")}");
			},
			success: function(data) {
				if (data.data != null) {
					var html = '<table>';
					$.each(data.data, function(i, item) {
						html += '<tr><th>' + item.time + '<\/th><td>' + item.context + '<\/td><\/tr>';
					});
					html += '<\/table>';
					$deliveryContent.html(html);
				} else {
					$deliveryContent.text(data.message);
				}
			}
		});
		return false;
	});
	
	// 关闭物流动态
	$close.click(function() {
		$dialog.hide();
		$dialogOverlay.hide();
	});

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
			<div class="input order">
                 <div id="dialog" class="dialog">
					<div id="close" class="close"></div>
					
					<div id="deliveryContent" class="deliveryContent"></div>
				</div>
				<div class="title">${message("shop.member.returns.view")}</div>
				<table class="info">
					<tr>
						<th>
							${message("shop.member.returns.sn")}:
						</th>
						<td>
							${order.sn}
						</td>
					</tr>
					<tr>
			      		<th>
			      			退款详情
						</th>
			      		<td>
			      			<table>
								<tr>
									<th>
										${message("Refunds.sn")}
									</th>
									<th>
										${message("Refunds.method")}
									</th>
									<th>
										${message("Refunds.amount")}
									</th>
									<th>
										退款状态
									</th>
									<th>
										${message("admin.common.createDate")}
									</th>
								</tr>
								[#list order.refunds as refunds]
									<tr>
										<td>
											${refunds.sn}
										</td>
										<td>
											${message("Refunds.Method." + refunds.method)}
										</td>
										<td>
											${currency(refunds.amount, true)}
										</td>
										<td>
											${message("Refunds.Status."+refunds.status)}
										</td>
										<td>
											<span title="${refunds.createDate?string("yyyy-MM-dd HH:mm:ss")}">${refunds.createDate}</span>
										</td>
									</tr>
								[/#list]
							</table>
						</td>
			      	</tr>	
					<tr>
						<th>
							${message("shop.member.returns.deliverycorp")}:
						</th>
						<td>
							${returns.deliveryCorp}
						</td>
					</tr>
					<tr>
						<th>
							${message("shop.member.returns.shippingmethod")}:
						</th>
						<td>
							${returns.shippingMethod}
						</td>
					</tr>
						<tr>
							<th>
								${message("shop.member.returns.trackingno")}:
							</th>
							<td>
								${returns.trackingNo}
							</td>
						</tr>
						<tr>
							[#if order.orderStatus=="concelReturn"]
								<th>
									${message("shop.orderReturn.cancelReturnReason")}:
								</th>
								<td>
									${returns.memo}
								</td>
							[#else]
								<th>
									${message("shop.orderReturn.returnReason")}:
								</th>
								<td>
									${returns.returnReason.cause}
								</td>
							[/#if]
						</tr>
						<tr>
							<th>
								${message("shop.orderReturn.userName")}:
							</th>
							<td>
								${returns.linkName}
							</td>
						</tr>
						<tr>
							<th>
								${message("shop.orderReturn.userPhone")}:
							</th>
							<td>
								${returns.linkPhone}
							</td>
						</tr>
						<tr>
							<th>
								${message("shop.orderReturn.address")}:
							</th>
							<td>
								${returns.address}
							</td>
						</tr>
					<tr>
						<th>
						 ${message("shop.orderReturn.fahuoName")}:
						</th>
						<td>
							${returns.shipper}
						</td>
					</tr>
					<tr>
					<th>
					</th>
					<td>
						<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
					</td>
				</tr>
			</table>
					
				<table class="orderItem">
					<tr>
						<th>
							${message("returnsItem.sn")}
						</th>
						<th>
							${message("returnsItem.name")}
						</th>
						<th>
							${message("returnsItem.quantity")}
						</th>
						<th>
							${message("returnsItem.createDate")}
						</th>
						
					</tr>
					[#list returnsList as returnsItemList]
						<tr>
							<td>
								${returnsItemList.sn}
							</td>
							<td>
								${returnsItemList.name}
							</td>
							<td>
								${returnsItemList.quantity}
							</td>
							<td>
								${returnsItemList.createDate}
							</td>
							
						</tr>
					[/#list]
				</table>
			</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>