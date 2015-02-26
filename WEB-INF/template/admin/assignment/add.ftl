<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>部门添加 - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function(){
	$("#inputForm").validate({
		rules:{
			title:"required",
			beginDate:"required",
		    endDate:"required",
		    executeEmployeeId:"required"
		},
		messages:{
			executeEmployeeId:"请选择执行员工"
		}
	
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 任务添加
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="任务信息" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th><span class="requiredField">*</span>标题:</th>
				<td><input type="text" name="title" class="text" maxlength="200" ></td>
			</tr>
			<tr>
				<th>
					项目:
				</th>
				<td>
					<input type="text" name="project" class="text" maxlength="200" />
				</td>
			</tr>			
			<tr>
				<th>
					描述:
				</th>
				<td>
					<textarea  cols="30" rows="10" name="description" class="text" ></textarea>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Promotion.beginDate")}:
				</th>
				<td colspan="2">
					<input type="text" id="beginDate" name="beginDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Promotion.endDate")}:
				</th>
				<td colspan="2">
					<input type="text" id="endDate" name="endDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th><span class="requiredField">*</span>执行员工</th>
				<td>
					<select name="executeEmployeeId">
						<option value="">--请选择--</option>
						[#list employees as employee]
						<option value="${employee.id}" >${employee.number}&nbsp;&nbsp;${employee.name}&nbsp;&nbsp;${emplloyee.department.name}</option>
						[/#list]
					</select>
				</td>
			</tr>			
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="hidden" name="createEmployeeId" value="${employee.id}"> 
					<input type="hidden" name="assignmentState" value="Have">
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>