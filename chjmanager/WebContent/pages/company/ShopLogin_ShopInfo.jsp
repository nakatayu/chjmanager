<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>服务供应商维护</title>
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
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<style type="text/css">
.tag_content {
	margin: 0px;
	padding: 2px 0 2px 0;
	list-style: none;
	line-height: 20px;
	font-size: 15px;
}

.shop_announcement {
	width: 486px;
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
					href="${ctx}/pages/company/ShopList.jsp" title="店铺设置"
					class="tip-bottom"><i class="icon-home"></i> 店铺设置</a> <a href="#"
					class="current">店铺详情</a>
			</div>
		</div>
		<div style="margin-left: 10px;"> <h3>${shop.name}</h3></div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>详细信息</h5>
						</div>

						<div class="widget-content nopadding">
							<form class="form-horizontal" method="post"
								action="${ctx}/shop!updateShopInfoSave.action"
								name="basic_validate" id="basic_validate">
								<input name="shopId" id="shopId" type="hidden"
									value="${shop.company_shop_id }" />
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
											name="categoryId" id="categoryId" type="hidden">
										<div class="controls" id="delchoosenclassify"
											titie="labelstyle">
											
											<c:if test="${shop.category_name!=null}">
											<span value="${shop.category_id}">${shop.category_name}</span>
											<a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>
										</c:if>
										
											</div>
									</div>
							

<br>
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息：</h5>
								<hr>
						<table>
										<tr>
												<td>
												  			<div id="form-wizard-1" class="step">
															<div class="control-group">
																<label class="control-label">店铺编号：</label>
																<div class="controls">
																	<input id="shopNumber" name="shopNumber" type="text"
																		style="width: 254px;" readonly="readonly"
																		value="${shop.shop_number}" /> <span><font
																		color="red" id="shopNumber_check"> </font></span>
																</div>
															</div>
														</div>	
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
												</td>
												<td></td>
												<td  rowspan="7" align=center>
																	<div
																		style="width: 150px; height: 280px; margin: 10px 0 0 30px; border: 1px solid #ccc; float: center;">
																		<img style="width: 150px; height: 160px;" id="imgCompany"
																			src="${http_img}${shop.logo}" /> <input type="hidden"
																			id="uploadUrl" name="logo"> <br />
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		&nbsp;&nbsp;&nbsp;&nbsp;<br /> <br /> <br />
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		&nbsp;&nbsp;&nbsp;&nbsp;
																		<button id="uploadButton" class="btn btn-primary"
																			style="background: #339999">浏&nbsp;&nbsp;&nbsp;&nbsp;览</button>
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	</div>
												</td>
										</tr>
											<tr>
												<td>	
															<div id="form-wizard-1" class="step">
																<div class="control-group">
																	<label class="control-label">店铺名称：</label>
																	<div class="controls">
																		<input id="name" name="name" style="width: 254px;"
																			onblur="nameOnBlur()" value="${shop.name}" type="text" />
																		<span><font color="red" id="name_check"> </font></span>
																	</div>
																</div>
															</div>
												</td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>	
															<div class="control-group">
																	<label class="control-label">支持外送：</label>
																	<div class="controls">
																				<table>
																					<tr>
																						<td>
																								<label> 是 <c:if test="${shop.deliver_ok=='T'}">
																														<input type="radio" id="deliverOk" name="deliverOk"
																															value="T" checked />
																													</c:if> 
																													<c:if test="${shop.deliver_ok != 'T' }">
																														<input type="radio" id="deliverOk" name="deliverOk"
																															value="T" />
																													</c:if>
																											</label>
																									</td>
																									<td>
																										<label> 否 <c:if test="${shop.deliver_ok == 'F' }">
																															<input type="radio" id="deliverOk" name="deliverOk"
																																value="F" checked />
																														</c:if> 
																														<c:if test="${shop.deliver_ok != 'F'}">
																															<input type="radio" id="deliverOk" name="deliverOk"
																																value="F" />
																														</c:if>
																											</label>
																									</td>
																							</tr>
																						</table>
																	</div>
																</div>
												</td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>	
															<div class="control-group">
																<label class="control-label">终端设备自动接收订单：</label>
																<div class="controls">
																	<table>
																		<tr>
																			<td>
																			    <label> 是 
																			         <c:if test="${shop.terminal_ok=='T'}">
																						<input type="radio" id="terminalOk" name="terminalOk" checked
																						 value="T" />
																					</c:if> 
																					<c:if test="${shop.terminal_ok!='T'}">
																						<input type="radio" id="terminalOk" name="terminalOk"  
																						value="T"/>
																					</c:if>
																			    </label>
																			</td>
																			<td><label> 否 <c:if
																						test="${shop.terminal_ok=='F'}">
																						<input type="radio" id="terminalOk" name="terminalOk"
																							value="F"  checked />
																					</c:if> 
																					<c:if test="${shop.terminal_ok!='F'}">
																						<input type="radio" id="terminalOk" name="terminalOk"
																							value="F" />
																					</c:if>
																			</label></td>
																		</tr>
																	</table>
																</div>
															</div>
												</td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>	
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																<label class="control-label">联系人：</label>
																<div class="controls">
																	<input id="linkman" type="text" name="linkman"
																		onblur="linkmanOnBlur()" value="${shop.linkman}"
																		style="width: 254px;" /> <span><font color="red"
																		id="linkman_check"> </font></span>
																</div>
															</div>
														</div>	
												</td>
												<td></td>
												<td></td>
												<td></td>
											</tr>	
								</table>
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">联系人号码：</label>
													<div class="controls">
														<input id="linkmanTel" type="text" name="linkmanTel"
															onblur="linkmanTelOnBlur()" value="${shop.linkman_tel}"
															style="width: 254px;" /> <span><font color="red"
															id="linkmanTel_check"> </font></span>
													</div>
												</div>
											</div>
												<div class="control-group">
													<label class="control-label">起送费：</label>
													<div class="controls">
														<div class="input-append">
															<input type="text" placeholder=""
																onblur="sendpriceOnBlur()" value="${shop.send_price}"
																style="width: 253px;" id="sendPrice" name="sendPrice">
														</div>
														<span><font color="red" id="sendPrice_check">
														</font></span>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label">外送费：</label>
													<div class="controls">
														<div class="input-append">
															<input type="text" placeholder=""
																onblur="deliverMoneyOnBlur()" style="width: 253px;"
																id="deliverMoney" value="${shop.deliver_money}"
																name="deliverMoney">
														</div>
														<span><font color="red" id="deliverMoney_check">
														</font></span>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label">人均消费：</label>
													<div class="controls">
														<div class="input-append">
															<input type="text" placeholder=""
																onblur="consumptionPerOnBlur()" style="width: 253px;"
																id="consumptionPer" value="${shop.consumption_per}"
																name="consumptionPer">
														</div>
														<span><font color="red" id="consumptionPer_check">
														</font></span>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label">送达时间：</label>
													<div class="controls">
														<select style="width: 268px;" name="sendTime"
															onchange="aaaa()">

															<c:if test="${shop.send_time==-1}">
																<option value="-1" selected>--请选择--</option>
															</c:if>
															<c:if test="${shop.send_time!=-1}">
																<option value="-1">--请选择--</option>
															</c:if>
															<c:if test="${shop.send_time==1}">
																<option id="sendTime" value="1" selected>15分钟</option>
															</c:if>
															<c:if test="${shop.send_time!=1}">
																<option id="sendTime" value="1">15分钟</option>
															</c:if>
															<c:if test="${shop.send_time==2}">
																<option id="sendTime" value="2" selected>30分钟</option>
															</c:if>
															<c:if test="${shop.send_time!=2}">
																<option id="sendTime" value="2">30分钟</option>
															</c:if>
															<c:if test="${shop.send_time==3}">
																<option id="sendTime" value="3" selected>1小时</option>
															</c:if>
															<c:if test="${shop.send_time!=3}">
																<option id="sendTime" value="3">1小时</option>
															</c:if>
														</select>
													</div>
												</div>



												<div class="control-group">
													<label class="control-label">支付方式：</label>
													<div class="controls" id="payTypeId" name="payType"
														value="${shop.pay_type}">
														<table>
															<tr>
																<label id="payTypeId1"> <input type="checkbox"
																	name="payType" value="1" /> 到店支付
																</label>
															</tr>
															<tr>
																<label id="payTypeId2"> <input type="checkbox"
																	name="payType" value="2" /> 货到付款（现金）
																</label>
															</tr>
															<tr>
																<label id="payTypeId3"> <input type="checkbox"
																	name="payType" value="3" /> 货到付款(一卡通)
																</label>
															</tr>
															<tr>
																<label id="payTypeId4"> <input type="checkbox"
																	name="payType" value="4" /> 货到付款(银行卡)
																</label>
															</tr>
															<tr>
																<label id="payTypeId5"> <input type="checkbox"
																	name="payType" value="5" /> 线上支付(一卡通)
																</label>
															</tr>
															<tr>
																<label id="payTypeId6"> <input type="checkbox"
																	name="payType" value="6" /> 线上支付(银行卡)
																</label>
															</tr>
														</table>
													</div>
												</div>



												<div class="control-group">
													<label class="control-label">服务范围：</label>
													<div class="controls">
														<input type="hidden" id="thirdServiceArea"
															name="thirdServiceArea"> <select
															style="width: 265px;" name="type" id="area"
															onclick="scopeofservices(this)">
															<option selected value=-1>--请选择--</option>
														</select>
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<table>
															<tr id="secondAreaId">
															</tr>
														</table>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">园区名称：</label>
													<div class="controls">
														<table id="thirdAreaId"></table>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label">营业时间：</label>
													<div class="controls">
														<div class="input-append">
															<input type="text" placeholder="" class="span11"
																onblur="workTimeOnBlur()" style="width: 262px;"
																id="workTime" value="${shop.work_time}" name="workTime">
														</div>
														<span><font color="red" id="workTime_check">
														</font></span>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">外送时间：</label>
													<div class="controls">
														<div class="input-append">
															<input type="text" placeholder="" class="span11"
																style="width: 262px;" id="serviceTime"
																onblur="serviceTimeOnBlur()" name="serviceTime">
															<button type="button" style="margin: 4px 4px 4px 4px"
																onclick="addServiceTime()">+</button>
															<button onclick="delServiceTime()" type="button">-</button>
														</div>
														<span><font color="red" id="serviceTime_check1"
															name="serviceTime_check"> </font></span>
													</div>

													<div id="addServiceTimeId"></div>
												</div>

												<div class="control-group">
													<label class="control-label">店铺经度：</label>
													<div class="controls">
														<div class="input-append">
															<input type="text" placeholder=" " class="span11"
																style="width: 262px;" id="lng" value="${shop.lng}"
																name="lng">
														</div>
														<span><font color="red" id="lng_check"> </font></span>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">店铺纬度：</label>
													<div class="controls">
														<div class="input-append">
															<input type="text" placeholder=" " class="span11"
																value="${shop.lat}" style="width: 262px;" id="lat"
																name="lat">

														</div>
														<span><font color="red" id="lat_check"></font></span>
													</div>
												</div>

												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">店铺地址：</label>
														<div class="controls">
															<select id="detailedAddress" name="areaId"
																style="width: 160px;" onclick="addressStreet(this)">
																<option value=-1>--请选择--</option>
																<c:set var="shopAreaId" value="${shop.area_id }"
																	scope="request" />
																<c:forEach items="${areaList }" var="area">
																	<c:choose>
																		<c:when test="${area.areaId==shopAreaId}">
																			<option class="tag_content" selected
																				value="${area.areaId}">${area.areaName}</option>
																		</c:when>
																		<c:otherwise>
																			<option class="tag_content" value="${area.areaId}">${area.areaName}</option>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</select> 
															<input type="text" id="address" style="width: 322px;" name="address" value="${shop.address}">
														</div>
													</div>
													<div class="shop_announcement">
														<label class="control-label">店铺介绍：</label>
														<div class="controls" style="height: 100px">
															<textarea name="content"
																onblur="contentOnBlur()" class="shop_announcement"
																style="height: 100px" id="content11"> ${shop.content} </textarea>
															<span><font color="red" id="content_check">
															</font></span>
														</div>
													</div>
												</div>
											<br>
											<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品标签：</h5>
											<hr>
											<table>
												<tr>
													<td></td>
													<td align="left" valign="bottom"
														style="height: 15px; font-size: 15px; padding: 10px;">标签分类：</td>
													<td align="left" valign="bottom"
														style="height: 15px; font-size: 15px; padding: 10px;">标签名称：</td>
												</tr>
												<tr>
													<td style="width: 10%"></td>
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
												<label class="control-label" style="height: 30px;">已选标签：</label> <input
													name="thirdCategoryTag" id="thirdCategoryTag" type="hidden">
												<div class="controls" id="choosenLabel" titie="labelstyle" style="height: 30px;">
												         <c:forEach items="${shopTag }" var="tag">
															<span value="${tag.tag_id}">${tag.tag_name}</span>
															<a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>
														</c:forEach>
												</div>
											</div>
												<div class="form-actions">
													<button class="btn btn-warning" type="button"
														onclick="saveShop()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button class="btn btn-warning" type="button"
														onclick="location.reload()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
											</div>
							</form>
						</div>
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
			<script src="${ctx}/js/bootstrap-datepicker.js"></script>
			<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
			<script src="${ctx}/js/jquery.peity.min.js"></script>
			<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
			<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
			<script src="${ctx}/js/masked.js"></script>
			<script src="${ctx}/js/myself/ajaxupload.js"></script>
			<script>
				$('.textarea_editor').wysihtml5();
			</script>
			<jsp:include page="/common/buttom.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
var shopId="${shop.company_shop_id }";
	$(function() {
		var payType = "${shop.pay_type}";
		if (payType != "") {
			var strs = new Array(); //定义一数组 
			strs = payType.split(","); //字符分割 
			var flag1 = false;
			var flag2 = false;
			var flag3 = false;
			var flag4 = false;
			var flag5 = false;
			var flag6 = false;
			for (var i = 0; i < strs.length; i++) {
				if (strs[i] == 1) {
					flag1 = true;
				} else if (strs[i] == 2) {
					flag2 = true;
				} else if (strs[i] == 3) {
					flag3 = true;
				} else if (strs[i] == 4) {
					flag4 = true;
				} else if (strs[i] == 5) {
					flag5 = true;
				} else if (strs[i] == 6) {
					flag6 = true;
				}
			}
			//alert(flag1+flag2+flag3+flag4+flag5+flag6);
			$("#payTypeId1").html("");
			$("#payTypeId2").html("");
			$("#payTypeId3").html("");
			$("#payTypeId4").html("");
			$("#payTypeId5").html("");
			$("#payTypeId6").html("");
			if (flag1 == true) {
				$("#payTypeId1")
						.append(
								" <input type='checkbox'  name='payType' checked  value='1'  /> 到店支付");
			} else {
				$("#payTypeId1")
						.append(
								"<input type='checkbox'  name='payType' value='1'  /> 到店支付");
			}
			if (flag2 == true) {
				$("#payTypeId2")
						.append(
								" <input type='checkbox'  name='payType' checked  value='2'  />货到付款（现金）");
			} else {
				$("#payTypeId2")
						.append(
								" <input type='checkbox'  name='payType' value='2'  /> 货到付款（现金）");
			}
			if (flag3 == true) {
				$("#payTypeId3")
						.append(
								"<input type='checkbox'  name='payType' checked  value='3'  />  货到付款(一卡通)");
			} else {
				$("#payTypeId3")
						.append(
								"<input type='checkbox'  name='payType' value='3'  />  货到付款(一卡通)");
			}
			if (flag4 == true) {
				$("#payTypeId4")
						.append(
								"<input type='checkbox'  name='payType' checked  value='4'  />  货到付款(银行卡)");
			} else {
				$("#payTypeId4")
						.append(
								"<input type='checkbox'  name='payType' value='4'  />  货到付款(银行卡)");
			}
			if (flag5 == true) {
				$("#payTypeId5")
						.append(
								"<input type='checkbox'  name='payType' checked  value='5'  /> 线上支付(一卡通)");
			} else {
				$("#payTypeId5")
						.append(
								"<input type='checkbox'  name='payType' value='5'  /> 线上支付(一卡通)");
			}
			if (flag6 == true) {
				$("#payTypeId6")
						.append(
								"<input type='checkbox'  name='payType' checked  value='6'  /> 线上支付(银行卡)");
			} else {
				$("#payTypeId6")
						.append(
								"<input type='checkbox'  name='payType' value='6'  /> 线上支付(银行卡)");
			}
		}

		//地址标签
		$.ajax({
			type : "post",
			url : '${ctx}/area!findDetailedAddress.action',
			dataType : 'json',
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					var array = [];
					array.push('<option  selected value=-1>--请选择--</option> ');
					for ( var i = 0; i < msg.rows.length; i++) {
						array.push('<option   class="tag_content"  ');
						array.push('	 value="' + msg.rows[i]["areaId"] + '">'
								+ msg.rows[i]["areaName"] + '</option>');
						$("#detailedAddress").data(
								"'" + msg.rows[i]["areaId"] + "'",
								msg.rows[i]["detailedAddress"] + "#"
										+ msg.rows[i]["lat"] + "#"
										+ msg.rows[i]["lng"]);
					}
					$('#lat').html(array.join(''));
					$('#lng').html(array.join(''));
					$('#detailedAddress').html(array.join(''));

				} else
					alert(msg.msg);
			}
		});

		// 创建AJAX方式上传文件
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload($uploadBtn,
				{
					action : '${ctx}/user!uploadImage.action',
					name : 'upfile',
					responseType : 'json',
					onSubmit : function(file, ext) {
						//ext 文件后缀
					},
					onComplete : function(file, response) {
						if (response.status == 200) {
							$("#uploadUrl").val(response.rows);
							$("#imgCompany").attr("src",
									"${http_img}" + response.rows);
							// alert($("#imgCompany").attr("src","${http_img}"+response.rows));
						} else {
							alert(response.msg);
						}
					}
				});

		//标签分类 1级 
		$.ajax({
					type : "post",
					url : '${ctx}/tag!findTagSecondList.action',
					dataType : 'json',
					//      data :{tagId:tagid},   
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
		//公共分类 1级 
		$.ajax({
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
						//alert(msg.rows[i]["areaName"]);
						array.push('<option    class="tag_content"');
						array.push('	 value="' + msg.rows[i]["areaId"] + '">'
								+ msg.rows[i]["areaName"] + '</option>');
					}
					$('#area').html(array.join(''));
				} else
					alert(msg.msg);
			}
		});

		//服务时间 	
		var serviceTime = "${shop.service_time}";
		if (serviceTime != "") {
			var str = new Array();
			str = serviceTime.split(",");
			for ( var i = 0; i < str.length; i++) {
				if (i == 0) {
					$("#serviceTime").val(str[i]);
				} else {
					$("#addServiceTimeId")
							.append(
									"<div class='controls'><div class='input-append'><input type='text' class='span11'style='width: 262px;'  name='serviceTime' value="+str[i]+"> </div></div>");
				}
			}
		}
	});

	//标签名称  2级
	function tagname(li) {
		var tagid = $(li).attr("value");
		$.ajax({
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

	var count = 0;
	function selected(li) {
		count = $("#choosenLabel").find("span").length;
		if (count > 5) {
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
		$(li).prev().remove();
		$(li).remove();
	}

	//分类名称  2级 
	function commonalityclassifyvalue(li) {
		var shoptag = $(li).attr("value");
		$.ajax({
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

	function submit() {
		var labelValue = "";
		$("#choosenclassify").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";
		});
		$("#choosenclassifyvalue").val(labelValue);
		$("#basic_validate").submit();
	}

	function shoptag(li) {//标签替换 
		$("#delchoosenclassify").html("");
		$("#delchoosenclassify")
				//已选分类 
				.append(
						"<span  class='tdstyle'  value="
								+ $(li).attr("value")
								+ ">"
								+ $(li).text()
								+ "</span><a href='javascript:void(0)' class='tdstyle'  onclick='delchoosenclassify(this)'>[X]&nbsp;&nbsp;</a>");
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
				$(this).parent('td').css({"font-weight": "normal","color":"black"});
			});
		} else {
			$("#thirdAreaId").find("input[type=checkbox]").each(function() {
				if ($(this).attr("parentId") == secondAreaId) {
					$(this).parent('td').css({"font-weight": "bold","color":"red"});
				} else {
					$(this).parent('td').css({"font-weight": "normal","color":"black"});
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
			$.ajax({
						type : "post",
						url : '${ctx}/area!findShopSecondArea.action',
						dataType : 'json',
						data : {
							areaId : areaId,shopId:shopId
						},
						timeout : 10000,
						success : function(msg, status) {
							if (msg.status == 200) {
								var array = [];
								array
										.push('<td><label><input type="radio"	name="secondArea" checked onclick="chooseArea(this)" ');
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
									//	alert(msg.total[i]["areaId"]);
									
									var nums=msg.total[i]["nums"];
										var str='';
										if(nums!=null){
											str=' checked="checked" ';
										}
																			
									rowTr = rowTr + 1;
									if (rowTr % 4 == 0) {
										columnTd = 1;
										thirdAreaArray
												.push('<tr><td><input type="checkbox"  style="font-size: 15px" class="tdstyle"');
										
										thirdAreaArray.push(str);
										thirdAreaArray.push(' parentId="'
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
													.push('<td><input type="checkbox"  style="font-size: 15px" class="tdstyle"');
											
											thirdAreaArray.push(str);
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
													.push('<td><input type="checkbox"  style="font-size: 15px" class="tdstyle"');
											
											thirdAreaArray.push(str);
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

	//地址输入框
	function addressStreet(opt) {
		var detailedAddress = $(opt).find("option:selected").val();
		if (detailedAddress == -1) {
			$('#address').val("");

		} else {
			var address = $("#detailedAddress").data(
					"'" + detailedAddress + "'");
			//	alert(address);
			var str = new Array();
			str = address.split("#");
			//	alert(str);
			$("#address").val(str[0]);
			$("#lat").val(str[1]);
			$("#lng").val(str[2]);
			if ($("#lat").val(str[1])) {
				$("#lat_check").html("");
			}
			if ($("#lng").val(str[1])) {
				$("#lng_check").html("");
			}
		}
	}

	var reg = new RegExp("^[0-9--]*$");
	var reg1 = new RegExp("[\u4e00-\u9fa5]"); //中文 字母
	var reg2 = new RegExp("[A-Za-z0-9\u0391-\uffe5]"); // 中文 字母 数字 
	var reg4 = new RegExp("^[1-9]d*.d*|0.d*[1-9]d*$");//正浮点数 
	//店铺编号验证 
	function shopNumberOnBlur() {
		var shopNumber = $.trim($("#shopNumber").val());
		if (shopNumber == "") {
			$("#shopNumber_check").html("不能为空！");
		} else if (!reg.test(shopNumber)) {
			$("#shopNumber_check").html("只能为数字!");
		} else if ($.trim($("#shopNumber").val().length) > 15) {
			$("#shopNumber_check").html("长度不能超过15个字符!");
		} else {
			$("#shopNumber_check").html("");
		}
	}
	//店铺名称 
	function nameOnBlur() {
		var name = $.trim($("#name").val());
		if (name == "") {
			$("#name_check").html("不能为空！");
		} else if ($.trim($("#name").val().length) > 50) {
			$("#name_check").html("长度不能超过50个字符!");
		} else {
			$("#name_check").html("");
			var badChar = "`~!@#$,%，*^&\\\\|:;\"\\\'<,>?/";
			for ( var i = 0; i < name.length; i++) {
				//字符串str中的字符
				var c = name.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#name_check").html("只能为汉字，字母，和数字！");
				}
			}
		}
	}
	//联系人 
	function linkmanOnBlur() {
		var linkman = $.trim($("#linkman").val());
		if (linkman == "") {
			$("#linkman_check").html("不能为空！");
		} else if ($.trim($("#linkman").val().length) > 20) {
			$("#linkman_check").html("长度不能超过20个字符!");
		} else if (!reg2.test(linkman)) {
			$("#linkman_check").html("只能为汉字，字母！ ");
		} else {
			$("#linkman_check").html("");
			var badChar = "`~!@#$%^&()-_=+]\\\\|:;\"\\\'<,>?*0/123456789";
			for ( var i = 0; i < linkman.length; i++) {
				//字符串str中的字符
				var c = linkman.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#linkman_check").html("只能为汉字，字母！");
				}
			}
		}
	}
	//人均消费
	function consumptionPerOnBlur() {
		var consumptionPer = $.trim($("#consumptionPer").val());
		if (!reg.test(consumptionPer)) {
			$("#consumptionPer_check").html("只能为数字!");
		} else if ($.trim($("#consumptionPer").val().length) > 9) {
			$("#consumptionPer_check").html("长度不能超过9个字符!");
		} else {
			$("#consumptionPer_check").html("");
		}
	}

	//起送费
	function sendpriceOnBlur() {
		var sendPrice = $.trim($("#sendPrice").val());
		if (!reg.test(sendPrice)) {
			$("#sendPrice_check").html("只能为数字!");
		} else if ($.trim($("#sendPrice").val().length) > 9) {
			$("#sendPrice_check").html("长度不能超过9个字符!");
		} else {
			$("#sendPrice_check").html("");
		}
	}

	//外送费
	function deliverMoneyOnBlur() {
		var deliverMoney = $.trim($("#deliverMoney").val());
		if (!reg.test(deliverMoney)) {
			$("#deliverMoney_check").html("只能为数字!");
		} else if ($.trim($("#deliverMoney").val().length) > 9) {
			$("#deliverMoney_check").html("长度不能超过9个字符!");
		} else {
			$("#deliverMoney_check").html("");
		}
	}
	//联系人电话 
	function linkmanTelOnBlur() {
		var linkmanTel = $.trim($("#linkmanTel").val());
		if (linkmanTel == "") {
			$("#linkmanTel_check").html("不能为空！");
		} else if (!reg.test(linkmanTel)) {
			$("#linkmanTel_check").html("只能为数字!");
		} else if ($.trim($("#linkmanTel").val().length) > 15) {
			$("#linkmanTel_check").html("长度不能超过15个字符!");
		} else {
			$("#linkmanTel_check").html("");
		}
	}

	//店铺内容
	function contentOnBlur(){
		/*var content11 = $.trim($("#content11").val());*/
		if ($.trim($("#content11").val().length) > 500) {
			$("#content_check").html("不能超过500个字符！");
		} else {
			$("#content_check").html("");
		}
	}

	//纬度
	function latOnBlur() {
		var lat = $.trim($("#lat").val());
		if (lat == "") {
			$("#lat_check").html("不能为空！");
		} else if (!reg4.test(lat)) {
			$("#lat_check").html("请输入正确的纬度，如：123");
		} else if ($.trim($("#lat").val().length) > 26) {
			$("#lat_check").html("长度不能超过26个字符!");
		} else {
			$("#lat_check").html("");
		}
	}

	//经度 
	function lngOnBlur() {
		var lng = $.trim($("#lng").val());
		if (lng == "") {
			$("#lng_check").html("不能为空！");
		} else if (!reg4.test(lng)) {
			$("#lng_check").html("请输入正确的经度，如：123");
		} else if ($.trim($("#lng").val().length) > 26) {
			$("#lng_check").html("长度不能超过26个字符!");
		} else {
			$("#lng_check").html("");
		}
	}

	//营业时间 
	function workTimeOnBlur() {
		var workTime = $.trim($("#workTime").val());
		if ($.trim($("#workTime").val().length) > 50) {
			$("#workTime_check").html("长度不能超过50个字符!");
		} else if (workTime == "") {
			$("#workTime_check").html("");
		} else if (!reg2.test(workTime)) {
			$("#workTime_check").html("只能输入汉字,字母和数字!");
		} else {
			$("#workTime_check").html("");
			var badChar = "`~!@#$%^()_=+]\，\,\\|;\"\\\'<,>?*,，,，。.;/";
			for ( var i = 0; i < workTime.length; i++) {
				//字符串str中的字符
				var c = workTime.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#workTime_check").html(
							"可以使用&进行分隔，如：上午08:00-12:00&下午14:00-20:00");
				}
			}
		}
	}

	//服务时间 
	function serviceTimeOnBlur() {
		var serviceTime = $.trim($("#serviceTime").val());
		if ($.trim($("#serviceTime").val().length) > 50) {
			$("#serviceTime_check1").html("长度不能超过50个字符!");
		} else if (serviceTime == "") {
			$("#serviceTime_check1").html("");
		} else if (!reg2.test(serviceTime)) {
			$("#serviceTime_check1").html("只能输入汉字,字母和数字!");
		} else {
			$("#serviceTime_check1").html("");
			var badChar = "`~!@#$%^()_=+]\，\,\\|;\"\\\'<,>?*,，,，。.;/";
			for ( var i = 0; i < serviceTime.length; i++) {
				//字符串str中的字符
				var c = serviceTime.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#serviceTime_check1").html(
							"可以使用&进行分隔，如：上午08:00-12:00&下午14:00-20:00");
				}
			}
		}
	}

	//服务时间增加
	var serviceTimeFlag = true;
	function addServiceTimeIdOnBlur(opt) {
		var addserviceTime = $.trim($(opt).val());

		if (addserviceTime.length > 50) {
			$(opt).parent("div.input-append").next().find(
					"font[name=addserviceTime_check]").html("长度不能超过50个字符!");
		} else if (addserviceTime == "") {
			$(opt).parent("div.input-append").next().find(
					"font[name=addserviceTime_check]").html("");
		} else {
			$(opt).parent("div.input-append").next().find(
					"font[name=addserviceTime_check]").html("");
			var badChar = "`~!@#$%^()_=+]\，\,\\|;\"\\\'<,>?*,，,，。.;/";
			for ( var i = 0; i < addserviceTime.length; i++) {
				//字符串str中的字符
				var c = addserviceTime.charAt(i);
				if (badChar.indexOf(c) > -1) {
					//alert($(opt).parent("div.input-append").next().find("font[name=addserviceTime_check]").html());
					$(opt).parent("div.input-append").next().find(
							"font[name=addserviceTime_check]").html(
							"可以使用&进行分隔，如：上午08:00-12:00&下午14:00-20:00");
					break;
				}
			}
		}
	}

	function saveShop() {
		flag = true;
		$("font[name=serviceTime_check]").each(function() {
			if ($.trim($(this).html()) != "") {
				flag = false;
			}
		});
		//店铺编号
		var shopNumber = $.trim($("#shopNumber").val());
		if (shopNumber == "") {
			$("#shopNumber_check").html("不能为空！");
			flag = false;
		} else if (!reg.test(shopNumber)) {
			$("#shopNumber_check").html("只能为数字!");
			flag = false;
		}

		//人均消费
		var consumptionPer = $.trim($("#consumptionPer").val());
		if (consumptionPer == "") {
			$("#consumptionPer_check").html("不能为空！");
		} else if (!reg.test(consumptionPer)) {
			$("#consumptionPer_check").html("只能为数字!");
		} else if ($.trim($("#consumptionPer").val().length) > 9) {
			$("#consumptionPer_check").html("长度不能超过9个字符!");
		} else {
			$("#consumptionPer_check").html("");
		}

		//店铺名称 
		var name = $.trim($("#name").val());
		if (name == "") {
			$("#name_check").html("不能为空！");
			flag = false;
		} else if (!reg2.test(name)) {
			$("#shopNumber_check").html("只能为汉字，字母，和数字！");
			flag = false;
		}
		//联系人 
		var linkman = $.trim($("#linkman").val());
		if (linkman == "") {
			$("#linkman_check").html("不能为空！");
			flag = false;
		} else if (!reg2.test(linkman)) {
			$("#linkman_check").html("只能为汉字，字母！");
			flag = false;
		}

		//联系人电话
		var linkmanTel = $.trim($("#linkmanTel").val());
		if (linkmanTel == "") {
			$("#linkmanTel_check").html("不能为空！");
			flag = false;
		} else if (!reg.test(linkmanTel)) {
			$("#linkmanTel_check").html("只能为数字!");
			flag = false;
		}
		//纬度 
		var lat = $.trim($("#lat").val());
		if (lat == "") {
			$("#lat_check").html("不能为空！");
			flag = false;
		} else if (!reg4.test(lat)) {
			$("#lat_check").html("只能为数字!");
			flag = false;
		}
		//经度 
		var lng = $.trim($("#lng").val());
		if (lng == "") {
			$("#lng_check").html("不能为空！");
			flag = false;
		} else if (!reg4.test(lng)) {
			$("#lng_check").html("只能为数字!");
			flag = false;
		}
		//服务时间增加
		function addServiceTimeIdOnBlur(opt) {
			var addserviceTime = $.trim($(opt).val());
			if (addserviceTime.length > 50) {
				$(opt).parent("div.input-append").next().find(
						"font[name=addserviceTime_check]").html("长度不能超过50个字符!");
			} else if (addserviceTime == "") {
				$(opt).parent("div.input-append").next().find(
						"font[name=addserviceTime_check]").html("");
			} else {
				$(opt).parent("div.input-append").next().find(
						"font[name=addserviceTime_check]").html("");
				var badChar = "`~!@#$%^()_=+]\，\,\\|;\"\\\'<,>?*,，,，。.;/";
				for ( var i = 0; i < addserviceTime.length; i++) {
					//字符串str中的字符
					var c = addserviceTime.charAt(i);
					if (badChar.indexOf(c) > -1) {
						//alert($(opt).parent("div.input-append").next().find("font[name=addserviceTime_check]").html());
						$(opt).parent("div.input-append").next().find(
								"font[name=addserviceTime_check]").html(
								"可以使用&进行分隔，如：上午08:00-12:00&下午14:00-20:00");
						break;
					}
				}
			}
		}

		//以上匹配后执行       
		if (flag != false) {
			//已选标签
			var labelValue = "";
			$("#choosenLabel").find("span").each(function() {
				labelValue = labelValue + $(this).attr("value") + ",";
			});
			$("#thirdCategoryTag").val(labelValue);
			//已选分类
			var label = "";
			$("#delchoosenclassify").find("span").each(function() {
				label = label + $(this).attr("value");
			});
			$("#categoryId").val(label);
			//园区名称 
			var serviceArea = "";
			$("#thirdAreaId").find("input[type=checkbox]:checked").each(
					function() {
						serviceArea = serviceArea + $(this).val() + ",";
					});
			$("#thirdServiceArea").val(serviceArea);
			
			$("#basic_validate").submit();
		}
	}

	function addServiceTime() {
		if ($("#addServiceTimeId").find('.controls').length > 2) {
			alert("最多可以加3个时间框！");
			return;
		}
		$("#addServiceTimeId")
				.append(
						"<div class='controls'><div class='input-append'><input type='text' class='span11' style='width: 262px;'  name='serviceTime' onblur='addServiceTimeIdOnBlur(this)'  id='addserviceTime'> </div><span><font color='red'  name='addserviceTime_check'> </font></span></div>");
	}

	function delServiceTime() {
		$("#addServiceTimeId").find("div[class=controls]:last").remove();
	}
</script>
