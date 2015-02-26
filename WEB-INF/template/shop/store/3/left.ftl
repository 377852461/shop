  <!--左侧190-->
  <div class="templet3_190 templet3_left templet3_190_bg">
    <h3>本店搜索</h3>
    <div class="templet3_190_search">
      <form id="serach" action="${base}/store/search.jhtml" method="get" >
      <div class="templet3_190_search_key"><span>关键字</span>
        <input type="hidden" name="factoryId" value="${store.factory.id}" >
        <input name="keyword" value="${productKeyword}" type="text" />
        <div class="templet3_0"></div>
      </div>
      <div class="templet3_190_search_btn">
        <input value="搜索" type="submit" />
      </div>
      </form>
    </div>
    <div class="templet3_0"></div>
    <div><a href="javascript:;" id="addFavoriteStore"><img src="${base}/resources/shop/images/3/templet3_7.jpg" /></a></div>
    <div class="templet3_notice">
      <marquee direction="up" scrollamount="2" scrolldelay="3">
          [@store_affiche_list storeId=store.id ]
          [#list affiches as affiche] 
		  【${affiche.beginDate}起】${affiche.content} [#if affiche.endDate?? ]【${affiche.endDate}止】[/#if]<br/>
		  [/#list]
		  [/@store_affiche_list] 
      </marquee>
    </div>
    <h3>个性化宝贝分类</h3>
    <div class="templet3_classify">
      <div class="templet3_classify_menu">
        <input type="checkbox" class="activate" id="accordion-1" name="accordion-1">
        <label for="accordion-1" class="templet3_classify_title">所有分类</label>
        <div class="templet3_classify_down1">
        	<a href="${base}/store/all.jhtml?storeId=${store.id}">所有分类</a>
        	<!--
        	<a href="${base}/store/all.jhtml?storeId=${store.id}&orderType=salesDesc">按销量</a> 
        	<a href="#">按价格</a>
        	<a href="#">按新品</a> 
        	<a href="#">按收藏</a>
        	-->
        </div>
      </div>
	[@store_category_show_list storeId = store.id count = 10 type="root" ]
	[#list storeCategories as storeCategory]  		
      <div class="templet3_classify_menu">
        <input type="checkbox" class="activate" id="accordion-${storeCategory_index+2}" name="accordion-${storeCategory_index+2}">
        <label for="accordion-${storeCategory_index+2}" class="templet3_classify_title">${storeCategory.name}</label>
        <div class="templet3_classify_down"> 
          	[@store_category_show_list storeId = store.id count = 10 parentId=storeCategory.id type="child" ]
			[#list storeCategories as storeCategory_c] 
          	<a href="${base}/store/list.jhtml?storeCategoryId=${storeCategory_c.id}">${storeCategory_c.name}</a>
		    [/#list]
		    [/@store_category_show_list]   
        </div>
      </div>
    [/#list]
    [/@store_category_show_list]
    </div>
	<div class="templet3_0"></div>
	<!--销售量和收藏数-->
	<h3>宝贝排行榜</h3>
	<div id="templet3_tab_con_1">
<script type="text/javascript">
    function pucker_show1(name, no, hiddenclassname, showclassname) {
        for (var i = 1; i < 11; i++) {
            document.getElementById(name + i).className = hiddenclassname;
        }
        document.getElementById(name + no).className = showclassname;
    }
</script>
	  <ul id="templet3_tab_tags_1">
	    <li class="templet3_tab_selectTag_1"><a onclick="templet3_tab_selectTag_1('templet3_tab_tagContent_10',this)" href="javascript:void(0)">销售量</a> </li>
	    <li>
	     <!--<a onclick="templet3_tab_selectTag_1('templet3_tab_tagContent_11',this)" href="javascript:void(0)">收藏数</a> -->
	    </li>
	  </ul>
	  <div class="templet3_0"></div>
	  <div id="templet3_tab_tagContent_1">
	    <div class="templet3_tab_tagContent_1 templet3_tab_selectTag_1" id="templet3_tab_tagContent_10">
	      <ul>
	        [@store_product_list factoryId=store.factory.id orderBy="sales" count=6 ]
	        [#list products as product]
	        <li class="scs">
	          <div class="pic"><a href="${base}${product.path}"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" /></a></div>
	          <div class="infor">
	            <div class="bt"><a href="${base}${product.path}">${product.name}</a></div>
	            <div class="jg">价格：￥<b>${product.price}</b></div>
	            <div class="sz">已售出${product.sales}件</div>
	            <div class="templet3_0"></div>
	          </div>
	        </li>
	        [/#list]
	        [/@store_product_list]
	      </ul>
	      <div class="templet3_0"></div>
	    </div>
	    <div class="templet3_0"></div>
	  </div>
	  <p>
<script type="text/javascript">
    function templet3_tab_selectTag_1(showContent,selfObj){
        // 操作标签
        var tag = document.getElementById("templet3_tab_tags_1").getElementsByTagName("li");
        var taglength = tag.length;
        for(i=0; i<taglength; i++){
            tag[i].className = "";
        }
        selfObj.parentNode.className = "templet3_tab_selectTag_1";
        // 操作内容
        for(i=0; j=document.getElementById("templet3_tab_tagContent_1"+i); i++){
            j.style.display = "none";
        }
        document.getElementById(showContent).style.display = "block";
    }
</script>
	    </p>
	</div>
	<!--销售量和收藏数结束-->
  </div>
  <!--左侧190结束-->
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  