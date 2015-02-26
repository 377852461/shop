    <!--左侧190部分-->
    <div class="templet1_left templet1_190">
      <!--搜索-->
      <div class="templet1_search">
        <h3>本店搜索</h3>
        <div class="templet1_10"></div>
        <form action="${base}/store/search.jhtml" method="get" >
        <input type="hidden" name="factoryId" value="${store.factory.id}" >
        <p><span>关键字</span>
          <input type="text" name="keyword" value="${productKeyword}" class="input1">
        </p>
        <p><span>价格</span>
          <input type="text" name="startPrice" value="${startPrice}" class="input2">
          <i>-</i>
          <input type="text" name="endPrice" value="${endPrice}" class="input3">
        </p>
        <p>
          <input value="搜索" type="submit" class="input_btn">
        </p>
        </form>
      </div>
      <!--搜索结束-->
      <div class="templet1_10"></div>
      <!--宝贝分类-->
      <div class="templet1_classify">
        <h3>宝贝分类</h3>
        <div class="templet1_10"></div>
		[@store_category_show_list storeId = store.id count = 10 type="root" ]
		[#list storeCategories as storeCategory]      
        <div class="templet1_classify_menu">
          <input type="checkbox" class="activate" id="accordion-${storeCategory_index+1}" name="accordion-${storeCategory_index+1}">
          <label for="accordion-${storeCategory_index+1}"  class="templet1_classify_title"><a href="${base}/store/list.jhtml?storeCategoryId=${storeCategory.id}" >${storeCategory.name}</a></label>
          <div class="templet1_classify_down"> 
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
      <!--宝贝分类结束-->
      <div class="templet1_10"></div>
      <!--销售量和收藏数-->
      <div id="templet1_tab_con_1">
        <script type="text/javascript">
    function pucker_show1(name, no, hiddenclassname, showclassname) {
        for (var i = 1; i < 11; i++) {
            document.getElementById(name + i).className = hiddenclassname;
        }
        document.getElementById(name + no).className = showclassname;
    }
</script>
        <ul id="templet1_tab_tags_1">
          <li class="templet1_tab_selectTag_1"><a onclick="templet1_tab_selectTag_1('templet1_tab_tagContent_10',this)" href="javascript:void(0)">销售量</a> </li>
          <li>
          	<!--
          	<a onclick="templet1_tab_selectTag_1('templet1_tab_tagContent_11',this)" href="javascript:void(0)">收藏数</a> 
          	-->
          </li>
        </ul>
        <div class="templet1_0"></div>
        <div id="templet1_tab_tagContent_1">
          <div class="templet1_tab_tagContent_1 templet1_tab_selectTag_1" id="templet1_tab_tagContent_10">
            <ul>
              [@store_product_list factoryId=store.factory.id orderBy="sales" count=6 ]
              [#list products as product]
              <li class="scs">
                <div class="pic"><a href="${base}${product.path}"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" /></a></div>
                <div class="infor">
                  <div class="bt"><a href="${base}${product.path}">${product.name}</a></div>
                  <div class="jg">价格：￥<b>${product.price}</b></div>
                  <div class="sz">销量：<b>${product.sales}</b>件</div>
                  <div style="clear:both; height:0; overflow:hidden;"></div>
                </div>
              </li>
              [/#list]
              [/@store_product_list]
               <div class="templet1_0"></div>
            </ul>
          </div>
          <div class="templet1_0"></div>
        </div>
        
        <p>
          <script type="text/javascript">
        function templet1_tab_selectTag_1(showContent,selfObj){
            // 操作标签
            var tag = document.getElementById("templet1_tab_tags_1").getElementsByTagName("li");
            var taglength = tag.length;
            for(i=0; i<taglength; i++){
                tag[i].className = "";
            }
            selfObj.parentNode.className = "templet1_tab_selectTag_1";
            // 操作内容
            for(i=0; j=document.getElementById("templet1_tab_tagContent_1"+i); i++){
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";
        }
        </script>
        </p>
      </div>
      <!--销售量和收藏数结束-->
    </div>
    <!--左侧190部分结束-->