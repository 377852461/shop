<div class="span6">
	<div class="info">
		<div class="top"></div>
		<div class="content">
			<p>${message("shop.member.navigation.welcome", member.username)}</p>
			<p>
				${message("shop.member.navigation.memberRank")}:
				[#if member.memberRank.id=5]
					<a href="${base}/article/content/201408/2/1.html"><span class="red">${member.memberRank.name}</span></a>
				[#else]
					<a href="${base}/article/content/201408/2/1.html"><span>${member.memberRank.name}</span></a>
				[/#if]
			</p>
		</div>
		<div class="bottom"></div>
	</div>
	<div class="menu">
		<div class="title">
			<a href="${base}/member/index.jhtml">${message("shop.member.navigation.title")}</a>
		</div>
		<div class="content">
			<dl>
				<dt>${message("shop.member.navigation.order")}</dt>
				<dd>
					<a href="${base}/member/order/list.jhtml"[#if current == "orderList"] class="current"[/#if]>${message("shop.member.order.list")}</a>
				</dd>
				<dd>
					<a href="${base}/member/coupon_code/list.jhtml"[#if current == "couponCodeList"] class="current"[/#if]>${message("shop.member.couponCode.list")}</a>
				</dd>
				<dd>
					<a href="${base}/member/coupon_code/exchange.jhtml"[#if current == "couponCodeExchange"] class="current"[/#if]>${message("shop.member.couponCode.exchange")}</a>
				</dd>
				<dd>
					<a href="${base}/member/exchange/list.jhtml"[#if current == "exchangeProduct"] class="current"[/#if]>${message("shop.member.product.exchange")}</a>
				</dd>
				<dd>
					<a href="${base}/member/exchange/eProduct_list.jhtml"[#if current == "eProduct_list"] class="current"[/#if]>${message("shop.member.exchangeProduct.list")}</a>
				</dd>
			</dl>
			<dl>
				<dt>${message("shop.member.navigation.favorite")}</dt>
				<dd>
					<a href="${base}/member/favorite/list.jhtml"[#if current == "favoriteList"] class="current"[/#if]>${message("shop.member.favorite.list")}</a>
				</dd>
				<dd>
					<a href="${base}/member/favoriteStore/list.jhtml"[#if current == "favoriteStoreList"] class="current"[/#if]>店铺收藏</a>
				</dd>				
				<dd>
					<a href="${base}/member/product_notify/list.jhtml"[#if current == "productNotifyList"] class="current"[/#if]>${message("shop.member.productNotify.list")}</a>
				</dd>
				<dd>
					<a href="${base}/member/review/list.jhtml"[#if current == "reviewList"] class="current"[/#if]>${message("shop.member.review.list")}</a>
				</dd>
				<dd>
					<a href="${base}/member/consultation/list.jhtml"[#if current == "consultationList"] class="current"[/#if]>${message("shop.member.consultation.list")}</a>
				</dd>
			</dl>
			<dl>
				<dt>${message("shop.member.navigation.message")}</dt>
				<dd>
					<a href="${base}/member/message/send.jhtml"[#if current == "messageSend"] class="current"[/#if]>${message("shop.member.message.send")}</a>
				</dd>
				<dd>
					<a href="${base}/member/message/list.jhtml"[#if current == "messageList"] class="current"[/#if]>${message("shop.member.message.list")}</a>
				</dd>
				<dd>
					<a href="${base}/member/message/draft.jhtml"[#if current == "messageDraft"] class="current"[/#if]>${message("shop.member.message.draft")}</a>
				</dd>
			</dl>
			<dl>
				<dt>${message("shop.member.navigation.profile")}</dt>
				<dd>
					<a href="${base}/member/profile/edit.jhtml"[#if current == "profileEdit"] class="current"[/#if]>${message("shop.member.profile.edit")}</a>
				</dd>
				<dd>
					<a href="${base}/member/password/edit.jhtml"[#if current == "passwordEdit"] class="current"[/#if]>${message("shop.member.password.edit")}</a>
				</dd>
				<dd>
					<a href="${base}/member/receiver/list.jhtml"[#if current == "receiverList"] class="current"[/#if]>${message("shop.member.receiver.list")}</a>
				</dd>
			</dl>
			<dl>
				<dt>${message("shop.member.navigation.deposit")}</dt>
				<dd>
					<a href="${base}/member/deposit/recharge.jhtml"[#if current == "depositRecharge"] class="current"[/#if]>${message("shop.member.deposit.recharge")}</a>
				</dd>
				<dd>
					<a href="${base}/member/deposit/list.jhtml"[#if current == "depositList"] class="current"[/#if]>${message("shop.member.deposit.list")}</a>
				</dd>
			</dl>
		</div>
		<div class="bottom"></div>
	</div>
</div>