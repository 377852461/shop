<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${product.name} ${message("shop.review.title")}[#if systemShowPowered] - Powered By kuanda[/#if]</title>
<meta name="author" content="kuanda Team" />
<meta name="copyright" content="kuanda" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/review.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.rating.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $reviewForm = $("#reviewForm");
	[#list order.orderItems as orderItem]
	var $score${orderItem_index} = $("input[name='score${orderItem_index}']");
	var $corpScore${orderItem_index} = $("input[name='corpScore${orderItem_index}']");
	var $customerScore${orderItem_index} = $("input[name='customerScore${orderItem_index}']");
	var $tips${orderItem_index} = $("#tips${orderItem_index}");
	var $corptips${orderItem_index} = $("#corptips${orderItem_index}");
	var $customertips${orderItem_index} = $("#customertips${orderItem_index}");
	var $content${orderItem_index} = $("#content${orderItem_index}");
	[/#list]
	
	var $captcha = $("#captcha");
	var $captchaImage = $("#captchaImage");
	var $submit = $(":submit");
	
	// 评分
	[#list order.orderItems as orderItem]
		$score${orderItem_index}.rating({
			callback: function(value, link) {
				$tips${orderItem_index}.text(message("${message("shop.review.tips")}", value));
			}
		});
		$corpScore${orderItem_index}.rating({
			callback: function(value, link) {
				$corptips${orderItem_index}.text(message("${message("shop.review.tips")}", value));
			}
		});
		$customerScore${orderItem_index}.rating({
			callback: function(value, link) {
				$customertips${orderItem_index}.text(message("${message("shop.review.tips")}", value));
			}
		});
	[/#list]
	
	
	// 更换验证码
	$captchaImage.click(function() {
		$captchaImage.attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
	});
	
	// 表单验证
	$reviewForm.validate({
		rules: {
			content: {
				required: true,
				maxlength: 200
			}
		},
		submitHandler: function(form) {
			$.ajax({
				url: $reviewForm.attr("action"),
				type: "POST",
				data: $reviewForm.serialize(),
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$submit.prop("disabled", true);
				},
				success: function(message) {
					$.message(message);
					if (message.type == "success") {
						setTimeout(function() {
							$submit.prop("disabled", false);
							location.href = "../list.jhtml";
						}, 3000);
					} else {
						$submit.prop("disabled", false);
					}
				}
			});
		}
	});

});
</script>
</head>
<body>
	[#include "/shop/include/header.ftl" /]
	<div class="container productContent review">
		<div class="span6">
			<div class="hotProductCategory">
				[@product_category_root_list]
					[#list productCategories as category]
						<dl[#if !category_has_next] class="last"[/#if]>
							<dt>
								<a href="${base}${category.path}">${category.name}</a>
							</dt>
							[@product_category_children_list productCategoryId = category.id count = 4]
								[#list productCategories as productCategory]
									<dd>
										<a href="${base}${productCategory.path}">${productCategory.name}</a>
									</dd>
								[/#list]
							[/@product_category_children_list]
						</dl>
					[/#list]
				[/@product_category_root_list]
			</div>
			<div class="hotProduct">
				<div class="title">${message("shop.product.hotProduct")}</div>
				<ul>
					[@product_list count = 6 orderBy="monthSales desc"]
						[#list products as product]
							<li[#if !product_has_next] class="last"[/#if]>
								<a href="${base}${product.path}" title="${product.name}">${abbreviate(product.name, 30)}</a>
								[#if product.scoreCount > 0]
									<div>
										<div>${message("Product.score")}: </div>
										<div class="score${(product.score * 2)?string("0")}"></div>
										<div>${product.score?string("0.0")}</div>
									</div>
								[/#if]
								<div>${message("Product.price")}: <strong>${currency(product.price, true, true)}</strong></div>
								<div>${message("Product.monthSales")}: <em>${product.monthSales}</em></div>
							</li>
						[/#list]
					[/@product_list]
				</ul>
			</div>
		</div>
		<form id="reviewForm" action="${base}/review/save.jhtml" method="post">
		<input type="hidden" name="sn" value="${order.sn}" />
		<div class="span18 last">
			<div class="path">
				<ul>
					<li>
						<a href="${base}/">${message("shop.path.home")}</a>
					</li>
					<li>订单评价</li>
				</ul>
			</div>
		</div>
		<div class="span18 last">
		[#list order.orderItems as orderItem]
			<table class="info">
				<tr>
					<th rowspan="3">
						<img src="[#if orderItem.product.thumbnail??]${orderItem.product.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${orderItem.product.name}" />
					</th>
					<td>
						<a href="${base}${orderItem.product.path}">${abbreviate(orderItem.product.name, 60, "...")}</a>
					</td>
				</tr>
				<tr>
					<td>
						${message("Product.price")}: <strong>${currency(orderItem.product.price, true, true)}</strong>
					</td>
				</tr>
				<tr>
					<td>
						[#if orderItem.product.scoreCount > 0]
							<div>${message("Product.score")}: </div>
							<div class="score${(orderItem.product.score * 2)?string("0")}"></div>
							<div>${orderItem.product.score?string("0.0")}</div>
						[#else]
							[#if setting.isShowMarketPrice]
								${message("Product.marketPrice")}:
								<del>${currency(orderItem.product.marketPrice, true, true)}</del>
							[/#if]
						[/#if]
					</td>
				</tr>
			</table>

				<input type="hidden" name="id" value="${orderItem.product.id}" />
				<div class="add">
					<table>
						<tr>
							<th>
								${message("Review.productScore")}:
							</th>
							<td>
								<input type="radio" name="score${orderItem_index}" class="score" value="1" title="${message("shop.review.score1")}" />
								<input type="radio" name="score${orderItem_index}" class="score" value="2" title="${message("shop.review.score2")}" />
								<input type="radio" name="score${orderItem_index}" class="score" value="3" title="${message("shop.review.score3")}" />
								<input type="radio" name="score${orderItem_index}" class="score" value="4" title="${message("shop.review.score4")}" />
								<input type="radio" name="score${orderItem_index}" class="score" value="5" title="${message("shop.review.score5")}" checked="checked" />
								<strong id="tips${orderItem_index}" class="tips">${message("shop.review.tips", 5)}</strong>
							</td>
						</tr>
						<tr>
							<th>
								${message("Review.corpScore")}:
							</th>
							<td>
								<input type="radio" name="corpScore${orderItem_index}" class="score" value="1" title="${message("shop.review.score1")}" />
								<input type="radio" name="corpScore${orderItem_index}" class="score" value="2" title="${message("shop.review.score2")}" />
								<input type="radio" name="corpScore${orderItem_index}" class="score" value="3" title="${message("shop.review.score3")}" />
								<input type="radio" name="corpScore${orderItem_index}" class="score" value="4" title="${message("shop.review.score4")}" />
								<input type="radio" name="corpScore${orderItem_index}" class="score" value="5" title="${message("shop.review.score5")}" checked="checked" />
								<strong id="corptips${orderItem_index}" class="tips">${message("shop.review.tips", 5)}</strong>
							</td>
						</tr>
						<tr>
							<th>
								${message("Review.customerScore")}:
							</th>
							<td>
								<input type="radio" name="customerScore${orderItem_index}" class="score" value="1" title="${message("shop.review.score1")}" />
								<input type="radio" name="customerScore${orderItem_index}" class="score" value="2" title="${message("shop.review.score2")}" />
								<input type="radio" name="customerScore${orderItem_index}" class="score" value="3" title="${message("shop.review.score3")}" />
								<input type="radio" name="customerScore${orderItem_index}" class="score" value="4" title="${message("shop.review.score4")}" />
								<input type="radio" name="customerScore${orderItem_index}" class="score" value="5" title="${message("shop.review.score5")}" checked="checked" />
								<strong id="customertips${orderItem_index}" class="tips">${message("shop.review.tips", 5)}</strong>
							</td>
						</tr>
						<tr>
							<th>
								${message("Review.content")}:
							</th>
							<td>
								<textarea id="content${orderItem_index}" name="content${orderItem_index}" class="text"></textarea>
							</td>
						</tr>
					</table>
				</div>
			
		[/#list]
			<div class="add">
				<table>
					<tr>
						<th>
							&nbsp;
						</th>
						<td>
							<input type="submit" class="button" value="${message("shop.review.submit")}" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		</form>
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>