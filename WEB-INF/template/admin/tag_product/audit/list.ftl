<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.tag.list")} - Powered By kuanda</title>
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
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 标签商品审核 <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" name="type" value="audit"/>
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="auditButton" class="iconButton disabled">
					<span class="addIcon">&nbsp;</span>${message("admin.common.audit")}
				</a>					
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
							<a href="javascript:;"[#if page.searchProperty == "name"] class="current"[/#if] val="name">商品名称</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "tagName"] class="current"[/#if] val="tagName">标签名称(全称)</a>
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
					<a href="javascript:;" name="name">商品</a>
				</th>
				<th>
					<a href="javascript:;" name="type">标签</a>
				</th>
				[#if !isFactory]
				<th style="width:150px;">
					<a href="javascript:;" >申请商户</a>
				</th>
				[/#if]
				<th style="width:100px;">
					<a href="javascript:;" name="icon">起始日期</a>
				</th>
				<th style="width:100px;">
					<a href="javascript:;" name="icon">失效日期</a>
				</th>
				<th style="width:50px;">
					<a>审核是否通过</a>
				</th>
			</tr>
			[#list page.content as tag]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${tag.id}" />
					</td>
					<td>
						${tag.product.name}&nbsp;&nbsp;<a href="${base}${tag.product.path}" target="_blank">[${message("admin.common.view")}]</a>
					</td>
					<td>
						[#list tag.tags as tagN]
							[${tagN.name}]
						[/#list]
					</td>
					<td>
						[#if tag.factory??]<a href="${base}/admin/factory/view.jhtml?id=${tag.factory.id}">${tag.factory.mName}</a>[/#if]
					</td>
					<td>
						<span title="${tag.startDate?string("yyyy-MM-dd")}">${tag.startDate}</span>
					</td>
					<td>
						<span title="${tag.expireDate?string("yyyy-MM-dd")}">${tag.expireDate}</span>
					</td>
					<td>
						<span class="${tag.isShow?string("true", "false")}Icon">&nbsp;</span>
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