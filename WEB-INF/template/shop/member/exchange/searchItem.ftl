<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.exchange.list")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	[@flash_message /]

});
</script>
</head>
<body>
	[#assign current = "couponCodeList" /]
	[#include "/shop/include/header.ftl" /]
	<div class="container member">
		[#include "/shop/member/include/navigation.ftl" /]
		<div class="span18 last">
			<div class="list">
				<div class="title">${message("shop.member.exchangeProduct.show")}</div>
				<table class="input">
					<tr>
						<th>${message("shop.member.pProduct.name")}：</th>
						<td>${exchangeDetail.exChangeProduct.name}</td>
					</tr>
					<tr>
						<th>${message("shop.member.pProduct.createDate")}：</th>
						<td><span title="${exchangeDetail.createDate?string("yyyy-MM-dd HH:mm:ss")}">${exchangeDetail.createDate}</span></td>
					</tr>
					<tr>
						<th>${message("shop.member.pProduct.point")}：</th>
						<td>${exchangeDetail.point}</td>
					</tr>
					<tr>
						<th>${message("shop.member.pProduct.consignee")}：</th>
						<td>${exchangeDetail.consignee}</td>
					</tr>
					<tr>
						<th>${message("shop.member.pProduct.address")}：</th>
						<td>${exchangeDetail.address}</td>
					</tr>
					<tr>
						<th>${message("shop.member.pProduct.phone")}：</th>
						<td>${exchangeDetail.phone}</td>
					</tr>
					<tr>
						<th>${message("shop.member.pProduct.intruduction")}：</th>
						<td>${exchangeDetail.exChangeProduct.shortIntroduction}</td>
					</tr>
				</table>
			</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>