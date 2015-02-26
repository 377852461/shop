<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${store.storeName}</title>
<link href="${base}/resources/shop/css/store_2.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/store.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/header_factory.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/store_2.js"></script>
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
	
	//联系方式选悬浮框
	  var timer, scrollTop, sideDiv = $('#fudong').appendTo('body');
    $(window).scroll(function() {
        timer && clearTimeout(timer);
        scrollTop = $(this).scrollTop();
        timer = setTimeout(function() {
            sideDiv.animate({
                top: scrollTop + 100 + 'px'
            }, 600);
        }, 200);
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
        <!--轮播图-->
		[@storeAd_list storeId = store.id positionId = 10 ]
		  [#if storeAds ??]
		  <div class="templet2_flash" >
		    <script>
			 var box =new PPTBox();
			 box.width = 748; //宽度
			 box.height = 298;//高度
			 box.autoplayer = 3;//自动播放间隔时间
		
			 //box.add({"url":"图片地址","title":"悬浮标题","href":"链接地址"})
			[#list storeAds as storeAd ]
			 box.add({"url":"${storeAd.path}","title":"${storeAd.title}","href":"${storeAd.url}" })
			[/#list]
			 box.show();
			</script>
		  </div>
		  [/#if]
		[/@storeAd_list]
        <!--轮播图结束-->
        <div class="templet2_10"></div>
        <!--公告-->
        <div class="templet2_notice">
          <div class="templet2_notice_btn">
            <div class="templet2_notice_leftbtn"></div>
            <div class="templet2_notice_rightbtn"></div>
          </div>
          <div class="templet2_notice1">
            <ul>
              [@store_affiche_list storeId=store.id count=8]
              [#list affiches as affiche]	
              	<li>${abbreviate(affiche.content,48)}</li>
			  [/#list]
			  [/@store_affiche_list]
            </ul>
          </div>
        </div>
<script type="text/javascript"> 
var flag = "left";
function DY_scroll(wraper,prev,next,img,speed,or){  
	var wraper = $(wraper); 
	var prev = $(prev); 
	var next = $(next); 
	var img = $(img).find('ul'); 
	var w = img.find('li').outerWidth(true); 
	var s = speed; 
	next.click(function(){ 
		img.animate({'margin-left':-w}/*,1500,'easeOutBounce'*/,function(){ 
			img.find('li').eq(0).appendTo(img); 
			img.css({'margin-left':0}); 
		}); 
		flag = "left";
	}); 
	prev.click(function(){ 
		img.find('li:last').prependTo(img); 
		img.css({'margin-left':-w}); 
		img.animate({'margin-left':0}/*,1500,'easeOutBounce'*/); 
		flag = "right";
	}); 
	if (or == true){ 
		ad = setInterval(function() { flag == "left" ? next.click() : prev.click()},s*1000); 
		wraper.hover(function(){clearInterval(ad);},function(){ad = setInterval(function() {flag == "left" ? next.click() : prev.click()},s*1000);});
	} 
} 
DY_scroll('.templet2_notice','.templet2_notice_leftbtn','.templet2_notice_rightbtn','.templet2_notice1',2,true);// true为自动播放，不加此参数或false就默认不自动 
</script>        
        <!--公告结束-->
        <div class="templet2_10"></div>
        <!--热门推荐-->
        <div class="templet2_hot">
          <div class="templet2_hot_title">店铺介绍</div>
          <div class="templet2_hot_one">
            <div class="templet2_hot_one_left">${store.intro}</div>
            <div class="templet2_hot_one_right">
				<object width="300" height="200" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
					<param name="src" value="[#if store.videoUrl != null || store.videoUrl != "" ]${store.videoUrl}[#else]${base}/resources/shop/images/store.swf[/#if]">
					<embed src="[#if store.videoUrl != null || store.videoUrl != "" ]${store.videoUrl}[#else]${base}/resources/shop/images/store.swf[/#if]" width="300" height="200"></embed>
				</object>  
            </div>
            <div class="templet2_0"></div>
          </div>
          <div class="templet2_0"></div>
          <div class="templet2_0"></div>
        </div>
        <!--热门推荐结束-->
        <div class="templet2_10"></div>
        <!--悬浮框start-->
      <div class="templet1_10"></div>
	<div id="fudong" style="border:1px solid #454545; width:80px; height:60px; position: absolute; right: 20px; top: 100px;" class="templet1_classify">
   <h3>联系方式</h3>
        <div class="templet1_10"></div>
        <div class="templet1_classify_menu">
        	<span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${store.factory.qq}&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:${store.factory.qq}:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></span>
				<span><a target="_blank" href="http://www.taobao.com/webww/ww.php?ver=3&touid=${store.factory.ww}&siteid=cntaobao&status=1&charset=utf-8"><img border="0" src="http://amos.alicdn.com/online.aw?v=2&uid=${store.factory.ww}&site=cntaobao&s=1&charset=utf-8" alt="点这里给我发消息" /></a>
        </div>
</div>
	<!--悬浮框end-->
        <!--推荐宝贝-->
        <div class="templet2_product">
            <ul>
 			[@product_list factoryId = store.factory.id  count = 8]
			[#list products as product]           
              <li>
                <div class="templet2_product_pic"><a href="${base}${product.path}"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" /></a></div>
                <div class="templet2_product_name"><a href="${base}${product.path}" title="${product.name}">${abbreviate(product.name,30,"...")}</a></div>
                <div class="templet2_product_price"><del>原价：${product.marketPrice}</del><span><b>￥</b>${product.price}</span></div>
                <div class="templet2_product_buy"><a href="${base}${product.path}" title="${product.name}" target="_blank"><img src="${base}/resources/shop/images/templet2_ljgm.jpg" /></a></div>
              </li>
			[/#list]
			[/@product_list]               
              <div class="templet2_0"></div>
            </ul>
        </div>
        <!--推荐宝贝结束-->
      </div>
      <!--右侧750部分结束-->
      <div class="templet2_10"></div>
    </div>
  </div>
</div>
</body>
</html>
