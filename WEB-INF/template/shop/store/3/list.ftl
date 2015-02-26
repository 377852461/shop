<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${store.storeName}</title>
<link href="${base}/resources/shop/css/store_3.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/header_factory.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $productForm = $("#productForm");
	var $brandId = $("#brandId");
	var $promotionId = $("#promotionId");
	var $orderType = $("#orderType");
	var $pageNumber = $("#pageNumber");
	var $pageSize = $("#pageSize");

	var $orderSelect = $("#orderSelect");
	var $previousPage = $("#previousPage");
	var $nextPage = $("#nextPage");
	var $size = $("#layout a.size");
	var $tagIds = $("input[name='tagIds']");
	var $sort = $("#sort a");
	var $startPrice = $("#startPrice");
	var $endPrice = $("#endPrice");
	var $result = $("#result");
	var $productImage = $("#result img");
	var $productJdjs = $(".product_jdjs");
	
	$size.click(function() {
		var $this = $(this);
		$pageNumber.val(1);
		$pageSize.val($this.attr("pageSize"));
		$productForm.submit();
		return false;
	});
	
	$previousPage.click(function() {
		$pageNumber.val(${page.pageNumber - 1});
		$productForm.submit();
		return false;
	});
	
	$nextPage.click(function() {
		$pageNumber.val(${page.pageNumber + 1});
		$productForm.submit();
		return false;
	});
	
	$orderSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.orderSelect");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height()}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	$tagIds.click(function() {
		$pageNumber.val(1);
		$productForm.submit();
	});
	
	$sort.click(function() {
		var $this = $(this);
		if ($this.hasClass("current")) {
			$orderType.val("");
		} else {
			$orderType.val($this.attr("orderType"));
		}
		$pageNumber.val(1);
		$productForm.submit();
		return false;
	});
	
	$startPrice.add($endPrice).focus(function() {
		$(this).siblings("button").show();
	});
	
	$startPrice.add($endPrice).keypress(function(event) {
		var $this = $(this);
		var key = event.keyCode?event.keyCode:event.which;
		if (key == 13 || (key >= 48 && key <= 57) || (key == 46 && $this.val().indexOf(".") == -1)) {
			return true;
		} else {
			return false;
		}
	});
	
	$productForm.submit(function() {
		if ($brandId.val() == "") {
			$brandId.prop("disabled", true)
		}
		if ($promotionId.val() == "") {
			$promotionId.prop("disabled", true)
		}
		if ($orderType.val() == "" || $orderType.val() == "topDesc") {
			$orderType.prop("disabled", true)
		}
		if ($pageNumber.val() == "" || $pageNumber.val() == "1") {
			$pageNumber.prop("disabled", true)
		}
		if ($pageSize.val() == "" || $pageSize.val() == "20") {
			$pageSize.prop("disabled", true)
		}
		if ($startPrice.val() == "" || !/^\d+(\.\d+)?$/.test($startPrice.val())) {
			$startPrice.prop("disabled", true)
		}
		if ($endPrice.val() == "" || !/^\d+(\.\d+)?$/.test($endPrice.val())) {
			$endPrice.prop("disabled", true)
		}
	});
	
	$.pageSkip = function(pageNumber) {
		$pageNumber.val(pageNumber);
		$productForm.submit();
		return false;
	}
	// 添加店铺收藏
	$("#addFavoriteStore").click(function(){
		$.ajax({
			url: "${base}/member/favoriteStore/add.jhtml?id=${store.id}",
			type: "GET",
			dataType: "json",
			cache: false,
			success: function(message) {
				$.message(message);
			}
		});
		return false;	
	});
	//导航下拉JS
	$('#templet3_xiala > li').bind('mouseover', templet3_xiala_open);
	$('#templet3_xiala > li').bind('mouseout',  templet3_xiala_timer);	
	
});


	//导航下拉JS
	var timeout         = 500;
	var closetimer		= 0;
	var ddmenuitem      = 0;
	
	function templet3_xiala_open(){	
		templet3_xiala_canceltimer();
		templet3_xiala_close();
		ddmenuitem = $(this).find('ul').eq(0).css('visibility', 'visible');
	}
	
	function templet3_xiala_close(){
		if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');
	}
	
	function templet3_xiala_timer(){
		closetimer = window.setTimeout(templet3_xiala_close, timeout);
	}
	
	function templet3_xiala_canceltimer(){
		if(closetimer){
			window.clearTimeout(closetimer);
			closetimer = null;
		}
	}
	document.onclick = templet3_xiala_close;
	//导航下拉结束
