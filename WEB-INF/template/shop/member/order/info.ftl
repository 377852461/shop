<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.order.info")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
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
				url: "isReceiver.jhtml",
				type: "POST",
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
	
	//使用优惠券
	$codeValue.live("click", function(){
		if(this.checked==true){
			$code.val($(this).prop("value"));
			$couponCode.show();
			$couponName.hide();
			$couponButton.text("${message("shop.order.codeConfirm")}");
			calculate();
		}				
	});
	
	//选择优惠券
	$couponTag.bind("click", function () {
		if(this.checked==true){
			$.ajax({
				url : "coupon_list.jhtml",
				type: "POST",
				success: function(data){
					$couponTable.empty();
					$.each(data,function(i,n){
						[@compress single_line = true]
							var trHtml = 
							'<tr>
								<td>
									<input type="radio" name="codeValue" value="' + n.code + '" \/>'+ n.name + '
								<\/td>
							<\/tr>';
						[/@compress]
						$couponTable.append(trHtml);
					});
				}
			});
			$("#couponDiv").show();
		}else{
			$code.val("");
			calculate();
			$couponTable.html("");
			$("#couponDiv").hide();
		}
    });
	
	// 计算
	function calculate() {
		$.ajax({
			url: "calculate.jhtml",
			type: "POST",
			data: $orderForm.serialize(),
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data.message.type == "success") {
					$freight.text(currency(data.freight, true));
					$freightstr.text(data.freightstr);
					if (data.promotionDiscount > 0) {
						$promotionDiscount.text(currency(data.promotionDiscount, true));
						$promotionDiscount.parent().show();
					} else {
						$promotionDiscount.parent().hide();
					}
					if (data.couponDiscount > 0) {
						$couponDiscount.text(currency(data.couponDiscount, true));
						$couponDiscount.parent().show();
					} else {
						$couponDiscount.parent().hide();
					}
					if (data.tax > 0) {
						$tax.text(currency(data.tax, true));
						$tax.parent().show();
					} else {
						$tax.parent().hide();
					}
				//	alert(data.point);
					if (data.point > 0) {
					//alert($point.val());
						$point.text(data.point);
						$point.parent().show();
					} else {
						$point.parent().hide();
					}
					
					$amountPayable.text(currency(data.amountPayable, true, true));
				} else {
					$.message(data.message);
					setTimeout(function() {
						location.reload(true);
					}, 3000);
				}
			}
		});
	}
	
	// 支付方式
	//$paymentMethodId.click(function() {
	//	var $this = $(this);
	//	if ($this.prop("disabled")) {
	//		return false;
	//	}
	//	$this.closest("dd").addClass("selected").siblings().removeClass("selected");
	//	var paymentMethodId = $this.val();
	//	$shippingMethodId.each(function() {
	//		var $this = $(this);
	//		if ($.inArray($this.val(), shippingMethodIds[paymentMethodId]) >= 0) {
	//			$this.prop("disabled", false);
	//		} else {
	//			$this.prop("disabled", true).prop("checked", false).closest("dd").removeClass("selected");
	//		}
	//	});
	//	calculate();
	//});
	calculate();
	
	
	// 配送方式
	$shippingMethodId.click(function() {
		var $this = $(this);
		if ($this.prop("disabled")) {
			return false;
		}
		$this.closest("dd").addClass("selected").siblings().removeClass("selected");
		calculate();
	});
	
	// 开据发票
	$isInvoice.click(function() {
		$invoiceTitleTr.toggle();
		calculate();
	});
	
	// 优惠券
	$couponButton.live("click",function() {
		$codeValue.attr("checked",false);
		if (!$couponCode.is(":hidden")) {
			if ($.trim($couponCode.val()) == "") {
				return false;
			}
			$.ajax({
				url: "coupon_info.jhtml",
				type: "POST",
				data: {code : $couponCode.val()},
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$couponButton.prop("disabled", true);
				},
				success: function(data) {
					if (data.message.type == "success") {
						$code.val($couponCode.val());
						$couponCode.hide();
						$couponName.text(data.couponName).show();
						$couponButton.text("${message("shop.order.codeCancel")}");
						calculate();
					} else {
						$.message(data.message);
					}
				},
				complete: function() {
					$couponButton.prop("disabled", false);
				}
			});
		} else {
			$code.val("");
			$couponCode.show();
			$couponName.hide();
			$couponButton.text("${message("shop.order.codeConfirm")}");
			calculate();
		}
	});
	
	// 使用余额
	$useBalance.click(function() {
		//calculate();
	});
	
	// 订单提交
	$submit.click(function() {
		var $checkedPaymentMethodId = $paymentMethodId.filter(":checked");
		var $checkedShippingMethodId = $shippingMethodId.filter(":checked");
		if ($checkedPaymentMethodId.size() == 0) {
			$.message("warn", "${message("shop.order.paymentMethodRequired")}");
			return false;
		}

		[#if setting.isInvoiceEnabled]
			if ($isInvoice.prop("checked") && $.trim($invoiceTitle.val()) == "") {
				$.message("warn", "${message("shop.order.invoiceTileRequired")}");
				return false;
			}
		[/#if]
		$.ajax({
			url: "create.jhtml",
			type: "POST",
			data: $orderForm.serialize(),
			dataType: "json",
			cache: false,
			beforeSend: function() {
				$submit.prop("disabled", true);
			},
			success: function(message) {
				if (message.type == "success") {
					location.href = "payment.jhtml?sn=" + message.content;
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
			phone: "required",
			areaId_select:"required"
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
					<li>${message("shop.order.step1")}</li>
					<li class="current">${message("shop.order.step2")}</li>
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
				<form id="orderForm" action="create.jhtml" method="post">
					<input type="hidden" id="receiverId" name="receiverId"[#if defaultReceiver??] value="${defaultReceiver.id}"[/#if] />
					<input type="hidden" name="cartToken" value="${cartToken}" />
					<dl id="paymentMethod" class="select">
						<dt>${message("shop.order.paymentMethod")}</dt>
						[#list paymentMethods as paymentMethod]
							<dd>
								<label for="paymentMethod_${paymentMethod.id}">
									<input type="radio" id="paymentMethod_${paymentMethod.id}" name="paymentMethodId" value="${paymentMethod.id}" />
									<span>
										[#if paymentMethod.icon??]
											<em style="border-right: none; background: url(${paymentMethod.icon}) center no-repeat;">&nbsp;</em>
										[/#if]
										<strong>${paymentMethod.name}</strong>
									</span>
									<span>${abbreviate(paymentMethod.description, 80, "...")}</span>
								</label>
							</dd>
						[/#list]
					</dl>
				<!--	<dl id="shippingMethod" class="select">
						<dt>${message("shop.order.shippingMethod")}</dt>
						[#list shippingMethods as shippingMethod]
							<dd>
								<label for="shippingMethod_${shippingMethod.id}">
									<input type="radio" id="shippingMethod_${shippingMethod.id}" name="shippingMethodId" value="${shippingMethod.id}" />
									<span>
										[#if shippingMethod.icon??]
											<em style="border-right: none; background: url(${shippingMethod.icon}) center no-repeat;">&nbsp;</em>
										[/#if]
										<strong>${shippingMethod.name}</strong>
									</span>
									<span>${abbreviate(shippingMethod.description, 80, "...")}</span>
								</label>
							</dd>
						[/#list]
					</dl>-->
					
					[#if setting.isInvoiceEnabled]
						<table>
							<tr>
								<th colspan="2">${message("shop.order.invoiceInfo")}</th>
							</tr>
							<tr>
								<td width="100">
									${message("shop.order.isInvoice")}:
								</td>
								<td>
									<label for="isInvoice">
										<input type="checkbox" id="isInvoice" name="isInvoice" value="true" />
										[#if setting.isTaxPriceEnabled](${message("shop.order.invoiceTax")}: ${setting.taxRate * 100}%)[/#if]
									</label>
								</td>
							</tr>
							<tr id="invoiceTitleTr" class="hidden">
								<td width="100">
									${message("shop.order.invoiceTitle")}:
								</td>
								<td>
									<input type="text" id="invoiceTitle" name="invoiceTitle" class="text"[#if defaultReceiver??] value="${defaultReceiver.consignee}"[/#if] maxlength="200" />
								</td>
							</tr>
						</table>
					[/#if]
					<table class="product">
						<tr>
							<th width="60">${message("shop.order.image")}</th>
							<th>${message("shop.order.product")}</th>
							<th>${message("shop.order.price")}</th>
							<th>${message("shop.order.quantity")}</th>
							<!--<th>${message("shop.order.freight")}</th>-->
							<th>${message("shop.order.subTotal")}</th>
						</tr>
						[#list order as curOrder]
						<tr>
							<td colspan="5" >
								<span class="red lowStock">${curOrder.factory.mName}</span>
							</td>
							
						<tr>
						[#list curOrder.orderItems as orderItem]
							<tr>
								<td>
									<img src="[#if orderItem.product.thumbnail??]${orderItem.product.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${orderItem.product.name}" />
								</td>
								<td>
									<a href="${base}${orderItem.product.path}" title="${orderItem.product.fullName}" target="_blank">${abbreviate(orderItem.product.fullName, 50, "...")}</a>
									[#if orderItem.isGift]
										<span class="red">[${message("shop.order.gift")}]</span>
									[/#if]
								</td>
								<td>
									[#if !orderItem.isGift]
										${currency(orderItem.price, true)}
									[#else]
										-
									[/#if]
								</td>
								<td>
									${orderItem.quantity}
								</td>
								<!--<td>
									${orderItem.quantity}
								</td>-->
								<td>
									[#if !orderItem.isGift]
										${currency(orderItem.subtotal, true)}
									[#else]
										-
									[/#if]
								</td>
							</tr>
						[/#list]
							[/#list]
					</table>
					<div class="span12">
						<dl class="memo">
							<dt>${message("shop.order.memo")}:</dt>
							<dd>
								<input type="text" name="memo" maxlength="200" />
							</dd>
						</dl>
						
						<dl class="coupon">
							<input id="couponTag" type="checkbox" />是否使用优惠券
							<input type="hidden" id="code" name="code" maxlength="200" />
							<div id="couponDiv"  class="hidden">
								<table id="couponTable" class="couponTable">
								
								</table>
								<dt>兑换:</dt>
								<dd>
									<input type="text" id="couponCode" maxlength="200" />
									<span id="couponName">&nbsp;</span>
									<button type="button" id="couponButton">${message("shop.order.codeConfirm")}</button>
								</dd>
							<div>
						</dl>
					</div>
				
					<div class="span12 last">
						<ul class="statistic">
							<li>
								<span>
									${message("shop.order.freight")}: <em id="freight">${currency(freight, true)}</em>(<em id="freightstr">${freightstr}</em>)
								</span>
								[#if setting.isInvoiceEnabled && setting.isTaxPriceEnabled]
									<span class="hidden">
										${message("shop.order.tax")}: <em id="tax">${currency(tax, true)}</em>
									</span>
								[/#if]
								<span>
									${message("shop.order.point")}:<em id="point">${currency(point, true)}</em>
								</span>
							</li>
							<li>
								<span[#if promotionDiscount == 0] class="hidden"[/#if]>
									${message("shop.order.promotionDiscount")}: <em id="promotionDiscount">${currency(promotionDiscount, true)}</em>
								</span>
								<span[#if couponDiscount == 0] class="hidden"[/#if]>
									${message("shop.order.couponDiscount")}: <em id="couponDiscount">${currency(couponDiscount, true)}</em>
								</span>
							</li>
							<li>
								<span>
									${message("shop.order.amountPayable")}: <strong id="amountPayable">${currency(amountPayable, true, true)}</strong>
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