<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>服务供应商维护</title>
<meta charset="UTF-8" />
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
<link rel="stylesheet" href="${ctx}/xheditor/common.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="${ctx}/js/dialog/dialog_subModal.css" />
<script src="${ctx}/js/dialog/dialog_common.js"></script>
<script src="${ctx}/js/dialog/dialog_subModal.js"></script>
<style type="text/css">
.tag_content {
	margin: 0px;
	padding: 2px 0 2px 0;
	list-style: none;
	line-height: 20px;
	font-size: 15px;
}

#a1 {
	background-color: skyblue;
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
					class="icon-home"></i> 主页</a> <a
					href="${ctx}/pages/company/ProductList.jsp" title="商品设置"
					class="tip-bottom"><i class="icon-home"></i> 商品设置</a> <a href="#"
					class="current">新增商品信息</a>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"><i class="icon-info-sign"></i> </span>
						<h5>商品详情</h5>
					</div>
				</div>
				<form class="form-horizontal" method="post"
					action="${ctx}/product!insertProductInfo.action"
					name="basic_validate" id="basic_validate">
					<div id="form-wizard-1" class="step">
						<div>
							<br>
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公共类目：</h5>
							<br>
						</div>
						<div class="control-group">
							<table>
								<tr>
									<td></td>
									<td align="left" valign="bottom"
										style="height: 15px; font-size: 15px; padding: 10px;">公共分类：</td>
									<td align="left" valign="bottom"
										style="height: 15px; font-size: 15px; padding: 10px;">所属分类：</td>
								</tr>
								<tr>
									<td style="width: 10%"></td>
									<td style="width: 27%;">
										<div
											style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
											class="tag_content">
											<ul id="Shopstairtag">
											</ul>
										</div>
									</td>
									<td style="width: 27%">
										<div
											style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
											class="tag_content">
											<ul id="Thirdshoptag">
											</ul>
										</div>
									</td>
									<td style="width: 27%"></td>
								</tr>
							</table>
						</div>

						<div class="control-group"
							style="margin: 20px 0 20px 0; height: 48px;">
							<label class="control-label">已选分类：</label> <input
								name="productCategoryId" id="productCategoryId" type="hidden">
							<div class="controls" id="delchoosenclassify"
								style="height: 30px; font-size: 20px;"></div>
						</div>
						<div class="control-group">
							<br />
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息：</h5>
							<br />
						</div>
						<table>
							<tr>
								<td width="500px">
									<div class="control-group">
										<label class="control-label">商品编号：</label>
										<div class="controls">
											<input type="text" name="productNumber" id="productNumber"
												readonly />
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">商品名称：</label>
										<div class="controls">
											<input id="name" type="text" name="name"
												onblur="nameOnBlur()" /> <span><font color="red"
												id="name_check"> </font></span>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">英文名称：</label>
										<div class="controls">
											<input type="text" name="foreignName" id="foreignName"
												onblur="foreignNameOnBlur()" /> <span><font
												color="red" id="foreignName_check"> </font></span>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">商品品牌：</label>
										<div class="controls">
											<input type="text" name="brand" />
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">商品厂商：</label>
										<div class="controls">
											<input type="text" name="factory" />
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">商品产地：</label>
										<div class="controls">
											<input type="text" name="place" />
										</div>
									</div>
								</td>
								<td align="center" width="500px" style="padding: 10px;"
									valign="top">
									<button id="uploadButton" class="btn btn-success">浏&nbsp;&nbsp;&nbsp;&nbsp;览</button>
									<span>(添加商品图片，大小150k以内)</span> <input type="hidden"
									name="hiddenImage" id="hiddenImage" />

									<div
										style="width: 440px; margin: 10px 0 0 30px; border: 0px solid #ccc; float: center;">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr style="padding-top: 10px;" id="tr-img"></tr>
										</table>
									</div>
								</td>
							</tr>
						</table>

						<div class="control-group">
							<label class="control-label">商品特性：</label>
							<div class="controls">
								<textarea name="feature" id="feature"
									style="height: 200px; width: 720px;">${productInfo.feature}</textarea>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">商品说明：</label>
							<div class="controls">
								<textarea name="content" id="contentdd"
									style="height: 200px; width: 720px;">${productInfo.content}</textarea>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">售后说明：</label>
							<div class="controls">
								<textarea name="summary" id="summary"
									style="height: 200px; width: 720px;">${productInfo.summary}</textarea>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">有效时间：</label>
							<div class="controls">
								<table>
									<tr>
										<td><label> <input type="radio" id="timeType"
												name="timeType" value="1" /> 立即生效
										</label></td>
									</tr>
									<tr>
										<td><label> <input type="radio" id="timeType"
												name="timeType" value="2" /> 手动设定
										</label></td>
										<td><label class="control-label">设定时间：</label>
											<div class="controls">
												<input style="width: 170px" type="text" id="startTime"
													name="startTime" class="Wdate"
													onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\');}',dateFmt:'yyyy-MM-dd'})" />&nbsp;&nbsp;至&nbsp;&nbsp;
												<input style="width: 170px" type="text" id="endTime"
													name="endTime" class="Wdate"
													onfocus="WdatePicker({minDate:'#F{$dp.$D(\'startTime\');}',dateFmt:'yyyy-MM-dd'})" />
											</div></td>
									</tr>
									<tr>
										<td><label> <input type="radio" id="timeType"
												name="timeType" value="3" /> 下架
										</label></td>
									</tr>
								</table>
							</div>
						</div>
						<div class="control-group">
							<br />
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他信息：</h5>
							<br />
						</div>
						<div class="control-group">
							<label class="control-label">有无发票：</label>
							<div class="controls">
								<table width="20%">
									<tr>
										<td><label> 有<input type="radio" id="invoice"
												name="invoice" value="T" />
										</label></td>
										<td><label>无 <input type="radio" id="invoice"
												name="invoice" value="F" />
										</label></td>
									</tr>
								</table>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">是否提供保修：</label>
							<div class="controls">
								<table width="20%">
									<tr>
										<td><label> 是<input type="radio" id="afterRepair"
												name="afterRepair" value="T" />
										</label></td>
										<td><label>否<input type="radio" id="afterRepair"
												name="afterRepair" value="F" />
										</label></td>
									</tr>
								</table>
							</div>
						</div>

						<div class="control-group">
							<br>
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品属性：</h5>
							<br>
						</div>

						<div class="control-group">
							<label class="control-label" style="height: 100px;"> <a
								class="btn btn-warning" onclick="addNewAttr()">添加属性 </a></label>
							<div class="controls">
								<input type="hidden" name="attrHidden" id="attrHidden" /> <input
									type="hidden" name="attrListHidden" id="attrListHidden" />
								<table id="attrId">
								</table>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">市场价：</label>
							<div class="controls">
								<input type="text" name="oldPrice" id="oldPrice" /> <span><font
									color="red" id="span_oldprice">例如:3.45</font></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">实际售价：</label>
							<div class="controls">
								<input type="text" name="price" id="price" /> <span><font
									color="red" id="span_price">例如:3.50</font></span>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label"> <a class="btn btn-warning"
								onclick="generateProduct()"> 生成商品</a>
							</label>
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
												<th></th>
											</tr>
										</thead>
										<tbody id="table_content">
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="control-group">
							<br>
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品标签：</h5>
							<br>
						</div>
						<div class="control-group">
							<table>
								<tr>
									<td></td>
									<td align="left" valign="bottom"
										style="height: 15px; font-size: 15px; padding: 10px;">标签一级分类选择：</td>
									<td align="left" valign="bottom"
										style="height: 15px; font-size: 15px; padding: 10px;">标签二级分类选择：</td>
									<td align="left" valign="bottom"
										style="height: 15px; font-size: 15px; padding: 10px;">标签三级分类选择：</td>
								</tr>
								<tr>
									<td style="width: 10%"></td>
									<td style="width: 27%">
										<div
											style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
											class="tag_content">
											<ul id="tagFirst">
											</ul>
										</div>
									</td>
									<td style="width: 27%">
										<div
											style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
											class="tag_content">
											<ul id="tagSecond">
											</ul>
										</div>
									</td>
									<td style="width: 27%">
										<div
											style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
											class="tag_content">
											<ul id="tagThird">
											</ul>
										</div>
									</td>
									<td style="width: 27%"></td>
								</tr>
							</table>
						</div>
						<div class="control-group" style="height: 48px;">
							<label class="control-label" style="height: 30px;">已选标签：</label>
							<input name="thirdCategoryTag" id="thirdCategoryTag"
								type="hidden">
							<div class="controls" id="choosenLabel"
								style="height: 30px; font-size: 20px;"></div>
						</div>

						<div class="form-actions" style="height: 100px;">
							<a class="btn btn-warning" onclick="saveShop()"
								style="margin-left: 100px;">保&nbsp;&nbsp;&nbsp;&nbsp;存</a> <a
								class="btn btn-warning" onclick="location.reload()"
								style="margin-left: 30px;">取&nbsp;&nbsp;&nbsp;&nbsp;消</a> <a
								class="btn btn-warning" onclick="window.history.go(-1);"
								style="margin-left: 30px;">返&nbsp;&nbsp;&nbsp;&nbsp;回</a>
						</div>
					</div>
				</form>
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
	<script src="${ctx}/js/myself/json2.js"></script>
	<script src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
	<script>
		$('.textarea_editor').wysihtml5();
	</script>

	<jsp:include page="/common/buttom.jsp"></jsp:include>
	<script src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>