</script>
</head>
<body>
[#include "/shop/include/header_factory.ftl" /]
  [#include "/shop/store/3/head.ftl" /]
  <div class="templet3_950" style="margin-top:20px;">  
	  [#include "/shop/store/3/left.ftl" /]
	  <!--右侧750-->
	  <div class="templet3_750 templet3_right">
		<!--宝贝推荐-->
		<div class="templet3_groom">
			<h3>${storeCategory.name}</h3>
		    <form id="productForm" action="${base}/store/list.jhtml" method="get" >
		    <input type="hidden" name="storeCategoryId" value="${storeCategory.id}" >
			<input type="hidden" id="brandId" name="brandId" value="${(brand.id)!}" />
			<input type="hidden" id="promotionId" name="promotionId" value="${(promotion.id)!}" />
			<input type="hidden" id="orderType" name="orderType" value="${orderType}" />
			<input type="hidden" id="pageNumber" name="pageNumber" value="${page.pageNumber}" />
			<div id="sort" class="sort">
				<div id="orderSelect" class="orderSelect">
					[#if orderType??]
						<span>${message("Product.OrderType." + orderType)}</span>
					[#else]
						<span>${message("Product.OrderType." + orderTypes[0])}</span>
					[/#if]
					<div class="popupMenu">
						<ul>
							[#list orderTypes as ot]
								<li>
									<a href="javascript:;"[#if ot == orderType] class="current" title="${message("shop.product.cancel")}"[/#if] orderType="${ot}">${message("Product.OrderType." + ot)}</a>
								</li>
							[/#list]
						</ul>
					</div>
				</div>
				<a href="javascript:;"[#if orderType == "priceAsc"] class="currentAsc current" title="${message("shop.product.cancel")}"[#else] class="asc"[/#if] orderType="priceAsc">${message("shop.product.priceAsc")}</a>
				<a href="javascript:;"[#if orderType == "salesDesc"] class="currentDesc current" title="${message("shop.product.cancel")}"[#else] class="desc"[/#if] orderType="salesDesc">${message("shop.product.salesDesc")}</a>
				<a href="javascript:;"[#if orderType == "scoreDesc"] class="currentDesc current" title="${message("shop.product.cancel")}"[#else] class="desc"[/#if] orderType="scoreDesc">${message("shop.product.scoreDesc")}</a>
				<button type="submit">${message("shop.product.submit")}</button>
			</div>     
		    <div class="templet3_groom_content" >
			    <ul style="height:[#if (page.content?size%3) == 0 ]${page.content?size/3*305}[#else]${(page.content?size-page.content?size%3)/3*305+305}[/#if]px;">  
			      [#list page.content as product]
			        <li>
			            <div class="pic"><a href="${base}${product.path}"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" /></a></div>
			            <div class="name"><a href="${base}${product.path}">${abbreviate(product.name,30,"...")}</a></div>
			            <div class="price">￥${product.price}</div>
			        </li>
			      [/#list]        
			    </ul>
		    </div>
			[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "javascript: $.pageSkip({pageNumber});" ]
				[#include "/shop/include/pagination.ftl"]
			[/@pagination]
			</form>     
		</div>
		<!--宝贝推荐结束-->
	  </div>
	  <!--右侧750结束-->
  </div>
</body>
</html>
