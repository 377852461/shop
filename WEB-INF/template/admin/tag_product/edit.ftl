<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.tag.edit")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $browserButton = $("#browserButton");
	
	[@flash_message /]
	
	$browserButton.browser();
	
	// 表单验证
	$inputForm.validate({
		rules: {
			expireDate: "required",
			order: "digits"
		},submitHandler:function(form){
			form.submit();
		}
	});
	
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.tag.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${tagProduct.id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>商品名称:
				</th>
				<td>
					${tagProduct.product.name}
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>发布日期:
				</th>
				<td>
					<input type="text" id="startDate" value="${tagProduct.startDate}" class="text Wdate" disabled="disabled" />
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>失效日期:
				</th>
				<td>
					<input type="text" id="expireDate" value="${tagProduct.expireDate}" name="expireDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd', minDate: '#F{$dp.$D(\'startDate\')}'});" />
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.tags")}:
				</th>
				<td>
					<label>
						[#list productTags as productTag]
							<label>
								<input type="checkbox" name="tagIds" value="${productTag.id}"[#if tags?seq_contains(productTag)] checked="checked"[/#if] />${productTag.name}
							</label>
						[/#list]
					</label>
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<!--<tr>
				<th>
					促销:
				</th>
				<td>
					[#list promotions as promotion]
						<label>
							<input type="checkbox" name="promotionIds" value="${promotion.id}" />${promotion.name}
						</label>
					[/#list]
				</td>
				<td>
					&nbsp;
				</td>
			</tr>-->
			<tr>
				<th>
					设置:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isShow" value="true" [#if tagProduct.isShow] checked="checked"[/#if] />是否审核通过
						<input type="hidden" name="_isShow" value="false" />
					</label>
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="order" class="text" value="${tagProduct.order}" />
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
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