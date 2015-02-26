<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.add")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/rsa.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jsbn.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/prng4.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/rng.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/base64.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $registerForm=$("#registerForm");
	// 表单验证
	$registerForm.validate({
		rules: {
			username: {
				required: true,
				pattern: /^(1\d{10})$|^(((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?)$/,
				minlength: ${setting.usernameMinLength},
				remote: {
					url: "${base}/register/check_username.jhtml",
					cache: false
				}
			},
			password: {
				required: true,
				pattern: /^[^\s&\"<>]+$/,
				minlength: ${setting.passwordMinLength}
			},
			rePassword: {
				required: true,
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
				[#if !setting.isDuplicateEmail]
					,remote: {
						url: "${base}/register/check_email.jhtml",
						cache: false
					}
				[/#if]
			}
			[#list memberAttributes as memberAttribute]
				[#if memberAttribute.isRequired]
					,memberAttribute_${memberAttribute.id}: {
						required: true
					}
				[/#if]
			[/#list]
		},
		messages: {
			username: {
				pattern: "${message("shop.register.mobileIllegal")}",
				remote: "${message("shop.register.mobileDisabledExist")}"
			},
			password: {
				pattern: "${message("shop.register.passwordIllegal")}"
			}
			[#if !setting.isDuplicateEmail]
				,email: {
					remote: "${message("admin.validate.exist")}"
				}
			[/#if]
		}
	});

});

var InterValObj; //timer变量，控制时间
var count = 5; //间隔函数，1秒执行
var curCount;//当前剩余秒数

function sendMessage() {
	var username=$("#username").val();
	if(username==""){
		$("#phoneMessage").html("请填写手机号码");
		$("#phoneMessage").css('color','#F90');
	}else{
		$("#phoneMessage").html("");
		if($("#phoneMessage").css("color")!="#F90"){
			$("#acodeSentSpan").css('display', 'block');
		  　	curCount = count;
		　　//设置button效果，开始计时
		     $("#btnSendCode").attr("disabled", "true");
		     $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
		     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
		　　  //向后台发送处理数据
		     $.ajax({
		     　　type: "get", //用POST方式传输
		     　　url: '${base}/register/sendCheck.jhtml', //目标地址
		    　　 data: 'username='+username,
		    　　 error: function (XMLHttpRequest, textStatus, errorThrown) { },
		     　　success: function (msg){ 
		     	$("#acodeSentSpan").css('display', 'block');
		     	if(msg!="success"){
		     		$("#acodeSentSpan").css("color","#F90");
		     		$("#acodeSentSpan").html("效验码发送失败！");
		     	}
		     }
		     });
		}
	}
}

//timer处理函数
function SetRemainTime() {
            if (curCount == 0) { 
            	$("#acodeSentSpan").css('display', 'none');               
                window.clearInterval(InterValObj);//停止计时器
                $("#btnSendCode").removeAttr("disabled");//启用按钮
                $("#btnSendCode").val("重新发送验证码");
            }
            else {
                curCount--;
                $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
            }
        }
function checkCode(){
	var username=$("#username").val();
	var acode= $(".acode").val();
	$.ajax({
		     　　type: "get", //用POST方式传输
		     　　url: '${base}/register/checkCode.jhtml', //目标地址
		    　　 data: {"username":username,"code":acode},
		    　　 error: function (XMLHttpRequest, textStatus, errorThrown) { },
		     　　success: function (msg){ 
		     	if(msg=="success"){
		     		$("#codeMessage").css("color","#093");
		     		$("#codeMessage").html("验证通过");
		     		$("#subButton").attr('disabled',"false");
		     	}else{
		     		$("#codeMessage").css("color","#F90");
		     		$("#codeMessage").html("验证未通过");
		     		$("#subButton").attr('disabled',"true");
		     	}
		     }
		  });
}
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.main.cscRegister")}
	</div>
	<form id="registerForm" action="${base}/admin/factory/csc_register_submit.jhtml" method="GET">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.factory.cscRegister")}" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("admin.register.cscid")}:
				</th>
				<td>
					<input type="text" id="username" name="username" class="text" maxlength="${setting.usernameMaxLength}" />
					<span id="phoneMessage"></span>
				</td>
			</tr>
							
			<tr>
				<th></th>
				<td>
					<input id="btnSendCode" type="button" value="免费获取验证码" onclick="sendMessage()" />
					<span id="acodeSentSpan" class="txt-succ" style="display:none;color:#093;">&nbsp;&nbsp;短信验证码已发送</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("shop.register.code")}:
				</th>
				<td>
					<input type="text"  class="text acode" name="code" onblur="checkCode()"/>
					<span id="codeMessage">请查收手机短信，并填写短信中的验证码</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("shop.register.password")}:
				</th>
				<td>
					<input type="password" id="password" name="password" class="text" maxlength="${setting.passwordMaxLength}" autocomplete="off"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("shop.register.rePassword")}:
				</th>
				<td>
					<input type="password" name="rePassword" class="text" maxlength="${setting.passwordMaxLength}" autocomplete="off" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("shop.register.email")}:
				</th>
				<td>
					<input type="text" id="email" name="email" class="text" maxlength="200" />
				</td>
			</tr>
		[@member_attribute_list]
								[#list memberAttributes as memberAttribute]
									<tr>
										<th>
											[#if memberAttribute.isRequired]<span class="requiredField">*</span>[/#if]${memberAttribute.name}:
										</th>
										<td>
											[#if memberAttribute.type == "name"]
												<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
											[#elseif memberAttribute.type == "gender"]
												<span class="fieldSet">
													[#list genders as gender]
														<label>
															<input type="radio" name="memberAttribute_${memberAttribute.id}" value="${gender}" />${message("Member.Gender." + gender)}
														</label>
													[/#list]
												</span>
											[#elseif memberAttribute.type == "birth"]
												<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" onfocus="WdatePicker();" />
											[#elseif memberAttribute.type == "area"]
												<span class="fieldSet">
													<input type="hidden" id="areaId" name="memberAttribute_${memberAttribute.id}" />
												</span>
											[#elseif memberAttribute.type == "address"]
												<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
											[#elseif memberAttribute.type == "zipCode"]
												<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
											[#elseif memberAttribute.type == "avatar"]
												<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
											[#elseif memberAttribute.type == "phone"]
												<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
											[#elseif memberAttribute.type == "mobile"]
												<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
											[#elseif memberAttribute.type == "text"]
												<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" maxlength="200" />
											[#elseif memberAttribute.type == "select"]
												<select name="memberAttribute_${memberAttribute.id}">
													<option value="">${message("shop.common.choose")}</option>
													[#list memberAttribute.options as option]
														<option value="${option}">
															${option}
														</option>
													[/#list]
												</select>
											[#elseif memberAttribute.type == "checkbox"]
												<span class="fieldSet">
													[#list memberAttribute.options as option]
														<label>
															<input type="checkbox" name="memberAttribute_${memberAttribute.id}" value="${option}" />${option}
														</label>
													[/#list]
												</span>
											[/#if]
										</td>
									</tr>
								[/#list]
							[/@member_attribute_list]
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