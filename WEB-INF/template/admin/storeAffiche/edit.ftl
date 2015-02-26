<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>店铺公告修改- Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function(){
	$("#inputForm").validate({
			rules: {
				beginDate: "required" 	
			}
	});		
});


var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="content"]', {
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : false,
		items : [
			'fontname', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'justifyleft', 'justifycenter', 'justifyright','|','removeformat'],
		afterChange : function() {
			K('#shortIntroduction_word_count').html(this.count('text'));
			if(this.count('text') > 200 ||this.count('text') == 0){
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 店铺公告修改
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<table class="input">
			<tr>
				<th>标题:</th>
				<td><input type="text" name="title" class="text" maxlength="200" value="${storeAffiche.title}"></td>
			</tr>			
			<tr>
				<th>
					<span class="requiredField">*</span>公告内容:
				</th>
				<td>
					<input type="hidden" name="id" value="${storeAffiche.id}" >
					<input type="hidden" name="storeId" value="${storeAffiche.store.id}"> 
					<textarea name="content" class="editor" style="width:70%;height:200px;">${storeAffiche.content}</textarea>
					<p>
						您当前输入了 <span id="shortIntroduction_word_count">0</span> 个文字。<br/>
						您最多能输入了 200 个文字。（字数统计包含中文、英文、数字、空格、标点符号）
					</p>	
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Promotion.beginDate")}:
				</th>
				<td colspan="2">
					<input type="text" id="beginDate" name="beginDate" class="text Wdate" value="[#if storeAffiche.beginDate??]${storeAffiche.beginDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.endDate")}:
				</th>
				<td colspan="2">
					<input type="text" id="endDate" name="endDate" class="text Wdate" value="[#if storeAffiche.endDate??]${storeAffiche.endDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
				</td>
			</tr>			
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" id="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>