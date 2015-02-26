<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.navigation.add")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {
   // 表单验证
		$("#inputForm").validate({
			rules: {
				address:"required",
				userName: "required",
				phone:{
				          required: true,
				          pattern: /^(((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?)|(0?1\d{10})$/
				}
			}
		});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.order.returnTitle")}
	</div>
	
	<form id="inputForm" action="orderReturn.jhtml" method="post">
		  <input type="hidden" name="id" value="${refunds.id}">
		  <input type="hidden" name="returnsExecute" value="4">
		  <input type="hidden" name="agreenreturn" value="9" />
		  <input type="hidden" name="overTime" value="${message("overTime")}" />
		  <input type="hidden" name="agreenReturns" class="text" value="11" />
				
		<table class="input">
			
			<tr>
			    <th>
					${message("shop.orderReturn.orderno")}:
				</th>
				<td>
				  ${Order.sn}
				</td>
			</tr>
			
			<tr>
			    <th>
					${message("shop.orderReturn.returnReason")}:
				</th>
				<td>
				  ${returns.returnReason}
				</td>
			</tr>
			<tr>
			    <th>
					${message("shop.orderReturn.linkName")}:
				</th>
				<td>
				  ${returns.linkName}
				</td>
			</tr>
			<tr>
			    <th>
					${message("shop.orderReturn.linkPhone")}:
				</th>
				<td>
				  ${returns.linkPhone}
				</td>
			</tr>
			
			
			<tr>
			    <th>
					<span class="requiredField">*</span>${message("admin.returns.order.address")}:
				</th>
				<td>
					<input type="text"  name="address" class="text" maxlength="200" />	 
				
				</td>
			</tr>
			<tr>
			    <th>
					<span class="requiredField">*</span>${message("admin.returns.order.linkphone")}:
				</th>
			    <td>
				  <input type="text"  name="phone" class="text" maxlength="200" />	 
				
			    </td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("admin.returns.order.linkname")}:
				</th>
				<td>
				 	  <input type="text"    name="shipper" class="text" maxlength="200" />	 
					
				</td>
				
				
			</tr>
			
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" id="returnsButtons" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>