<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.review.title")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]
	
	var $reviewForm = $("#inputForm");
	var $score = $("input[name='score']");
	var $corpScore = $("input[name='corpScore']");
	var $customerScore = $("input[name='customerScore']");
	var $tips = $("#tips");
	var $corptips = $("#corptips");
	var $customertips = $("#customertips");
	var $content = $("#content");
	
	// 评分
	$score.click(
		function(){
			$tips.text(message("${message("shop.review.tips")}", $(this).val()));
		}
	);
	// 评分
	$corpScore.click(
		function(){
			$corptips.text(message("${message("shop.review.tips")}", $(this).val()));
		}
	);
	// 评分
	$customerScore.click(
		function(){
			$customertips.text(message("${message("shop.review.tips")}", $(this).val()));
		}
	);
	
	// 表单验证
	$reviewForm.validate({
		rules: {
			content: {
				required: true,
				maxlength: 200
			},
			memberId:{
				required: true,
				remote: {
					url: "ifMemberExist.jhtml",
					cache: false
				}
			},
			numbers:{
				required: true,
				pattern: /^([0-9,-]+)+$/
			}
		},
		messages: {
			numbers: {
				pattern: "${message("admin.vlidate.productMumber")}"
			},
			memberId:{
				remote: "${message("admin.member.disableNotdExist")}"
			}
		}
	});
});

</script>
<style type="text/css">
	#memberId{height:22px;width:200px;}
	#numbers{height:50px;width:200px;}
</style>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.shop.review")}
	</div>
	<div>
		<form id="inputForm" action="${base}/admin/reviewTool/save.jhtml" method="post">
			<table class="input tabContent">
				<tr>
					<th>
						${message("admin.order.productSn")}:
					</th>
					<td>
						<textarea id="numbers" name="numbers" class="text" ></textarea>&nbsp;&nbsp;${message("shop.member.split")}
					</td>
				</tr>
				<tr>
					<th>
						${message("admin.memberName")}:
					</th>
					<td>
						<input type="text" id="memberId" name="memberId" title="${message("admin.member.input")}"  />
					</td>
				</tr>
				<tr>
					<th>
						${message("Review.productScore")}:
					</th>
					<td>
						<input type="radio" name="score" class="score" value="1" title="${message("shop.review.score1")}" />
						<input type="radio" name="score" class="score" value="2" title="${message("shop.review.score2")}" />
						<input type="radio" name="score" class="score" value="3" title="${message("shop.review.score3")}" />
						<input type="radio" name="score" class="score" value="4" title="${message("shop.review.score4")}" />
						<input type="radio" name="score" class="score" value="5" title="${message("shop.review.score5")}" checked="checked" />
						<strong id="tips" class="tips">${message("shop.review.tips", 5)}</strong>
					</td>
				</tr>
				<tr>
					<th>
						${message("Review.corpScore")}:
					</th>
					<td>
						<input type="radio" name="corpScore" class="score" value="1" title="${message("shop.review.score1")}" />
						<input type="radio" name="corpScore" class="score" value="2" title="${message("shop.review.score2")}" />
						<input type="radio" name="corpScore" class="score" value="3" title="${message("shop.review.score3")}" />
						<input type="radio" name="corpScore" class="score" value="4" title="${message("shop.review.score4")}" />
						<input type="radio" name="corpScore" class="score" value="5" title="${message("shop.review.score5")}" checked="checked" />
						<strong id="corptips" class="tips">${message("shop.review.tips", 5)}</strong>
					</td>
				</tr>
				<tr>
					<th>
						${message("Review.customerScore")}:
					</th>
					<td>
						<input type="radio" name="customerScore" class="score" value="1" title="${message("shop.review.score1")}" />
						<input type="radio" name="customerScore" class="score" value="2" title="${message("shop.review.score2")}" />
						<input type="radio" name="customerScore" class="score" value="3" title="${message("shop.review.score3")}" />
						<input type="radio" name="customerScore" class="score" value="4" title="${message("shop.review.score4")}" />
						<input type="radio" name="customerScore" class="score" value="5" title="${message("shop.review.score5")}" checked="checked" />
						<strong id="customertips" class="tips">${message("shop.review.tips", 5)}</strong>
					</td>
				</tr>
				<tr>
					<th>
						${message("Review.content")}:
					</th>
					<td>
						<textarea id="content" name="content" class="text" ></textarea>&nbsp;&nbsp;${message("shop.content.split")}
					</td>
				</tr>
				<tr>
					<th>
						${message("admin.validate.auditing")}:
					</th>
					<td>
						<label>
							<input type="checkbox" name="isReviewCheck" value="true" checked="checked" />${message("shop.isReviewCheck")}
							<input type="hidden" name="_isReviewCheck" value="false" />
						</label>
					</td>
				</tr>
				<tr>
					<th>
						&nbsp;
					</th>
					<td>
						<input type="submit" class="button" value="${message("shop.review.submit")}" />
						<input type="reset" class="button" value="清空内容" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>