<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${store.storeName}</title>
<link href="${base}/resources/shop/css/store_2.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/header_factory.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
	$().ready(function(){
		
		var $sousuo = $("#a_sousuo");
		var $serachForm = $("#serach");
		
		//搜索
		$sousuo.click(function(){
			$serachForm.submit();
			return false;
		});		
		
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
	
});
</script>
</head>
<body>
[#include "/shop/include/header_factory.ftl" /]
[#include "/shop/store/2/head.ftl" /]
<div class="templet2_all">
  [#include "/shop/store/2/navigation.ftl" /]
  <div class="templet2_one">
    <div class="templet2_950">
      [#include "/shop/store/2/left.ftl" /]
      <!--右侧750部分-->
      <div class="templet2_750 templet2_right">
        <!--推荐宝贝-->
        [@store_category_show_list storeId = store.id  type="root" ]
		[#list storeCategories as storeCategory]
        <div class="templet2_product"> 
          <div class="templet2_hot_title">${storeCategory.name}</div>
          <div class="templet2_0"></div>        
            <ul>
				[@product_list storeCategoryId = storeCategory.id  count = 2]
				[#list products as product]           
	              <li>
	                <div class="templet2_product_pic"><a href="#"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" /></a></div>
	                <div class="templet2_product_name"><a href="#" title="">${abbreviate(product.name,30,"...")}</a></div>
	                <div class="templet2_product_price"><del>原价：${product.marketPrice}</del><span><b>￥</b>${product.price}</span></div>
	                <div class="templet2_product_buy"><a href="${base}${product.path}" title="${product.name}" target="_blank"><img src="${base}/resources/shop/images/templet2_ljgm.jpg" /></a></div>
	              </li>
				[/#list]
			    [/@product_list]				               
	            <div class="templet2_0"></div>
            </ul>          
        </div>
 		[/#list]
		[/@store_category_show_list]	       
        <!--推荐宝贝结束-->
      </div>
      <!--右侧750部分结束-->
      <div class="templet2_10"></div>
    </div>
  </div>
</div>
</body>
</html>
