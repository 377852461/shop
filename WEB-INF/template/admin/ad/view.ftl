<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.ad.edit")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.ad.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${ad.id}" />
		<table class="input">
			<tr>
				<th>
					${message("Ad.title")}:
				</th>
				<td>
					${ad.title}
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.type")}:
				</th>
				<td>
					[#list types as type]
						[#if type == ad.type]${message("Ad.Type." + type)}[/#if]
					[/#list]
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.adPosition")}:
				</th>
				<td>
					[#list adPositions as adPosition]
						[#if adPosition == ad.adPosition]${adPosition.name} [${adPosition.width} × ${adPosition.height}][/#if]
					[/#list]
				</td>
			</tr>
			<tr id="contentTr"[#if ad.type != "text"] class="hidden"[/#if]>
				<th>
					${message("Article.content")}:
				</th>
				<td>
					<textarea id="editor" name="content" class="editor" style="width: 100%;" >${ad.content?html}</textarea>
				</td>
			</tr>
			<tr id="pathTr"[#if ad.type == "text"] class="hidden"[/#if]>
				<th>
					${message("Ad.path")}:
				</th>
				<td>
					${ad.path}
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.beginDate")}:
				</th>
				<td>
					[#if ad.beginDate??]${ad.beginDate?string("yyyy-MM-dd")}[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.endDate")}:
				</th>
				<td>
					[#if ad.endDate??]${ad.endDate?string("yyyy-MM-dd")}[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Ad.url")}:
				</th>
				<td>
					${ad.url}
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.order")}:
				</th>
				<td>
					${ad.order}
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>