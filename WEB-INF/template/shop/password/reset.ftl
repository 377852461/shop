<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.password.reset")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<meta http-equiv="X-UA-Compatible" content="edge" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/password.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/password.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $passwordForm = $("#passwordForm");
	var $password = $("#password");
	var $captcha = $("#captcha");
	var $captchaImage = $("#captchaImage");
	var $submit = $(":submit");
	
	// 更换验证码
	$captchaImage.click(function() {
		$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
	});
	
	// 表单验证
	$passwordForm.validate({
		rules: {
			newPassword: {
				required: true,
				pattern: /^[^\s&\"<>]+$/,
				minlength: ${setting.passwordMinLength}
			},
			rePassword: {
				required: true,
				equalTo: "#newPassword"
			},
			captcha: "required"
		},
		submitHandler: function(form) {
			$.ajax({
				url: $passwordForm.attr("action"),
				type: "POST",
				data: $passwordForm.serialize(),
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$submit.prop("disabled", true);
				},
				success: function(message) {
					$.message(message);
					if (message.type == "success") {
						setTimeout(function() {
							$submit.prop("disabled", false);
							location.href = "${base}/";
						}, 3000);
					} else {
						$submit.prop("disabled", false);
						[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("resetPassword")]
							$captcha.val("");
							$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
						[/#if]
					}
				}
			});
		}
	});

});
//pwStrength函数 
//当用户放开键盘或密码输入框失去焦点时,根据不同的级别显示不同的颜色 
function pwStrength(){ 
	var pwd = $("#newPassword").val();
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
</script>
</head>
<body>
	[#include "/shop/include/header.ftl" /]
	<div class="container password">
		<div class="span24">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>${message("shop.password.reset")}</strong>RESET PASSWORD
					</div>
					<form id="passwordForm" action="reset.jhtml" method="post">
						<input type="hidden" name="captchaId" value="${captchaId}" />
						<input type="hidden" name="username" value="${member.username}" />
						<input type="hidden" name="key" value="${key}" />
						<table>
							<tr>
								<th>
									${message("shop.password.username")}:
								</th>
								<td>
									${member.username}
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("shop.password.newPassword")}:
								</th>
								<td>
									<input type="password" id="newPassword" name="newPassword" class="text" maxlength="${setting.passwordMaxLength}" autocomplete="off" onkeyup="pwStrength()"/>
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
									<span class="requiredField">*</span>${message("shop.password.rePassword")}:
								</th>
								<td>
									<input type="password" name="rePassword" class="text" maxlength="${setting.passwordMaxLength}" autocomplete="off" />
								</td>
							</tr>
							[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("resetPassword")]
								<tr>
									<th>
										<span class="requiredField">*</span>${message("shop.captcha.name")}:
									</th>
									<td>
										<span class="fieldSet">
											<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /><img id="captchaImage" class="captchaImage" src="${base}/common/captcha.jhtml?captchaId=${captchaId}" title="${message("shop.captcha.imageTitle")}" />
										</span>
									</td>
								</tr>
							[/#if]
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="submit" value="${message("shop.password.submit")}" />
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