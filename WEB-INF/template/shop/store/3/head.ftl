<!--头部-->
<div class="templet3_header">
  <div class="templet3_950">
    <div class="templet3_logo">
		<a href="${base}/store.jhtml?factoryId=${store.factory.id}">
		[#if store.logo?? ]
		<img src="${store.logo}" style="max-width:950px;max-height:120px;" />
		[#else]
		<span style="font-size:50px; color:#000;">${abbreviate(store.storeName,38)}<span>
		[/#if]
		</a>
    </div>
    <!--
    <div class="templet3_header_notice"><span>公告</span>：公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告</div>
    -->
    <div class="templet3_nav">
      <ul id="templet3_xiala">
        <li class="allgoods"><a href="${base}/store/all.jhtml?storeId=${store.id}">所有宝贝</a>
          <ul>  
			[@store_category_show_list storeId = store.id count = 10 type="root" ]
			[#list storeCategories as storeCategory]             
            <li><a href="${base}/store/list.jhtml?storeCategoryId=${storeCategory.id}">${storeCategory.name}</a></li>
	        [/#list]
	        [/@store_category_show_list]           
          </ul>
        </li>
        <li><a href="${base}/store.jhtml?factoryId=${store.factory.id}" class="now">首页</a></li>
      </ul>
    </div>
  </div>
</div>
<!--头部结束-->