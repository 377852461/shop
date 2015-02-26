<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.product.add")} - Powered By kuanda</title>
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
<style type="text/css">
	.specificationSelect {
		height: 100px;
		padding: 5px;
		overflow-y: scroll;
		border: 1px solid #cccccc;
	}
	
	.specificationSelect li {
		float: left;
		min-width: 150px;
		_width: 200px;
	}
</style>
<script type="text/javascript">
$().ready(function() {
	var $browserButton = $("#browserButton");
	var $inputForm = $("#inputForm");
	$browserButton.browser();
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			sn:"required",
			image:"required",
			price: {
				required: true,
				min: 0,
				decimal: {
					integer: 12,
					fraction: ${setting.priceScale}
				}
			},
			cost: {
				min: 0,
				decimal: {
					integer: 12,
					fraction: ${setting.priceScale}
				}
			},
			weight: "digits",
			stock: "digits",
			point: {
				digits:true,
				required: true
			}
		},
		messages: {
			sn: {
				pattern: "${message("admin.validate.illegal")}",
				remote: "${message("admin.validate.exist")}"
			}
		}
	});
});
var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="shortIntroduction"]', {
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : false,
		items : [
			'fontname', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'justifyleft', 'justifycenter', 'justifyright','|','removeformat'],
		afterChange : function() {
			K('#shortIntroduction_word_count').html(this.count('text'));
			if(this.count('text') > 69){
				K('#shortSubmit').attr('disabled',true);
			}else{
				K('#shortSubmit').removeAttr("disabled");
			}
		}
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.product.add")}
	</div>
	<form id="inputForm" action="update.jhtml" method="POST" enctype="multipart/form-data">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.product.base")}" />
			</li>
			<li>
				<input type="button" value="${message("admin.product.introduction")}" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Product.name")}:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" value="${exchange.name}"/>
					<input type="hidden" name="id" value="${exchange.id}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.sn")}:
				</th>
				<td>
					<input type="text" name="sn" class="text" maxlength="100" title="${message("admin.product.snTitle")}" value="${exchange.sn}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Product.price")}:
				</th>
				<td>
					<input type="text" name="price" class="text" maxlength="16" value="${exchange.price}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Product.image")}:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" name="image" class="text" maxlength="200" title="${message("admin.product.imageTitle")}" value="${exchange.image}"/>
						<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.unit")}:
				</th>
				<td>
					<input type="text" name="unit" class="text" maxlength="200" value="${exchange.unit}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.weight")}:
				</th>
				<td>
					<input type="text" name="weight" class="text" maxlength="9" title="${message("admin.product.weightTitle")}" value="${exchange.weight}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.stock")}:
				</th>
				<td>
					<input type="text" name="stock" class="text" maxlength="9" title="${message("admin.product.stockTitle")}" value="${exchange.stock}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.brand")}:
				</th>
				<td>
					<input type="text" name="brand" class="text" maxlength="200" value="${exchange.brand}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.memo")}:
				</th>
				<td>
					<input type="text" name="memo" class="text" maxlength="200" value="${exchange.memo}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("exchange.pPoint")}:
				</th>
				<td>
					<input type="text" name="point" class="text" maxlength="200" value="${exchange.point}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("exchange.pStatus")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true"[#if exchange.isEnabled] checked="checked"[/#if] />${message("Member.isEnabled")}
						<input type="hidden" name="_isEnabled" value="false" />
					</label>
				</td>
			</tr>
		</table>
		<table class="input tabContent">
			<tr>
				<td>
					<textarea name="shortIntroduction" style="width:100%;height:200px;visibility:hidden;">${exchange.shortIntroduction}</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<p>
						您当前输入了 <span id="shortIntroduction_word_count">0</span> 个文字。<br/>
						您最多能输入了 69 个文字。（字数统计包含中文、英文、数字、空格、标点符号）
					</p>				
				</td>
			</tr>
		</table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" id="shortSubmit" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml?type=product'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>