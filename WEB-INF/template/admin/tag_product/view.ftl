<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.tag.edit")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 查看标签商品配置
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${tagProduct.id}" />
		<table class="input">
			<tr>
				<th>
					商品名称:
				</th>
				<td>
					${tagProduct.product.name}
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					发布日期:
				</th>
				<td>
					${tagProduct.startDate?string("yyyy-MM-dd")}
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					失效日期:
				</th>
				<td>
					${tagProduct.expireDate?string("yyyy-MM-dd")}
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			[#if tags??&&tags?size > 0]
				<tr>
					<th>
						${message("Product.tags")}:
					</th>
					<td>
						[#list tags as reTags]
							[${reTags.name}]
						[/#list]
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			[/#if]
			<tr>
				<th>
					是否审核通过:
				</th>
				<td>
					<input type="checkbox" [#if tagProduct.isShow] checked="checked"[/#if] disabled="disabled" />
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					${tagProduct.order}
				</td>
				<td>
					&nbsp;
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