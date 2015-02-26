<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.order.payment")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
[#assign sn=""]
[#assign amount=0]
[#assign orderfee=0]
[#assign orderfee=0]
[#assign shippingMethodName=""]
[#list order as curOrder]
	[#assign sn = sn +curOrder.sn+","];
	[#assign amount= amount +curOrder.amount];
	[#assign orderfee=orderfee+curOrder.fee];
	[#assign shippingMethodName=shippingMethodName+curOrder.shippingMethodName+","];
[/#list]

$().ready(function() {

	var $dialogOverlay = $("#dialogOverlay");
	var $dialog = $("#dialog");
	var $other = $("#other");
	var $amountPayable = $("#amountPayable");
	var $fee = $("#fee");
	var $paymentForm = $("#paymentForm");
	var $paymentPluginId = $("#paymentPlugin :radio");
	var $paymentButton = $("#paymentButton");
//alert("${sn}----${amount}----${orderfee}");
//alert("${paymentStatus}----${paymentMethod.method}---${shippingMethodName}");

	[#if paymentMethod.method == "online" && (paymentStatus == "unpaid" || paymentStatus == "partialPayment")]
		// 订单锁定
		setInterval(function() {
			$.ajax({
				url: "lock.jhtml",
				type: "POST",
				data: {sn: "${sn}"},
				dataType: "json",
				cache: false,
				success: function(data) {
					if (!data) {
						location.href = "list.jhtml";
					}
				}
			});
		}, 10000);

		// 检查支付
		setInterval(function() {
			$.ajax({
				url: "/shop/member/order/check_payment.jhtml",
				type: "POST",
				data: {sn: "${sn}"},
				dataType: "json",
				cache: false,
				success: function(data) {
					if (data) {
						location.href = "list.jhtml";
					}
				}
			});
		}, 1000);
	[/#if]
	
	// 选择其它支付方式
	$other.click(function() {
		$dialogOverlay.hide();
		$dialog.hide();
	});
	
	// 支付插件
	$paymentPluginId.click(function() {
		$.ajax({
			url: "calculate_amount.jhtml",
			type: "POST",
			data: {paymentPluginId: $(this).val(), sn: "${sn}"},
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data.message.type == "success") {
					$amountPayable.text(currency(data.amount, true, true));
					if (data.fee > 0) {
						$fee.text(currency(data.fee, true)).parent().show();
					} else {
						$fee.parent().hide();
					}
				} else {
					$.message(data.message);
					setTimeout(function() {
						location.reload(true);
					}, 3000);
				}
			}
		});
	});
	
	// 支付
	$paymentForm.submit(function() {
		
		$dialogOverlay.show();
		$dialog.show();
	});

});
</script>
</head>
<body>
	<div id="dialogOverlay" class="dialogOverlay"></div>
	[#include "/shop/include/header.ftl" /]
	<div class="container order">
	
		<div id="dialog" class="dialog">
			<dl>
				${message("shop.order.paymentDialog")}
			</dl>
			<div>
				${message("shop.order.paid")}
				<a href="${base}/">${message("shop.order.trouble")}</a>
			</div>
			<a href="javascript:;" id="other">${message("shop.order.otherPaymentMethod")}</a>
		</div>
		<div class="span24">
			<div class="step step3">
				<ul>
					<li>${message("shop.order.step1")}</li>
					<li>${message("shop.order.step2")}</li>
					<li class="current">${message("shop.order.step3")}</li>
				</ul>
			</div>
			<div class="result">
				[#if paymentStatus == "paid"]
					<div class="title">${message("shop.order.waitingShipment")}</div>
				[#else]
					[#if paymentMethod.method == "online"]
						<div class="title">${message("shop.order.waitingPayment")}</div>
					[#else]
					[#if paymentStatusResult == "ok"]
						<div class="title">${message("shop.order.waitingProcess")}</div>
						[#else]
						<div class="title">${message("shop.order.partialProcess")}</div>
						[/#if]
					[/#if]
				[/#if]
				<table>
					<tr>
						<th colspan="4">${message("shop.order.info")}:</th>
					</tr>
					<tr>
						<td width="100">${message("shop.order.sn")}:</td>
						<td width="340">
							<strong>${sn}</strong>
						</td>
						[#if paymentStatus == "unpaid" || paymentStatus == "partialPayment"]
							<td width="100">${message("shop.order.amountPayable")}:</td>
							<td>
								[#if amount??]
									<strong id="amountPayable">${currency(amount, true, true)}</strong>
								[#else]
									<strong id="amountPayable">${currency(curOrder.amountPayable, true, true)}</strong>
								[/#if]
								[#if fee??]
									<span[#if fee == 0] class="hidden"[/#if]>(${message("shop.order.fee")}: <span id="fee">${currency(fee, true)}</span>)</span>
								[#else]
									<span[#if orderfee == 0] class="hidden"[/#if]>(${message("shop.order.fee")}: <span id="fee">${currency(orderfee, true)}</span>)</span>
								[/#if]
							</td>
						[#else]
							<td width="100">${message("shop.order.amount")}:</td>
							<td>
								<strong>${currency(amount, true, true)}</strong>
								[#if orderfee > 0]
									(${message("shop.order.fee")}: ${currency(orderfee, true)})
								[/#if]
							</td>
						[/#if]
					</tr>
					<tr>
						<td>${message("shop.order.shippingMethod")}:</td>
						<td>${shippingMethodName}</td>
						<td>${message("shop.order.paymentMethod")}:</td>
						<td>${paymentMethodName}</td>
					</tr>
					[#if expire??]
						<tr>
							<td colspan="4">${message("shop.order.expireTips", expire?string("yyyy-MM-dd HH:mm"))}</td>
						</tr>
					[/#if]
				</table>
				[#if paymentStatus != "paid"]
					[#if paymentMethod.method == "online"]
						[#if paymentPlugins??]
							<form id="paymentForm" action="${base}/payment/submit.jhtml" method="post" target="_blank">
								<input type="hidden" name="type" value="payment" />
								<input type="hidden" name="sn" value="${sn}" />
								<table id="paymentPlugin" class="paymentPlugin">
									<tr>
										<th colspan="4">${message("shop.order.paymentMethod")}:</th>
									</tr>
									<tr>
										<td>
											[#if cscinit==0]
												<input type="radio" id="0" name="paymentPluginId" value="0" [#if amount>balance] disabled="disabled" [/#if]/>
											[#else]
												<input type="radio" id="0" name="paymentPluginId" value="0" [#if amount>MeBalance] disabled="disabled" [/#if]/>
											[/#if]
											<label for="0">
												[#if cscinit==0]
												预存款:
													(<span style="color:red;">${balance}</span>元)
												[#else]
													(<span style="color:red;">${MeBalance}</span>元)
												[/#if]
											</label>
										</td>
									</tr>
									[#list paymentPlugins?chunk(4, "") as row]
										<tr>
											[#list row as paymentPlugin]
												[#if paymentPlugin?has_content]
													<td>
														<input type="radio" id="${paymentPlugin.id}" name="paymentPluginId" value="${paymentPlugin.id}"[#if paymentPlugin == defaultPaymentPlugin] checked="checked"[/#if] />
														<label for="${paymentPlugin.id}">
															[#if paymentPlugin.logo??]
																<em title="${paymentPlugin.paymentName}" style="background-image: url(${paymentPlugin.logo});">&nbsp;</em>
															[#else]
																<em>${paymentPlugin.paymentName}</em>
															[/#if]
														</label>
													</td>
												[#else]
													<td>
														&nbsp;
													</td>
												[/#if]
											[/#list]
										</tr>
									[/#list]
								</table>
								<input type="submit" id="paymentButton" class="paymentButton" value="${message("shop.order.payNow")}" />
							</form>
						[/#if]
					[#else]
						${paymentMethod.content}
					[/#if]
				[/#if]
			</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>