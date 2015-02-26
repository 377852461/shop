<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${store.storeName}</title>
<link href="${base}/resources/shop/css/store.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/header_factory.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/store.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>

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

function MM_CheckFlashVersion(reqVerStr,msg){
  with(navigator){
    var isIE  = (appVersion.indexOf("MSIE") != -1 && userAgent.indexOf("Opera") == -1);
    var isWin = (appVersion.toLowerCase().indexOf("win") != -1);
    if (!isIE || !isWin){  
      var flashVer = -1;
      if (plugins && plugins.length > 0){
        var desc = plugins["Shockwave Flash"] ? plugins["Shockwave Flash"].description : "";
        desc = plugins["Shockwave Flash 2.0"] ? plugins["Shockwave Flash 2.0"].description : desc;
        if (desc == "") flashVer = -1;
        else{
          var descArr = desc.split(" ");
          var tempArrMajor = descArr[2].split(".");
          var verMajor = tempArrMajor[0];
          var tempArrMinor = (descArr[3] != "") ? descArr[3].split("r") : descArr[4].split("r");
          var verMinor = (tempArrMinor[1] > 0) ? tempArrMinor[1] : 0;
          flashVer =  parseFloat(verMajor + "." + verMinor);
        }
      }
      // WebTV has Flash Player 4 or lower -- too low for video
      else if (userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 4.0;

      var verArr = reqVerStr.split(",");
      var reqVer = parseFloat(verArr[0] + "." + verArr[2]);
  
      if (flashVer < reqVer){
        if (confirm(msg))
          window.location = "http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash";
      }
    }
  } 
}
</script>
<script type="text/javascript" src="${base}/resources/shop/js/AC_RunActiveContent.js"></script>
</head>
<body onload="MM_CheckFlashVersion('7,0,0,0','本页内容需要使用较新的 Adobe Flash Player 版本。是否现在下载它？');">
[#include "/shop/include/header_factory.ftl" /]
<div class="templet1_one">
  [#include "/shop/store/1/head.ftl" /]
  <div class="templet1_10"></div>
  <div class="templet1_950">
	[#include "/shop/store/1/left.ftl" /]
    <!--右侧750部分-->
    <div class="templet1_750 templet1_right">
      <!--轮播图-->
		[@storeAd_list storeId = store.id positionId = 10 ]
	      [#if storeAds ??]
	      <div class="templet1_flash" >
	        <script>
			 var box =new PPTBox();
			 box.width = 748; //宽度
			 box.height = 298;//高度
			 box.autoplayer = 3;//自动播放间隔时间
		
			 //box.add({"url":"图片地址","title":"悬浮标题","href":"链接地址"})
			[#list storeAds as storeAd ]
			 box.add({"url":"${storeAd.path}","title":"${storeAd.title}","href":"${storeAd.url}"})
			[/#list]
			 box.show();
	    	</script>
	      </div>
	      [/#if]
		[/@storeAd_list]
      <!--轮播图结束-->
      <div class="templet1_10"></div>
      <!--公告和收藏店铺-->
      <div class="templet1_notice templet1_left">
        <h3>店铺公告</h3>
        <div id="hotlist" onmouseover="clearInterval(timerluwei_2)" onmouseout="timerluwei_2=setInterval(marluwei_2,50)" class="templet1_notice_centent">
          [@store_affiche_list storeId=store.id ]
          [#list affiches as affiche]          
          	<div id="hotlist${affiche_index+1}">【${affiche.beginDate}起】${affiche.content} [#if affiche.endDate?? ]【${affiche.endDate}止】[/#if]</div>
		  [/#list]
		  [/@store_affiche_list]          
        </div>
<script language="javascript">
	var tluwei_2=getid("hotlist"),t1luwei_2=getid("hotlist1"),t2luwei_2=getid("hotlist2"),shluwei_2=getid("show"),timer;
	t2luwei_2.innerHTML=t1luwei_2.innerHTML;
	function marluwei_2(){
	if(t2luwei_2.offsetTop<=tluwei_2.scrollTop)
		tluwei_2.scrollTop-=t1luwei_2.offsetHeight;
	else
		tluwei_2.scrollTop++;
	}
	timerluwei_2=setInterval(marluwei_2,50);
	
	
	function getid(id){
		return document.getElementById(id);
	}
</script>
      </div>
      <div class="templet1_vedio templet1_left">
        <h3>店铺视频</h3>
		<object width="250" height="150" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
			<param name="src" value="[#if store.videoUrl != null || store.videoUrl != "" ]${store.videoUrl}[#else]${base}/resources/shop/images/store.swf[/#if]">
			<embed src="[#if store.videoUrl != null || store.videoUrl != "" ]${store.videoUrl}[#else]${base}/resources/shop/images/store.swf[/#if]" width="250" height="150"></embed>
		</object>      
      
      
<script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0','width','250','height','150','id','FLVPlayer','src','FLVPlayer_Progressive','flashvars','&MM_ComponentVersion=1&skinName=Clear_Skin_2&streamName=${store.videoUrl}=false&autoRewind=false','quality','high','scale','noscale','name','FLVPlayer','salign','lt','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','FLVPlayer_Progressive' ); //end AC code
</script>
          <noscript>
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="250" height="150" id="FLVPlayer">
            <param name="movie" value="FLVPlayer_Progressive.swf" />
            <param name="salign" value="lt" />
            <param name="quality" value="high" />
            <param name="scale" value="noscale" />
            <param name="FlashVars" value="&MM_ComponentVersion=1&skinName=Clear_Skin_2&streamName=${store.videoUrl}=false&autoRewind=false" />
            <embed src="FLVPlayer_Progressive.swf" flashvars="&MM_ComponentVersion=1&skinName=Clear_Skin_2&streamName=${store.videoUrl}=false&autoRewind=false" quality="high" scale="noscale" width="250" height="150" name="FLVPlayer" salign="LT" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" />
          </object>
          </noscript>
      </div>
      <div class="templet1_collect templet1_right">
        <div><a href="javascript:;" id="addFavoriteStore"><img src="${base}/resources/shop/images/store_collect.jpg" /></a></div>
      </div>
      <!--公告和收藏店铺结束-->
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
		[@store_category_show_list storeId = store.id count = 10 type="show" ]
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
      <!--推荐宝贝结束-->
      <div class="templet1_10"></div>
    </div>
    <!--右侧750部分结束-->
    <div class="templet1_10"></div>
  </div>
</div>
</body>
</html>
