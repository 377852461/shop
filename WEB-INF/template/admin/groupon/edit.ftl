<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.promotion.edit")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<style type="text/css">
.memberRank label, .productCategory label, .brand label, .coupon label {
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
	var $productTable = $("#productTable");
	var $productSelect = $("#productSelect");
	var $deleteProduct = $("a.deleteProduct");
	var $productTitle = $("#productTitle");
	var $giftTable = $("#giftTable");
	var $giftSelect = $("#giftSelect");
	var $deleteGift = $("a.deleteGift");
	var $giftTitle = $("#giftTitle");
	var productIds = [#if groupon.products?has_content][[#list groupon.products as product]${product.id}[#if product_has_next], [/#if][/#list]][#else]new Array()[/#if];
	
	[@flash_message /]
	
	// 商品选择
	$productSelect.autocomplete("product_select.jhtml", {
		dataType: "json",
		max: 20,
		width: 600,
		scrollHeight: 300,
		parse: function(data) {
			return $.map(data, function(item) {
				return {
					data: item,
					value: item.fullName
				}
			});
		},
		formatItem: function(item) {
			if ($.inArray(item.id, productIds) < 0) {
				return '<span title="' + item.fullName + '">' + item.fullName.substring(0, 50) + '<\/span>';
			} else {
				return false;
			}
		}
	}).result(function(event, item) {
		[@compress single_line = true]
			var trHtml = 
			'<tr class="productTr">
				<th>
					<input type="hidden" name="productIds" value="' + item.id + '" \/>
					&nbsp;
				<\/th>
				<td>
					<span title="' + item.fullName + '">' + item.fullName.substring(0, 50) + '<\/span>
				<\/td>
				<td>
					<a href="${base}' + item.path + '" target="_blank">[${message("admin.common.view")}]<\/a>
					<a href="javascript:;" class="deleteProduct">[${message("admin.common.delete")}]<\/a>
				<\/td>
			<\/tr>';
		[/@compress]
		$productTitle.show();
		$productTable.append(trHtml);
		productIds.push(item.id);
	});
	
	// 删除商品
	$deleteProduct.live("click", function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.dialog.deleteConfirm")}",
			onOk: function() {
				var id = parseInt($this.closest("tr").find("input:hidden").val());
				productIds = $.grep(productIds, function(n, i) {
					return n != id;
				});
				$this.closest("tr").remove();
				if ($productTable.find("tr.productTr").size() <= 0) {
					$productTitle.hide();
				}
			}
		});
	});
	
	$.validator.addMethod("compare", 
		function(value, element, param) {
			var parameterValue = $(param).val();
			if ($.trim(parameterValue) == "" || $.trim(value) == "") {
				return true;
			}
			try {
				return parseFloat(parameterValue) <= parseFloat(value);
			} catch(e) {
				return false;
			}
		},
		"${message("admin.promotion.compare")}"
	);
	
	$.validator.addClassRules({
		giftItemQuantity: {
			required: true,
			integer: true,
			min: 1
		}
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			title: "required",
			beginDate: "required",
			endDate: "required",
			minimumQuantity: {
				digits: true,
				required:true
			},
			maximumQuantity: {
				digits: true,
				required:true,
				compare: "#minimumQuantity"
			},
			minimumPrice: {
				min: 0,
				decimal: {
					integer: 12,
					fraction: ${setting.priceScale}
				},
				required:true
			},
			maximumPrice: {
				min: 0,
				decimal: {
					integer: 12,
					fraction: ${setting.priceScale}
				},
				compare: "#minimumPrice",
				required:true
			},
			priceExpression: {
				remote: {
					url: "check_price_expression.jhtml",
					cache: false
				}
			},
			pointExpression: {
				remote: {
					url: "check_point_expression.jhtml",
					cache: false
				}
			},
			order: "digits"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.promotion.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${groupon.id}" />
		<input type="hidden" name="isFreeShipping" value="false" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.promotion.base")}" />
			</li>
			<li>
				<input type="button" value="${message("Promotion.introduction")}" />
			</li>
		</ul>
		<div class="tabContent">
			<table class="input">
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Promotion.name")}:
					</th>
					<td colspan="2">
						<input type="text" name="name" class="text" value="${groupon.name}" maxlength="200" />
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Promotion.title")}:
					</th>
					<td colspan="2">
						<input type="text" name="title" class="text" value="${groupon.title}" maxlength="200" />
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Promotion.beginDate")}:
					</th>
					<td colspan="2">
						<input type="text" id="beginDate" name="beginDate" class="text Wdate" value="[#if groupon.beginDate??]${groupon.beginDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Promotion.endDate")}:
					</th>
					<td colspan="2">
						<input type="text" id="endDate" name="endDate" class="text Wdate" value="[#if groupon.endDate??]${groupon.endDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Promotion.minimumQuantity")}:
					</th>
					<td colspan="2">
						<input type="text" id="minimumQuantity" name="minimumQuantity" class="text" value="${groupon.minimumQuantity}" maxlength="9" />
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Promotion.maximumQuantity")}:
					</th>
					<td colspan="2">
						<input type="text" name="maximumQuantity" class="text" value="${groupon.maximumQuantity}" maxlength="9" />
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Promotion.minimumPrice")}:
					</th>
					<td colspan="2">
						<input type="text" id="minimumPrice" name="minimumPrice" class="text" value="${groupon.minimumPrice}" maxlength="16" />
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Promotion.maximumPrice")}:
					</th>
					<td colspan="2">
						<input type="text" name="maximumPrice" class="text" value="${groupon.maximumPrice}" maxlength="16" />
					</td>
				</tr>
				<tr>
					<th>
						${message("Promotion.priceExpression")}:
					</th>
					<td colspan="2">
						<input type="text" name="priceExpression" class="text" value="${groupon.priceExpression}" maxlength="255" title="${message("admin.promotion.priceExpressionTitle")}" />
					</td>
				</tr>
				<tr>
					<th>
						${message("admin.common.order")}:
					</th>
					<td>
						<input type="text" name="order" class="text" value="${groupon.order}" maxlength="9" />
					</td>
				</tr>
				<!--<tr>
					<th>
						是否团购过期下架:
					</th>
					<td colspan="2">
						<label>
							<input type="checkbox" name="isMarketable" value="true"[#if groupon.isMarketable] checked="checked"[/#if] />是否下架
							<input type="hidden" name="_isMarketable" value="false" />
						</label>
					</td>
				</tr>-->
				<!--<tr>
					<th>
						${message("admin.common.setting")}:
					</th>
					<td colspan="2">
						<label>
							<input type="checkbox" name="isFreeShipping" value="true"[#if groupon.isFreeShipping] checked="checked"[/#if] />${message("Promotion.isFreeShipping")}
							<input type="hidden" name="_isFreeShipping" value="false" />
						</label>
					</td>
				</tr>-->
			</table>
			<table id="productTable" class="input">
				<tr>
					<th>
						${message("admin.static.product")}:
					</th>
					<td colspan="2">
						<input type="text" id="productSelect" name="productSelect" class="text" maxlength="200" title="${message("admin.promotion.productSelectTitle")}" />
					</td>
				</tr>
				<tr id="productTitle" class="title[#if !groupon.products?has_content] hidden[/#if]">
					<th>
						&nbsp;
					</th>
					<td width="712">
						${message("Product.name")}
					</td>
					<td>
						${message("admin.common.handle")}
					</td>
				</tr>
				[#list groupon.products as product]
					<tr class="productTr">
						<th>
							<input type="hidden" name="productIds" value="${product.id}" />
							&nbsp;
						</th>
						<td>
							<span title="${product.fullName}">${abbreviate(product.fullName, 50)}</span>
						</td>
						<td>
							<a href="${base}${product.path}" target="_blank">[${message("admin.common.view")}]</a>
							<a href="javascript:;" class="deleteProduct">[${message("admin.common.delete")}]</a>
						</td>
					</tr>
				[/#list]
			</table>
		</div>
		<div class="tabContent">
			<table class="input">
				<tr>
					<td>
						<textarea id="editor" name="introduction" class="editor" style="width: 100%;">${groupon.introduction?html}</textarea>
					</td>
				</tr>
			</table>
		</div>
		<table class="input">
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