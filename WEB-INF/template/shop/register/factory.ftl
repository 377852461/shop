<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.header.productRegister")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="edge" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/register.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jsbn.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/prng4.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/rng.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/rsa.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/base64.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/shop/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/password.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jQuery.form.js"></script>

<script type="text/javascript">
$().ready(function() {

	var $registerForm = $("#registerForm");
	var $username = $("#username");
	var $password = $("#password");
	var $email = $("#email");
	var $captcha = $("#captcha");
	var $captchaImage = $("#captchaImage");
	var $submit = $(":submit");
	var $agreement = $("#agreement");
	
	[@flash_message /]
	
	// 更换验证码
	$captchaImage.click(function() {
		$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
	});
	
	// 注册协议
	$agreement.hover(function() {
		$(this).height(200);
	});
	
	// 表单验证
	$registerForm.validate({
		rules: {
			username: {
				required: true,
				pattern: /^[0-9a-z_A-Z\u4e00-\u9fa5]+$/,
				minlength: 2,
				maxlength: 20,
				remote: {
					url: "check_username.jhtml",
					cache: false
				}
			},
			password: {
				required: true,
				pattern: /^[^\s&\"<>]+$/,
				minlength: 4,
				maxlength: 20
			},
			rePassword: {
				required: true,
				equalTo: "#password"
			},
			qq:{
				required: true
			},
			ww:{
				required: true
			},
			email: {
				required: true,
				email: true
				[#if !setting.isDuplicateEmail]
					,remote: {
						url: "check_email.jhtml",
						cache: false
					}
				[/#if]
			},
			mName: "required",
			identityCard: {
				required: true,
				pattern:/^(\d{15}|\d{17}[\dXx])$/
			},
			maturity: "required",
			photo: "required",
			linkName: "required",
			corp: "required",
			lbNumber: "required",
			lPhone: {
				required: true,
				pattern:/^(1\d{10})$|^(((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?)$/
			},
			address:"required",
			blNumber:"required",
			captcha:"required",
			textfile:"required",
			textfile2:"required",
			textfile3:"required",
			textfile4:"required",
			textfile5:"required",
			textfile6:"required"
		},
		messages: {
			username: {
				pattern: "${message("admin.validate.illegal")}",
				remote: "${message("admin.validate.exist")}"
			},
			password: {
				pattern: "${message("admin.validate.illegal")}"
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
				,email: {
					remote: "${message("shop.register.emailExist")}"
				}
			[/#if]
		},submitHandler: function(form) {
			//var saveData = form.serializeArray();
			//saveData.push("captchaId",$("#captchaId").value);
			//saveData.push("captcha",captcha.value);
			var options = {
		        success: function (message) {
		        	removeCookie("username", null);
					removeCookie("password", null);
					/*$.message("success","注册成功,请等待审核...");
					setTimeout(function() {
					$submit.prop("disabled", false);
						location.href = "${base}/";
					}, 3000);*/
					
		            $.message(message);
					if (message.type == "success") {
						setTimeout(function() {
							$submit.prop("disabled", false);
							location.href = "${base}/";
						}, 3000);
					} else {
						$submit.prop("disabled", false);
						[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("factoryRegister")]
							$captcha.val("");
							$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
						[/#if]
					}
		        }
		    };
		    $registerForm.ajaxSubmit(options);
			
			         	//form.submit();
		}
	});
	
	$("#browserfile").change(function(){
		$("#textfile").val($(this).val());
	});
	$("#browserFile2").change(function(){
		$("#textfile2").val($(this).val());
	});
	$("#browserFile3").change(function(){
		$("#textfile3").val($(this).val());
	});
	$("#browserFile4").change(function(){
		$("#textfile4").val($(this).val());
	});
	$("#browserFile5").change(function(){
		$("#textfile5").val($(this).val());
	});
	$("#browserFile6").change(function(){
		$("#textfile6").val($(this).val());
	});
	$("#browserFile7").change(function(){
		$("#textfile7").val($(this).val());
	});
	
});
//pwStrength函数 
//当用户放开键盘或密码输入框失去焦点时,根据不同的级别显示不同的颜色 
function pwStrength(){ 
	var pwd = $("#password").val();
	O_color="#eeeeee"; 
	L_color="#FF0000"; 
	M_color="#FF9900"; 
	H_color="#33CC00";
	if (pwd==null||pwd==''){ 
		Lcolor=Mcolor=Hcolor=O_color; 
	} else{ 
		S_level=checkStrong(pwd); 
		switch(S_level) { 
		case 0: 
		Lcolor=Mcolor=Hcolor=O_color; 
		case 1: 
		Lcolor=L_color; 
		Mcolor=Hcolor=O_color; 
		break; 
		case 2: 
		Lcolor=Mcolor=M_color; 
		Hcolor=O_color; 
		break; 
		default: 
		Lcolor=Mcolor=Hcolor=H_color; 
		} 
	}
	$("#strength_L").css("background",Lcolor); 
	$("#strength_M").css("background",Mcolor);
	$("#strength_H").css("background",Hcolor);
	return; 
};

</script>
<style type="text/css">
	.browserFiles{display:none; }
	#registerForm table th{width:150px;}
</style>
</head>
<body>
	[#include "/shop/include/header.ftl" /]
	<div class="container register">
		<div class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong>${message("shop.header.productRegister")}</strong>FACTORY REGISTER
					</div>
					<form id="registerForm" action="${base}/register_facotry/submit.jhtml" enctype="multipart/form-data" method="POST" >
						<table>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Admin.username")}:
								</th>
								<td>
									<input type="text" name="username" class="text" maxlength="20" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Admin.password")}:
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off" onkeyup="pwStrength()" />
								</td>
							</tr>
							<tr>
								<th></th>
								<td><div id="strength_L" class="strength"></div>
									<div id="strength_M" class="strength"></div>
									<div id="strength_H" class="strength"></div>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("admin.admin.rePassword")}:
								</th>
								<td>
									<input type="password" name="rePassword" class="text" maxlength="20" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Admin.email")}:
								</th>
								<td>
									<input type="text" name="email" class="text" maxlength="200" />
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.name")}:
								</th>
								<td>
									<input type="text" name="mName" class="text" maxlength="100" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.corp")}:
								</th>
								<td>
									<input type="text" name="corp" class="text" maxlength="10" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.identityCard")}:
								</th>
								<td>
									<input type="text" name="identityCard" class="text" maxlength="18" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.maturity")}:
								</th>
								<td>
									<input type="text" name="maturity" class="text" onfocus="WdatePicker({minDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true});" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.cic_photo")}:
								</th>
								<td>
									<input type="text" id="textfile" name="textfile" readonly="true" />
									<input type="file" id="browserfile" name="imageFile" class="browserFiles"  />
									<input type="button" value="${message("shop.upload.select")}" id="uploadbutton" onclick="$('#browserfile').click();" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.photo")}:
								</th>
								<td>
									<input type="text" id="textfile2" name="textfile2" readonly="true" />
									<input type="file" id="browserFile2" name="imageFile" class="browserFiles" />
									<input type="button" value="${message("shop.upload.select")}" id="uploadbutton2" onclick="$('#browserFile2').click();" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.LBNumber")}:
								</th>
								<td>
									<input type="text" name="blNumber" class="text" maxlength="15" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.busPhoto")}:
								</th>
								<td>
									<input type="text" id="textfile3" name="textfile3" readonly="true" />
									<input type="file" id="browserFile3" name="imageFile" class="browserFiles"  />
									<input type="button" value="${message("shop.upload.select")}" id="uploadbutton3" onclick="$('#browserFile3').click();" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.taxRegPhoto")}:
								</th>
								<td>
									<input type="text" id="textfile4" name="textfile4" readonly="true" />
									<input type="file" id="browserFile4" name="imageFile" class="browserFiles" />
									<input type="button" value="${message("shop.upload.select")}" id="uploadbutton4" onclick="$('#browserFile4').click();" />
								</t	d>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.accPermits")}:
								</th>
								<td>
									<input type="text" id="textfile5" name="textfile5" readonly="true" />
									<input type="file" id="browserFile5" name="imageFile" class="browserFiles" />
									<input type="button" value="${message("shop.upload.select")}" id="uploadbutton5" onclick="$('#browserFile5').click();" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.occ")}:
								</th>
								<td>
									<input type="text" id="textfile6" name="textfile6" readonly="true" />
									<input type="file" id="browserFile6" name="imageFile" class="browserFiles" />
									<input type="button" value="${message("shop.upload.select")}" id="uploadbutton6" onclick="$('#browserFile6').click();" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.linkName")}:
								</th>
								<td>
									<input type="text" name="linkName" class="text"/>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.phone")}:
								</th>
								<td>
									<input type="text" name="lPhone" class="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.QQ")}:
								</th>
								<td>
									<input type="text" name="qq" class="text" maxlength="50" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.WW")}:
								</th>
								<td>
									<input type="text" name="ww" class="text" maxlength="50" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Factory.address")}:
								</th>
								<td>
									<input type="text" name="address" class="text" maxlength="100" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Factory.fax")}:
								</th>
								<td>
									<input type="text" name="fax" class="text" maxlength="16" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Factory.weburl")}:
								</th>
								<td>
									<input type="text" name="webUrl" class="text" maxlength="50" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Factory.image")}:
								</th>
								<td>
									<span class="fieldSet">
										<input type="text" id="textfile7" name="textfile7" readonly="true" />
										<input type="file" name="imageFactory"  id="browserFile7" class="browserFiles" />
										<input type="button" value="${message("shop.upload.select")}" id="uploadbutton7" onclick="$('#browserFile7').click();" />
									</span>
								</td>
							</tr>
							<tr>
								<th>
									${message("Factory.remark")}:
								</th>
								<td>
									<input type="text" name="remark" class="text" maxlength="100" />
								</td>
							</tr>
							<tr>
								<th>
									${message("admin.common.setting")}:
								</th>
								<td>
									<label>
										<input type="checkbox" name="isHDFK" value="true" />${message("Factory.isHDFK")}
										<input type="hidden" name="_isHDFK" value="false" />
									</label>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									${message("shop.register.agreement")}
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<div id="agreement" class="agreement">
										${setting.registerFactoryAgreement}
									</div>
								</td>
							</tr>
							[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("factoryRegister")]
								<tr>
									<th>
										<span class="requiredField">*</span>${message("shop.captcha.name")}:
									</th>
									<td>
										<span class="fieldSet">
											<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /><img id="captchaImage" class="captchaImage" src="${base}/common/captcha.jhtml?captchaId=${captchaId}" title="${message("shop.captcha.imageTitle")}" />
											<input type="hidden" name="captchaId" value=${captchaId} />
										</span>
									</td>
								</tr>
							[/#if]
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="submit" value="${message("shop.register.submit")}" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>