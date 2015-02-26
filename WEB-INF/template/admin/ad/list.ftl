<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.ad.list")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $listForm = $("#listForm");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");

	[@flash_message /]

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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.ad.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="screen" name="screen" value="${screen}" >
		<div class="bar">
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>
			<div class="buttonWrap">
				[#if !isFactory]
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="auditButton" class="iconButton disabled">
					<span class="addIcon">&nbsp;</span>${message("admin.common.audit")}
				</a>
				[/#if]
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						数据筛选<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							<li>
								<a href="javascript:;" name="screen" val="all"[#if screen == "all"] class="checked"[/#if]>全部</a>
							</li>
							<li>
								<a href="javascript:;" name="screen" val="audit"[#if screen == "audit"] class="checked"[/#if]>已审核</a>
							</li>
							<li>
								<a href="javascript:;" name="screen" val="notAudit"[#if screen == "notAudit"] class="checked"[/#if]>未审核</a>
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
							<a href="javascript:;"[#if page.searchProperty == "title"] class="current"[/#if] val="title">${message("Ad.title")}</a>
						</li>
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
					<a href="javascript:;" class="sort" name="title">${message("Ad.title")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="adPosition">${message("Ad.adPosition")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="type">${message("Ad.type")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="beginDate">${message("Ad.beginDate")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="endDate">${message("Ad.endDate")}</a>
				</th>
				[#if !isFactory]
				<th>
					<a href="javascript:;" >申请商户</a>
				</th>
				[/#if]
				<th>
					<a href="javascript:;" class="sort" name="order">${message("admin.common.order")}</a>
				</th>
				<th>
					<a>审核是否通过</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as ad]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${ad.id}" />
					</td>
					<td>
						<span title="${ad.title}">${abbreviate(ad.title, 50, "...")}</span>
					</td>
					<td>
						${ad.adPosition.name}
					</td>
					<td>
						${message("Ad.Type." + ad.type)}
					</td>
					<td>
						[#if ad.beginDate??]
							<span>${ad.beginDate}</span>
						[#else]
							-
						[/#if]
					</td>
					<td>
						[#if ad.endDate??]
							<span>${ad.endDate}</span>
						[#else]
							-
						[/#if]
					</td>
					[#if !isFactory]
					<td>
						[#if ad.factory??]<a href="${base}/admin/factory/view.jhtml?id=${ad.factory.id}">${ad.factory.mName}</a>[/#if]
					</td>
					[/#if]
					<td>
						${ad.order}
					</td>
					<td>
						<span class="${ad.isAudit?string("true", "false")}Icon">&nbsp;</span>
					</td>
					<td>
						<a href="view.jhtml?id=${ad.id}">[${message("admin.common.view")}]</a>
						[#if !isFactory]
							<a href="edit.jhtml?id=${ad.id}">[${message("admin.common.edit")}]</a>
						[/#if]
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