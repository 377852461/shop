<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
[@seo type = "index"]
	<title>[#if seo.title??][@seo.title?interpret /][#else]${message("shop.index.title")}[/#if][#if systemShowPowered] - Powered By kuanda[/#if]</title>
	<meta name="author" content="kuanda Team" />
	<meta name="copyright" content="kuanda" />
	[#if seo.keywords??]
		<meta name="keywords" content="[@seo.keywords?interpret /]" />
	[/#if]
	[#if seo.description??]
		<meta name="description" content="[@seo.description?interpret /]" />
	[/#if]
[/@seo]
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/shop/slider/slider.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="${base}/resources/shop/slider/slider.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $slider = $("#slider");
	var $newArticleTab = $("#newArticle .tab");
	var $promotionProductTab = $("#promotionProduct .tab");
	var $promotionProductInfo = $("#promotionProduct .info");
	var $hotProductTab = $("#hotProduct .tab");
	var $newProductTab = $("#newProduct .tab");
	var $hotProductImage = $("#hotProduct img");
	var $newProductImage = $("#newProduct img");
	
	$slider.nivoSlider({
		effect: "random",
		animSpeed: 1000,
		pauseTime: 6000,
		controlNav: true,
		keyboardNav: false,
		captionOpacity: 0.4
	});
	
	$newArticleTab.tabs("#newArticle .tabContent", {
		tabs: "li",
		event: "mouseover",
		initialIndex: 1
	});
	
	$promotionProductTab.tabs("#promotionProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	$hotProductTab.tabs("#hotProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	$newProductTab.tabs("#newProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	function promotionInfo() {
		$promotionProductInfo.each(function() {
			var $this = $(this);
			var beginDate = $this.attr("beginTimeStamp") != null ? new Date(parseFloat($this.attr("beginTimeStamp"))) : null;
			var endDate = $this.attr("endTimeStamp") != null ? new Date(parseFloat($this.attr("endTimeStamp"))) : null;
			if (beginDate == null || beginDate <= new Date()) {
				if (endDate != null && endDate >= new Date()) {
					var time = (endDate - new Date()) / 1000;
					$this.html("${message("shop.index.remain")}:<em>" + Math.floor(time / (24 * 3600)) + "<\/em> ${message("shop.index.day")} <em>" + Math.floor((time % (24 * 3600)) / 3600) + "<\/em> ${message("shop.index.hour")} <em>" + Math.floor((time % 3600) / 60) + "<\/em> ${message("shop.index.minute")}");
				} else if (endDate != null && endDate < new Date()) {
					$this.html("${message("shop.index.ended")}");
				} else {
					$this.html("${message("shop.index.going")}");
				}
			}
		});
	}
	
	promotionInfo();
	setInterval(promotionInfo, 60 * 1000);
	
	$hotProductImage.lazyload({
		threshold: 100,
		effect: "fadeIn",
		skip_invisible: false
	});
	
	$newProductImage.lazyload({
		threshold: 100,
		effect: "fadeIn",
		skip_invisible: false
	});

});
</script>



</head>
<body>
	[#include "/shop/include/header.ftl" /]
	<div class="container index">
		<div class="span18">
			[@ad_position id = 3 /]
		</div>
		<div class="span6 last">
			<div id="newArticle" class="newArticle">
				[@article_category_root_list count = 3]
					<ul class="tab">
						[#list articleCategories as articleCategory]
							<li>
								<a href="${base}${articleCategory.path}" target="_blank">${articleCategory.name}</a>
							</li>
						[/#list]
					</ul>
					[#list articleCategories as articleCategory]
						[@article_list articleCategoryId = articleCategory.id count = 5]
							<ul class="tabContent">
								[#list articles as article]
									<li>
										<a href="${base}${article.path}" title="${article.title}" target="_blank">${abbreviate(article.title, 30)}</a>
									</li>
								[/#list]
							</ul>
						[/@article_list]
					[/#list]
				[/@article_category_root_list]
			</div>
			[@ad_position id = 4 /]
		</div>

		<div class="span24" >
			[@ad_position id = 5 /]
		</div>
		[@tag_list type="product" count=3 ]
		[#list tags as tag]
		<div class="span24">
			[#if tag_index == 0]
			<div id="newProduct" class="newProduct clearfix">
			[#elseif tag_index == 1]
			<div id="hotProduct" class="hotProduct clearfix">
			[#elseif tag_index == 2]
			<div id="groupon" class="groupon clearfix">
			[#else]
			<div id="newProduct" class="newProduct clearfix">
			[/#if]
				[@product_category_root_list count = 2]
					<a href="${base}/product/list.jhtml?tagIds=${tag.id}" target="_blank">
					<div class="title">
						<strong>${tag.name}</strong>
					</div>
					</a>
					<ul class="tab">
					</ul>
					<ul class="tabContent">
						[@product_list  tagIds=tag.id count = 3 indexShow = "true" ] 																
							[#list products as product]
								<li style="[#if product_index = 0 ]float:left;margin-left:0px;[/#if]">
									<div id="productSellInfo" >
										<div id="productSellInfo_img" >
											<a href="${base}${product.path}" title="${product.name}" target="_blank"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" /></a>
										</div>
										<div id="productSellInfo_down">
											<div id="productSellInfo_down_left">
												<div id="productSellInfo_down_left_top">
													<a href="${base}${product.path}" title="${product.name}" target="_blank" >
														<span>${abbreviate(product.name,48)}</span>
													</a>
												</div>
												<div id="productSellInfo_down_left_center">${message("shop.product.salesDesc")}：${product.sales}</div>
												<div id="productSellInfo_down_left_down">
													<span class="price">
														${currency(product.price, true)}
													</span>
													[#if setting.isShowMarketPrice]
														<del>${currency(product.marketPrice, true)}</del>
													[/#if]
												</div>										
											</div>
											<div id="productSellInfo_down_right">
												<div id="productSellInfo_down_right_down"><a href="${base}${product.path}" target="_blank" >${message("shop.product.look")}</a></div>
											</div>
										</div>
									</div>
								</li>								
							[/#list]
						[/@product_list]
					</ul>	
				[/@product_category_root_list]
			</div>			
		</div>
		[/#list]
		[/@tag_list]

		<div class="span24">
			<div class="friendLink">
				<dl>
					<dt>${message("shop.index.friendLink")}</dt>
					[@friend_link_list count = 10]
						[#list friendLinks as friendLink]
							<dd>
								<a href="${friendLink.url}" target="_blank">${friendLink.name}</a>
								[#if friendLink_has_next]|[/#if]
							</dd>
						[/#list]
					[/@friend_link_list]
					<dd class="more">
						<a href="${base}/friend_link.jhtml">${message("shop.index.more")}</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>