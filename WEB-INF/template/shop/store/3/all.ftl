<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${store.storeName}</title>
<link href="${base}/resources/shop/css/store_3.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/header_factory.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/header_factory.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
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
	
	$(document).ready(function(){
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

		$('#templet3_xiala > li').bind('mouseover', templet3_xiala_open);
		$('#templet3_xiala > li').bind('mouseout',  templet3_xiala_timer);
	});
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
		[@store_category_show_list storeId = store.id  type="root" ]
		[#list storeCategories as storeCategory]		
		<div class="templet3_groom">
			<h3>${storeCategory.name}</h3>
		    <div class="templet3_groom_content" >
			    <ul>  
			      [@product_list storeCategoryId = storeCategory.id  count = 3]
			      [#list products as product]
			        <li>
			            <div class="pic"><a href="${base}${product.path}"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" /></a></div>
			            <div class="name"><a href="${base}${product.path}">${abbreviate(product.name,30,"...")}</a></div>
			            <div class="price">￥${product.price}</div>
			        </li>
			      [/#list]
			      [/@product_list]       
			    </ul>
		    </div>    
		</div>
		[/#list]
		[/@store_category_show_list]		
		<!--宝贝推荐结束-->
	  </div>
	  <!--右侧750结束-->
  </div>
</body>
</html>
