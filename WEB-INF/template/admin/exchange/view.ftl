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
	$browserButton.browser();
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
	<form id="inputForm" action="" method="GET" enctype="multipart/form-data">
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
					${exchange.name}
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.sn")}:
				</th>
				<td>
					${exchange.sn}
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Product.price")}:
				</th>
				<td>
					${exchange.price}
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.image")}:
				</th>
				<td>
					${exchange.image}
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.unit")}:
				</th>
				<td>
					${exchange.unit}
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.weight")}:
				</th>
				<td>
					${exchange.weight}
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.stock")}:
				</th>
				<td>
					${exchange.stock}
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.brand")}:
				</th>
				<td>
					${exchange.brand}
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.memo")}:
				</th>
				<td>
					${exchange.memo}
				</td>
			</tr>
			<tr>
				<th>
					${message("exchange.pPoint")}:
				</th>
				<td>
					${exchange.point}
				</td>
			</tr>
			<tr>
				<th>
					${message("exchange.pStatus")}:
				</th>
				<td>
					[#if !exchange.isEnabled]
						<span class="red">${message("admin.factory.disabled")}</span>
					[#else]
						<span class="green">${message("admin.admin.normal")}</span>
					[/#if]
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
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml?type=product'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>