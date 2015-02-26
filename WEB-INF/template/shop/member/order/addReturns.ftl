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
			refunsReasonId:"required",
			returnReason:"required",
			linkName: "required",
			linkPhone:{
				       required: true,
				       pattern: /^(((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?)|(0?1\d{10})$/
				}
		}
	});
	$("input:submit").each(function() {
        var srcclick = $(this).attr("onclick");
        if(typeof(srcclick)=="function"){
        $(this).click(function() {
            if (srcclick()) {
                setdisabled(this);
                return true;
            }
            return false;
        });}    
    }); 
	function setdisabled(obj) {	
	    setTimeout(function() { obj.disabled = true; }, 100);	
	}
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
		 	<div class="title">${message("shop.orderReturn.title")}</div>
		 	
			 <form id="inputForm" action="saveReturns.jhtml?id=${orderItem.id}" method="post" enctype="multipart/form-data">
		      <table class="input tabContent">
		        <tr>
				<th>
				 ${message("shop.orderReturn.orderno")}:</th>
				<td>${orderItem.id}
				</td>
			</tr>
		      <tr>
				<th>
					<span class="requiredField">*</span>${message("shop.orderReturn.returnReason")}:
				</th>
				<td>
					<select name="refunsReasonId">
						<option value="">${message("shop.orderRefunds.good")}</option>
						[#list returnsCauseList as option]
							<option value="${option.id}">
								${option.cause}
							</option>
						[/#list]
					</select>
				</td>
			</tr>
			   <tr>
				<th>
					<span class="requiredField">*</span>${message("shop.orderReturns.explain")}:
				</th>
				<td>
				    <input type="hidden" name="returnsExecute" class="text" value="4" />
				     <input type="hidden" name="paid" class="text" value="2" />
				      <input type="hidden" name="shipped" class="text" value="2" />
				    
				     <input type="hidden" name="online" class="text" value="0" />
				     <input type="hidden" name="deposit" class="text" value="2" />
				     
				      <input type="hidden" name="returnsExce" class="text" value="10" />
				     
					<textarea   name="returnReason" class="text" maxlength="200" width="20px"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>
					<span class="requiredField">*</span>${message("shop.orderReturn.userPhone")}:
				</th>
				<td>
					<input type="text" name="linkPhone" class="text" value="" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("shop.orderReturn.userName")}:
				</th>
				<td>
					<input type="text" name="linkName" class="text" value="" maxlength="200" />
				</td>
			</tr>
			<tr class="roles">
					<th>
						退货凭证:
					</th>
					<td>
						<input type="file" name="imageFile" />
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