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

</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo;${message("admin.transactionInfo.dz")}  <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="cy.jhtml" method="get">
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
			<div class="buttonWrap">
				<a href="cy.jhtml[#if type=null || type="" ]?type=refunds[/#if]"  class="iconButton">
					[#if type="refunds"]
						支付差异
						<input type="hidden" name="type" value="refunds" >
					[#else]
						退款差异
					[/#if]
				</a>
			</div>
		</div>	
		<table id="listTable" class="list">
			<tr>
				<th>&nbsp;&nbsp;${message("admin.transactionInfo.date")}</th>
				<th>&nbsp;&nbsp;${message("admin.transactionInfo.orderId")}</th>
				[#if type="refunds"]
					<th>&nbsp;&nbsp;平台退款金额</th>
				[#else]
					<th>&nbsp;&nbsp;${message("admin.transactionInfo.amountPaid")}</th>				
				[/#if]
				<th>&nbsp;&nbsp;${message("admin.transactionInfo.orderStatus")}</th>
				<th>&nbsp;&nbsp;支付方式</th>
				[#if type="refunds"]
					<th>&nbsp;&nbsp;第三方退款金额</th>
				[#else]
					<th>&nbsp;&nbsp;第三方交易额</th>
				[/#if]	
				<th>&nbsp;&nbsp;${message("admin.transactionInfo.threeLSH")}</th>
				<th>&nbsp;&nbsp;${message("admin.transactionInfo.threeStatus")}</th>
			</tr>
			[#list page.content as order]
			<tr>
				<td>&nbsp;${order[0]}</td>
				<td>&nbsp;${order[1]}</td>
				<td>&nbsp;${order[2]}</td>
				<td>&nbsp;
					[#if type="refunds"]
						[#if (order[3])== 0 ]
						退款中
						[#elseif (order[3])== 1 ]
						银行退款中
						[#elseif (order[3])== 2 ]
						退款成功						
						[#elseif (order[3])== 3 ]
						退款失败						
						[#elseif (order[3])== 4 ]
						同意退款						
						[#elseif (order[3])== 5 ]
						同意退货						
						[#elseif (order[3])== 6 ]
						取消退款						
						[/#if]						
					[#else]
						[#if (order[3])== 0 ]
						等待支付 
						[#elseif (order[3])== 1 ]
						支付成功
						[#elseif (order[3])== 2 ]
						支付失败
						[/#if]					
					[/#if]
				</td>
				<td>&nbsp;${order[4]}</td>
				<td>&nbsp;${order[5]}</td>
				<td>&nbsp;${order[6]}</td>
				<td>&nbsp;
						[#if (order[7])== "1001" ]
						成功支付 
						[#elseif (order[7])== "1111" ]
						支付未成功
						[#elseif (order[7])== "1003" ]
						退款成功
						[#elseif (order[7])== "1005" ]
						退款撤销成功
						[/#if]	
				</td>
			</tr>
			[/#list]
						
		</table>
		
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages  ]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>	
	
</body>
</html>