<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.area.list")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $delete = $("#listTable a.delete");
	
	[@flash_message /]
	
	// 删除
	$delete.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.dialog.deleteConfirm")}",
			onOk: function() {
				$.ajax({
					url: "delete.jhtml",
					type: "POST",
					data: {id: $this.attr("val")},
					dataType: "json",
					cache: false,
					success: function(message) {
						$.message(message);
						if (message.type == "success") {
							$this.parent().html("&nbsp;");
						}
					}
				});
			}
		});
		return false;
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.area.list")}
	</div>
	<div class="bar">
		<a href="add.jhtml[#if parent??]?parentId=${parent.id}[/#if]" class="iconButton">
			<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
		</a>
		[#if parent??]
			<div class="pageBar">
				[#if parent.parent??]
					<a href="list.jhtml?parentId=${parent.parent.id}" class="iconButton">
						<span class="upIcon">&nbsp;</span>${message("admin.area.parent")}
					</a>
				[#else]
					<a href="list.jhtml" class="iconButton">
						<span class="upIcon">&nbsp;</span>${message("admin.area.parent")}
					</a>
				[/#if]
			</div>
		[/#if]
	</div>
	<table id="listTable" class="list">
		<tr>
			<th colspan="5" class="green" style="text-align: center;">
				[#if parent??]${message("admin.area.parent")} - ${parent.name}[#else]${message("admin.area.root")}[/#if]
			</th>
		</tr>
		[#list nodareas?chunk(5, "") as row]
			<tr>
				[#list row as nodarea]
					[#if nodarea?has_content]
						<td>
								[#if admin.factory.id==nodarea.factory.id]
									${message("admin.common.admin")}-<a href="#" title="${message("admin.common.view")}">${nodarea.area.name}</a>
									<a href="javascript:;" class="delete" val="${nodarea.id}">[${message("admin.common.delete")}]</a>
								[#else]
									${nodarea.factory.mName}-<a href="#" title="${message("admin.common.view")}">${nodarea.area.name}</a>
								[/#if]
							
						</td>
					[#else]
						<td>
							&nbsp;
						</td>
					[/#if]
				[/#list]
			</tr>
		[/#list]
		[#if !nodareas?has_content]
			<tr>
				<td colspan="5" style="text-align: center; color: red;">
					${message("admin.area.emptyChildren")} <a href="add.jhtml[#if parent??]?parentId=${parent.id}[/#if]" style="color: gray">${message("admin.common.add")}</a>
				</td>
			</tr>
		[/#if]
	</table>
</body>
</html>