</body>
</html>

<script type="text/javascript">
	$(function() {
		
		$.ajax({
			type : "post",
			url : '${ctx}/product!generateProductCode.action',
			dataType : 'json',
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					$("#productNumber").val(msg.rows);
				} else
					alert(msg.msg);
			}
		});

		//标签分类 1级 
		$
				.ajax({
					type : "post",
					url : '${ctx}/tag!findTagFirstList.action',
					dataType : 'json',
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="tagname2(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>');
							}
							$('#tagFirst').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});

		//公共分类 1级 
		$
				.ajax({
					type : "post",
					url : '${ctx}/category!findShopstairtagList.action',
					dataType : 'json',
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content" onclick="commonalityclassifyvalue(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="'
										+ msg.rows[i]["productCategoryId"]
										+ '">' + msg.rows[i]["Name"] + '</li>');
							}
							$('#Shopstairtag').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});

		//上传头像
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload(
				$uploadBtn,
				{
					action : '${ctx}/product!uploadProductImage.action',
					name : 'uploadFile',
					responseType : 'json',
					onSubmit : function(file, ext) {
						if ($('#tr-img td').length >= 4) {
							alert('最多添加4张!');
							return false;
						}
					},
					onComplete : function(file, response) {
						if (response.status == 200) {
							$('#tr-img')
									.append(
											'<td><img src="${http_img}'+ response.rows+'" width="100" height="100"/></td>');

						} else {
							alert(response.msg);
						}
					}
				});

		// 服务范围 下拉框 1级
		$.ajax({
			type : "post",
			url : '${ctx}/area!findArea.action',
			dataType : 'json',
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					var array = [];
					array.push('<option  selected value=-1>--请选择--</option> ');
					for ( var i = 0; i < msg.rows.length; i++) {
						array.push('<option    class="tag_content"');
						array.push('	 value="' + msg.rows[i]["areaId"] + '">'
								+ msg.rows[i]["areaName"] + '</option>');
					}
					$('#area').html(array.join(''));
				} else
					alert(msg.msg);
			}
		});
		addhtmlCSS();
	});

	function addhtmlCSS() {
		var str = "Fontface,FontSize,Bold,Italic,Underline,";
		str += "FontColor,SelectAll,Removeformat,Align,List,Img,Source,Preview";
		$('#feature').xheditor({
			tools : str,
			upImgUrl:"${ctx}/common!uploadHtmlFile.action",upImgExt:"jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG"
		});
		$('#contentdd').xheditor({
			tools : str,upImgUrl:"${ctx}/common!uploadHtmlFile.action",upImgExt:"jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG"
		});
		$('#summary').xheditor({
			tools : str,upImgUrl:"${ctx}/common!uploadHtmlFile.action",upImgExt:"jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG"
		});
	}

	//标签名称  2级
	function tagname2(li) {
		var tagid = $(li).attr("value");
		$
				.ajax({
					type : "post",
					url : '${ctx}/tag!findTagSecondList.action',
					dataType : 'json',
					data : {
						tagId : tagid
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="tagname(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>');
							}
							$('#tagSecond').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	//标签名称  3级
	function tagname(li) {
		var tagid = $(li).attr("value");
		$
				.ajax({
					type : "post",
					url : '${ctx}/tag!findTagThirdList.action',
					dataType : 'json',
					data : {
						tagId : tagid
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="selected(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>');
							}
							$('#tagThird').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	var count = 1;
	function selected(li) {
		if (count > 6) {
			alert("不能超过6个");
			return;
		}
		var currentLabel = $(li).val();//判断是否重复 
		var flag = true;
		$("#choosenLabel").find("span").each(function() {
			if ($(this).attr("value") == currentLabel) {
				alert("标签不可重复");
				flag = false;
			}
		});
		if (flag == true) {
			count = count + 1;
			$("#choosenLabel")
					//已选标签 
					.append(
							"<span  value="
									+ $(li).attr("value")
									+ ">"
									+ $(li).text()
									+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>");
		}
	}

	function delLabel(li) {
		count = count - 1;
		$(li).prev().remove();
		$(li).remove();
	}

	//分类名称  2级 
	function commonalityclassifyvalue(li) {
		var shoptag = $(li).attr("value");
		$
				.ajax({
					type : "post",
					url : '${ctx}/category!findCategory.action',
					dataType : 'json',
					data : {
						shoptagId : shoptag
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="shoptag(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="'
										+ msg.rows[i]["productCategoryId"]
										+ '">' + msg.rows[i]["Name"] + '</li>');
							}
							$('#Thirdshoptag').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	var shoptagcount = 1;
	function shoptag(li) {
		if (shoptagcount > 1) {
			alert("只能选择一个分类");
			return;
		}

		shoptagcount = shoptagcount + 1;
		$("#delchoosenclassify")
				//已选分类 
				.append(
						"<span  value="
								+ $(li).attr("value")
								+ ">"
								+ $(li).text()
								+ "</span><a onclick='delchoosenclassify(this)'>[X]&nbsp;&nbsp;</a>");
	}
	function delchoosenclassify(li) {
		shoptagcount = shoptagcount - 1;
		$(li).prev().remove();
		$(li).remove();
	}

	function chooseArea(radio) {//多选框 checked 
		var secondAreaId = $(radio).val();
		if (secondAreaId == -1) {
			$("#thirdAreaId").find("input[type=checkbox]").each(function() {
				$(this).attr("checked", true);
			});
		} else {
			$("#thirdAreaId").find("input[type=checkbox]").each(function() {
				if ($(this).attr("parentId") == secondAreaId) {
					$(this).attr("checked", true);
				} else {
					$(this).attr("checked", false);
				}
			});
		}
	}

	// 服务范围  单选框 2级  
	function scopeofservices(opt) {
		var areaId = $(opt).find("option:selected").val();
		if (areaId == -1) {
			$('#secondAreaId').html("");
			$('#thirdAreaId').html("");
			return;
		} else {
			$
					.ajax({
						type : "post",
						url : '${ctx}/area!findSecondArea.action',
						dataType : 'json',
						data : {
							areaId : areaId
						},
						timeout : 10000,
						success : function(msg, status) {
							if (msg.status == 200) {
								var array = [];
								array
										.push('<td><label><input type="radio"	name="secondArea" checked   onclick="chooseArea(this)" ');
								array.push('	 value=-1 />' + "开发区全部区域"
										+ '</label></td>');
								for ( var i = 0; i < msg.rows.length; i++) {
									array
											.push('<td><label><input  type="radio" name="secondArea" onclick="chooseArea(this)" ');
									array.push('	 value="'
											+ msg.rows[i]["areaId"] + '" />'
											+ msg.rows[i]["areaName"]
											+ '</label></td>');
								}
								$('#secondAreaId').html(array.join(''));

								//园区名称  多选框排列   
								var thirdAreaArray = [];
								var rowTr = 3;
								var columnTd = 1;
								for ( var i = 0; i < msg.total.length; i++) {
									rowTr = rowTr + 1;
									if (rowTr % 4 == 0) {
										columnTd = 1;
										thirdAreaArray
												.push('<tr><td><input type="checkbox"  style="font-size: 20px" checked ');
										thirdAreaArray.push('	 parentId="'
												+ msg.total[i]["parentId"]
												+ '"');
										thirdAreaArray.push('	 value="'
												+ msg.total[i]["areaId"] + '">'
												+ msg.total[i]["areaName"]
												+ '</td>');
									} else {
										columnTd = columnTd + 1;
										if (columnTd == 4) {
											thirdAreaArray
													.push('<td><input type="checkbox"  style="font-size: 20px" checked ');
											thirdAreaArray.push('	 parentId="'
													+ msg.total[i]["parentId"]
													+ '"');
											thirdAreaArray.push('	 value="'
													+ msg.total[i]["areaId"]
													+ '">'
													+ msg.total[i]["areaName"]
													+ '</td></tr>');
										} else {
											thirdAreaArray
													.push('<td><input type="checkbox"  style="font-size: 20px" checked ');
											thirdAreaArray.push('	 parentId="'
													+ msg.total[i]["parentId"]
													+ '"');
											thirdAreaArray.push('	 value="'
													+ msg.total[i]["areaId"]
													+ '">'
													+ msg.total[i]["areaName"]
													+ '</td>');
										}
									}
								}
								$('#thirdAreaId').html(thirdAreaArray.join('')); //园区名称  
							} else
								alert(msg.msg);
						}
					});
		}
	}

	//商品名称验证 
	function nameOnBlur() {
		var name = $.trim($("#name").val());
		if (name.length == 0) {
			$("#name_check").html("不能为空！");
		} else if ($.trim($("#name").val().length) > 15) {
			$("#name_check").html("长度不能超过15个字符!");
		} else {
			$("#name_check").html("");
		}
	}
	function foreignNameOnBlur() {
		var name = $.trim($("#foreignName").val());
		if (name == "") {
			$("#foreignName_check").html("不能为空！");
		} else if ($.trim($("#foreignName").val().length) > 50) {
			$("#foreignName_check").html("长度不能超过50个字符!");
		} else {
			$("#foreignName_check").html("");
		}
	}
	var  statuse=true;	//控制重复提交
	function saveShop() {
		if(!statuse){
			alert('请不要重复提交！');
			return;
		}else{
			statuse=false;
		}
		
		var name = $.trim($("#name").val());
		if (name == "") {
			statuse=true;
			alert("名称不能为空！");			
			return;
		}
		var arrayImage = [];
		$.each($('#tr-img td'),function() {
				var path = $(this).find('img:last').attr('src');
				path = path
						.substr((path.lastIndexOf('${http_img}') + '${http_img}'.length));
				arrayImage.push(path);
			});
		if (arrayImage.length == 0) {
			statuse=true;
			alert('请选择图片!');			
			return;
		}
		$('#hiddenImage').val(arrayImage.join('####'));

		//已选标签
		var labelValue = "";
		$("#choosenLabel").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";
		});
		$("#thirdCategoryTag").val(labelValue);

		// 口味选择
		var flavorsIds = "";
		if ($("#customizeFlavors").length > 0) {
			$("#customizeFlavors").find("input:checked").each(function() {
				flavorsIds = +$(this).val() + "," + flavorsIds;
			});
		}
		$("#flavorsIds").val(flavorsIds);
		//已选分类
		var label = "";
		$("#delchoosenclassify").find("span").each(function() {
			label = label + $(this).attr("value");
		});
		$("#productCategoryId").val(label);

		//园区名称 
		var serviceArea = "";
		$("#thirdAreaId").find("input[type=checkbox]:checked").each(function() {
			serviceArea = serviceArea + $(this).val() + ",";
		});
		$("#thirdServiceArea").val(serviceArea);

		//商品属性：
		var attrStr = "";
		$("#table_content").find("tr").each(
				function() {
					attrStr = $(this).find("td:eq(1)").html() + "@"
							+ $(this).find("td:eq(2)").html() + "@"
							+ $(this).find("td:eq(3)").html() + "#" + attrStr;
				});

		$("#attrHidden").val(attrStr);
		$('#attrListHidden').val(JSON.stringify(attrObj));
		
		var labelValue = "";
		$("#choosenclassify").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";
		});
		$("#choosenclassifyvalue").val(labelValue);
		$("#basic_validate").submit();
		statuse=true;
	}

	//删除属性
	function delAttribute(attr) {
		delete attrObj[attr];
		$("#" + attr).remove();
	}

	var genProNum = 0;
	function generateProduct() {
		if ($.trim($("#oldPrice").val()).length == 0) {
			$('#span_oldprice').html('请输入市场价!');
			return;
		}
		if ($.trim($("#price").val()).length == 0) {
			$('#span_price').html('请输入实售价!');
			return;
		}
		$('#span_price').html('');
		$('#span_oldprice').html('');
		var str = "";
		genProNum = genProNum + 1;

		$("#attrId").find("tr").each(
				function() {
					str = str + $(this).find("td:eq(1)>font").html()
							+ $(this).find("td:eq(2)>select").val() + ",";
				});
		str = str.substr(0, str.length - 1);

		$("#table_content")
				.append(
						"<tr><td>"
								+ genProNum
								+ "</td><td>"
								+ str
								+ "</td><td>"
								+ $("#price").val()
								+ "</td><td>"
								+ $("#oldPrice").val()
								+ "</td><td> <a href='javascript:void(0)' onclick='delGenPro(this)'>删除</td></tr>");
	}

	function delGenPro(pro) {
		$(pro).parents("tr").remove();
	}

	function addNewAttr() {
		showPopWin('新增商品属性', '${ctx}/pages/company/addattribute.jsp', 500, 310,
				gotopage);
	}

	var attrObj = {};
	function gotopage(data) {
		var str = data["attributeTrait"].split("#");
		var selectStr = "";
		for ( var i = 0; i < str.length; i++) {
			if ($.trim(str[i]).length > 0) {
				selectStr = selectStr + "<option  value='"+str[i]+"'>" + str[i]
						+ "</option>";
			}
		}
		selectedStr = "<select style='width: 223px;' name='addinput' >"
				+ selectStr + "</select>";

		$("#attrId")
				.append(
						"<tr id='"+data["attributeName"]+"' valign='top'><td width='50px'></td><td><font size='4px'>"
								+ data["attributeName"]
								+ ":</font></td><td>"
								+ selectedStr
								+ "</td><td></td><td><a class='btn btn-info btn-mini' onclick='delAttribute(\""
								+ data["attributeName"]
								+ "\")' >&nbsp;删&nbsp;&nbsp;除&nbsp;</a></td></tr><br>");

		attrObj[data["attributeName"]] = str.join(',');
	}
</script>








