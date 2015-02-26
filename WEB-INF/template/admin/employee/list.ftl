[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>员工列表 - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $listForm = $("#listForm");
	var $filterOption = $("#filterOption a");
	var $filterSelect = $("#filterSelect");
	var $filterOption1 = $("#filterOption1 a");
	var $filterSelect1 = $("#filterSelect1");	
	var $filterOption2 = $("#filterOption2 a");
	var $filterSelect2 = $("#filterSelect2");	
	[@flash_message /]

	// 员工筛选
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

	// 员工筛选
	$filterSelect1.mouseover(function() {
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
	$filterOption1.click(function() {
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

	// 员工筛选
	$filterSelect2.mouseover(function() {
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
	$filterOption2.click(function() {
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo;员工列表  <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="isEnabled" name="isEnabled" value="${isEnabled}" >
		<input type="hidden" id="departmentId" name="departmentId" value="${departmentId}" >
		<input type="hidden" id="employeeLevelId" name="employeeLevelId" value="${employeeLevelId}" >
		<div class="bar">
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>		
			<div class="buttonWrap">		
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						是否启用<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							<li>
								<a href="javascript:;" name="isEnabled" val="true" [#if isEnabled?? && isEnabled ] class="checked"[/#if] >已启用</a>
							</li>
							<li>
								<a href="javascript:;" name="isEnabled" val="false" [#if isEnabled?? && !isEnabled ] class="checked"[/#if] >未启用</a>
							</li>													
						</ul>
					</div>					
				</div>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect1" class="button">
						部&nbsp;&nbsp;&nbsp;&nbsp;门<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption1" class="check">
							[#list departments as department]
							<li>
								<a href="javascript:;" name="departmentId" val="${department.id}" [#if departmentId?? && departmentId==department.id ] class="checked"[/#if] >${department.name}</a>
							</li>
							[/#list]													
						</ul>
					</div>					
				</div>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect2" class="button">
						职务级别<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption2" class="check">
							[#list employeeLevels as level]
							<li>
								<a href="javascript:;" name="employeeLevelId" val="${level.id}" [#if employeeLevelId?? && employeeLevelId==level.id ] class="checked"[/#if] >${level.name}</a>
							</li>
							[/#list]												
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
							<a href="javascript:;"[#if page.searchProperty == "number"] class="current"[/#if] val="number">员工编号</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "name"] class="current"[/#if] val="name">员工姓名</a>
						</li>						
					</ul>
				</div>
			</div>

		</div>	
		<table id="listTable" class="list">
			<tr>
				<th>&nbsp;&nbsp;员工编号</th>
				<th>&nbsp;&nbsp;姓名</th>
				<th>&nbsp;&nbsp;性别</th>
				<th>&nbsp;&nbsp;部门</th>
				<th>&nbsp;&nbsp;职位</th>
				<th>&nbsp;&nbsp;职位类型</th>
				<th><a href="javascript:;" class="sort" name="joinDate">入职时间</a></th>
				<th>&nbsp;&nbsp;是否启用</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as employee]
			<tr>
				<td>&nbsp;${employee.number}</td>
				<td>&nbsp;${employee.name}</td>
				<td>&nbsp;[#if employee.sex ??][#if employee.sex ]男[#else]女[/#if][/#if]</td>
				<td>&nbsp;${employee.department.name} [#if !employee.department.isEnabled ]<span class="requiredField">&nbsp;&nbsp;(无效)</span>[/#if]</td>
				<td>&nbsp;${employee.position}</td>
				<td>&nbsp;${employee.level.name}&nbsp;&nbsp;[#if !employee.level.isEnabled ]<span class="requiredField">&nbsp;&nbsp;(无效)</span>[/#if]</td>
				<td>&nbsp;${employee.joinDate}</td>
				<td>[#if employee.isEnabled ]是[#else]否[/#if]</td>
				<td>
					<a href="edit.jhtml?id=${employee.id}">[${message("admin.common.edit")}]</a>
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