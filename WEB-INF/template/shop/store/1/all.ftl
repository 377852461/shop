<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${store.storeName}</title>
<link href="${base}/resources/shop/css/store.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/header_factory.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript">
$().ready(function(){
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
	$('#templet1_xiala > li').bind('mouseover', templet1_xiala_open);
	$('#templet1_xiala > li').bind('mouseout',  templet1_xiala_timer);
});

var timeout         = 500;
var closetimer		= 0;
var ddmenuitem      = 0;

function templet1_xiala_open(){
	templet1_xiala_canceltimer();
	templet1_xiala_close();
	ddmenuitem = $(this).find('ul').eq(0).css('visibility', 'visible');
}
function templet1_xiala_close(){
	if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');
}
function templet1_xiala_timer(){
	closetimer = window.setTimeout(templet1_xiala_close, timeout);
}
function templet1_xiala_canceltimer(){
	if(closetimer){
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}
document.onclick = templet1_xiala_close;
</script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>


</head>
<body>
[#include "/shop/include/header_factory.ftl" /]
<div class="templet1_one">
	[#include "/shop/store/1/head.ftl" /]
  <div class="templet1_10"></div>
  <div class="templet1_950">
	[#include "/shop/store/1/left.ftl" /]    
	<!--右侧750部分-->
    <div class="templet1_750 templet1_right">

		[@store_category_show_list storeId = store.id  type="root" ]
		[#list storeCategories as storeCategory]     
	      <div class="templet1_product_hot">
	        <h3>${storeCategory.name}</h3>
	        <div class="templet1_product_hot1">
	          <ul>
				[@product_list storeCategoryId = storeCategory.id  count = 3]
				[#list products as product]
	            <li [#if product_index = 0 ]class="templet1_product_hot1_li1"[/#if]>
	              <div class="templet1_product_hot1_pic"><a href="${base}${product.path}" target="_blank"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" /></a></div>
	              <div class="templet1_product_hot1_name"><a href="${base}${product.path}" title="${product.name}" target="_blank">${abbreviate(product.name,30,"...")}</a></div>
	              <div class="templet1_product_hot1_price">
	                <dd><b>一口价</b><span>￥${product.price}</span></dd>
	                <dl>累计销售：${product.sales} </dl>
	              </div>
	            </li>
				[/#list]
				[/@product_list]            
	            <div class="templet1_0"></div>
	          </ul>
	        </div>
	      </div>
		[/#list]
		[/@store_category_show_list] 
      <div class="templet1_10"></div>
    </div>
    <!--右侧750部分结束-->
    <div class="templet1_10"></div>
  </div>
</div>
</body>
</html>
