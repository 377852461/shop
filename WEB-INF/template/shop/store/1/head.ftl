
  <!--店招导航-->
  <div class="templet1_950">
    <div class="templet1_logo">
    		<a href="${base}/store.jhtml?factoryId=${store.factory.id}">
    		[#if store.logo?? ]
    		<img src="${store.logo}" style="max-width:950px;max-height:120px;" />
    		[#else]
    		${abbreviate(store.storeName,18)}
    		[/#if]
    		</a>
    </div>
    <div class="templet1_nav">
      <ul id="templet1_xiala">
        <li><a href="${base}/store/all.jhtml?storeId=${store.id}">所有分类</a>
        	<ul>
				[@store_category_show_list storeId = store.id count = 10 type="root" ]
				[#list storeCategories as storeCategory]    
					<li><a href="${base}/store/list.jhtml?storeCategoryId=${storeCategory.id}">${storeCategory.name}</a></li>
		        [/#list]
		        [/@store_category_show_list]
			</ul>        
        </li>
        <li><span>|</span></li>
        <li><a href="${base}/store.jhtml?factoryId=${store.factory.id}" class="now">首页</a></li>
      </ul>
    </div>
  </div>
  <!--店招导航结束-->