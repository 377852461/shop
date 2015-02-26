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
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $beginDate = $("#beginDate");
	var $endDate = $("#endDate");

	[#assign dateFormat = "yyyy-MM-dd" /]
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			beginDate: "required",
			endDate: "required"
		}
	});
	
});

function daochu(){
	var listForm = document.getElementById("listForm").action;
	document.getElementById("listForm").action = 'daochu.jhtml';
    document.getElementById("listForm").submit();
    document.getElementById("listForm").action = listForm; 
}


</script>

</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo;${message("admin.transactionInfo.dz")}  <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="qfls.jhtml" method="get">
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
				<div class="menuWrap" style="margin-left: 10px;">
					${message("admin.salesRanking.beginDate")}: <input type="text" id="beginDate" name="beginDate" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
					${message("admin.salesRanking.endDate")}: <input type="text" id="endDate" name="endDate" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
					<input type="submit" class="button" value="查询" />
					<input type="hidden" name = "zjls" value="${page.total}" /><!-- 总记录数 -->
					<input type="button" class="button" value="导出Excel" onclick="daochu();" />
				</div>
			</div>
			<!--
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "sn"] class="current"[/#if] val="sn">订单编号</a>
						</li>
					</ul>
				</div>
			</div>
			-->
		</div>	
		<table id="listTable" class="list">
			<tr>
				<th>&nbsp;&nbsp;id</th>
				<th>&nbsp;&nbsp;cscAccountOrderNum</th>
				<th>&nbsp;&nbsp;accountRemark</th>
				<th>&nbsp;&nbsp;appOrderNum</th>
				<th>&nbsp;&nbsp; 余额</th>
				<th>&nbsp;&nbsp;交易方式</th>
				<th>&nbsp;&nbsp;时间</th>
				<th>&nbsp;&nbsp;自己商户号</th>
				<th>&nbsp;&nbsp;收入金额</th>
				<th>&nbsp;&nbsp;对方商户号</th>
				<th>&nbsp;&nbsp;支出金额</th>
				<th>&nbsp;&nbsp;支付方式</th>
			</tr>
			[#list page.content as account]
			<tr>
				<td>&nbsp;${account.accountId}</td>
				<td>&nbsp;${account.cscAccountOrderNum}</td>
				<td>&nbsp;${account.accountRemark}</td>
				<td>&nbsp;${account.appOrderNum}</td>
				<td>&nbsp;${account.balance}</td>
				<td>&nbsp;${account.businessType}</td>
				<td>&nbsp;${account.dateTime}</td>
				<td>&nbsp;${account.homeAccountId}</td>
				<td>&nbsp;${account.inamount}</td>
				<td>&nbsp;${account.oppositeAccountId}</td>
				<td>&nbsp;${account.outamount}</td>
				<td>&nbsp;${account.type}</td>
			</tr>
			[/#list]
						
		</table>
		
		
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>	
</body>
</html>