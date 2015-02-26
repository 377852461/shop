<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.password.edit")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<meta http-equiv="X-UA-Compatible" content="edge" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/password.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	jQuery.validator.addMethod("notEqualTo", function(value, element, param) {
		return value != $(param).val();
		}, $.validator.format('${message("shop.password.notEqual")}'));

	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			currentPassword: {
				required: true,
				remote: {
					url: "check_current_password.jhtml",
					cache: false
				}
			},
			password: {
				required: true,
				pattern: /^[^\s&\"<>]+$/,
				//minlength: ${setting.passwordMinLength},
				maxlength: ${setting.passwordMaxLength},
				rangelength: [${setting.passwordMinLength},16],
				notEqualTo : "#currentPassword"
			},
			rePassword: {
				required: true,
				equalTo: "#password"
			},
			captcha: {
				required: true,
				remote: {
					url: "check_captcha.jhtml",
					cache: false
				}
			}
		},
		messages: {
			password: {
				pattern: "${message("shop.validate.illegal")}"
			}
		}
	});
});

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
}
function sendcaptcha(){
	$.ajax({
		url: "sendCaptcha.jhtml",
		type: "POST",
		data: {},
		dataType: "json",
		cache: false,
		success: function(message) {
			$.message(message);
		}
	});	
}
</script>
</head>
<body>
	[#assign current = "passwordEdit" /]
	[#include "/shop/include/header.ftl" /]
	<div class="container member">
		[#include "/shop/member/include/navigation.ftl" /]
		<div class="span18 last">
			<div class="input">
				<div class="title">${message("shop.member.password.edit")}</div>
				<form id="inputForm" action="update.jhtml" method="post">
					<table class="input">
						<tr>
							<th>
								${message("shop.member.password.currentPassword")}: 
							</th>
							<td>
								<input id="currentPassword" type="password" name="currentPassword" class="text" maxlength="${setting.passwordMaxLength}" />
							</td>
						</tr>
						<tr>
							<th>
								${message("shop.member.password.newPassword")}: 
							</th>
							<td>
								<input type="password" id="password" name="password" class="text" maxlength="${setting.passwordMaxLength}" onkeyup="pwStrength()" title="${message("shop.register.passwordTitle")}"/>
								<label id="passstrength" class='newFieldError'></label>
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
								${message("shop.member.password.rePassword")}: 
							</th>
							<td>
								<input type="password" name="rePassword" class="text" maxlength="${setting.passwordMaxLength}" />
							</td>
						</tr>
						<!--<tr>
							<th>
								${message("shop.captcha.name")}: 
							</th>
							<td>
								<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" />
								<input type="button" class="button" value="${message("shop.captcha.send")}" onclick="sendcaptcha()" />					
							</td>
						</tr>-->
						<tr>
							<th>
								&nbsp;
							</th>
							<td>
								<input type="submit" class="button" value="${message("shop.member.submit")}" />
								<input type="button" class="button" value="${message("shop.member.back")}" onclick="location.href='../index.jhtml'" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>