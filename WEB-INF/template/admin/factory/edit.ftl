<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.factory.edit")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $browserButton = $("#browserButton");
	//var $browserButton2=$("#browserButton2");
	var $browserButton3=$("#browserButton3");
	//var $browserButton4=$("#browserButton4");
	var $browserButton5=$("#browserButton5");
	var $browserButton6=$("#browserButton6");
	var $browserButton7=$("#browserButton7");
	var $browserButton8=$("#browserButton8");
	var $browserButton9=$("#browserButton9");
	
	$browserButton.browser();
	//$browserButton2.browser();
	$browserButton3.browser();
	//$browserButton4.browser();
	$browserButton5.browser();
	$browserButton6.browser();
	$browserButton7.browser();
	$browserButton8.browser();
	$browserButton9.browser();
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			[#if cscinit==0]
				username: {
					required: true,
					pattern: /^(1\d{10})$|^(((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?)$/,
					minlength: ${setting.usernameMinLength},
					remote: {
						url: "${base}/admin/factory/check_username.jhtml",
						cache: false
					}
				},
			[/#if]
			mName: {
				required: true
			},
			identityCard: {
				required: true,
				pattern:/^(\d{15}|\d{17}[\dXx])$/
			},
			maturity: {
				required: true
			},
			photo: {
				required: true
			},
			busPhoto: {
				required: true
			},
			taxRegPhoto: {
				required: true
			},
			accPermits: {
				required: true
			},
			occ: {
				required: true
			},
			linkName: {
				required: true
			},
			corp: {
				required: true
			},
			lPhone: {
				required: true,
				pattern:/^(1\d{10})$|^(((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?)$/
			},
			address: {
				required: true
			},
			blNumber: {
				required: true
			},
			lEmail: {
				email:true
				[#if !setting.isDuplicateEmail]
					,remote: {
						url: "check_email.jhtml?previousEmail=${factory.lEmail?url}",
						cache: false
					}
				[/#if]
			},
			qq:{
				required: true
			}
		},
		messages: {
			username: {
				pattern: "${message("admin.factory.mobileIllegal")}",
				remote: "${message("admin.factory.mobileNotExists")}"
			},
			password: {
				pattern: "${message("shop.register.passwordIllegal")}"
			},
			mName: {
				pattern: "${message("admin.validate.illegal")}",
				remote: "${message("admin.member.disabledExist")}"
			},
			lPhone:{
				pattern: "${message("admin.validate.phone")}"
			},
			identityCard:{
				pattern: "${message("admin.validate.identityCard")}"
			}
			[#if !setting.isDuplicateEmail]
				,lEmail: {
					remote: "${message("admin.validate.exist")}"
				}
			[/#if]
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.factory.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${factory.id}" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.factory.base")}" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
			[#if cscinit==0]
				<th>
					${message("admin.register.cscid")}:
				</th>
			[/#if]
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.name")}:
				</th>
				<td>
					<input type="text" name="mName" class="text" maxlength="100" value="${factory.mName}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.corp")}:
				</th>
				<td>
					<input type="text" name="corp" class="text" maxlength="10"  value="${factory.corp}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.identityCard")}:
				</th>
				<td>
					<input type="text" name="identityCard" class="text" maxlength="18"  value="${factory.identityCard}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.maturity")}:
				</th>
				<td>
					<input type="text" name="maturity" class="text" onfocus="WdatePicker();" value="${factory.maturity}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.cic_photo")}:
				</th>
				<td>
					<input type="text" name="cicPhoto" class="text" maxlength="200" value="${factory.cicPhoto}"/>
					<input type="button" id="browserButton9" class="button" value="${message("admin.browser.select")}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.photo")}:
				</th>
				<td>
					<input type="text" name="photo" class="text" maxlength="200" value="${factory.photo}"/>
					<input type="button" id="browserButton3" class="button" value="${message("admin.browser.select")}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.LBNumber")}:
				</th>
				<td>
					<input type="text" name="blNumber" class="text" maxlength="15" value="${factory.blNumber}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.busPhoto")}:
				</th>
				<td>
					<input type="text" name="busPhoto" class="text" maxlength="200" title="${message("admin.factory.busPhotoTitle")}" value="${factory.busPhoto}"/>
					<input type="button" id="browserButton5" class="button" value="${message("admin.browser.select")}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.taxRegPhoto")}:
				</th>
				<td>
					<input type="text" name="taxRegPhoto" class="text" maxlength="200" title="${message("admin.factory.commonTitle")}" value="${factory.taxRegPhoto}"/>
					<input type="button" id="browserButton7" class="button" value="${message("admin.browser.select")}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.accPermits")}:
				</th>
				<td>
					<input type="text" name="accPermits" class="text" maxlength="200"  title="${message("admin.factory.commonTitle")}" value="${factory.accPermits}"/>
					<input type="button" id="browserButton6" class="button" value="${message("admin.browser.select")}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.occ")}:
				</th>
				<td>
					<input type="text" name="occ" class="text" maxlength="200"  title="${message("admin.factory.commonTitle")}" value="${factory.occ}"/>
					<input type="button" id="browserButton8" class="button" value="${message("admin.browser.select")}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.linkName")}:
				</th>
				<td>
					<input type="text" name="linkName" class="text" maxlength="10" value="${factory.linkName}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.phone")}:
				</th>
				<td>
					<input type="text" name="lPhone" class="text" maxlength="11" value="${factory.lPhone}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.email")}:
				</th>
				<td>
					<input type="text" id="email" name="lEmail" class="text" maxlength="50" value="${factory.lEmail}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.QQ")}:
				</th>
				<td>
					<input type="text" name="qq" class="text" maxlength="50" value="${factory.qq}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.WW")}:
				</th>
				<td>
					<input type="text" name="ww" class="text" maxlength="50" value="${factory.ww}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Factory.address")}:
				</th>
				<td>
					<input type="text" name="address" class="text" maxlength="100" value="${factory.address}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.fax")}:
				</th>
				<td>
					<input type="text" name="fax" class="text" maxlength="16" value="${factory.fax}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.weburl")}:
				</th>
				<td>
					<input type="text" name="webUrl" class="text" maxlength="50" value="${factory.webUrl}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.image")}:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" name="image" class="text" maxlength="200" title="${message("admin.factory.imageTitle")}" value="${factory.image}"/>
						<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.remark")}:
				</th>
				<td>
					<input type="text" name="remark" class="text" maxlength="100" value="${factory.remark}"/>
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true" [#if factory.isEnabled] checked="checked"[/#if] />${message("Factory.isEnabled")}
						<input type="hidden" name="_isEnabled" value="false" />
					</label>
					[#if member.isLocked]
						<label>
							<input type="checkbox" name="isLocked" value="true" checked="checked" />${message("Factory.isLocked")}
							<input type="hidden" name="_isLocked" value="false" />
						</label>
					[/#if]
					<label>
						<input type="checkbox" name="isHDFK" value="true" [#if factory.isHDFK] checked="checked"[/#if] />${message("Factory.isHDFK")}
						<input type="hidden" name="_isHDFK" value="false" />
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
	</form>
</body>
</html>