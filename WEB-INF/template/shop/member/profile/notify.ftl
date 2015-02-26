[#if notifyMessage??]
${notifyMessage}
[#else]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.payment.notify")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/payment.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script language="javascript">
var cTime=5;
function TimeClose()
{
     window.setTimeout('TimeClose()',1000);
     if(cTime<=0)
       CloseWindow_Click();
     this.ShowTime.innerHTML="倒计时"+cTime+"秒后关闭当前窗口";
     cTime--;
}
function CloseWindow_Click()
{
     window.close();
}
</script>
</head>
<body onload="TimeClose()">
	[#include "/shop/include/header.ftl" /]
	<div class="container payment">
		<div class="span24">
			<div class="title">
				${message("shop.password.mailCheckSuccess")}
			</div>
			<div id="ShowTime" class="close">倒计时5秒后关闭当前窗口
       		<input type="button" name="CloseWindow" onClick="CloseWindow_Click();" value="立即关闭当前网页">
       		</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>
[/#if]