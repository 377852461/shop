<div class="templet2_all">
  <!--店招导航-->
  <div class="templet2_950">
    <div class="templet2_logo">
      <div class="templet2_logo_left">
		<a href="${base}/store.jhtml?factoryId=${store.factory.id}">
		[#if store.logo?? ]
		<img src="${store.logo}" style="max-width:950px;max-height:120px;" />
		[#else]
		${abbreviate(store.storeName,38)}
		[/#if]
		</a>
      	<span></span>
      </div>
      [#if store.phone ??]
      <div class="templet2_logo_right"><span>客服联系电话：</span>${store.phone}</div>
      [/#if]
    </div>
    <div class="templet2_0"></div>
    <div class="templet2_nav">
      <ul id="templet2_xiala">
        <li><a href="${base}/store.jhtml?factoryId=${store.factory.id}" class="now">首页</a></li>
      </ul>
    </div>
  </div>
  <!--店招导航结束-->
</div>