<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${store.storeName}</title>
<link href="${base}/resources/shop/css/header_factory.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/store_3.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/store.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/global.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/tab.js"></script>
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
		
		// 添加商品收藏
		$(".addFavoriteProduct").click(function(){
			var id = this.name;
			$.ajax({
				url: "${base}/member/favorite/add.jhtml?id="+id,
				type: "POST",
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
	
	//全屏轮播图JS
	$(function(){
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
	
	
		var $window = $(window),
			window_width = $window.width();
		$('#templet3_flash_js, #templet3_flash_img li').width(window_width);

		var urlParam = G.util.parse.url(),
			startFrame = 0;
		if (urlParam.search && ('templet3_flash' in urlParam.search)) {
			startFrame = (parseInt(urlParam.search['templet3_flash'])-1) || 0;
		}

		new $.Tab({/*添加圆点按钮*/
			target: $('#templet3_flash_img li'),
			effect: 'slide3d',
			animateTime: 1000,
			stay: 4000,
			playTo: startFrame,
			autoPlay: true,
			merge: true,
			prevBtn: $('#templet3_flash_pre'),
			nextBtn: $('#templet3_flash_next')
		});
		$('#templet3_flash_img').css('left','-' + (window_width * startFrame) + 'px');
	})
	//全屏轮播图JS结束
</script>
<script type="text/javascript">
	//商品中间显示
	(function(b,c){
		var a=function(d,e){
			this.$element=c(d);
			this.option=c.extend({},c.fn.templet3_slideShow.defaults,e);
			this.timmer;
			this.$container=c(this.option.container);
			this.$control=c(this.option.control);
			this.$follow=this.$control.children(this.option.follower);
			this.$child=this.$container.children();
			this.follow_height=this.$control.find(":first-child").outerHeight();
			this.cur=0;this.length=this.$child.length;
			this._init();this._events()
		};
		a.prototype._init=function(){
			var d=this;
			d.$container.children().each(function(f,e){
				var g=c(this);
				if(f===0){
					g.css({opacity:1})
				}else{
					g.css({display:"block",opacity:0})
				}
			});
			d.$control.children(d.option.trigger).each(function(f,e){
				var g=c(this);
				g.data("templet3_slideindex",f)
			});
			d._start()
		};
		a.prototype.next=function(){
			var d=this,e;
			e=d.cur+1<d.length?d.cur+1:0;d.templet3_slideto(e)};
			a.prototype.prev=function(){
				var d=this,e;
				e=d.cur-1<0?d.length-1:d.cur-1;d.templet3_slideto(e)
			};
			a.prototype.templet3_slideto=function(e){
				var f=this,g=f.cur,h=f.$child.eq(f.cur),d=f.$child.eq(e);
				if(g===e){
					return
				}if(f.anim){
					f.anim.stop(false,true)}d.css({zIndex:4,opacity:1});
					h.css({zIndex:5});
					f.anim=h.animate({opacity:0},"fast",function(){
						h.css({zIndex:1})
					});
					!!f.$follow&&f.$follow.stop(true).animate({
						top:f.follow_height*e
					},"fast",function(){
						f.$follow.css({
							top:f.follow_height*e
						})
					});
					f.cur=e
				};
				a.prototype._stop=function(){
					var d=this;
					clearTimeout(d.timmer)
				};
				a.prototype._start=function(){
					var d=this;
					d.timmer=setTimeout(function(){
						d.next();
						d._start()
					},d.option.timeout)
				};
				a.prototype._events=function(){
					var e=this,d;
					e.$element.bind("mouseenter mouseleave",function(f){
						if(f.type==="mouseenter"){
							e._stop()
						}else{
							if(f.type==="mouseleave"){
								e._start()
							}
						}
					});
					c(e.option.control).delegate(e.option.trigger,"mouseenter",function(f){
						var g=c(this);
						clearTimeout(d);
						d=setTimeout(function(){
							e.templet3_slideto(g.data("templet3_slideindex"))
						},100)
					})
				};c
				.fn.templet3_slideShow=function(d){
					return this.each(function(){
						var g=c(this),f=g.data("templet3_slideShow-obj"),e=typeof d==="object"&&d;
						if(!f){
							g.data("templet3_slideShow-obj",(f=new a(this,e)))
						}
					})
				};
				c.fn.templet3_slideShow.Constructor=a;c.fn.templet3_slideShow.defaults={
					timeout:4000,
					container:"#indexLeft1",
					control:"#indexRight1",
					trigger:"a",
					follower:"div"
				}
	})(window,jQuery);
	//商品中间显示结束
</script>
</head>
<body>
[#include "/shop/include/header_factory.ftl" /]
[#include "/shop/store/3/head.ftl" /]
<!--全屏轮播图-->
[@storeAd_list storeId = store.id positionId = 10 ]
  [#if storeAds ??]
<div id="templet3_flash_js" class="templet3_flash">
  <ul id="templet3_flash_img" class="templet3_flash_img">
    [#list storeAds as storeAd ]
    <li><a [#if storeAd.url?? ] href="${storeAd.url}" target="_blank" [/#if] ><img src="${storeAd.path}" /> </a></li>
    [/#list]
  </ul>
  <div class="templet3_flash_common"> 
  	<a id="templet3_flash_pre" href="javascript:;" class="templet3_flash_pre"></a> 
  	<a id="templet3_flash_next" href="javascript:;" class="templet3_flash_next"></a> 
  </div>
</div>
  [/#if]
[/@storeAd_list]
<!--全屏轮播图结束-->
<div class="templet3_10"></div>

[@store_category_show_list storeId = store.id count = 10 type="show" ]
[#list storeCategories as storeCategory] 
<div class="templet3_950">
  <div class="templet3_slide_title"><a href="${base}/store/list.jhtml?storeCategoryId=${storeCategory.id}">更多宝贝>></a>${storeCategory.name}</div>
  <div class="templet3_slide" id="indextemplet3_slide${storeCategory_index+1}">
	[@product_list storeCategoryId = storeCategory.id  count = 12]
    <div class="left" id="indexLeft${storeCategory_index+1}">
	  [#list products as product]      
      <div class="swcont" [#if product_index == 0]style="display:block;"[/#if]>
        <div class="pic"><a href="${base}${product.path}" target="_blank"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" /></a></div>
        <div class="name"><a href="${base}${product.path}" title="${product.name}" target="_blank">${abbreviate(product.name,30,"...")}</a></div>
        <div class="price">
          <div class="c1">￥<b>${product.price}</b><del>原价：${product.marketPrice}</del></div>
          <div class="c2">已售：${product.sales}</div>
          <a href="javascript:;" name="${product.id}" class="addFavoriteProduct">★收藏宝贝</a></div>
            <div class="shear"><span>分享到：</span>
        	<div>
				<script type="text/javascript">
					(function(){
					var p = {
					url:location.href,
					showcount:'0',/*是否显示分享总数,显示：'1'，不显示：'0' */
					desc:'金牌承诺100%正品 100%信赖',/*默认分享理由(可选)*/
					summary:'${product.attributeValue0}${product.attributeValue1}${product.attributeValue2}${product.attributeValue3}',/*分享摘要(可选)*/
					title:'${product.fullName}',/*分享标题(可选)*/
					site:'指码开门诚信电商',/*分享来源 如：腾讯网(可选)*/
					pics:'${product.productImages[0].medium}', /*分享图片的路径(可选)*/
					style:'203',
					width:22,
					height:22
					};
					var s = [];
					for(var i in p){
					s.push(i + '=' + encodeURIComponent(p[i]||''));
					}
					document.write(['<a version="1.0" class="qzOpenerDiv" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?',s.join('&'),'" target="_blank">分享</a>'].join(''));
					})();
				</script>
				<script src="http://qzonestyle.gtimg.cn/qzone/app/qzlike/qzopensl.js#jsdate=20111201" charset="utf-8"></script>
			</div>
        </div>
      </div>
      [/#list]
    </div>
    <div class="right" id="indexRight${storeCategory_index+1}"> 
      [#list products as product]	
    	<a href="#" class="r${product_index+1}">
    		<img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" />
	      	<div class="price">
	        	<div class="c1">￥<span>${product.price}</span></div>
	        	<div class="c2"> 已售<b>${product.sales}</b> </div>
	      	</div>
      	</a>
      [/#list]  
    </div>
    [/@product_list]
  </div>
  <script type="text/javascript">
	$(document).ready(function(){
		
		$("#indextemplet3_slide${storeCategory_index+1}").templet3_slideShow({container:"#indexLeft${storeCategory_index+1}",control:"#indexRight${storeCategory_index+1}",trigger:"a",follower:"div"});
		
	});
  </script>
</div>
<div class="templet3_10"></div>
[/#list]
[/@store_category_show_list]
<div class="templet3_950" > 
	[#include "/shop/store/3/left.ftl" /]
  <!--右侧750-->
  <div class="templet3_750 templet3_right">
  	<!--产品切换-->
[@store_product_list factoryId=store.factory.id orderBy="sales" count=8 ]
<div class="templet3_mod"> 
	<span id="prev" class="btn prev"></span> 
	<span id="next" class="btn next"></span> 
	<span id="prevTop" class="btn prev"></span> 
	<span id="nextTop" class="btn next"></span>
  <div id="picBox" class="picBox">
    <ul class="cf">
      [#list products as product]      
      <li>
        <div class="pic"><a href="${base}${product.path}"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]"  /></a></div>
        <div class="goods">
          <div class="num">TOP NO.${product_index+1}</div>
          <div class="name"><a href="${base}${product.path}">${product.name}</a></div>
          <div class="price">
            <p class="p1"><b>￥</b><span>${product.price}</span><del>原价：${product.marketPrice}元</del></p>
            <p class="p2">已售：${product.sales}</p>
          </div>
          <div class="fx">
            <div class="sc"><a href="javascript:" name="${product.id}" class="addFavoriteProduct">★收藏宝贝</a></div>
                <div class="shear"  style=" width:100px;"  ><span>分享到：</span>       	
        	<div>
				<script type="text/javascript">
					(function(){
					var p = {
					url:location.href,
					showcount:'0',/*是否显示分享总数,显示：'1'，不显示：'0' */
					desc:'金牌承诺100%正品 100%信赖',/*默认分享理由(可选)*/
					summary:'${product.attributeValue0}${product.attributeValue1}${product.attributeValue2}${product.attributeValue3}',/*分享摘要(可选)*/
					title:'${product.fullName}',/*分享标题(可选)*/
					site:'指码开门诚信电商',/*分享来源 如：腾讯网(可选)*/
					pics:'${product.productImages[0].medium}', /*分享图片的路径(可选)*/
					style:'203',
					width:22,
					height:22
					};
					var s = [];
					for(var i in p){
					s.push(i + '=' + encodeURIComponent(p[i]||''));
					}
					document.write(['<a version="1.0" class="qzOpenerDiv" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?',s.join('&'),'" target="_blank">分享</a>'].join(''));
					})();
				</script>
				<script src="http://qzonestyle.gtimg.cn/qzone/app/qzlike/qzopensl.js#jsdate=20111201" charset="utf-8"></script>
			</div>
        </div>
          </div>
          <div class="xq"><a href="${base}${product.path}">查看详情</a></div>
        </div>
      </li>
      [/#list]     
    </ul>
  </div>
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
  <div id="listBox" class="listBox">
    <ul class="cf">
      [#list products as product]
      <li [#if product_index==0]class="on"[/#if]><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" /></li>
      [/#list]
    </ul>
  </div>
<script type="text/javascript">
(function(){
	
	function G(s){
		return document.getElementById(s);
	}
	
	function getStyle(obj, attr){
		if(obj.currentStyle){
			return obj.currentStyle[attr];
		}else{
			return getComputedStyle(obj, false)[attr];
		}
	}
	
	function Animate(obj, json){
		if(obj.timer){
			clearInterval(obj.timer);
		}
		obj.timer = setInterval(function(){
			for(var attr in json){
				var iCur = parseInt(getStyle(obj, attr));
				iCur = iCur ? iCur : 0;
				var iSpeed = (json[attr] - iCur) / 5;
				iSpeed = iSpeed > 0 ? Math.ceil(iSpeed) : Math.floor(iSpeed);
				obj.style[attr] = iCur + iSpeed + 'px';
				if(iCur == json[attr]){
					clearInterval(obj.timer);
				}
			}
		}, 30);
	}

	var oPic = G("picBox");
	var oList = G("listBox");
	
	var oPrev = G("prev");
	var oNext = G("next");
	var oPrevTop = G("prevTop");
	var oNextTop = G("nextTop");

	var oPicLi = oPic.getElementsByTagName("li");
	var oListLi = oList.getElementsByTagName("li");
	var len1 = oPicLi.length;
	var len2 = oListLi.length;
	
	var oPicUl = oPic.getElementsByTagName("ul")[0];
	var oListUl = oList.getElementsByTagName("ul")[0];
	var w1 = oPicLi[0].offsetWidth;
	var w2 = oListLi[0].offsetWidth;

	oPicUl.style.width = w1 * len1 + "px";
	oListUl.style.width = w2 * len2 + "px";

	var index = 0;
	
	var num = 5;
	var num2 = Math.ceil(num / 2);

	function Change(){

		Animate(oPicUl, {left: - index * w1});
		
		if(index < num2){
			Animate(oListUl, {left: 0});
		}else if(index + num2 <= len2){
			Animate(oListUl, {left: - (index - num2 + 1) * w2});
		}else{
			Animate(oListUl, {left: - (len2 - num) * w2});
		}

		for (var i = 0; i < len2; i++) {
			oListLi[i].className = "";
			if(i == index){
				oListLi[i].className = "on";
			}
		}
	}
	
	oNextTop.onclick = oNext.onclick = function(){
		index ++;
		index = index == len2 ? 0 : index;
		Change();
	}

	oPrevTop.onclick = oPrev.onclick = function(){
		index --;
		index = index == -1 ? len2 -1 : index;
		Change();
	}

	for (var i = 0; i < len2; i++) {
		oListLi[i].index = i;
		oListLi[i].onclick = function(){
			index = this.index;
			Change();
		}
	}
	
})()
</script>
</div>
  	<!--产品切换结束-->
[/@store_product_list]
<!--宝贝推荐-->
<div class="templet3_groom">
	<h3><a href="#">更多>></a>宝贝促销</h3>
    <div class="templet3_groom_content" >
    <ul>
      [@store_product_list factoryId=store.factory.id showType="cuxiao" count=12 ]
      [#list products as product]
        <li>
            <div class="pic"><a href="${base}${product.path}"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" /></a></div>
            <div class="name"><a href="${base}${product.path}">${abbreviate(product.name,30,"...")}</a></div>
            <div class="price">￥${product.price}</div>
        </li>
      [/#list]
      [/@store_product_list]        
    </ul>
    </div>
</div>

<!--宝贝推荐结束-->
  </div>
  <!--右侧750结束-->
  <div class="templet3_10"></div>
</div>
<div class="templet3_10"></div>
</body>
</html>
