<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.paymentMethod.add")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<style type="text/css">
.shippingMethods label {
	width: 150px;
	display: block;
	float: left;
	padding-right: 6px;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $browserButton = $("#browserButton");
	
	[@flash_message /]
	
	$browserButton.browser();
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			timeout: {
				integer: true,
				min: 1
			},
			order: "digits"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.paymentMethod.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("PaymentMethod.name")}:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("PaymentMethod.method")}:
				</th>
				<td>
					<select name="method">
						[#list methods as method]
							<option value="${method}">${message("PaymentMethod.Method." + method)}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					${message("PaymentMethod.timeout")}:
				</th>
				<td>
					<input type="text" name="timeout" class="text" maxlength="9" title="${message("admin.paymentMethod.timeoutTitle")}" />
				</td>
			</tr><!--
			<tr class="shippingMethods">
				<th>
					${message("PaymentMethod.shippingMethods")}:
				</th>
				<td>
					[#list shippingMethods as shippingMethod]
						<label>
							<input type="checkbox" name="shippingMethodIds" value="${shippingMethod.id}" />${shippingMethod.name}
						</label>
					[/#list]
				</td>
			</tr>-->
			<tr>
				<th>
					${message("PaymentMethod.icon")}:
				</th>
				<td>
					<input type="text" name="icon" class="text" maxlength="200" />
					<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
				</td>
			</tr>
			<tr>
				<th>
					${message("PaymentMethod.description")}:
				</th>
				<td>
					<input type="text" name="description" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.order")}:
				</th>
				<td>
					<input type="text" name="order" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					${message("PaymentMethod.content")}:
				</th>
				<td>
					<textarea id="editor" name="content" class="editor"></textarea>
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