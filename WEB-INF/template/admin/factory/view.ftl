<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.factory.view")} - Powered By kuanda</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.factory.view")}
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="${message("admin.factory.base")}" />
		</li>
	</ul>
	<table class="input tabContent">
			<tr>
			[#if cscinit==0]
				<th>
					${message("admin.register.cscid")}:
				</th>
			[/#if]
			</tr>
			<tr>
				<th>
					${message("Factory.name")}:
				</th>
				<td>
					${factory.mName}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.corp")}:
				</th>
				<td>
					${factory.corp}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.identityCard")}:
				</th>
				<td>
					${factory.identityCard}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.maturity")}:
				</th>
				<td>
					${factory.maturity}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.cic_photo")}:
				</th>
				<td>
					${factory.cicPhoto}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.photo")}:
				</th>
				<td>
					${factory.photo}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.LBNumber")}:
				</th>
				<td>
					${factory.blNumber}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.busPhoto")}:
				</th>
				<td>
					${factory.busPhoto}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.taxRegPhoto")}:
				</th>
				<td>
					${factory.taxRegPhoto}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.accPermits")}:
				</th>
				<td>
					${factory.accPermits}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.occ")}:
				</th>
				<td>
					${factory.occ}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.tracelevel")}:
				</th>
				<td>
					${factory.traceLevel.level}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.linkName")}:
				</th>
				<td>
					${factory.linkName}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.phone")}:
				</th>
				<td>
					${factory.lPhone}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.email")}:
				</th>
				<td>
					${factory.lEmail}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.QQ")}:
				</th>
				<td>
					${factory.qq}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.WW")}:
				</th>
				<td>
					${factory.ww}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.address")}:
				</th>
				<td>
					${factory.address}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.fax")}:
				</th>
				<td>
					${factory.fax}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.weburl")}:
				</th>
				<td>
					${factory.webUrl}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.image")}:
				</th>
				<td>
					${factory.image}
				</td>
			</tr>
			<tr>
				<th>
					${message("Factory.remark")}:
				</th>
				<td>
					${factory.remark}
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.factory.status")}:
				</th>
				<td>
					[#if !factory.isEnabled]
						<span class="red">${message("admin.member.disabled")}</span>
					[#elseif factory.isLocked]
						<span class="red"> ${message("admin.member.locked")} </span>
					[#else]
						<span class="green">${message("admin.member.normal")}</span>
					[/#if]
				</td>
			</tr>
		</table>
		<!-- store begin -->
		<table class="input tabContent">
			<tr>
				<th>
					${message("admin.factory.store.name")}:
				</th>
				<td>
					[#if factory.store??]
						${factory.store.storeName}
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.factory.store.logo")}:
				</th>
				<td>
					[#if factory.store??]
						${factory.store.logo}
					[/#if]
				</td>
			</tr>
		</table>
		<!-- store end -->
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
			</td>
		</tr>
	</table>
</body>
</html>