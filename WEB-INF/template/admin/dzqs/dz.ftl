[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.order.list")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]

});

$().ready(function() {

	var $listForm = $("#listForm");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");
	
	
	
		// 订单筛选
	$filterSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 筛选选项
	$filterOption.click(function() {
		var $this = $(this);
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		$listForm.submit();
		return false;
	});
	

	
});







</script>

</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo;${message("admin.transactionInfo.dz")}  <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="dz.jhtml" method="get">
		<input type="hidden" id="paymentPlugin" name="paymentPlugin" > 
		
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						支付插件<span class="arrow">&nbsp;</span>
					</a>					
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							[#list paymentPlugins as plugin]
							<li>
								<a href="javascript:;" name="paymentPlugin" val="${plugin}" [#if plugin == paymentPlugin] class="checked"[/#if] >${plugin}</a>
							</li>
							[/#list]
						</ul>
					</div>
				</div>					
			</div>
		</div>	
		<table id="listTable" class="list">
			<tr>
				<th>&nbsp;&nbsp;${message("admin.transactionInfo.date")}</th>
				<th>&nbsp;&nbsp;${message("admin.transactionInfo.amountPaid")}</th>
				<th>&nbsp;&nbsp;${message("admin.transactionInfo.transAmt")}</th>
				<th style="background-color:Silver;">&nbsp;&nbsp;${message("admin.transactionInfo.banlance")}</th>
				<th>&nbsp;&nbsp;平台退款金额</th>
				<th>&nbsp;&nbsp;第三方退款金额</th>
				<th style="background-color:Silver;">&nbsp;&nbsp;退款差额（平台减第三方）</th>
			</tr>
			[#list page.content as payment]
			<tr>
				<td>&nbsp;${payment[1]}</td>
				<td>&nbsp;${payment[0]}</td>
				<td>&nbsp;			
					[@getAmountPaid type="amt" strDate=payment[1]  /]
				</td>
				<td style="background-color:Silver;">&nbsp;
					[@getAmountPaid type="amt" strDate=payment[1] amt=payment[0]  /]
				</td>
				<td>&nbsp;[@getRefundsSum strDate=payment[1] /]</td>
				<td>[@getAmountPaid type="tk" strDate=payment[1]  /]</td>
				<td style="background-color:Silver;">
					&nbsp;
					[@getRefundsSum strDate=payment[1] type="ce"  /]
				</td>
			</tr>
			[/#list]
						
		</table>
		
		
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>	
</body>
</html>