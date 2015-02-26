[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>部门列表 - Powered By kuanda</title>
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
	var $iconButton = $(".iconButton");
	
	[@flash_message /]

	// 商品筛选
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
	$iconButton.click(function(){
		$.ajax({
			url: "${base}/admin/assignment/check.jhtml",
			type: "GET",
			dataType: "json",
			cache: false,
			success: function(message) {
				if(message.type == "success"){
					location.href="${base}/admin/assignment/add.jhtml";
				}else{
					$.message(message);
				}
			}
		});
		return false;
	});

});
</script>

</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo;任务列表  <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="type" name="type" value="${type}"  >
		<div class="bar">
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>		
			<div class="buttonWrap">
				<!--
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				-->			
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						任务筛选<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							<li>
								<a href="javascript:;" name="type" val="all" [#if type =="all" || !type?? ] class="checked"[/#if] >所有任务</a>
							</li>
							<li>
								<a href="javascript:;" name="type" val="createEmployee" [#if  type =="createEmployee"] class="checked"[/#if]>我创建的任务</a>
							</li>
							<li>
								<a href="javascript:;" name="type" val="executeEmployee" [#if type =="executeEmployee"] class="checked"[/#if]>我执行的任务</a>
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
							<a href="javascript:;"[#if page.searchProperty == "title"] class="current"[/#if] val="title">任务标题</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "project"] class="current"[/#if] val="project">项目名称</a>
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
				<th>&nbsp;&nbsp;${message("Promotion.title")}</th>
				<th>&nbsp;&nbsp;项目</th>
				<th>
					<a href="javascript:;" class="sort" name="beginDate">${message("Promotion.beginDate")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="endDate">${message("Promotion.endDate")}</a>
				</th>
				<th>&nbsp;&nbsp;创建人</th>
				<th>&nbsp;&nbsp;执行人</th>
				<th><a href="javascript:;" class="sort" name="assignmentState">状态</a></th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as assignment]
			<tr>
				<td>
					<input type="checkbox" name="ids" value="${assignment.id}" />
				</td>
				<td>${assignment.title}</td>
				<td>&nbsp;${assignment.project}</td>
				<td>&nbsp;${assignment.beginDate}</td>
				<td>&nbsp;${assignment.endDate}</td>
				<td>${assignment.createEmployee.name}</td>
				<td>${assignment.executeEmployee.name}</td>
				<td>${message("admin.assignment."+assignment.assignmentState)}</td>
				<td>
					[#if assignment.createEmployee.id == employee.id ]
						[#if assignment.assignmentState != "Closed"  ]
						<a href="updateState.jhtml?id=${assignment.id}&state=Closed">[关闭]</a>&nbsp;
						<a href="edit.jhtml?id=${assignment.id}">[${message("admin.common.edit")}]</a>&nbsp;
						[#else]
						<a href="show.jhtml?id=${assignment.id}">[查看]</a>&nbsp;
						[/#if]
					[#elseif assignment.executeEmployee.id == employee.id ]
					<a href="show.jhtml?id=${assignment.id}">[查看]</a>&nbsp;
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