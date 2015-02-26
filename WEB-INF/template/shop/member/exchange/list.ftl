<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.exchange.list")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/exchange.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	[@flash_message /]

});
</script>
</head>
<body>
	[#assign current = "exchangeProduct" /]
	[#include "/shop/include/header.ftl" /]
	<div class="container member">
		[#include "/shop/member/include/navigation.ftl" /]
		<div class="span18 last">
			<div class="templet4_left">
				<div class="title">${message("shop.member.exchange.list")}</div>
<!--精品推荐-->
    <div class="templet4_left_tj">
	<ul>
		[#list page.content as exchange]
	    	<li>
	        	<p class="pic"><a href="#"><img src="${exchange.image}" width="130" height="130"/></a></p>
	            <p class="xx">编号:${exchange.sn}</p>
	            <p class="xx">名称:${exchange.name}</p>
	            <p class="xx">积分:${exchange.point}分</p>
	            [#if member.point>exchange.point || member.point==exchange.point ]
			        <p class="btn"><a href="info.jhtml?id=${exchange.id}">立即兑换</a></p>
			    [#else]
			    	<p class="btn2"><a href="#">立即兑换</a></p>
	            [/#if]
	        </li>
		[/#list]
    </ul>
    </div>
<!--精品推荐结束-->
</div>
			[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "?pageNumber={pageNumber}"]
				[#include "/shop/include/pagination.ftl"]
			[/@pagination]
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>