<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>商品详情页页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-media.css" />
<link rel="stylesheet" href="css/bootstrap-wysihtml5.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="${ctx}/xheditor/common.css" type="text/css"
	media="screen" />


<style type="text/css">
.tag_content {
	margin: 0px;
	padding: 2px 0 2px 0;
	list-style: none;
	line-height: 20px;
	font-size: 15px;
}

.shop_announcement {
	width: 557px;
	high: 57px;
	overflow-x: visible;
	overflow-y: visible;
}

#a1 {
	background-color: skyblue
}

[titie~=labelstyle] {
	font-size: 20px;
}

.tdstyle {
	font-size: 20px;
}

/*  遮罩层 */
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity =     80);
}

.white_content {
	display: none;
	position: absolute;
	top: 30%;
	left: 10%;
	width: 50%;
	height: 10%;
	border: 2px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

.white_content_small {
	display: none;
	position: absolute;
	top: 20%;
	left: 30%;
	width: 10%;
	height: 20%;
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
				<a href="../index.jsp" title="主页" class="tip-bottom"> <i
					class="icon-home"></i> 主页
				</a> <a href="${ctx}/pages/company/ProductList.jsp" class="current">
					<i class=" icon-leaf"></i>商品列表
				</a> <a href="#" class="current">修改商品基本信息</a>
			</div>
		</div>


		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"> <i class="icon-info-sign"></i>
						</span>
						<h5>详细信息</h5>
					</div>
				</div>


				<form class="form-horizontal" method="post" name="basic_validate"
					id="basic_validate">
					<div id="form-wizard-1" class="step">
						<div>
							<input name="" id="" type="hidden" value="" /> <br />
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品分类：</h5>
							<br />
						</div>
						<div class="control-group">
							<table>
								<tr>
									<td></td>
									<td align="left" valign="bottom"
										style="height: 15px; font-size: 15px; padding: 10px;">商品一级分类：</td>
									<td align="left" valign="bottom"
										style="height: 15px; font-size: 15px; padding: 10px;">商品二级分类：</td>
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
								name="categoryId" id="categoryId" type="hidden">
							<div class="controls" id="delchoosenclassify" titie="labelstyle">
								<c:if test="${productInfo.category_name!=null}">
									<span value="${productInfo.product_category_id}">${productInfo.category_name}</span>
									<a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>
								</c:if>
							</div>
						</div>
						<div class="control-group">
							<input id="productId" type="hidden" name="productId"
								value="${productInfo.product_id}"> <br />
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息：</h5>
							<br />
						</div>

						<div class="control-group">
							<label class="control-label">商品名称：</label>
							<div class="controls">
								<input type="text" name="name" value="${productInfo.name}" />
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">商品品牌：</label>
							<div class="controls">
								<input type="text" name="brand" value="${productInfo.brand}" />
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">商品厂商：</label>
							<div class="controls">
								<input type="text" name="factory" value="${productInfo.factory}" />
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">商品产地：</label>
							<div class="controls">
								<input type="text" name="place" value="${productInfo.place}" />
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">商品特性：</label>
							<div class="controls">
								<textarea name="feature" id="feature"
									style="height: 200px; width: 720px;">${productInfo.feature}</textarea>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">商品介绍：</label>
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
							<br />
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他信息：</h5>
							<br />
						</div>
						<div class="control-group">
							<label class="control-label">有无发票：</label>
							<div class="controls">
								<table width="20%">
									<tr>
										<td><label> 有 <c:if
													test="${productInfo.invoice=='T'}">
													<input type="radio" name="invoice" value="T" checked />
												</c:if> <c:if test="${productInfo.invoice!='T'}">
													<input type="radio" name="invoice" value="T" />
												</c:if>
										</label></td>
										<td><label> 无 <c:if
													test="${productInfo.invoice=='F'}">
													<input type="radio" name="invoice" value="F" checked />
												</c:if> <c:if test="${productInfo.invoice!='F'}">
													<input type="radio" name="invoice" value="F" />
												</c:if>
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
										<td><label> 是 <c:if
													test="${productInfo.after_repair=='T'}">
													<input type="radio" name="afterRepair" value="T" checked />
												</c:if> <c:if test="${productInfo.after_repair!='T'}">
													<input type="radio" id="afterRepair" name="afterRepair"
														value="T" />
												</c:if>
										</label></td>
										<td><label> 否 <c:if
													test="${productInfo.after_repair=='F'}">
													<input type="radio" name="afterRepair" value="F" checked />
												</c:if> <c:if test="${productInfo.after_repair!='F'}">
													<input type="radio" name="afterRepair" value="F" />
												</c:if>
										</label></td>
									</tr>
								</table>
							</div>
						</div>
						<div class="control-group">
							<br />
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品标签：</h5>
							<br />
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
								</tr>
							</table>
						</div>
						<div class="control-group"
							style="margin: 20px 0 20px 0; height: 48px;">
							<label class="control-label">已选标签：</label> <input
								name="thirdCategoryTag" id="thirdCategoryTag" type="hidden">
							<div class="controls" id="choosenLabel" titie="labelstyle">
								<c:forEach items="${shopTag }" var="tag">
									<span value="${tag.tag_id}">${tag.tag_name}</span>
									<a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>
								</c:forEach>
							</div>
						</div>

						<div class="form-actions" style="padding: 20px 0 100px 50px;">
							<button
								onclick="saveProductDetail()" class="btn btn-warning" style="margin:5px 30px;">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
							
							<button 
								onclick="moreAttributeUpdate()" class="btn btn-warning" style="margin:5px 30px;">更多属性</button>
							<button
								class="btn btn-warning" onclick="ReturnThePage()" style="margin:5px 30px;">返&nbsp;&nbsp;&nbsp;&nbsp;回</button>
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
	<script src="${ctx}/js/bootstrap-datepicker.js"></script>
	<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
	<script src="${ctx}/js/jquery.peity.min.js"></script>
	<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
	<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
	<script src="${ctx}/js/masked.js"></script>
	<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<%--<script src="${ctx}/js/matrix.form_common.js"></script>  --%>
	<script>
		$('.textarea_editor').wysihtml5();
	</script>

	<jsp:include page="/common/buttom.jsp"></jsp:include>
	<script src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
</body>
</html>

<script type="text/javascript">
	productId = "${productInfo.product_id}";

	$(function() {
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
		//商品分类 1级 
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
										.push('<li class="tag_content"	onclick="commonalityclassifyvalue(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="'
										+ msg.rows[i]["productCategoryId"]
										+ '">' + msg.rows[i]["Name"] + '</li>');
							}
							$('#Shopstairtag').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
		addhtmlCSS();
	});

	function addhtmlCSS() {
		var str = "Fontface,FontSize,Bold,Italic,Underline,Strikethrough,";
		str += "FontColor,BackColor,SelectAll,Removeformat,Align,List,";
		str += "Outdent,Indent,Link,Unlink,Anchor,Img,Hr,Emot,Table,Source,Preview";
		$('#feature').xheditor({
			tools : str,
			upImgUrl : "${ctx}/user!uploadHtmlFile.action",
			upImgExt : "jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG"
		});
		$('#contentdd').xheditor({
			tools : str,
			upImgUrl : "${ctx}/user!uploadHtmlFile.action",
			upImgExt : "jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG"
		});
		$('#summary').xheditor({
			tools : str,
			upImgUrl : "${ctx}/user!uploadHtmlFile.action",
			upImgExt : "jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG"
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
	function shoptag(li) {//标签替换 
		$("#delchoosenclassify")
				//已选分类 
				.html(
						"<span  class='tdstyle'  value="
								+ $(li).attr("value")
								+ ">"
								+ $(li).text()
								+ "</span><a class='tdstyle'  onclick='delchoosenclassify(this)'>[X]&nbsp;&nbsp;</a>");
	}
	function delchoosenclassify(li) {
		$(li).prev().remove();
		$(li).remove();
	}

	function saveProductDetail() {
		var param = {};
		param["productId"] = productId;
		param["name"] = $('input:text[name="name"]').val();
		param["brand"] = $('input:text[name="brand"]').val();
		param["factory"] = $('input:text[name="factory"]').val();
		param["place"] = $('input:text[name="place"]').val();
		param["feature"] = $('#feature').val();
		param["content"] = $('#contentdd').val();
		param["summary"] = $('#summary').val();
		var invoice = $('input:radio[name="invoice"]:checked').val();
		if (invoice == null) {
			invoice = 'F';
		}
		param["invoice"] = invoice;
		var afterRepair = $('input:radio[name="afterRepair"]:checked').val();
		if (afterRepair == null) {
			afterRepair = 'F';
		}
		param["afterRepair"] = afterRepair;
		//标签
		var labelValue = "";
		$("#choosenLabel").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";
		});
		param["productTagId"] = labelValue;
		//分类
		var label = "";
		$("#delchoosenclassify").find("span").each(function() {
			label = label + $(this).attr("value");
		});
		param["categoryId"] = label;

		$.ajax({
			type : "post",
			url : '${ctx}/product!updateTheProduct.action',
			dataType : 'json',
			data : param,
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("保存成功！");
				} else {
					alert(msg.msg);
				}
			}
		});
	}

	function ReturnThePage() {
		window.location.href = "${ctx}/pages/company/ProductList.jsp";
	}
	function moreAttributeUpdate() {
		window.location.href = "${ctx}/pages/company/productAttribute.jsp?productId="
				+ productId;
	}
</script>