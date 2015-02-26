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

	[@flash_message /]
	
});

</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.order.dfferencelist")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
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
								<a href="javascript:;"[#if page.searchProperty == "factory"] class="current"[/#if] val="factory" id="cccd">${message("admin.factoryName")}</a>
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
					<td>
						<a href="order_difference_submit.jhtml?id=${order.id}">[上传]</a>
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