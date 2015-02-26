<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.couponCode.list")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
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
				<div class="title">${message("shop.member.couponCode.show")}</div>
				<table class="input">
					<tr>
						<th>${message("shop.member.couponCode.name")}：</th>
						<td>${couponCode.coupon.name}</td>
					</tr>
					<tr>
						<th>${message("CouponCode.code")}：</th>
						<td>${couponCode.code}</td>
					</tr>
					<tr>
						<th>${message("CouponCode.isUsed")}：</th>
						<td>${couponCode.isUsed?string(message("shop.member.true"), message("shop.member.false"))}</td>
					</tr>
					<tr>
						<th>${message("CouponCode.usedDate")}：</th>
						<td>
							[#if couponCode.usedDate??]
								<span title="${couponCode.usedDate?string("yyyy-MM-dd HH:mm:ss")}">${couponCode.usedDate}</span>
							[#else]
								-
							[/#if]
						</td>
					</tr>
					<tr>
						<th>${message("shop.member.couponCode.expire")}：</th>
						<td>
							[#if couponCode.coupon.endDate??]
								<span title="${couponCode.coupon.endDate?string("yyyy-MM-dd HH:mm:ss")}">${couponCode.coupon.endDate}</span>
							[#else]
								-
							[/#if]
						</td>
					</tr>
					<tr>
						<th>${message("shop.member.couponCode.count")}：</th>
						<td>${couponCode.coupon.point}</td>
					</tr>
					<tr>
						<th>${message("shop.member.couponCode.introduction")}：</th>
						<td>${couponCode.coupon.introduction}</td>
					</tr>
				</table>
			</div>
			[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "?pageNumber={pageNumber}"]
				[#include "/shop/include/pagination.ftl"]
			[/@pagination]
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>