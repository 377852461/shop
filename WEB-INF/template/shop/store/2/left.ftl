 <script type="text/javascript"> 		
	function view_menu(i) {
		document.getElementById("foucs"+i).className = 'foucs';
	}
	function hide_menu(i) {
		document.getElementById("foucs"+i).className = '';
	}
 </script>
      <!--左侧190部分-->
      <div class="templet2_left templet2_190">
        <!--竖导航-->
        <div class="templet2_nav2">
          <div class="templet2_nav2_title"><a href="${base}/store/all.jhtml?storeId=${store.id}">所有的个性产品</a></div>
          <ul class="templet2_nav2_in">
			[@store_category_show_list storeId = store.id count = 10 type="root" ]
			[#list storeCategories as storeCategory]             
            <li id="foucs${storeCategory_index+1}" onmouseover="view_menu(${storeCategory_index+1})" onmouseout="hide_menu(${storeCategory_index+1})">
                <div>
                	<a href="${base}/store/list.jhtml?storeCategoryId=${storeCategory.id}">${storeCategory.name}<b class="a_icon1"></b></a>
                	<span></span>
                </div>
	           	[@store_category_show_list storeId = store.id  parentId=storeCategory.id type="child" ]
              	[#if storeCategories?has_content ]
              	<ul>
					[#list storeCategories as storeCategory_c]             	
	              	<li [#if storeCategory_c_index == 0] class="one" [/#if]><a href="${base}/store/list.jhtml?storeCategoryId=${storeCategory_c.id}">${storeCategory_c.name}<b class="a_icon2"></b></a></li>
				    [/#list]
			    </ul>
			    [/#if]
				[/@store_category_show_list]  
            </li>
	        [/#list]
	        [/@store_category_show_list]            
            <div class="templet2_0"></div>
          </ul>
        </div>
        <!--竖导航结束-->
        <div class="templet2_10"></div>
        <!--广告-->
        <div class="templet2_gg"><a href="javascript:" id="addFavoriteStore"><img src="${base}/resources/shop/images/store_collect.jpg" /></a></div>
        <!--广告结束-->
        <div class="templet2_10"></div>
        <!--促销-->
        <div class="templet2_cuxiao">
          <div class="templet2_cuxiao_title">促销商品</div>
          <ul class="templet2_cuxiao_in">
          [@store_product_list factoryId=store.factory.id showType="cuxiao" count=3 ]
          [#list products as product]          	
            <li class="pic"><a href="${base}${product.path}"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" /></a></li>
            <li class="nopic"><a href="${base}${product.path}" title="${product.name}" target="_blank"><span>[促销]</span>${abbreviate(product.name,30,"...")}</a></li>
          [/#list]
          [/@store_product_list]            
          </ul>
        </div>
        <!--促销结束-->
        <div class="templet2_10"></div>
        <!--评论-->
        <div class="templet2_cuxiao">
          <div class="templet2_cuxiao_title">买家评论</div>
          <ul class="templet2_pinglun_in">
            [@review_list factoryId=store.factory.id count=6]
            [#list reviews as review]
            <li>
              <div class="templet2_pinglun_content">${abbreviate(review.content,20,"")}</div>
              <div class="templet2_pinglun_people">
                <p class="p3">${abbreviate(review.member.name,3,"***")}</p>
                <p class="p4">${review.createDate}</p>
              </div>
            </li>
            [/#list]
            [/@review_list]
          </ul>
        </div>
        <!--评论结束-->
      </div>
      <!--左侧190部分结束-->