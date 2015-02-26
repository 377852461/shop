<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.tag.add")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $productTable = $("#productTable");
	var $deleteProduct = $("a.deleteProduct");
	var $productSelect = $("#productSelect");
	var $productTitle = $("#productTitle");
	var productIds = new Array();
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			expireDate:"required",
			order: "digits"
		},submitHandler:function(form){
			var checked=false;
			//var productIds=$("input[name='productIds']");
			$("input:checkbox[name='tagIds']:checkbox[checked]").each(function(){
			　　checked=true;
			});
			if(!checked){
				$.message("warn", "请选择标签进行查找");
			}else if(productIds.length<=0){
				$.message("warn", "请添加商品");
			}else{
				$.ajax({
					url: "checkProdcuts.jhtml",
					type: "POST",
					data: {tagIds: function(){ 
							var temp=$("input:checkbox[name='tagIds']:checkbox[checked]").map(function(){ 
									return $(this).val();
								}).get().join(","); 
								return temp;
							}, productIds: function(){ 
								 var temp=productIds.join(",");
								 return temp;
							}
						 },
					dataType: "json",
					cache: false,
					success: function(message) {
						if(message!=null){
						 	$.message(message);
						 }else{
							form.submit();
						 }
					}
				});
			}
			
		}
	});
	
	//当input输入栏发生字符变化时，重新进行查询
	$productSelect.bind("input propertychange", function() { 
   		onChange(0, true); 
    });
	
	// 商品选择
	$productSelect.autocomplete("product_select.jhtml", {
		dataType: "json",
		max: 20,
		width: 600,
		scrollHeight: 300,
		cacheLength:0,
		matchSubset:false,
		extraParams:{
			"tags":function(){
				var saveBuffer=new Array();
				$("input:checkbox[name='tagIds']:checkbox[checked]").each(function(){
					saveBuffer.push(this.value);
				});
				return JSON.stringify(saveBuffer);
			}
		},
		parse: function(data) {
			var checked=false;
			var productIds=$("input[name='productIds']");
			$("input:checkbox[name='tagIds']:checkbox[checked]").each(function(){
			　　checked=true;
			});
			if(!checked){
				$.message("warn", "请选择标签进行查找");
			}else{
				return $.map(data, function(item) {
					return {
						data: item,
						value: item.fullName
					}
				});
			}
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.tag.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table id="productTable" class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>失效日期:
				</th>
				<td>
					<input type="text" id="expireDate" name="expireDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd', minDate: 'new Date()'});" />
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
			<!--<tr>
				<th>
					团购:
				</th>
				<td>
					[#list groupons as groupon]
						<label>
							<input type="checkbox" name="grouponIds" value="${groupon.id}" />${groupon.name}
						</label>
					[/#list]
				</td>
				<td>
					&nbsp;
				</td>
			</tr>-->
			[#if !isFactory]
			<tr>
				<th>
					设置:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isShow" value="true" checked="checked" />是否审核通过
						<input type="hidden" name="_isShow" value="false" />
					</label>
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			[/#if]
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="order" class="text" />
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
					[#list tags as tag]
						<label>
							<input type="checkbox" checked="checked" name="tagIds" value="${tag.id}" />${tag.name}
						</label>
					[/#list]
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>查找标签中的商品:
				</th>
				<td>
					<input type="text" id="productSelect" name="productSelect" class="text" maxlength="200" title="${message("admin.promotion.productSelectTitle")}" />
					<div id="findResult"></div>
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr id="productTitle" class="title hidden">
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