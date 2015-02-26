<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>员工修改 - Powered By kuanda</title>
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
<script type="text/javascript" >
$().ready(function() {
  $("#inputForm").validate({
         rules: {
		    name: "required",
		    email: {
		     required: true,
		     email: true
		    },
		  	departmentId:"required",
		    levelId:"required",
		    empType:"required",
		    nationality:"required",
		    birthday:"required",
		    endDate:"required",
		    identityCard:{
				required: true,
				pattern:/^(\d{15}|\d{17}[\dXx])$/
		    },
		    account:"required",
			phone:{
				required: true,
				pattern:/^(1\d{10})$|^(((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?)$/	
			},
		   	position:"required"
	   },
         messages: {
		    firstname: "请输入姓名",
		    email: {
		     required: "请输入Email地址",
		     email: "请输入正确的email地址"
		    }
   		}
     });
 });

</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 员工添加
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${employee.id}" > 
		<input type="hidden" name="number" value="${employee.number}" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.admin.base")}" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					员工编号:
				</th>
				<td>
					${employee.number}
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>姓名:
				</th>
				<td>
					<input type="text" id="name" name="name" value="${employee.name}" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>性别:
				</th>
				<td>	
					<input type="radio" name="sex" value="true" [#if employee.sex ] checked="checked" [/#if]>男
					<input type="radio" name="sex" value="false" [#if !employee.sex ] checked="checked" [/#if] >女
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>民族:
				</th>
				<td>
					<input type="text" id="nationality" name="nationality" value="${employee.nationality}" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>出生日期:
				</th>
				<td>
					<input type="text" id="beginDate" name="birthday" class="text Wdate" value="${(employee.birthday?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>身份证号:
				</th>
				<td>
					<input type="text" name="identityCard" value="${employee.identityCard}" class="text" maxlength="18" />
				</td>
			</tr>			
			<tr>
				<th>
					<span class="requiredField">*</span>户口所在地:
				</th>
				<td>
					<input type="text" id="account" name="account" value="${employee.account}" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>联系电话:
				</th>
				<td>
					<input type="text" id="phone" name="phone" value="${employee.phone}" class="text" maxlength="11" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>电子邮箱:
				</th>
				<td>
					<input type="text" id="email" name="email" value="${employee.email}" class="text" maxlength="200" />
				</td>
			</tr>			
			<tr>
				<th>
					最高学历:
				</th>
				<td>
					<select name="mostEducation">
						[#list mostEducations as education]							
							<option value="${education}" [#if education == employee.mostEducation] selected="selected" [/#if] >${message("admin.employee."+education)}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					专业:
				</th>
				<td>
					<input type="text"  name="major" value="${employee.major}" class="text" maxlength="200" />
				</td>
			</tr>				
			<tr>
				<th>
					政治面貌:
				</th>
				<td>
					<select name="politicsStatus">
						[#list politicsStatuses as status]
								<option value="${status}" [#if status == employee.politicsStatus] selected="selected" [/#if] >${message("admin.employee."+status)}</option>
						[/#list]
					</select>				
				</td>
			</tr>
			<tr>
				<th>
					住址:
				</th>
				<td>
					<input type="text" name="address" value="${employee.address}" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>入职日期:
				</th>
				<td>
					<input type="text" id="endDate" name="joinDate" class="text Wdate" value="${(employee.joinDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>部门:
				</th>
				<td>
					<select id="departmentId" name="departmentId">
						<option value="">${message("admin.common.choose")}</option>
						[#list departments as department]							
							<option value="${department.id}" [#if department.id == employee.department.id] selected="selected" [/#if]>${department.name}</option>						
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>职务级别:
				</th>
				<td>
					<select name="levelId">
						<option value="">${message("admin.common.choose")}</option>
						[#list employeesLevel as level]
							<option value="${level.id}" [#if employee.level==level] selected="selected"[/#if] >${level.level}&nbsp;&nbsp;${level.name}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>职位:
				</th>
				<td>
					<input type="text" id="position" name="position" value="${employee.position}" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>员工类型:
				</th>
				<td>
					<select name="empType">
						<option value="">${message("admin.common.choose")}</option>
						[#list empTypes as type]						
							<option value="${type}" [#if type == employee.empType] selected="selected" [/#if]>${message("admin.employee."+type)}</option>					
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true" [#if employee.isEnabled] checked="checked"[/#if] />${message("Admin.isEnabled")}
						<input type="hidden" name="_isEnabled" value="false" />
					</label>
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
		<table class="input tabContent">
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