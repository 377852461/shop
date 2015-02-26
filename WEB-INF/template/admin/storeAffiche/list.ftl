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
	  //使用id选择器;例如:tab对象->tr->td对象.  
    $("#listTable tr #con").each(function(i){  
         //获取td当前对象的文本,如果长度大于25;  
         if($(this).text().length>10){  
                //给td设置title属性,并且设置td的完整值.给title属性.  
    $(this).attr("title",$(this).text());  
                //获取td的值,进行截取。赋值给text变量保存.  
    var text=$(this).text().substring(0,25)+"...";  
                //重新为td赋值;  
                $(this).text(text);  
         }  
      });  
	[@flash_message /]

});
</script>

</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo;店铺公告  <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>		
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
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
		</div>	
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>&nbsp;&nbsp;${message("Promotion.title")}</th>
				<th>&nbsp;&nbsp;内容</th>
				<th>
					<a href="javascript:;" class="sort" name="beginDate">${message("Promotion.beginDate")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="endDate">${message("Promotion.endDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as storeAffiche]
			<tr>
				<td>
					<input type="checkbox" name="ids" value="${storeAffiche.id}" />
				</td>
				<td>${storeAffiche.title}</td>
				<td id="con">&nbsp;${storeAffiche.content}</td>
				<td>&nbsp;${storeAffiche.beginDate}</td>
				<td>&nbsp;
					[#if storeAffiche.endDate ??]
					${storeAffiche.endDate}
					[#else]
					--
					[/#if]
				</td>
				<td>
					<a href="edit.jhtml?id=${storeAffiche.id}">[${message("admin.common.edit")}]</a>
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