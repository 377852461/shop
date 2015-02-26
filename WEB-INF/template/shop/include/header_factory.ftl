<script type="text/javascript" src="${base}/resources/shop/js/jquery.cookie.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $headerLogin = $("#headerLogin");
	var $headerRegister = $("#headerRegister");
	var $headerFactoryRegister = $("#headerFactoryRegister");
	var $headerMemberRegister=$("#headerMemberRegister");
	var $headerUsername = $("#headerUsername");
	var $headerLogout = $("#headerLogout");
	var defaultKeyword = "${message("shop.header.keyword")}";
	
	
	var username = $.cookie("username");
	if (username != null) {
		$headerUsername.text("${message("shop.header.welcome")}, " + username).show();
		$headerLogout.show();
	} else {
		$headerLogin.show();
		$headerRegister.show();
		$headerFactoryRegister.show();
		$headerMemberRegister.show();
	}
	
	/*$("#headerRegistera").live("click",function(){
		$headerRegister.hide();
		$headerFactoryRegister.show();
		$headerMemberRegister.show();
	});*/
	
	$.ajax({
		url: "${base}/cart/view_num.jhtml",
		type: "GET",
		cache: false,
		success: function(num) {
			$(".cart_num").html(num);
		}
	});
		
});
</script>
<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="${base}/">
				<img src="${setting.logo}" alt="${setting.siteName}" />
			</a>
		</div>
	</div>
	<div class="span9">
		[@ad_position id = 1 /]
	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<li id="headerLogin" class="headerLogin">
					<a href="${base}/login.jhtml">${message("shop.header.login")}</a>|
				</li>
				<!--
				<li id="headerRegister" class="headerRegister">
					<a id="headerRegistera" href="javascript:;">${message("shop.header.register")}</a>|
				</li>
				-->
				<li id="headerMemberRegister" class="headerRegister">
					<a href="${base}/register.jhtml">${message("shop.header.registerMember")}</a>|
				</li>
				<li id="headerFactoryRegister" class="headerRegister">
					<a href="${base}/register_facotry/factory.jhtml">${message("shop.header.productRegister")}</a>|
				</li>
				<li id="headerUsername" class="headerUsername"></li>
				<li id="headerLogout" class="headerLogout">
					<a href="${base}/logout.jhtml">[${message("shop.header.logout")}]</a>|
				</li>
				[@navigation_list position = "top"]
					[#list navigations as navigation]
						<li>
							<a href="${navigation.url}"[#if navigation.isBlankTarget] target="_blank"[/#if]>${navigation.name}</a>
							[#if navigation_has_next]|[/#if]
						</li>
					[/#list]
				[/@navigation_list]
			</ul>
		</div>
		<div class="cart">
			<a href="${base}/cart/list.jhtml">${message("shop.header.cart")}<span class="cart_num"></span></a>
		</div>
		[#if setting.phone??]
			<div class="phone">
				${message("shop.header.phone")}:
				<strong>${setting.phone}</strong>
			</div>
		[/#if]
	</div>

</div>