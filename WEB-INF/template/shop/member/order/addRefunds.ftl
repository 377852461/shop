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

});

function two(){
	var money = $("#money").val(); 
	var red_money=/^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/;
	[#if order.shippingStatus == "shipped"]
		var returnsMaxMoney=${orderItem.order.amount};
	[/#if]
	if(!red_money.test(money)){
		$("#message").html("${message("shop.returnmoney.formalerror")}");
		return false;
	}else if(money>returnsMaxMoney){
		$("#message").html("${message("shop.returnmoney.maxreturnmoney")}");
		return false;
	}else{
		$("#message").html("");
		return true;
	}
}
var flag = false;
function checkInput(){
	if(!flag){
		var refundsReason=$("#refundsReason").val();
		var money=$("#money").val();
		var refundsExplain=$("#refundsExplain").val();
		if(money==""){
			$("#message").html("${message("shop.returnmoney.moneynull")}");
			return false;
		}else if(refundsReason==null||refundsReason==""){
			$("#refundsReasonMessage").html("${message("shop.returnmoney.returnreasonnull")}");
			return false;
		}else if(refundsExplain==null||refundsExplain==""){
			$("#refundsExplainMessage").html("${message("shop.returnmoney.returnexplainnnull")}");
			return false;
		}else if($("#message").html()!=""){
			return false;
		}
		$("#refundsExplainMessage").html("");
		$("#refundsReasonMessage").html("");
		$("#message").html("");
		flag = true;
		return true;
	}else{
		return false;
	}	
}

</script>
</head>
<body>
	<div id="dialogOverlay" class="dialogOverlay"></div>
	[#assign current = "orderList" /]
	[#include "/shop/include/header.ftl" /]
	<div class="container member">
		[#include "/shop/member/include/navigation.ftl" /]
		<div class="span18 last">
		   <div class="input">
		   
		 	<div class="title">${message("shop.orderRefunds.refunds")}</div>
			 <form id="inputForm" action="save.jhtml?id=${orderItem.id}" enctype="multipart/form-data" method="post" onsubmit="return checkInput()">
		      <table class="input tabContent">
		      	<tr>
		      		<th>
						<span class="requiredField">*</span>${message("shop.orderRefunds.order")}:
					</th>
		      		<td>
		      			${orderItem.order.sn}
					</td>
		      	</tr>
			   	<tr>
					<th>
						<span class="requiredField">*</span>${message("shop.orderRefunds.money")}:
					</th>
						<td>
							[#if (orderItem.totalPrice+orderItem.order.freight+refundsCount)==orderItem.order.amount]
								<input id="money" type="hidden" style="width:60px;" name="amount" value="${orderItem.totalPrice+orderItem.order.freight}"/>${orderItem.totalPrice+orderItem.order.freight}元(最多${orderItem.totalPrice+orderItem.order.freight}元,含邮费${orderItem.order.freight}元)
							[#else]
								<input id="money" type="hidden" style="width:60px;" name="amount" value="${orderItem.totalPrice}"/>${orderItem.totalPrice}元(最多${orderItem.totalPrice}元,含邮费0元)
							[/#if]	
							<span id="message" style="color:red;"></span>		
						</td>
					
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("shop.orderRefunds.reason")}:
					</th>
					<td>
						<select name="refundsReasonId" id="refundsReason">
							<option value="">${message("shop.orderRefunds.cause")}</option>
							[#list returnsCauseList as option]
								<option value="${option.id}">
									${option.cause}
								</option>
							[/#list]
						</select>
						<span id="refundsReasonMessage" style="color:red;"></span>
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("shop.orderRefunds.explain")}:
					</th>

					<td>
						<textarea name="refundsExplain" id="refundsExplain" class="text" maxlength="200" width="20px"></textarea>
						<span id="refundsExplainMessage" style="color:red;"></span>
					</td>
				</tr>
				<!--<tr class="roles">
					<th>
						${message("shop.orderRefunds.upload")}:
					</th>
					<td>
						<input type="text" name="uploadImages" class="text" maxlength="200" />
						<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
					</td>

				</tr>-->
				<tr>
					<th>${message("shop.orderRefunds.upload")}:</th>
					<td><input type="file" name="imageFile" /></td>
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
	[#include "/shop/include/footer.ftl" /]
</body>
</html>