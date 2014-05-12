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
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="${ctx}/xheditor/common.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="${ctx}/js/dialog/dialog_subModal.css" />
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
					href="${ctx}/pages/company/ShopList.jsp" title="店铺列表"
					class="current"><i class=" icon-magic"></i> 店铺列表</a> <a href="#"
					class="current">修改店铺</a>
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

					<div class="widget-content nopadding form-horizontal"
						style="font-size: 14px;">
						<div id="form-wizard-1" class="step">
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息：</h5>
							<hr>
							<table width="100%">
								<tr>
									<td width="700px">

										<div class="control-group">
											<label class="control-label">店铺编号：</label>
											<div class="controls">${shop.shop_number}</div>

										</div>

										<div class="control-group">
											<label class="control-label">店铺名称：</label>
											<div class="controls">${shop.name}</div>
										</div>

										<div class="control-group">
											<label class="control-label">店铺类型：</label>
											<div class="controls">
												<c:forEach items="${shopTypeList}" var="type">
													<c:if
														test="${type.company_shop_category_id==shop.category_id}">
																	${type.name}
																</c:if>
												</c:forEach>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">店铺状态：</label>
											<div class="controls">
												<c:if
													test="${shop.deliver_ok=='T'||shop.deliver_ok == 'TZ'}">
																			支持外送
																		</c:if>
												<c:if
													test="${shop.deliver_ok == 'F'||shop.deliver_ok == 'FZ'}">
																			服务展示
																		</c:if>
												<c:if
													test="${shop.deliver_ok == 'L'||shop.deliver_ok == 'LZ'}">
																			在线预订
																		</c:if>												
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">联系人：</label>
											<div class="controls">${shop.linkman}</div>
										</div>
										<div class="control-group">
											<label class="control-label">联系人号码：</label>
											<div class="controls">${shop.linkman_tel}</div>
										</div>

										<div class="control-group">
											<label class="control-label">人均消费：</label>
											<div class="controls">${shop.consumption_per}</div>
										</div>

									</td>
									<td style="padding: 0px 0px 10px 0px; text-align: center;">

										<img
										style="width: 230px; height: 230px; border: 1px solid #ccc;"
										src="${http_img}${shop.logo}" />

									</td>
								</tr>
							</table>
							<div class="control-group">
								<label class="control-label">营业时间：</label>
								<div class="controls">${fn:split(shop.work_time, '||')[0]}</div>
							</div>

							<c:if test="${shop.deliver_ok=='T'||shop.deliver_ok=='TZ'}">

								<div class="control-group">
									<label class="control-label">起送费：</label>
									<div class="controls">${shop.send_price}元</div>
								</div>

								<div class="control-group">
									<label class="control-label">外送费：</label>
									<div class="controls">${shop.deliver_money}元</div>
								</div>

								<div class="control-group">
									<label class="control-label">预计送达时间：</label>
									<div class="controls">

										<c:if test="${shop.send_time==1}">
														30分钟以内
													</c:if>

										<c:if test="${shop.send_time==2}">
														60分钟以内
													</c:if>
										<c:if test="${shop.send_time==3}">
														90分钟以内	</c:if>

										<c:if test="${shop.send_time==4}">
														请电话确认
													</c:if>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">终端设备自动接收订单：</label>
									<div class="controls">
										<c:if test="${shop.terminal_ok=='T'}">
																			 是 
																		</c:if>
										<c:if test="${shop.terminal_ok=='F'}">
																			否
																		</c:if>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">已选配送范围：</label>
									<div class="controls">
										<ul class="thumbnails">
											<c:forEach items="${shopArea}" var="area">
												<li>${area.area_name}</li>
											</c:forEach>
										</ul>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">外送时间：</label>
									<div class="controls">${fn:split(shop.service_time,'||')[0]}</div>
								</div>
							</c:if>
							<div class="control-group">
									<label class="control-label">支付方式：</label>
									<div class="controls">

										<c:if test="${not empty shop.pay_type}">
											<table width="400px">
												<c:forEach items="${fn:split(shop.pay_type, ',')}"
													var="type" varStatus="index1">
													<c:if test="${index1.index%2==0}">
														<tr>
													</c:if>
													<td><c:choose>
															<c:when test="${fn:trim(type)=='1'}">到店支付 </c:when>
															<c:when test="${fn:trim(type)=='2'}">货到付款（现金）</c:when>
															<c:when test="${fn:trim(type)=='3'}">货到付款(一卡通)</c:when>
															<c:when test="${fn:trim(type)=='4'}">货到付款(银行卡)</c:when>
															<c:when test="${fn:trim(type)=='5'}">线上支付(一卡通)</c:when>
															<c:when test="${fn:trim(type)=='6'}">线上支付(银行卡)</c:when>
															<c:otherwise>
																<font>错误数据！</font>
															</c:otherwise>
														</c:choose>										
													</td>
													<c:if
														test="${index1.index==(fn:length(fn:split(shop.pay_type, ','))-1)||index1.index%2==1}">
														</tr>
													</c:if>
												</c:forEach>
											</table>
										</c:if>										
									</div>
								</div>
							<div class="control-group">
								<label class="control-label">店铺地址：</label>
								<div class="controls">${shop.address}</div>
							</div>
							<div class="control-group">
								<label class="control-label">店铺经度：</label>
								<div class="controls">${shop.lng}</div>
							</div>
							<div class="control-group">
								<label class="control-label">店铺纬度：</label>
								<div class="controls">${shop.lat}</div>
							</div>

							<div class="control-group">
								<label class="control-label">店铺介绍：</label>
								<div class="controls"
									style="border: 2px #ccc solid; width: 700px;min-height: 150px;">
									${shop.content}</div>
							</div>
							<br>
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;店铺标签：</h5>
							<hr>

							<div class="control-group" style="height: 68px;">
								<label class="control-label" style="height: 30px;">已选标签：</label>

								<div class="controls" id="selectLabel" titie="labelstyle"
									style="height: 30px;">
									<c:forEach items="${shopTag}" var="tag">
														${tag.tag_name}														
													</c:forEach>
								</div>
							</div>
							<div class="form-actions">
								<button class="btn btn-warning" onclick="window.history.go(-1);">返&nbsp;&nbsp;回</button>
							</div>
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
	<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
	<script src="${ctx}/js/jquery.peity.min.js"></script>
	<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
	<script src="${ctx}/js/masked.js"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<script>
		$('.textarea_editor').wysihtml5();
	</script>
	<jsp:include page="/common/buttom.jsp"></jsp:include>
	<script src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
	<script src="${ctx}/js/dialog/dialog_common.js"></script>
	<script src="${ctx}/js/dialog/dialog_subModal.js"></script>
</body>
</html>

<script type="text/javascript">
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
		for ( var i = 0; i < strs.length; i++) {
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
</script>
