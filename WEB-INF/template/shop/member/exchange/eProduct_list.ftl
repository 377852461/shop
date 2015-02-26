<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.exchangeProduct.list")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
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
	[#assign current = "eProduct_list" /]
	[#include "/shop/include/header.ftl" /]
	<div class="container member">
		[#include "/shop/member/include/navigation.ftl" /]
		<div class="span18 last">
			<div class="list">
				<div class="title">${message("shop.member.exchangeProduct.list")}</div>
				<table class="list">
					<tr>
						<th>
							${message("shop.member.pProduct.name")}
						</th>
						<th>
							${message("shop.member.pProduct.image")}
						</th>
						<th>
							${message("shop.member.pProduct.createDate")}
						</th>
						<th>
							${message("shop.member.pProduct.point")}
						</th>
						<th>
							${message("shop.cart.handle")}
						</th>
					</tr>
					[#list page.content as exchangeDetail]
						<tr>
							<td>
								${exchangeDetail.exChangeProduct.name}
							</td>
							<td>
								<img src="${exchangeDetail.exChangeProduct.image}" alt="${orderItem.product.name}" widht="60" height="60"/>
							</td>
							<td>
								[#if exchangeDetail.createDate??]
									<span title="${exchangeDetail.createDate?string("yyyy-MM-dd HH:mm:ss")}">${exchangeDetail.createDate}</span>
								[#else]
									-
								[/#if]
							</td>
							<td>
								${exchangeDetail.point}
							</td>
							<td>
								<a href="searchItem.jhtml?id=${exchangeDetail.id}">${message("shop.common.view")}</a>
							</td>
						</tr>
					[/#list]
				</table>
				[#if !page.content?has_content]
					<p>${message("shop.member.noResult")}</p>
				[/#if]
			</div>
			[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "?pageNumber={pageNumber}"]
				[#include "/shop/include/pagination.ftl"]
			[/@pagination]
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>