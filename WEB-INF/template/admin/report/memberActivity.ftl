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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.report.memberActivity")}<span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="member_list.jhtml" method="get">
		<input type="hidden" id="count" name="count" value="${count}" />
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th>
					<span>统计时间类型</span>
				</th>
				<th>
					<span>活跃会员数</span>
				</th>
				<th>
					<span>新增会员数</span>
				</th>
				<th>
					<span>会员总数</span>
				</th>
			</tr>
			<tr>
				<td>
					昨日
				</td>
				[#if memberActiveDay!=null]
					<td>
						${memberActiveDay.activeCount}
					</td>
					<td>
						${memberActiveDay.regCount}
					</td>
					<td>
						${memberActiveDay.totalCount}
					</td>
				[#else]
					<td></td><td></td><td></td>
				[/#if]			
			</tr>
			<tr>
				<td>
					上周
				</td>
				[#if memberActiveWeek!=null]
					<td>
						${memberActiveWeek.activeCount}
					</td>
					<td>
						${memberActiveWeek.regCount}
					</td>
					<td>
						${memberActiveWeek.totalCount}
					</td>
				[#else]
					<td></td><td></td><td></td>
				[/#if]	
			</tr>
			<tr>
				<td>
					上月
				</td>
				[#if memberActiveMonth!=null]
					<td>
						${memberActiveMonth.activeCount}
					</td>
					<td>
						${memberActiveMonth.regCount}
					</td>
					<td>
						${memberActiveMonth.totalCount}
					</td>
				[#else]
					<td></td><td></td><td></td>
				[/#if]	
			</tr>
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>