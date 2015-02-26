<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.purchaseRanking.list")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	var $listForm = $("#listForm");
	var $count = $("#count");
	var $countSelect = $("#countSelect");
	var $countOption = $("#countOption a");
	
	[@flash_message /]
	
	// 显示数量
	$countSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 显示数量
	$countOption.click(function() {
		var $this = $(this);
		if ($this.hasClass("checked")) {
			$count.val("");
		} else {
			$count.val($this.attr("val"));
		}
		$listForm.submit();
		return false;
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.report.favoriteReport")}<span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="favorite_report.jhtml" method="get">
		<input type="hidden" id="count" name="count" value="${count}" />
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
			名称：<input type="text" name="searchKey" value="${searchProperty}"/>
			<input type="submit" class="button" value="${message("admin.common.submit")}" />
		</div>
		<table id="listTable" class="list">
			<tr>
				<th>
					<span>${message("admin.report.rank")}</span>
				</th>
				<th>
					<span>${message("admin.report.productID")}</span>
				</th>
				<th>
					<span>商品编号</span>
				</th>
				<th>
					<span>${message("admin.report.productName")}</span>
				</th>
				<th>
					<span>${message("admin.report.favorite")}</span>
				</th>
			</tr>
			[#list page.content as row]
				<tr>
					<td>
						${row_index + 1}
					</td>
					<td>
						${row[0]}
					</td>
					<td>
						${row[1]}
					</td>
					<td>
						${row[3]}
					</td>
					<td>
						${row[4]}
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