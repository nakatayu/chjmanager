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
<link rel="stylesheet" href="css/bootstrap-wysihtml5.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<script type="text/javascript"
	src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
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
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a
					href="${ctx}/pages/company/ProductList.jsp" title="商品列表"
					class="current"> <i class=" icon-leaf"></i>商品列表
				</a> <a href="#" class="current">商品基本属性</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>商品详情</h5>
						</div>

						<div class="widget-content nopadding">
							<form class="form-horizontal" method="post"
								action="${ctx}/product!insertProductInfo.action"
								name="basic_validate" id="basic_validate">
								<br>
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公共类目：</h5>
								<hr>
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
											<div class="control-group">
												<div
													style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
													class="tag_content">
													<ul id="Thirdshoptag">
													</ul>
												</div>
											</div>
										</td>
										<td style="width: 27%"></td>
									</tr>
								</table>
								<div class="control-group"
									style="margin: 20px 0 20px 0; height: 0px;">
									<label class="control-label">已选分类：</label> <input
										name="productCategoryId" id="productCategoryId" type="hidden">
									<div class="controls" id="delchoosenclassify"
										titie="labelstyle"></div>
								</div>

								<br>
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息：</h5>
								<hr>
								<div id="form-wizard-1" class="step">
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
								</div>
						</div>
						<br>
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品属性：</h5>
						<hr>

						<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						<input type="hidden" name="attrHidden" id="attrHidden" /> <input
							type="hidden" name="attrListHidden" id="attrListHidden" />
						<c:if test="${user.companyId==254}">
							<table id="attrId">
								<tr>
									<td width="130"></td>
									<td><font size="4px">杯型:</font></td>
									<td style="padding-left: 24px;"><select
										style="width: 220px;">
											<option value="中杯(354ml)">中杯(354ml)</option>
											<option value="大杯(473ml)">大杯(473ml)</option>
											<option value="超大杯(591ml)">超大杯(591ml)</option>
									</select></td>
								</tr>


							</table>
						</c:if>
						<c:if test="${user.companyId != 254}">
							<button class="btn btn-warning" type="button"
								class="btn btn-success" onclick="startDiv(this)">
								&nbsp;&nbsp;添加属性&nbsp;&nbsp;</button>
							<table id="attrId">

							</table>
						</c:if>
						<hr>
						<div id="form-wizard-1" class="step">
							<table>
								<tr>
									<td>
										<div class="control-group">
											<label class="control-label">市场价：</label>
											<div class="controls" style="width: 140px;">
												<input type="text" name="oldPrice" id="oldPrice" /> <span><font
													color="red" id="span_oldprice">例如:3.45</font></span>
											</div>

										</div>
									</td>
									<td></td>
									<td rowspan=7 align=center>
										<button id="uploadButton" class="btn btn-primary"
											style="background: #339999">浏&nbsp;&nbsp;&nbsp;&nbsp;览</button>
										<span>230*230</span> <input type="hidden" name="hiddenImage"
										id="hiddenImage" />
										<div
											style="width: 440px; height: 120px; margin: 10px 0 0 30px; border: 0px solid #ccc; float: center;">
											<table width="100%" cellpadding="0" cellspacing="0">
												<tr style="padding-top: 10px;" id="tr-img">
												</tr>
											</table>


											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;<br /> <br /> <br />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;

											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label">实际售价：</label>
												<div class="controls" style="width: 140px;">
													<input type="text" name="price" id="price" /> <span><font
														color="red" id="span_price">例如:3.50</font></span>
												</div>
											</div>
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label"></label>
												<div class="controls"></div>
											</div>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label"></label>
												<div class="controls"></div>
											</div>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label"></label>
												<div class="controls"></div>
											</div>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label"></label>
												<div class="controls"></div>
											</div>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label"></label>
												<div class="controls"></div>
											</div>
									</td>
									<td></td>
									<td></td>
								</tr>
							</table>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


							<button class="btn btn-warning" type="button"
								onclick="generateProduct()" class="btn btn-success">
								&nbsp;&nbsp;生成商品&nbsp;&nbsp;</button>

							<div class="container-fluid">
								<div class="row-fluid">
									<table class="table table-bordered table-striped">
										<div class="widget-content nopadding">
											<div class="container-fluid">
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
									<div class="widget-title"
										style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
									</div>
								</div>
							</div>
						</div>
						<hr>

						<div class="shop_announcement">
							<label class="control-label">商品特性：</label>
							<div class="controls" style="height: 100px">
								<textarea type="text" name="feature" id="feature"
									class="shop_announcement" style="height: 100px"></textarea>
							</div>
						</div>

						<div class="shop_announcement">
							<label class="control-label">商品介绍：</label>
							<div class="controls" style="height: 100px">
								<textarea type="text" name="content" class="shop_announcement"
									style="height: 100px"></textarea>
							</div>
						</div>

						<div class="shop_announcement">
							<label class="control-label">售后说明：</label>
							<div class="controls" style="height: 100px">
								<textarea type="text" name="summary" id="summary"
									class="shop_announcement" style="height: 100px"></textarea>
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
										<td>
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">设定时间：</label>
													<div class="controls">
														<input style="width: 170px" type="text" id="startTime"
															name="startTime" class="Wdate"
															onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\');}',dateFmt:'yyyy-MM-dd'})" />&nbsp;&nbsp;至&nbsp;&nbsp;

														<input style="width: 170px" type="text" id="endTime"
															name="endTime" class="Wdate"
															onfocus="WdatePicker({minDate:'#F{$dp.$D(\'startTime\');}',dateFmt:'yyyy-MM-dd'})" />
													</div>
												</div>
										</td>
									</tr>
									<tr>
										<td><label> <input type="radio" id="timeType"
												name="timeType" value="3" /> 下架
										</label></td>
									</tr>
								</table>
							</div>
						</div>
						<br>
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他信息：</h5>
						<hr>
						<div class="control-group">
							<label class="control-label">有无发票：</label>
							<div class="controls">
								<table>
									<tr>
										<td><label> 有<input type="radio" id="invoice"
												name="invoice" value="F" />
										</label></td>
										<td><label>无 <input type="radio" id="invoice"
												name="invoice" value="T" />
										</label></td>
									</tr>
								</table>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">是否提供保修：</label>
							<div class="controls">
								<table>
									<tr>
										<td><label> 是<input type="radio" id="afterRepair"
												name="afterRepair" value="F" />
										</label></td>
										<td><label>否<input type="radio" id="afterRepair"
												name="afterRepair" value="T" />
										</label></td>
									</tr>
								</table>
							</div>
						</div>

						<br> <input type="hidden" name="flavorsIds" id="flavorsIds">
						<c:if test="${user.companyId==254}">
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;口味选择：</h5>
							<hr>
							<div class="control-group" style="padding: 0 0 0 60px;">

								<table id="customizeFlavors">

								</table>
							</div>
							<br>
						</c:if>
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品标签：</h5>
						<hr>
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
						<div class="control-group" style="height: 68px;">
							<label class="control-label" style="height: 30px;">已选标签：</label>
							<input name="thirdCategoryTag" id="thirdCategoryTag"
								type="hidden">
							<div class="controls" id="choosenLabel" titie="labelstyle"
								style="height: 30px;"></div>
						</div>

						<div class="form-actions" style="height: 30px;">
							<button class="btn btn-warning" type="button"
								onclick="saveShop()" class="btn btn-success">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-warning" type="button"
								onclick="location.reload()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 遮罩层  -->
	<div id="white" class="white_content"
		style="padding: 30px 0px 0px 50px;">
		<div
			style="text-align: right; cursor: default; height: 40px; padding: 0px 20px 0px 0px;">
			<a href="#"><span style="font-size: 16px;"
				onclick="CloseDiv('white','black')"> <font color="orange">关闭
				</font></span></a>
		</div>
		<table>
			<tr>
				<td><label class="control-label">属性名称：</label></td>
				<td><input type="hidden" id="modifyNum">
					<div class="controls">
						<input type="text" id="attributeName" style="width: 250px;" />
					</div></td>
			</tr>
			<tr>
				<td><label class="control-label">属性特征：</label></td>
				<td>
					<div class="controls">
						<input type="text" id="attributeTrait" style="width: 250px;" />
					</div>
				</td>
			</tr>
		</table>
		<br> <br>
		<table>
			<tr>
				<td>
					<button class="btn btn-warning" type="button"
						onclick="saveFrom(this)">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
					<button class="btn btn-warning" type="button" onclick="clearFrom()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
				</td>
			</tr>
		</table>
	</div>
	<div id="black" class="black_overlay"></div>

	<!--  自定义遮罩层   -->
	<div id="definitionWhite" class="white_content"
		style="padding: 30px 0px 0px 50px;">
		<div
			style="text-align: right; cursor: default; height: 40px; padding: 0px 20px 0px 0px;">
			<a href="#"><span style="font-size: 16px;"
				onclick="CloseDiv('definitionWhite','definitionblack')"> <font
					color="orange">关闭 </font></span></a>
		</div>
		<table>
			<tr>
				<td><label class="control-label">属性名称：</label></td>
				<td>
					<div class="controls">
						<input type="text" id="definitionAttributeName"
							style="width: 250px;" />
					</div>
				</td>
			</tr>
			<tr>
				<td><label class="control-label">属性特征：</label></td>
				<td>
					<div class="controls">
						<input type="text" id="definitionAttributeTrait"
							style="width: 250px;" />
					</div>
				</td>
			</tr>
		</table>
		<br> <br>
		<table>
			<tr>
				<td>
					<button class="btn btn-warning" type="button"
						onclick="definitionSaveFrom()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
					<button class="btn btn-warning" type="button" onclick="clearFrom()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
				</td>
			</tr>
		</table>
	</div>
	<div id="definitionblack" class="black_overlay"></div>




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
	<script src="${ctx}/js/myself/json2.js"></script>
	<%--<script src="${ctx}/js/matrix.form_common.js"></script>  --%>
	<script>
		$('.textarea_editor').wysihtml5();
	</script>

	<jsp:include page="/common/buttom.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
	$(function() {

		//生成店铺编号  
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

		if ('${user.companyId}' == '254') {

			//口味
			$
					.ajax({
						type : "post",
						url : '${ctx}/product!CustomizeFlavors.action',
						dataType : 'json',
						timeout : 10000,
						success : function(msg, status) {
							if (msg.status == 200) {
								var array = [];
								for ( var i = 0; i < msg.rows.length; i++) {
									if (msg.rows[i]["parent_id"] == 0) {
										array
												.push("<tr><td><label calss='label'>"
														+ msg.rows[i]["name"]
														+ ':'
														+ "</label></td></tr>");
										for ( var h = 0; h < msg.rows.length; h++) {
											if (msg.rows[i]["append_id"] == msg.rows[h]["parent_id"]) {
												array
														.push("<td align='right'><label calss='label'>"
																+ msg.rows[h]["name"]
																+ "<input type='checkbox' value='"+msg.rows[h]["append_id"]+"'   /></label></td>");
											}
										}
										$('#customizeFlavors').html(
												array.join(''));
									}
								}
							}
						}
					});
		}

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
										.push('<li class="tag_content"	onclick="commonalityclassifyvalue(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="'
										+ msg.rows[i]["productCategoryId"]
										+ '">' + msg.rows[i]["Name"] + '</li>')
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
											'<td><img src="${http_img}'+ response.rows+'" width="100" height="100"/></td>')

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
	});
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
										+ '">' + msg.rows[i]["Name"] + '</li>')
							}
							$('#Thirdshoptag').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	function submit() {
		var labelValue = "";
		$("#choosenclassify").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";
		});
		$("#choosenclassifyvalue").val(labelValue);
		$("#basic_validate").submit();
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
												.push('<tr><td><input type="checkbox"  style="font-size: 15px" checked class="tdstyle"');
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
													.push('<td><input type="checkbox"  style="font-size: 15px" checked class="tdstyle"');
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
													.push('<td><input type="checkbox"  style="font-size: 15px" checked class="tdstyle"');
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
					})
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
	function saveShop() {
		//商品名称
		flag = true;
		var name = $.trim($("#name").val());
		if (name == "") {
			$("#name_check").html("不能为空！");
			flag = false;
		} else {
			$("#name_check").html("");
		}
		var arrayImage = [];
		$
				.each(
						$('#tr-img td'),
						function() {
							var path = $(this).find('img:last').attr('src');
							path = path
									.substr((path.lastIndexOf('${http_img}') + '${http_img}'.length));
							arrayImage.push(path);
						});
		if (arrayImage.length == 0) {
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

		//提交表单 
		$("#basic_validate").submit();
	}

	//放值
	var num = 0;
	function saveFrom(i) {
		var name = document.getElementById("attributeName").value;
		var trait = document.getElementById("attributeTrait").value;
		var str = new Array();
		str = trait.split(",");
		var selectStr = "";
		for ( var i = 0; i < str.length; i++) {
			selectStr = selectStr + "<option  value='"+str[i]+"'>" + str[i]
					+ "</option>"
		}
		selectedStr = "<select style='width: 223px;' name='addinput' >"
				+ selectStr + "</select>";
		var modifyNum = $("#modifyNum").val();
		if (modifyNum == "") {
			num = num + 1;
			$("#attrId")
					.append(
							"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><font size='4px'>"
									+ name
									+ ":"
									+ "</font></td><td>"
									+ selectedStr
									+ "</td><td><button class='btn btn-success btn-mini' type='button'  onclick='definitionAttribute(this)'  num="
									+ num
									+ ">自定义</button></td><td><button class='btn btn-info btn-mini' type='button' onclick='delAttribute(this)' >&nbsp;删&nbsp;&nbsp;除&nbsp;</button></td></tr><br>");
		} else {
			$("button[num=" + num + "]").parents("tr").find("font").html(
					$("#attributeName").val());
			$("button[num=" + num + "]").parents("tr").find(
					"input[name=addinput]").val($("#attributeTrait").val());
		}
		CloseDiv('white', 'black');
	}

	//打开遮罩层
	function startDiv(parameter) {
		clearFrom();
		document.getElementById('white').style.display = 'block';
		document.getElementById('black').style.display = 'block';
	}
	//关闭遮罩层
	function CloseDiv(show_div, bg_div) {
		document.getElementById(show_div).style.display = 'none';
		document.getElementById(bg_div).style.display = 'none';
	};
	//遮罩层内容  取消
	function clearFrom() {
		$('#attributeName').val("");
		$('#attributeTrait').val("");
	}

	//自定义遮罩层
	function definitionAttribute(attr) {
		document.getElementById('white').style.display = 'block';
		document.getElementById('black').style.display = 'block';
		$("#attributeName").val($(attr).parents("tr").find("font").html());
		$("#attributeTrait").val(
				$(attr).parents("tr").find("<option  selected ></option>")
						.val());
		$("#modifyNum").val($(attr).attr("num"));
	}

	//删除属性
	function delAttribute(attr) {
		$("#attributeName").val($(attr).parents("tr").remove());
	}
	//自定义放值
	function definitionSaveFrom() {
		var name = document.getElementById("definitionAttributeName").value;
		var trait = document.getElementById("definitionAttributeTrait").value;

		document.getElementById("definitionAddAttributeName").innerHTML = "<span><font size='4px'>"
				+ name + ":" + "</font></span>";

		$("#definitionAddAttributeValue")
				.append(
						"<input type='text' class='span11' style='width: 262px;'   id='addinput'  value='" + trait +"''/>");
		$("#definitionAddButton")
				.append(
						"<button class='btn btn-info btn-mini' type='button' >&nbsp;删&nbsp;&nbsp;除&nbsp;</button>");
	}

	var genProNum = 0;
	var attrObj = {};

	function generateProduct() {

		//if (!/^\d+\.\d+$/.test($("#price").val())){
		//	$('#span_price').html('请输入正确实售价!');
		//	return;
		//}
		//if (!/^\d+\.\d+$/.test($("#oldPrice").val())){
		//	$('#span_oldprice').html('请输入正确市场价!');
		//	return;
		//}

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
					var options = $(this).find("td:eq(2)>select option");

					var strOption = "";
					for ( var i = 0; i < options.length; i++) {
						strOption = strOption + $(options[i]).val() + ',';
					}
					attrObj[$(this).find("td:eq(1)>font").html()] = strOption
							.substr(0, strOption.length - 1);
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
								+ "</td><td> <a href='#' onclick='delGenPro(this)'>删除</td></tr>");
	}

	function delGenPro(pro) {
		genProNum = genProNum - 1;
		$(pro).parents("tr").remove();
	}
</script>