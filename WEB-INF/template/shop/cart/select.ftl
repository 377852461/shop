<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.cart.title")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/cart.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
</head>
<body>
	[#include "/shop/include/header.ftl" /]
	[#assign productCategory = product.productCategory /]
	<div id = "content" class="container">
		<div id="succeed">
			<div class="success">
		            <div class="success-b">
		                <h3>商品已成功加入购物车！</h3>
		            </div>
		        <span id="initCart_next_go"><a id="GotoShoppingCart" href="/shop/cart/list.jhtml" class="btn-pay">去结算</a><a href="javascript:history.back();" class="btn-continue">继续购物</a></span>
		    </div>
		</div>
    </div>   
	[#include "/shop/include/footer.ftl" /]
</body>
</html>