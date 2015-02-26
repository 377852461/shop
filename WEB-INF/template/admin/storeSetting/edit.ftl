<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.productCategory.edit")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
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
	var $browserButtonLogon=$("#browserButtonLogon");
	var $factoryId=$("#factoryId");
	
	$browserButtonLogon.browser();
	
	[@flash_message /]
	
	[#if !(admin.factory)??]
		$factoryId.change(function(){
			$.ajax({
				url: "store_setting.jhtml",
				type: "GET",
				data: {id: this.value},
				dataType: "json",
				cache: false,
				success: function(data) {
					$("#name").val(data.storeName);
					$("#logo").val(data.logo);
					$("#editor").val(data.intro);
					$("#storeId").val(data.id);
					$("#factoryId").val(data.factory.id);
				}
			});
		});
	[/#if]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			storeName: "required"
		}
	});
	
});

var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="intro"]', {
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : false,
		items : [
			'fontname', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'justifyleft', 'justifycenter', 'justifyright','|','removeformat'
			],
		afterChange : function() {
			K('#intro_word_count').html(this.count('text'));
			if(this.count('text') > 450){
				K('#submit').attr('disabled',true);
			}else{
				K('#submit').removeAttr("disabled");
			}
		}
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.main.storeSetting")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" id="storeId" name="id" value="${store.id}" />
		<table class="input">
			[#if !(admin.factory)??]
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Product.factory")}:
					</th>
					<td>
						<select id="factoryId" name="factory_id">
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
			<tr>
				<th>
					<span class="requiredField">*</span>${message("ProductCategory.name")}:
				</th>
				<td>
					<input type="text" id="name" name="storeName" class="text" value="${store.storeName}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.factory.store.logo")}:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="logo" name="logo" class="text" maxlength="200" value="${store.logo}" />
						<input type="button" id="browserButtonLogon" class="button" value="${message("admin.browser.select")}" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.factory.store.video")}:
				</th>
				<td>
					<input type="text" id="video" name="videoUrl" class="text" maxlength="200" value="${store.videoUrl}" />
				</td>
			</tr>
			<tr>
				<th>
					客服联系电话:
				</th>
				<td>
					<input type="text" name="phone" class="text" maxlength="200" value="${store.phone}" />
				</td>
			</tr>
			<tr>
				<th>店铺描述:</th>
				<td>
					<textarea  cols="30" rows="10" name="intro">${store.intro}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>注意
				</th>
				<td>
					<p>
						您当前输入了 <span id="intro_word_count">0</span> 个文字。<br/>
						您最多能输入了 450 个文字。（字数统计包含中文、英文、数字、空格、标点符号）
					</p>				
				</td>
			</tr>
			<tr>
				<th>模版:</th>
				<td>
					<input type="radio" name="templet" value="1" [#if store.templet == 1]checked="checked"[/#if]>模版一&nbsp;:&nbsp;logo像素：950*120<br/>
					<input type="radio" name="templet" value="2" [#if store.templet == 2]checked="checked"[/#if]>模版二&nbsp;:&nbsp;logo像素：950*120<br/>
					<input type="radio" name="templet" value="3" [#if store.templet == 3]checked="checked"[/#if]>模版三&nbsp;:&nbsp;logo像素：950*120<br/>
				</td>
			</tr>			
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" id="submit" />
					<input type="reset" class="button" value="重&nbsp;&nbsp;置" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>