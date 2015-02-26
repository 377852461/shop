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
<script type="text/javascript" src="${base}/resources/admin/layer/layer.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<style type="text/css">
.moreTable th {
	width: 80px;
	line-height: 25px;
	padding: 5px 10px 5px 0px;
	text-align: right;
	font-weight: normal;
	color: #333333;
	background-color: #f8fbff;
}

.moreTable td {
	line-height: 25px;
	padding: 5px;
	color: #666666;
}

.promotion {
	color: #cccccc;
}




#dialogContent{display:none; }
</style>
<script type="text/javascript">
$().ready(function() {

	var $listForm = $("#listForm");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");
	var $print = $("select[name='print']");
	var $exportOrder=$("#exportOrder");
	var $moreButton = $("#moreButton");
	var $browserButton=$("#browserButton");

	var $exportShippingButton=$("#exportShippingButton");
	var $importShippingButton=$("#importShippingButton");
	var $exportReturnButton=$("#exportReturnButton");
	var $importReturnButton=$("#importReturnButton");
	var $exportOrImportSelect=$("#exportOrImportSelect");
	var $exportOrImportOption=$("#exportOrImportOption a");
	
	[@flash_message /]
	//$importShippingButton.click( function() {
		//文件上传
		//layer.prompt({title: '文件路径',type: 2}, function(file){
	    	//$.get('importShipping.jhtml', { 'filePath': file }, function (data) {
     //});
		//});
	//});
	
	
	$exportShippingButton.click( function() {
		location.href="exportShipping.jhtml";
	});
	
	$exportReturnButton.click( function() {
		location.href="exportReturn.jhtml";
	});
	
	//$importReturnButton.click( function() {
		//文件上传
		//layer.prompt({title: '文件路径',type: 2}, function(file){
	    	//location.href="importReturn.jhtml?filePath="+file;
		//});
		
	//});
	
	
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
	
	// 订单筛选
	$exportOrImportSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	
	// 打印选择
	$print.change(function() {
		var $this = $(this);
		if ($this.val() != "") {
			window.open($this.val());
		}
	});
	
	//明细导出
	$exportOrder.click(function(){
		$listForm.attr("action","exportOrder.jhtml");
		$listForm.submit();
		$listForm.attr("action","list.jhtml");
	});
	
	// 更多选项
	$moreButton.click(function() {
		var temp=$("#dialogContent").html();
		$("#dialogContent").html("");
		$.dialog({
			title: "${message("admin.product.moreOption")}",
			[@compress single_line = true]
				content:temp,
			[/@compress]
			width: 470,
			modal: true,
			ok: "${message("admin.dialog.ok")}",
			cancel: "${message("admin.dialog.cancel")}",
			onOk: function() {
				$("#moreTable :input").each(function() {
					var $this = $(this);
					$("#" + $this.attr("name")).val($this.val());
				});
				$("#searchDateProperty").val("createDate");
				$listForm.submit();
				$("#dialogContent").html(temp);
			},
			onCancel:function(){
				$("#dialogContent").html(temp);
			}
		});
	});
	
	$importShippingButton.click(function() {
			$.dialog({
				title: "${message("admin.file.upload")}",
				[@compress single_line = true]
					content: '
					<form id="upladForm" action="${base}/admin/imp/importShipping.jhtml" method="post" enctype="multipart/form-data" >
						<input type="hidden" name="token" value="${token}" \/>
						<input type="hidden" name="token" value="${token}" \/>
						<table class="input">
							<tr>
								<th>
									${message("admin.file.upload")}:
								<\/th>
								<td width="300">
									<input type="file" name="file" id="file" \/>
								<\/td>
							<\/tr>
						<\/table>
					<\/form>',
				[/@compress]
				modal: true,
				ok: "${message("admin.dialog.ok")}",
				cancel: "${message("admin.dialog.cancel")}",
				onOk: function() {
					$("#upladForm").submit();
					close();
				}
			});
		});
		
		
		$importReturnButton.click(function() {
			$.dialog({
				title: "${message("admin.file.upload")}",
				[@compress single_line = true]
					content: '
					<form id="upladForm" action="${base}/admin/imp/importReturn.jhtml" method="post" enctype="multipart/form-data">
						<input type="hidden" name="token" value="${token}" \/>
						<table class="input">
							<tr>
								<th>
									${message("admin.file.upload")}:
								<\/th>
								<td width="300">
									<input type="file" name="file" id="file" \/>
								<\/td>
							<\/tr>
						<\/table>
					<\/form>',
				[/@compress]
				modal: true,
				ok: "${message("admin.dialog.ok")}",
				cancel: "${message("admin.dialog.cancel")}",
				onOk: function() {
					$("#upladForm").submit();
					close();
				}
			});
		});
	
});



