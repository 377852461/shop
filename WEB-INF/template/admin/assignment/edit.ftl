<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>部门修改 - Powered By kuanda</title>
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
			beginDate:"required",
		    endDate:"required"
		},
		messages:{
		
		}
	
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 任务修改
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="任务信息" />
			</li>
			<li>
				<input type="button" value="任务日志" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>标题:</th>
				<td>${assignment.title}</td>
			</tr>			
			<tr>
				<th>
					项目:
				</th>
				<td>
					${assignment.project}
				</td>
			</tr>			
			<tr>
				<th>
					描述:
				</th>
				<td>
					<textarea  cols="30" rows="10" name="description" class="text" >${assignment.description}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.beginDate")}:
				</th>
				<td>
					[#if assignment.beginDate??]${assignment.beginDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.endDate")}:
				</th>
				<td>
					[#if assignment.endDate??]${assignment.endDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]
				</td>
			</tr>
			<tr>
				<th>执行人：</th>
				<td>
					${assignment.executeEmployee.name}
				</td>
			</tr>						
		</table>
		<table class="input tabContent">
			<tr  class="title">
				<th>
					${message("Log.operation")}
				</th>
				<th>
					修改人
				</th>
				<th>
					修改日期
				</th>
			</tr>
			[#list page as log]
				<tr>
					<td>
						${log.operationLog}
					</td>
					<td>
						${log.employee.name}
					</td>
					<td>
						<span title="${log.createDate?string("yyyy-MM-dd HH:mm:ss")}">${log.createDate}</span>
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
					<input type="hidden" name="id" value="${assignment.id}" >
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>