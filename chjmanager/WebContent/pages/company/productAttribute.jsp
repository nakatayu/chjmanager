<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品属性页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-media.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="${ctx}/js/dialog/dialog_subModal.css" />
<script src="${ctx}/js/dialog/dialog_common.js"></script>
<script src="${ctx}/js/dialog/dialog_subModal.js"></script>
<style type="text/css">
a {
	cursor: pointer;
}
/*  遮罩层 */
.black_overlay {
	display: none;
	position: fixed;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity =80);
}

.white_content {
	display: none;
	position: fixed;
	top: 30%;
	left: 30%;
	width: 400px;
	height: 200px;
	border: 2px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

</style>
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a onclick="returnProductAtt()"
					title="商品属性" class="current">商品属性</a> <a href="#" class="current">商品更多属性</a>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="form-horizontal">
					<div id="form-wizard-1" class="step">

						<div class="control-group">
							<br />
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品图片:</h5>
							<br />
						</div>

						<div class="control-group">
							<div class="control-label">
								<a class="btn btn-warning" id="addImages" type="button">添&nbsp;&nbsp;&nbsp;加</a>
								<br> <span style="color: red; font-size: 12px;">(添加后请保存！)</span>
								<br> <br> <br> <a class="btn btn-warning"
									id="addTheNewImages" type="button">保&nbsp;&nbsp;&nbsp;存</a>
							</div>
							<div class="controls">
								<ul class="thumbnails" id="imageUpdate">
								</ul>
							</div>
						</div>

						<div class="control-group">
							<br />
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;属性修改:</h5>
							<br />
						</div>

						<c:if test="${user.type!=4&&user.type!=5}">
							<div class="control-group">
								<label class="control-label"><a class="btn btn-warning"
									onclick="addnewAttr()">新建属性</a></label>
							</div>
						</c:if>
						<div class="control-group">
							<div class="container-fluid">
								<div class="row-fluid">
									<table class="table table-bordered table-striped">
										<thead>
											<tr>
												<th width="150px">属性名称</th>
												<th>属性值</th>
												<th width="150px">操作</th>
											</tr>
										</thead>
										<tbody id="attribute">
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div id="price" style="display: none;">

							<div class="control-group">
								<label class="control-label">市场价：</label>
								<div class="controls">
									<input type="text" name="proSkuOPrice" id="proSkuOPrice" /> <span><font
										color="red" id="span_oldprice">例如:3.45</font></span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">实际售价：</label>
								<div class="controls">
									<input type="text" name="proSkuPrice" id="proSkuPrice" /> <span><font
										color="red" id="span_price">例如:3.50</font></span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><a class="btn btn-warning"
									onclick="addnewsku()">确定</a></label>
								<div class="controls">
									<span><font color="red" id="span_price">请根据需要在商品属性里选择对应属性。</font></span>
								</div>

							</div>
						</div>
						<div class="control-group" id="newpros">
							<label class="control-label"><a class="btn btn-warning"
								onclick="$('#price').show();$('#newpros').hide();">生成商品</a> </label>
						</div>
					</div>
					<div class="control-group">
						<div class="container-fluid">
							<div class="row-fluid">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>序号</th>
											<th>SKU名称</th>
											<th>市场价</th>
											<th>售价</th>
											<th width="300px"></th>
										</tr>
									</thead>
									<tbody id="productSku">
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<c:if test="${user.type==4||user.type==5}">
						<div class="control-group">
							<input type="hidden" name="flavorsIds" id="flavorsIds"> <br>
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附加属性：</h5>
							<br>
						</div>
						<div class="control-group">
							<table id="customizeFlavors" style="font-size: 16px;">
							</table>
						</div>
					</c:if>

					<div class="form-actions" style="height: 100px;">
					<c:if test="${user.type==4||user.type==5}">
						<a class="btn btn-warning" onclick="updproductAtt()"
							style="margin-left: 100px;">保存附加属性</a>
							</c:if>
							<a class="btn btn-warning" onclick="window.history.go(-1);"
							style="margin-left: 100px;">返&nbsp;&nbsp;&nbsp;&nbsp;回</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/jquery.ui.custom.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/jquery.uniform.js"></script>
	<script src="${ctx}/js/select2.min.js"></script>
	<script src="${ctx}/js/jquery.validate.js"></script>
	<script src="${ctx}/js/matrix.js"></script>
	<script src="${ctx}/js/matrix.form_validation.js"></script>
	<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
	<script src="${ctx}/js/jquery.peity.min.js"></script>
	<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
	<script src="${ctx}/js/masked.js"></script>
	<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<script>
		$('.textarea_editor').wysihtml5();
	</script>
	<jsp:include page="/common/buttom.jsp"></jsp:include>
	
	
	<!-- 遮罩层  -->
	<div id="dialog_div" class="white_content"
		style="padding: 30px 0px 0px 50px;">
		<div style="cursor: default; height: 40px; padding: 0px 20px 0px 0px;">
			<span style="flaot: left; font-size: 16px;">修改价格:</span> 
			<a href="javascript:void(0)"><span
				style="float: right; font-size: 16px;"
				onclick="CloseDiv('dialog_div','dialog_black')"> <font
					color="orange">关闭 </font></span></a>
		</div>
		<table>
			<tr>
				<td><label class="control-label">市场价：</label></td>
				<td><input type="hidden" id="hiddenProductSkuId" />
					<div class="controls">
						<input type="text" id="txtOldPrice" style="width: 250px;" />
					</div></td>
			</tr>
			<tr>
				<td><label class="control-label">售价：</label></td>
				<td>
					<div class="controls">
						<input type="text" id="txtPrice" style="width: 250px;" />
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<a class="btn btn-warning" type="button" style="margin: 20px 30px 20px 30px; "
						onclick="saveDialogPrice()">保&nbsp;&nbsp;&nbsp;&nbsp;存</a>
					<a class="btn btn-warning" type="button"
						onclick="clearDialog()">重&nbsp;&nbsp;&nbsp;&nbsp;置</a>
				</td>
			</tr>
		</table>
	</div>
	<div id="dialog_black" class="black_overlay"></div>

</body>
</html>
<script type="text/javascript">
	productId = "${param.productId}";
	var maxImage = 0;
	var s = -1;
	$(function() {
		$
				.ajax({
					type : "post",
					url : '${ctx}/product!moreUpdateAttribute.action',
					dataType : 'json',
					data : {
						productId : productId
					},
					success : function(msg, status) {
						if (msg.status == 200) {
							var images = msg.rows["imglist"];
							var proSku = msg.rows["proSku"];
							var proAttr = msg.rows["proAttr"];
							maxImage = images.length;
							var str = '';
							for ( var i = 0; i < images.length; i++) {
								str += '<li id="llii'+images[i]["product_image_id"]+'"><div style="width: 150px;border: 1px solid #ccc; float: center;">'
										+ '<img style="width: 150px; height: 160px;" src="${http_img}'+images[i]["file_path"]+'"/>'
										+ '<div style="height: 30px;padding: 10px 0 0 50px;"><input type="hidden" id="productImage'+
					images[i]["product_image_id"]+'" value="'+images[i]["file_path"]+'"/>'
										+ '<a style="font-size: 20px;" onclick="deleteImage('
										+ images[i]["product_image_id"]
										+ ')">删除</a></div>' + '</div></li>';
							}

							$('#imageUpdate').html(str);
							str = '';
							for ( var i = 0; i < proAttr.length; i++) {

								str += '<tr><td id="attr'+proAttr[i]["product_attribute_id"]+'">'
										+ proAttr[i]["name"] + '</td><td>';
								for ( var j = 0; j < proAttr[i]["attrVal"].length; j++) {
									var attrVal = proAttr[i]["attrVal"][j];
									str += '<input id="attrVal'+attrVal["product_attribute_value_id"]+'" type="checkbox" name="attrVal'+proAttr[i]["product_attribute_id"]+
						'" value="'+attrVal["product_attribute_value_id"]+
						'"><span id="pan'+attrVal["product_attribute_value_id"]+'">'
											+ attrVal["name"]
											+ '</span>'
											+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
								}
								str += '</td><th><a onclick="deleteAttrVal('
										+ proAttr[i]["product_attribute_id"]
										+ ')">删除</a></th></tr>';
							}

							$('#attribute').append(str);
							str = '';
							for ( var i = 0; i < proSku.length; i++) {
								str += '<tr><td>'
										+ proSku[i]["sku_no"]
										+ '</td><td>'
										+ proSku[i]["sku_kind"]
										+ '</td><td>'
										+ proSku[i]["old_price"]
										+ '</td>'
										+ '<td>'
										+ proSku[i]["price"]
										+ '</td><td>&nbsp;<a onclick="startDiv('
										+ proSku[i]["product_sku_id"] + ','
										+ proSku[i]["price"] + ','
										+ proSku[i]["old_price"]
										+ ')" style="margin-left:20px;">修改价格</a><a onclick="deleteProSku('
										+ proSku[i]["product_sku_id"] + ')" style="margin-left:20px;">删除</a></td></tr>';
							}
							$('#productSku').append(str);
							str = '';

						} else {
							alert(msg.msg);
						}
					}
				});

		var $uploadBtn = $("#addImages");
		new AjaxUpload(
				$uploadBtn,
				{
					action : '${ctx}/product!uploadProductImage.action',
					name : 'uploadFile',
					responseType : 'json',
					type : 6,//个人头像1企业所有图片2店铺所有图片3圈子图片4话题图片5活动图片6商品图片7广告图片8个人证件图片9二维码图片10其他图片11
					onChange : function(file, extension) {
						if ($('#imageUpdate li').length >= 4) {
							alert('最多添加4张!');
							return false;
						}
					},
					onSubmit : function(file, ext) {
						ext = ext.toLowerCase(); //ext 文件后缀     
						if (ext == 'bmp' || ext == 'jpg' || ext == 'jpeg'
								|| ext == 'png') {
						} else {
							alert('图片格式不对');
							return false;
						}
					},
					onComplete : function(file, response) {
						if (response.status == 200) {
							$('#imageUpdate')
									.append(
											'<li id="llii'+s+'"><div style="width: 150px;border: 1px solid #ccc; float: center;">'
													+ '<img style="width: 150px; height: 160px;" src="${http_img}'+ response.rows+'"/>'
													+ '<div style="height: 30px;padding: 10px 0 0 50px;"><input type="hidden" id="productImage'+s+'" value="'+response.rows+'"/>'
													+ '<a style="font-size: 20px;" onclick="deleteImage('
													+ s
													+ ')">删除</a></div>'
													+ '</div></li>');
							s--;
						} else {
							alert(response.msg);
						}
					}
				});
		$('#addTheNewImages').click(function() {
			var str = '';
			$('input[id^="productImage"]').each(function() {
				str += $(this).val() + ',';
			});
			$.ajax({
				type : "post",
				url : '${ctx}/product!addTheProductImages.action',
				dataType : 'json',
				data : {
					productId : productId,
					imgpath : str
				},
				success : function(msg, status) {
					if (msg.status == 200) {
						alert('保存成功！');

					} else {
						alert(msg.msg);
					}
				}
			});
		});

		if ('${user.type}' == 4 || '${user.type}' == 5) {
			//口味
			$
					.ajax({
						type : "post",
						url : '${ctx}/product!CustomizeFlavors.action',
						dataType : 'json',
						data : {
							productId : productId
						},
						timeout : 10000,
						success : function(msg, status) {
							if (msg.status == 200) {
								var array = [];

								for ( var i = 0; i < msg.rows.length; i++) {
									if (msg.rows[i]["parent_id"] == 0) {
										array
												.push("<tr><td style='padding:15px 20px;' align='right'>"
														+ msg.rows[i]["name"]
														+ ':' + "</td>");
										for ( var h = 0; h < msg.rows.length; h++) {
											if (msg.rows[i]["append_id"] == msg.rows[h]["parent_id"]) {
												array
														.push("<td width='100px'>"
																+ msg.rows[h]["name"]
																+ "<input type='checkbox'");
												if (msg.rows[h]["pappend"] != ''
														&& msg.rows[h]["pappend"] == msg.rows[h]["append_id"]) {
													array
															.push(" checked='checked' ");
												}
												array
														.push(" value='"
																+ msg.rows[h]["append_id"]
																+ "'/></td>");
											}
										}
										array.push("</tr>");
									}
								}
								$('#customizeFlavors').html(array.join(''));
							}
						}
					});
		}

	});

	function deleteImage(i) {
		$('#llii' + i).remove();
	}
	function addnewAttr() {
		showPopWin('新增商品属性', '${ctx}/pages/company/addattribute.jsp?type=1',
				500, 310, addTheNewAttribute);
	}
	function addTheNewAttribute(data) {
		var pam = {};
		pam["attribute"] = $.trim(data["attributeName"]);
		pam["attributeValue"] = $.trim(data["attributeTrait"]);
		pam["productId"] = productId;

		$
				.ajax({
					type : "post",
					url : '${ctx}/product!addTheProductAttribute.action',
					dataType : 'json',
					data : pam,
					success : function(msg, status) {
						if (msg.status == 200) {

							var attrBate = msg.rows;
							var sttr = '<tr><td id="attr'+attrBate["attrId"]+'">'
									+ attrBate["attriBute"] + '</td><td>';

							for ( var j = 0; j < attrBate["listVal"].length; j++) {
								var attrVal = attrBate["listVal"][j];
								sttr += '<input id="attrVal'+attrVal["valId"]+'" type="checkbox" name="attrVal'+attrBate["attrId"]+
					'" value="'+attrVal["valId"]+
					'"><span id="pan'+attrVal["valId"]+'">'
										+ attrVal["attributeValue"]
										+ '</span>'
										+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
							}
							sttr += '</td><th><a onclick="deleteAttrVal('
									+ attrBate["attrId"]
									+ ')">删除</a></th></tr>';

							$('#attribute').prepend(sttr);
						} else {
							alert(msg.msg);
						}
					}
				});
	}

	function deleteProSku(i) {
		$.ajax({
			type : "post",
			url : '${ctx}/product!updateTheSkuType.action',
			dataType : 'json',
			data : {
				skuId : i
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("已删除！");
					location.reload();
				} else
					alert(msg.msg);
			}
		});
	}
	function deleteAttrVal(i) {
		alert(i);
		$.ajax({
			type : "post",
			url : '${ctx}/product!updateTheAttrType.action',
			dataType : 'json',
			data : {
				attributeId : i
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("已删除！");
					location.reload();
				} else
					alert(msg.msg);
			}
		});
	}

	function addnewsku() {

		var p = /^\d{1,}([.]\d{1,2})?$/;
		var skuData = {};
		var productSku = "";
		var text = "";

		$('td[id^="attr"]').each(function() {
			var pid = $(this).attr("id").replace("attr", "attrVal");
			var pname = $(this).html();
			$('input:checkbox[name="' + pid + '"]:checked').each(function() {
				if (this.checked) {
					var nid = $(this).val();
					var cname = $('#pan' + nid).html();
					text = text + pname + ":" + cname + ",";
					productSku = productSku + nid + ",";
				}
			});
		});

		skuData["productId"] = productId;
		skuData["proAValue"] = productSku;
		skuData["skuKind"] = text;

		var pricre = $.trim($('#proSkuPrice').val());

		if (pricre.length == 0) {
			$('#span_price').html('售价不能为空!');
			return;
		} else {
			if (p.test(pricre) == false) {
				$('#span_price').html('售价不正确!');
				$('#proSkuPrice').val("");
				return;
			} else
				skuData["price"] = pricre;
		}

		var oldpricre = $.trim($('#proSkuOPrice').val());
		if (oldpricre.length == 0) {
			skuData["oldPrice"] = pricre;
		} else {
			if (p.test(oldpricre) == false) {
				$('#span_oldprice').html('市场价不正确!!');
				$('#proSkuOPrice').val("");
				return;
			} else
				skuData["oldPrice"] = oldpricre;
		}
		$.ajax({
			type : "post",
			url : '${ctx}/product!addTheProductSku.action',
			dataType : 'json',
			data : skuData,
			success : function(msg, status) {
				if (msg.status == 200) {
					$('#price').hide();
					$('#newpros').show();
					alert("添加成功！");
					window.location.reload();
				} else {
					alert(msg.msg);
				}
			}
		});
	}

	function saveDialogPrice() {
		var p = /^\d{1,}([.]\d{1,3})?$/;
		var oldPrice = $('#txtOldPrice').val();
		var price = $('#txtPrice').val();
		if (oldPrice.length == 0) {
			alert("不为空!");
			return;
		}
		if (oldPrice.length == 0) {
			alert("不为空!");
			return;
		}
		if (!p.test(oldPrice)) {
			alert("请输入两位小数!");
			return;
		}
		if (!p.test(price)) {
			alert("请输入两位小数!");
			return;
		}

		$.ajax({
			type : "post",
			url : '${ctx}/product!updateProductSkuPrice.action',
			dataType : 'json',
			data : {
				skuId : $('#hiddenProductSkuId').val(),
				price : price,
				oldPrice : oldPrice
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("修改成功！");
					window.location.reload();
				} else {
					alert(msg.msg);
				}
			}
		});
	}

	function returnProductAtt() {

		window.location = "${ctx}/product!updateProductInfo.action?productId="
				+ productId;

	}

	function updproductAtt() {
		var flavorsIds = "";
		if ($("#customizeFlavors").length > 0) {
			$("#customizeFlavors").find("input:checked").each(function() {
				flavorsIds = flavorsIds + $(this).val() + ",";
			});
		}
		$.ajax({
			type : "post",
			url : '${ctx}/product!updProductApp.action',
			dataType : 'json',
			data : {
				flavorsIds : flavorsIds,
				productId : productId
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("修改成功！");
					window.location.reload();
				} else {
					alert(msg.msg);
				}
			}
		});
	}

	//打开遮罩层
	function startDiv(id, price, oldprice) {
		$('#hiddenProductSkuId').val(id);
		$('#txtOldPrice').val(oldprice);
		$('#txtPrice').val(price);
		document.getElementById('dialog_div').style.display = 'block';
		document.getElementById('dialog_black').style.display = 'block';
	}
	//关闭遮罩层
	function CloseDiv(show_div, close_div) {
		document.getElementById(close_div).style.display = 'none';
		document.getElementById(show_div).style.display = 'none';
	}
	function clearDialog() {
		$('#hiddenProductSkuId').val('');
		$('#txtOldPrice').val('');
		$('#txtPrice').val('');
	}
</script>




