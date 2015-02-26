<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.order.refusePrint")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<style type="text/css">
.bar {
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid #d7e8f8;
	background-color: #eff7ff;
}

table {
	width: 80%;
	margin:0px auto; 
	border:1px solid; 
}

table th {
	font-weight: bold;
	text-align: left;
}

table td, table th {
	line-height: 30px;
	padding: 0px 4px;
	font-size: 10pt;
	color: #000000;
}
table td{
	margin:0px 20px;
	border:1px solid; 
}
table td span{
	margin-left:20px;
	margin-right:50px;
}

.content{margin:0px auto; }
.separated th, .separated td {
	border-top: 1px solid #000000;
	border-bottom: 1px solid #000000;
}
#title{
	margin:20px auto; text-align:center; font-size:15px; 
}
table .navtitle{
	font-weight:bold; 
}

.marginLeft100{margin-left:100px; }
</style>

<style type="text/css" media="print">
.bar {
	display: none;
}

</style>
<script type="text/javascript">
$().ready(function() {

	var $print = $("#print");
	var $deliveryForm=$("#deliveryForm");
	var $deliveryCenter = $("#deliveryCenter");

	$print.click(function() {
		window.print();
		return false;
	});
	
	$deliveryCenter.change(function() {
		if ($deliveryCenter.val() != "") {
			$deliveryForm.submit();
		}
	});
});
</script>
</head>
<body>
	<div class="bar">
		<a href="javascript:;" id="print" class="button">${message("admin.print.print")}</a>
		<form id="deliveryForm" action="refuse.jhtml" method="get">
			${message("Area.receivers")}:
			<select id="deliveryCenter" name="deliveryCenterId">
				<option value="">${message("admin.common.choose")}</option>
				[#list deliveryCenters as center]
					<option value="${center.id}"[#if center == deliveryCenter] selected="selected"[/#if]>${center.name}</option>
				[/#list]
			</select>
			<input type="hidden" name="orderId" value="${order.id}" />
		</form>
	</div>
	[#if deliveryCenter??]
		<div class="content">
			<div id="title">${message("admin.refuse.registerCard")}</div>
		  	 <table>
				<tr>
					<td colspan="2">
				 		${message("admin.memberName")}:<span>${order.member.username}</span>
					</td>
					<td colspan="2">
					 	${message("shop.orderReturn.orderno")}:<span>${order.sn}</span>
					</td>
				 </tr>
				<tr>
					<td colspan="2">
						${message("admin.custom.name")}:
					</td>
					<td colspan="2">
					   	${message("Factory.phone")}:
					 </td>
				</tr>
				<tr>
				    <td colspan="2">
						${message("shop.orderReturn.returnReason")}：
					</td>
					<td>
						${message("admin.refuse.date")}：
					</td>
				</tr>
				 <tr>
					<td colspan="4">
				 		收件人：<span>${deliveryCenter.factory.linkName}</span>
					 	邮编:<span>${deliveryCenter.zipCode}</span>
					 	电话：<span>${deliveryCenter.phone}</span>
					 	手机：<span>${deliveryCenter.mobile}</span>
					   	地址:<span>${deliveryCenter.areaName+deliveryCenter.address}</span>
					 </td>
				 </tr>
			</table>
	<div>
	[/#if]
</body>
</html>