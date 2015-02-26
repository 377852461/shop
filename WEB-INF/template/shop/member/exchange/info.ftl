<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.exchange.list")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $dialogOverlay = $("#dialogOverlay");
	var $receiverForm = $("#receiverForm");
	var $receiver = $("#receiver ul");
	var $otherReceiverButton = $("#otherReceiverButton");
	var $newReceiverButton = $("#newReceiverButton");
	var $newReceiver = $("#newReceiver");
	var $areaId = $("#areaId");
	var $newReceiverSubmit = $("#newReceiverSubmit");
	var $newReceiverCancelButton = $("#newReceiverCancelButton");
	var $orderForm = $("#orderForm");
	var $receiverId = $("#receiverId");
	var $paymentMethodId = $("#paymentMethod :radio");
	var $shippingMethodId = $("#shippingMethod :radio");
	var $isInvoice = $("#isInvoice");
	var $invoiceTitleTr = $("#invoiceTitleTr");
	var $invoiceTitle = $("#invoiceTitle");
	var $couponTag = $("#couponTag");
	var $couponTable = $("#couponTable");
	var $code = $("#code");
	var $couponCode = $("#couponCode");
	var $couponName = $("#couponName");
	var $couponButton = $("#couponButton");
	var $useBalance = $("#useBalance");
	var $freight = $("#freight");
	var $freightstr = $("#freightstr");
	var $promotionDiscount = $("#promotionDiscount");
	var $couponDiscount = $("#couponDiscount");
	var $tax = $("#tax");
	var $amountPayable = $("#amountPayable");
	var $submit = $("#submit");
	var $point = $("#point");
	var $codeValue = $("input[name='codeValue']");
	var shippingMethodIds = {};
	
	[@compress single_line = true]
		[#list paymentMethods as paymentMethod]
			shippingMethodIds["${paymentMethod.id}"] = [
				[#list paymentMethod.shippingMethods as shippingMethod]
					"${shippingMethod.id}"[#if shippingMethod_has_next],[/#if]
				[/#list]
			];
		[/#list]
	[/@compress]
	
	[#if !member.receivers?has_content]
		$dialogOverlay.show();
	[/#if]
	
	// 地区选择
	$areaId.lSelect({
		url: "${base}/common/area.jhtml"
	});
	
	// 收货地址
	$("#receiver li").live("click", function() {
		var $this = $(this);
		$receiverId.val($this.attr("receiverId"));
	$.ajax({
				url: "${base}/member/exchange/isReceiver.jhtml",
				type: "post",
				data: {receiverId : $receiverId.val()},
				dataType: "json",
				cache: false,
				success: function(data) {
					if (data.message.type == "success") {
						$("#receiver li").removeClass("selected");
						$this.addClass("selected");
						[#if setting.isInvoiceEnabled]
							if ($.trim($invoiceTitle.val()) == "") {
							$invoiceTitle.val($this.find("strong").text());
							}
						[/#if]
						//alert($receiverId.val());
						calculate();
					} else {
						$.message(data.message);
					}
				}
			});
	});
	
	// 其它收货地址
	$otherReceiverButton.click(function() {
		$otherReceiverButton.hide();
		$newReceiverButton.show();
		$("#receiver li").show();
	});
	
	// 新收货地址
	$newReceiverButton.click(function() {
		$dialogOverlay.show();
		$newReceiver.show();
	});
	
	// 新收货地址取消
	$newReceiverCancelButton.click(function() {
		if ($receiverId.val() == "") {
			$.message("warn", "${message("shop.order.receiverRequired")}");
			return false;
		}
		$dialogOverlay.hide();
		$newReceiver.hide();
	});
	
	
	// 订单提交
	$submit.click(function() {
		$.ajax({
			url: "build.jhtml",
			type: "POST",
			data: $orderForm.serialize(),
			dataType: "json",
			cache: false,
			beforeSend: function() {
				$submit.prop("disabled", true);
			},
			success: function(message) {
				if (message.type == "success") {
					location.href = "eProduct_list.jhtml";
				} else {
					$.message(message);
					setTimeout(function() {
						location.reload(true);
					}, 3000);
				}
			},
			complete: function() {
				$submit.prop("disabled", false);
			}
		});
	});
	
	// 表单验证
	$receiverForm.validate({
		rules: {
			consignee: "required",
			areaId: "required",
			address: "required",
			zipCode: "required",
			phone: "required"
		},
		submitHandler: function(form) {
			$.ajax({
				url: "${base}/member/order/save_receiver.jhtml",
				type: "POST",
				data: $receiverForm.serialize(),
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$newReceiverSubmit.prop("disabled", true);
				},
				success: function(data) {
					if (data.message.type == "success") {
						$receiverId.val(data.receiver.id);
						$("#receiver li").removeClass("selected");
						$receiver.append('<li class="selected" receiverId="' + data.receiver.id + '"><div><strong>' + data.receiver.consignee + '<\/strong> ${message("shop.order.receive")}<\/div><div><span>' + data.receiver.areaName + data.receiver.address + '<\/span><\/div><div>' + data.receiver.phone + '<\/div><\/li>');
						$dialogOverlay.hide();
						$newReceiver.hide();
						[#if setting.isInvoiceEnabled]
							if ($.trim($invoiceTitle.val()) == "") {
								$invoiceTitle.val(data.receiver.consignee);
							}
						[/#if]
					} else {
						$.message(data.message);
					}
				},
				complete: function() {
					$newReceiverSubmit.prop("disabled", false);
				}
			});
		}
	});
	
});
</script>
</head>
<body>
	<div id="dialogOverlay" class="dialogOverlay"></div>
	[#include "/shop/include/header.ftl" /]
	<div class="container order">
		<div class="span24">
			<div class="step step2">
				<ul>
					<li>${message("shop.order.step4")}</li>
					<li class="current">${message("shop.order.step5")}</li>
					<li>${message("shop.order.step3")}</li>
				</ul>
			</div>
			<div class="info">
				<form id="receiverForm" action="save_receiver.jhtml" method="post">
					<div id="receiver" class="receiver clearfix">
						<div class="title">${message("shop.order.receiver")}</div>
						<ul>
							[#list member.receivers as receiver]
								<li[#if receiver_index == 0][#assign defaultReceiver = receiver /] class="selected"[#elseif receiver_index > 3] class="hidden"[/#if] receiverId="${receiver.id}">
									<div>
										<strong>${receiver.consignee}</strong> ${message("shop.order.receive")}
									</div>
									<div>
										<span>${receiver.areaName}${receiver.address}</span>
									</div>
									<div>
										${receiver.phone}
									</div>
								</li>
							[/#list]
						</ul>
						<p>
							[#if member.receivers?size > 4]
								<a href="javascript:;" id="otherReceiverButton" class="button">${message("shop.order.otherReceiver")}</a>
							[/#if]
							<a href="javascript:;" id="newReceiverButton" class="button"[#if member.receivers?size > 4] style="display: none;"[/#if]>${message("shop.order.newReceiver")}</a>
						</p>
					</div>
					<table id="newReceiver" class="newReceiver[#if member.receivers?has_content] hidden[/#if]">
						<tr>
							<th width="100">
								<span class="requiredField">*</span>${message("shop.order.consignee")}:
							</th>
							<td>
								<input type="text" id="consignee" name="consignee" class="text" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>${message("shop.order.area")}:
							</th>
							<td>
								<span class="fieldSet">
									<input type="hidden" id="areaId" name="areaId" />
								</span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>${message("shop.order.address")}:
							</th>
							<td>
								<input type="text" id="address" name="address" class="text" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>${message("shop.order.zipCode")}:
							</th>
							<td>
								<input type="text" id="zipCode" name="zipCode" class="text" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>${message("shop.order.phone")}:
							</th>
							<td>
								<input type="text" id="phone" name="phone" class="text" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								${message("shop.order.isDefault")}:
							</th>
							<td>
								<input type="checkbox" name="isDefault" value="true" />
								<input type="hidden" name="_isDefault" value="false" />
							</td>
						</tr>
						<tr>
							<th>&nbsp;
								
							</th>
							<td>
								<input type="submit" id="newReceiverSubmit" class="button" value="${message("shop.order.ok")}" />
								<input type="button" id="newReceiverCancelButton" class="button" value="${message("shop.order.cancel")}" />
							</td>
						</tr>
					</table>
				</form>
				<form id="orderForm" action="build.jhtml" method="post">
					<input type="hidden" id="receiverId" name="receiverId"[#if defaultReceiver??] value="${defaultReceiver.id}"[/#if] />
					<input type="hidden" name="id" value="${exchange.id}"/>
					<input type="hidden" name="cartToken" value="${cartToken}" />
					<table class="product">
						<tr>
							<th width="60">${message("shop.order.image")}</th>
							<th>${message("shop.order.product")}</th>
							<th>${message("shop.order.price")}</th>
							<th>${message("shop.exchange.point")}</th>
							<th>${message("shop.order.subTotal")}</th>
						</tr>
							<tr>
								<td>
									<img src="${exchange.image}" alt="${orderItem.product.name}" />
								</td>
								<td>
									${exchange.name}
								</td>
								<td>
									${exchange.price}
								</td>
								<td>
									${exchange.point}
								</td>
								<td>
									${exchange.point}
								</td>
							</tr>
					</table>
				
					<div class="span12 last" style="float:right;">
						<ul class="statistic">
							<li>
								<span>
									${message("shop.order.pointPayable")}: <strong id="amountPayable">${exchange.point}</strong>
								</span>
							</li>
							
						</ul>
					</div>
			
					<div class="span24">
						<div class="bottom">
							<a href="${base}/cart/list.jhtml" class="back">${message("shop.order.back")}</a>
							<a href="javascript:;" id="submit" class="submit">${message("shop.order.submit")}</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>