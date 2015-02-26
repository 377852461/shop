<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.productCategory.edit")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<style type="text/css">
.brands label {
	width: 150px;
	display: block;
	float: left;
	padding-right: 6px;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $productTable = $("#productTable");
	var $productSelect = $("#productSelect");
	var $deleteProduct = $("a.deleteProduct");
	var $productTitle = $("#productTitle");
	var productIds = [#if productCategory.products?has_content][[#list productCategory.products as product]${product.id}[#if product_has_next], [/#if][/#list]][#else]new Array()[/#if];
	
	[@flash_message /]

	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			order: "digits",
			url:"required",
			factory_id: {
				required: true
			}
		}
	});
	
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
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.productCategory.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${productCategory.id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("ProductCategory.name")}:
				</th>
				<td>
					<input type="text" id="name" name="name" class="text" value="${productCategory.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("ProductCategory.parent")}:
				</th>
				<td>
					<select name="parentId">
						<option value="">${message("admin.productCategory.root")}</option>
						[#list productCategoryTree as category]
							[#if category != productCategory && !children?seq_contains(category)]
								<option value="${category.id}"[#if category == productCategory.parent] selected="selected"[/#if]>
									[#if category.grade != 0]
										[#list 1..category.grade as i]
											&nbsp;&nbsp;
										[/#list]
									[/#if]
									${category.name}
								</option>
							[/#if]
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.order")}:
				</th>
				<td>
					<input type="text" name="order" class="text" value="${productCategory.order}" maxlength="9" />
				</td>
			</tr>
			<!--<tr>
				<th>
					<span class="requiredField">*</span>${message("admin.store.categoryUrl")}:
				</th>
				<td>
					<input type="text" name="url" value="${productCategory.url}" class="text" maxlength="200" />
				</td>
			</tr>-->
			<!--
			[#if !(admin.factory)??]
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Product.factory")}:
					</th>
					<td>
						<select name="factory_id">
							<option value="">${message("admin.common.choose")}</option>
							[#list factorys as factory]
								[#if factory.isEnabled]
									<option value="${factory.id}" >${factory.mName}</option>
								[/#if]
							[/#list]
						</select>
					</td>
				</tr>
			[/#if]
			-->
			<tr>
				<th>
					${message("admin.storagePlugin.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isShow" [#if (productCategory.isShow)] checked="checked"[/#if] value="true" />${message("admin.store.visible")}
						<input type="hidden" name="_isShow" value="false" />
					</label>
				</td>
			</tr>
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
			<tr id="productTitle" class="title[#if !productCategory?has_content] hidden[/#if]">
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
			[#list productCategory.products as product]
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