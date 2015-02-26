<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.order.returns")}[#if systemShowPowered] - Powered By SHOP++[/#if]</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.column-main{overflow:hidden;border-top:1px solid #ddd;zoom:1;width:685px;height:100%;float:right;min-height:300px}
</style>	
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>

<script type="text/javascript">


$().ready(function() {

	var $inputForm = $("#inputForm");
	var $browserButton = $("#browserButton");
	
	[@flash_message /]
	$browserButton.browser();
	
	// 表单验证
	$inputForm.validate({
		rules: {
			
			
			deliverycorp:{
			           required: true
			},
			shippingMethod:{
			           required: true
			},
			trackingno:{
			           required: true
			}
		}
	});
});
	

</script>
</head>
<body>
	<div id="dialogOverlay" class="dialogOverlay"></div>
	
	[#include "/shop/include/header.ftl" /]
	<div class="container member">
		[#include "/shop/member/include/navigation.ftl" /]
		<div class="span18 last">
		   <div class="list">
		 	<div class="column-main" id="J_ApplyMain">
		 	<div class="title">${message("shop.member.handle.returnsCorp")}</div>
		 	
			 <form id="inputForm" action="addOrderCorp.jhtml" method="post">
			 <input type="hidden" name="id" value="${refunds.id}">
			 <input type="hidden" name="confirmReturn" value="10">
			 <input type="hidden" name="confirmReturns" class="text" value="13" />
				     
			
		      <table class="input tabContent">
		      <tr>
				 <th>
				 ${message("shop.orderReturn.orderno")}:</th>
				  <td>${order.sn}
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
					${message("shop.orderReturn.address")}:
				</th>
				<td>
				  ${returns.address}
				</td>
			</tr>
		      <tr>
				 <th>
				     ${message("admin.returns.order.linkname")}:</th>
				  <td>
				     ${returns.shipper}
				  </td>
			  </tr>
			  <tr>
			    <th>
					${message("shop.orderReturn.linkPhone")}:
				</th>
				<td>
				  ${returns.phone}
				</td>
			</tr>
		     <tr>
			    <th>
					${message("shop.orderReturn.confirmTime")}:
				</th>
				<td>
				  ${order.modifyDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr> 
			<tr>
			    <th>
					${message("shop.orderReturn.confirmEndTime")}:
				</th>
				<td>
				  ${confirmTime}
				</td>
			</tr>
			   
			<tr>
				<th>
					<span class="requiredField">*</span>${message("admin.returns.order.deliverycorp")}:
				</th>
				<td>
					<select name="deliveryCorp">
						[#list deliveryCorps as delivertCorp]
							<option value="${delivertCorp.name}">${delivertCorp.name}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("shop.returns.order.shippingmethod")}:
				</th>
				<td>
					<input type="text" name="shippingMethod" class="text" value="" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("shop.orderReturn.trackingno")}:
				</th>
				<td>
					<input type="text" name="trackingNo" class="text" value="" maxlength="200" />
				</td>
			</tr>
			
			
			 
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
		
	</form>
				
				
				  </div>
				</div>
			  </div>	
			</div>
		</div>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>