</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.order.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get" enctype="multipart/form-data">
		<input type="hidden" id="beginDate"  name="sectionDate" value="${(pageable.sectionDate[0]?string('yyyy-MM-dd HH:mm:ss'))!}"/>
		<input type="hidden" id="endDate" name="sectionDate" value="${(pageable.sectionDate[1]?string('yyyy-MM-dd HH:mm:ss'))!}"/>
		<input type="hidden" id="searchDateProperty" name="searchDateProperty" />
		<input type="hidden" id="factoryId" name="factoryId" value="${session.currentUser}" />
		<input type="hidden" id="orderStatus" name="orderStatus" value="${orderStatus}" />
		<input type="hidden" id="paymentStatus" name="paymentStatus" value="${paymentStatus}" />
		<input type="hidden" id="shippingStatus" name="shippingStatus" value="${shippingStatus}" />
		<input type="hidden" id="hasExpired" name="hasExpired" value="[#if hasExpired??]${hasExpired?string("true", "false")}[/#if]" />
		<input type="hidden" id="key" name="key" value="${key}">
		<div class="bar">
			<div class="buttonWrap">
				[#if !factory==null]
					<a href="javascript:;" id="deleteButton" class="iconButton disabled">
						<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
					</a>
				[/#if]
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						${message("admin.order.filter")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							<li>
								<a href="javascript:;" name="orderStatus" val="unconfirmed"[#if orderStatus == "unconfirmed"] class="checked"[/#if]>${message("Order.OrderStatus.unconfirmed")}</a>
							</li>
							<li>
								<a href="javascript:;" name="orderStatus" val="confirmed"[#if orderStatus == "confirmed"] class="checked"[/#if]>${message("Order.OrderStatus.confirmed")}</a>
							</li>
							<li>
								<a href="javascript:;" name="orderStatus" val="completed"[#if orderStatus == "completed"] class="checked"[/#if]>${message("Order.OrderStatus.completed")}</a>
							</li>
							<li>
								<a href="javascript:;" name="orderStatus" val="cancelled"[#if orderStatus == "cancelled"] class="checked"[/#if]>${message("Order.OrderStatus.cancelled")}</a>
							</li>
							<li>
								<a href="javascript:;" name="orderStatus" val="partialrefunded"[#if orderStatus == "partialrefunded"] class="checked"[/#if]>${message("Order.PaymentStatus.partialRefunds")}</a>
							</li>
							<li>
								<a href="javascript:;" name="orderStatus" val="refunded"[#if orderStatus == "refunded"] class="checked"[/#if]>${message("Order.PaymentStatus.refunded")}</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="paymentStatus" val="unpaid"[#if paymentStatus == "unpaid"] class="checked"[/#if]>${message("Order.PaymentStatus.unpaid")}</a>
							</li>
							<li>
								<a href="javascript:;" name="paymentStatus" val="partialPayment"[#if paymentStatus == "partialPayment"] class="checked"[/#if]>${message("Order.PaymentStatus.partialPayment")}</a>
							</li>
							<li>
								<a href="javascript:;" name="paymentStatus" val="paid"[#if paymentStatus == "paid"] class="checked"[/#if]>${message("Order.PaymentStatus.paid")}</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="shippingStatus" val="unshipped"[#if shippingStatus == "unshipped"] class="checked"[/#if]>${message("Order.ShippingStatus.unshipped")}</a>
							</li>
							<li>
								<a href="javascript:;" name="shippingStatus" val="partialShipment"[#if shippingStatus == "partialShipment"] class="checked"[/#if]>${message("Order.ShippingStatus.partialShipment")}</a>
							</li>
							<li>
								<a href="javascript:;" name="shippingStatus" val="shipped"[#if shippingStatus == "shipped"] class="checked"[/#if]>${message("Order.ShippingStatus.shipped")}</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="hasExpired" val="true"[#if hasExpired?? && hasExpired] class="checked"[/#if]>${message("admin.order.hasExpired")}</a>
							</li>
							<li>
								<a href="javascript:;" name="hasExpired" val="false"[#if hasExpired?? && !hasExpired] class="checked"[/#if]>${message("admin.order.unexpired")}</a>
							</li>
						</ul>
					</div>
				</div>
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
					<a href="javascript:;" id="exportOrImportSelect" class="button">
						${message("admin.common.exportOrImport")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="exportOrImportOption">
							<li>
								<a href="javascript:;" id="exportOrder" >${message("admin.print.ordertList")}</a>
							</li>
							[#if admin.factory??]
								<li>
									<a href="javascript:;" id="exportShippingButton" >${message("admin.common.exportShipping")}</a>
								</li>
								<li>
									<a href="javascript:;" id="exportReturnButton" >${message("admin.common.exportReturn")}</a>
								</li>
								<li>
									<a href="javascript:;" id="importShippingButton">${message("admin.common.importShipping")}</a>
								</li>
								<li>
									<a href="javascript:;" id="importReturnButton" >${message("admin.common.importReturn")}</a>
								</li>
							[/#if]
						</ul>
					</div>
				</div>
				<div class="menuWrap">
					<a href="javascript:;" id="moreButton" class="button">${message("admin.product.moreOption")}</a>
				</div>
			</div>
			<div class="menuWrap">
				<a href="list.jhtml?key=waitingPaymentOrder" id="pageSizeSelect" class="button">
					等待买家付款(${waitingPaymentOrderCount})
				</a>
				<a href="list.jhtml?key=waitingShippingOrder" id="pageSizeSelect" class="button">
					等待发货(${waitingShippingOrderCount})
				</a>
				<a href="list.jhtml?key=waitingReturnOrder" id="pageSizeSelect" class="button">
					退款退货中(${waitingReturnOrderCount})
				</a>
				<a href="list.jhtml?key=waitingConfirmOrder" id="pageSizeSelect" class="button">
					已发货(${waitingConfirmOrderCount})
				</a>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "sn"] class="current"[/#if] val="sn">${message("Order.sn")}</a>
						</li>
						[#if !admin.factory??]
							<li>
								<a href="javascript:;"[#if page.searchProperty == "factory"] class="current"[/#if] val="factory" id="cccd">${message("admin.factoryName")}(全称)</a>
							</li>
						[/#if]
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="sn">${message("Order.sn")}</a>
				</th>
				<th>
					<span>${message("Order.amount")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="member">${message("Order.member")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="consignee">${message("Order.consignee")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="paymentMethodName">${message("Order.paymentMethodName")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="shippingMethodName">${message("Order.shippingMethodName")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="orderStatus">${message("Order.orderStatus")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="paymentStatus">${message("Order.paymentStatus")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="shippingStatus">${message("Order.shippingStatus")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">${message("admin.common.createDate")}</a>
				</th>
				[@shiro.hasPermission name = "admin:print"]
					<th>
						<span>${message("admin.order.print")}</span>
					</th>
				[/@shiro.hasPermission]
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as order]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${order.id}" />
					</td>
					<td>
						${order.sn}
					</td>
					<td>
						${currency(order.amount, true)}
					</td>
					<td>
						${order.member.username}
					</td>
					<td>
						${order.consignee}
					</td>
					<td>
						${order.paymentMethodName}
					</td>
					<td>
						${order.shippingMethodName}
					</td>
					<td>
						${message("Order.OrderStatus." + order.orderStatus)}
						[#if order.expired]<span class="gray">(${message("admin.order.hasExpired")})</span>[/#if]
					</td>
					<td>
						${message("Order.PaymentStatus." + order.paymentStatus)}
					</td>
					<td>
						${message("Order.ShippingStatus." + order.shippingStatus)}
					</td>
					<td>
						<span title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${order.createDate}</span>
					</td>
					[@shiro.hasPermission name = "admin:print"]
						<td>
							<select name="print">
								<option value="">${message("admin.common.choose")}</option>
								<option value="../print/order.jhtml?id=${order.id}">${message("admin.order.orderPrint")}</option>
								<option value="../print/product.jhtml?id=${order.id}">${message("admin.order.productPrint")}</option>
								<option value="../print/shipping.jhtml?id=${order.id}">${message("admin.order.shippingPrint")}</option>
								<option value="../print/delivery.jhtml?orderId=${order.id}">${message("admin.order.deliveryPrint")}</option>
								<option value="../print/refuse.jhtml?orderId=${order.id}">${message("admin.order.refusePrint")}</option>
							</select>
						</td>
					[/@shiro.hasPermission]
					<td>
						<a href="view.jhtml?id=${order.id}">[${message("admin.common.view")}]</a>
						[#if !order.expired && order.orderStatus == "unconfirmed" && !factory==null]
							<a href="edit.jhtml?id=${order.id}">[${message("admin.common.edit")}]</a>
						[#else]
							<span title="${message("admin.order.editNotAllowed")}">[${message("admin.common.edit")}]</span>
						[/#if]
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
	<div id="dialogContent">
		<table id="moreTable" class="moreTable">
			<tr>
				<th>
					${message("Promotion.beginDate")}:
				</th>
				<td>
					<input type="text" id="beginDateBox" name="beginDate" class="text Wdate" value="${(pageable.sectionDate[0]?string('yyyy-MM-dd HH:mm:ss'))!}" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDateBox\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.endDate")}:
				</th>
				<td>
					<input type="text" id="endDateBox" name="endDate" class="text Wdate" value="${(pageable.sectionDate[1]?string('yyyy-MM-dd HH:mm:ss'))!}" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',minDate: '#F{$dp.$D(\'beginDateBox\')}'});" />
				</td>
			</tr>
		</table>
	</div>
</body>
</html>