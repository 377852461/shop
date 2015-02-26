<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta property="qc:admins" content="56207406376255516375" />
<meta name="description" content="">
<meta name="keywords" content="">
<title>诚信电商-服装限时抢购</title>
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/group.css">
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.yomi.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<!--<link rel="dns-prefetch" href="##">----(dns-prefetch)--通过dns解析,提高访问速度-->
<script type="text/javascript" >
	function shoucang(productId){
		//alert(productId);
		$.ajax({
			url: "${base}/member/favorite/add.jhtml",
			data: {"id":productId},
			type: "POST",
			cache: false,
			success: function(message) {
			//	alert(message)
				$.message(message);
			}
		});
	}
</script>
</head>

<body>
  
  [#include "/shop/include/header.ftl" /]
  <div class="content">
   <!--banner-->
    <div class="con_banner">
       <img src="${base}/resources/shop/images/img/banner_01.png" width="950" height="332"/>
    </div>
   <!--end-banner-->
   <!--精选特卖-->
    <div class="jxtm_box">
       <p class="jxtm_title">精选特卖</p>
		<form id="scForm" action="${base}/member/favorite/add.jhtml" method="post" > 
			<input type="hidden"  id="productId" name="id" value="" > 
        [@groupon_list count=30 orderBy="endDate"  ]
       [#list groupons as groupon]
       [#if groupon.products != null ]
       [#list groupon.products as product]
       <div class="jxtm_con">
          <div class="jxtm_con_left">
             <p class="jxtm_bt">[#if groupon.isFreeShipping == true ]<span class="icon_baoyou"></span>[/#if] <a href="${base}${product.path}" title="${product.name}" target="_blank" > ${abbreviate(product.name,60)} </a></p>
             <div class="jxtm_tedian">${product.shortIntroduction}</div>
             <div class="jiage">
                <p class="jiage_youhui">
                	<span class="small">￥</span>${product.price}
                </p>
                <span class="yuanjiage">￥${product.marketPrice}</span>
             </div>
             <p class="time">
				<div style="width:350px;heigth:20px;margin-left:90px;">
					<div class="yomibox" data="${groupon.endDate?string('yyyy-MM-dd HH:mm:ss')}"></div>
				</div>
             </p>
             <p class="renshu">&nbsp;</p>
             <div class="jxtm_syjz_rs" >
             	<p><span class="renshu_fon">${product.groupNum}</span>人购买</p>
             </div>
              <div class="bottom_scfx">
                 <div class="button_shoucang">
                 	<a href="javascript:shoucang(${product.id});">${message("shop.product.addFavorite")}</a>
                 </div>
                 <div class="button_fenxiang">
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
										style:'102',
										width:145,
										height:30
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
          </div>
         
          <div class="jxtm_con_right">
             <a href="${base}${product.path}" target="_blank"><img src="[#if product.groupImage ??]${product.groupImage}[#else]${base}/resources/shop/images/img/img_01.png[/#if]" title="点击参团"  /></a>
          </div>
       </div>
       [/#list]
       [/#if]    			
       [/#list]
       [/@groupon_list]
		</form>

		
    </div>
   <!--end-精选特卖-->

  </div>  
  [#include "/shop/include/footer.ftl" /]
</body>
</html>
