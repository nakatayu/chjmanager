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
<link rel="stylesheet" href="${ctx}/js/hourTime/hourTime.css" />
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
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>详细信息</h5>
						</div>

						<div class="widget-content nopadding">
							<form class="form-horizontal" id="formDivId">
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息：</h5>
								<hr>
								<table width="100%">
									<tr>
										<td>
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">店铺编号：</label>
													<div class="controls">
														<input id="shopNumber" name="shopNumber" type="text"
															style="width: 250px;" readonly="readonly"
															value="${shop.shop_number}" /> <span><font
															color="red" id="shopNumber_check"> </font></span>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label">店铺名称：</label>
													<div class="controls">
														<input id="name" name="name" style="width: 250px;"
															onblur="nameOnBlur()" value="${shop.name}" type="text" />
														<span><font color="red" id="name_check"> </font></span>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label">店铺类型：</label>
													<div class="controls">
														<select id="shopType" style="width: 262px;">
															<c:forEach items="${shopTypeList}" var="type">
																<c:if
																	test="${type.company_shop_category_id==shop.category_id}">
																	<option selected
																		value="${type.company_shop_category_id}">${type.name}</option>
																</c:if>
																<c:if
																	test="${type.company_shop_category_id !=shop.category_id}">
																	<option value="${type.company_shop_category_id}">${type.name}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">店铺状态：</label>
													<div class="controls">
														<table width="70%">
															<tr>
																<td><label> 支持外送 <c:if
																			test="${shop.deliver_ok=='T'||shop.deliver_ok=='TZ'}">
																			<input type="radio" name="deliverOk"
																				onchange="disabledOutSend()" value="T" checked />
																		</c:if> <c:if
																			test="${shop.deliver_ok != 'T'&&shop.deliver_ok!='TZ'}">
																			<input type="radio" name="deliverOk"
																				onchange="disabledOutSend()" value="T" />
																		</c:if>
																</label></td>
																<td><label>服务展示<c:if
																			test="${shop.deliver_ok == 'F'||shop.deliver_ok=='FZ'}">
																			<input type="radio" name="deliverOk"
																				onchange="disabledOutSend()" value="F" checked />
																		</c:if> <c:if
																			test="${shop.deliver_ok != 'F'&&shop.deliver_ok!='FZ'}">
																			<input type="radio" name="deliverOk"
																				onchange="disabledOutSend()" value="F" />
																		</c:if>
																</label></td>

																<td><label>在线预订 <c:if
																			test="${shop.deliver_ok == 'L'||shop.deliver_ok=='LZ'}">
																			<input type="radio" name="deliverOk"
																				onchange="disabledOutSend()" value="L" checked />
																		</c:if> <c:if
																			test="${shop.deliver_ok != 'L'&&shop.deliver_ok!='LZ'}">
																			<input type="radio" name="deliverOk"
																				onchange="disabledOutSend()" value="L" />
																		</c:if>
																</label></td>
															</tr>															
														</table>
													</div>
												</div>


												<div class="control-group">
													<label class="control-label">联系人：</label>
													<div class="controls">
														<input id="linkman" type="text" name="linkman"
															onblur="linkmanOnBlur()" value="${shop.linkman}"
															style="width: 250px;" /> <span><font color="red"
															id="linkman_check"> </font></span>
													</div>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">联系人号码：</label>
												<div class="controls">
													<input id="linkmanTel" type="text" name="linkmanTel"
														onblur="linkmanTelOnBlur()" value="${shop.linkman_tel}"
														style="width: 250px;" /> <span><font color="red"
														id="linkmanTel_check"> </font></span>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label">人均消费：</label>
												<div class="controls">
													<div class="input-append">
														<input type="text" onblur="consumptionPerOnBlur()"
															style="width: 250px;" id="consumptionPer"
															value="${shop.consumption_per}" name="consumptionPer">
													</div>
													<span><font color="red" id="consumptionPer_check">
													</font></span>
												</div>
											</div>
										</td>
										<td>
											<table style="margin: 0px 0px 10px 100px;">
												<tr>
													<td style="text-align: center;"><img
														style="width: 230px; height: 230px; border: 1px solid #ccc;"
														id="imgCompany" src="${http_img}${shop.logo}" /> <input
														type="hidden" id="uploadUrl" name="logo"></td>
												</tr>
												<tr>
													<td style="padding-left: 20px; color: red;">图片上传尺寸：230*230px
														限制上传：300KB</td>
												</tr>
												<tr>
													<td style="padding-left: 80px">
														<button id="uploadButton" class="btn btn-primary"
															style="background: #339999;">浏&nbsp;&nbsp;&nbsp;&nbsp;览</button>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>

								<div class="control-group">
									<label class="control-label">营业时间：</label>
									<div class="controls">
										<div class="input-append">
											<input type="hidden" id="workTime" name="workTime">
											<table id="wTime"
												style="border-spacing: 4px; border-collapse: separate;"></table>

										</div>
									</div>
								</div>
								<div id="disabledOutSend">
									<!-- 隐藏 -->
									<div class="control-group">
										<label class="control-label">起送费：</label>
										<div class="controls">
											<div class="input-append">
												<input type="text" onblur="sendpriceOnBlur()"
													value="${shop.send_price}" style="width: 250px;"
													id="sendPrice" name="sendPrice">
											</div>
											<span><font color="red" id="sendPrice_check"> </font></span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">外送费：</label>
										<div class="controls">
											<div class="input-append">
												<input type="text" onblur="deliverMoneyOnBlur()"
													style="width: 250px;" id="deliverMoney"
													value="${shop.deliver_money}" name="deliverMoney">
											</div>
											<span><font color="red" id="deliverMoney_check">
											</font></span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">预计送达时间：</label>
										<div class="controls">
											<select name="sendTime" id="sendTime" style="width: 262px;">
												<c:if test="${shop.send_time==-1}">
													<option value="-1" selected>--请选择--</option>
												</c:if>
												<c:if test="${shop.send_time!=-1}">
													<option value="-1">--请选择--</option>
												</c:if>
												<c:if test="${shop.send_time==1}">
													<option value="1" selected>30分钟以内</option>
												</c:if>
												<c:if test="${shop.send_time!=1}">
													<option value="1">30分钟以内</option>
												</c:if>
												<c:if test="${shop.send_time==2}">
													<option value="2" selected>60分钟以内</option>
												</c:if>
												<c:if test="${shop.send_time!=2}">
													<option value="2">60分钟以内</option>
												</c:if>
												<c:if test="${shop.send_time==3}">
													<option value="3" selected>90分钟以内</option>
												</c:if>
												<c:if test="${shop.send_time!=3}">
													<option value="3">90分钟以内</option>
												</c:if>
												<c:if test="${shop.send_time==4}">
													<option value="4" selected>请电话确认</option>
												</c:if>
												<c:if test="${shop.send_time!=4}">
													<option value="4">请电话确认</option>
												</c:if>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">终端设备自动接收订单：</label>
										<div class="controls">
											<table width="20%">
												<tr>
													<td><label> 是 <c:if
																test="${shop.terminal_ok=='T'}">
																<input type="radio" id="terminalOk" name="terminalOk"
																	checked value="T" />
															</c:if> <c:if test="${shop.terminal_ok!='T'}">
																<input type="radio" id="terminalOk" name="terminalOk"
																	value="T" />
															</c:if>
													</label></td>
													<td><label> 否 <c:if
																test="${shop.terminal_ok=='F'}">
																<input type="radio" id="terminalOk" name="terminalOk"
																	value="F" checked />
															</c:if> <c:if test="${shop.terminal_ok!='F'}">
																<input type="radio" id="terminalOk" name="terminalOk"
																	value="F" />
															</c:if>
													</label></td>
												</tr>
											</table>
										</div>
									</div>

									<!-- 配送范围 -->
									<div class="control-group">
										<label class="control-label">配送范围：</label>
										<div class="controls">
											<table width="100%">
												<tr>
													<td style="width: 30%">
														<div
															style="width: 250px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
															class="tag_content">
															<ul id="areaStair">
															</ul>
														</div>
													</td>
													<td style="width: 30%">
														<div
															style="width: 300px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
															class="tag_content">
															<ul id="areaSecondLevel">
															</ul>
														</div>
													</td>
													<td style="width: auto;"></td>
												</tr>
											</table>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">已选范围：</label> <input
											name="hiddenAreaName" id="hiddenAreaId" type="hidden">
										<div class="controls" style="font-size: 20px;">
											<table id="selectedArea">
												<c:forEach items="${shopArea}" var="area" varStatus="index">
													<c:if test="${index.index%5==0}">
														<tr>
													</c:if>
													<td><span value="${area.area_id}">${area.area_name}</span>
														<a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a></td>
													<c:if
														test="${index.index==(fn:length(shopArea)-1) || index.index%5==4}">
														</tr>
													</c:if>
												</c:forEach>
											</table>
										</div>
									</div>
									<!-- 配送范围 -->
									
									<div class="control-group">
										<label class="control-label">外送时间：</label>
										<div class="controls">
											<div class="input-append">
												<input type="hidden" id="serviceTime" name="serviceTime">
												<table id="sTime"
													style="border-spacing: 4px; border-collapse: separate;"></table>

											</div>
										</div>
									</div>
								</div>
								<div class="control-group">
										<label class="control-label">支付方式：</label>
										<div class="controls" id="payTypeId" name="payType"
											value="${shop.pay_type}">
											<table width="400px" id="payTypeIds">

											</table>
										</div>
									</div>
								
								<div class="control-group">
									<label class="control-label">地址：</label>
									<div class="controls">
										<select name="areaFirstId" id="fristAddress"
											onChange="onChanges(this)" style="width: 230px;">
											<option value="-1">--请选择--</option>
										</select> <span>&nbsp;&nbsp;----&nbsp;&nbsp;</span> <select
											name="areaSecondId" id="secondAddress"
											onclick="latlngInputValue(this)" style="width: 235px;">
											<option value="-1">--请选择--</option>
										</select> <input type="hidden" id="hiddenAddress" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">店铺地址：</label>
									<div class="controls">
										<input type="text" id="detailedAddress"
											class="shop_announcement" name="address"
											value="${shop.address}" /> <img
											src="${ctx}/images/activity_map.png" style="cursor: pointer;"
											onclick="openwindow('地址',600,400)" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">店铺经度：</label>
									<div class="controls">
										<div class="input-append">
											<input type="text" class="span11" style="width: 262px;"
												id="lng" value="${shop.lng}" name="lng">
										</div>
										<span><font color="red" id="lng_check"> </font></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">店铺纬度：</label>
									<div class="controls">
										<div class="input-append">
											<input type="text" class="span11"
												value="${shop.lat}" style="width: 262px;" id="lat"
												name="lat">

										</div>
										<span><font color="red" id="lat_check"></font></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">店铺介绍：</label>
									<div class="controls" style="height: auto;">
										<textarea name="content" onblur="contentOnBlur()"
											class="shop_announcement"
											style="height: 200px; width: 720px;" id="content11"> ${shop.content} </textarea>
										<span><font color="red" id="content_check"> </font></span>
									</div>
								</div>

								<br>
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;店铺标签：</h5>
								<hr>
								<table width="100%">
									<tr>
										<td></td>
										<td align="left" valign="bottom"
											style="height: 15px; font-size: 15px; padding: 10px;">标签一级分类选择：</td>
										<td align="left" valign="bottom"
											style="height: 15px; font-size: 15px; padding: 10px;">标签二级分类选择：</td>
										<td align="left" valign="bottom"
											style="height: 15px; font-size: 15px; padding: 10px;">标签三级分类选择：</td>
										<td></td>
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
									<div class="controls" id="selectLabel"
										style="height: 30px;font-size: 20px;">
										<c:forEach items="${shopTag}" var="tag">
											<span value="${tag.tag_id}">${tag.tag_name}</span>
											<a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>
										</c:forEach>
									</div>
								</div>
								<div class="form-actions">
									<a class="btn btn-warning" style="margin: 0 50px;"
										onclick="saveShop()">保&nbsp;&nbsp;&nbsp;&nbsp;存</a> <a
										class="btn btn-warning" style="margin: 0 50px;"
										onclick="location.reload()">取&nbsp;&nbsp;&nbsp;&nbsp;消</a>
								</div>
								<input name="companyShopId" id="companyShopId" type="hidden">
								<input name="CategoryId" id="shopTypeId" type="hidden">
								<input name="shopType" id="shopTypeName" type="hidden">
								<input name="shopId" id="shopId" type="hidden"
									value="${shop.company_shop_id}" />

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/common/buttom.jsp"></jsp:include>

	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/jquery.ui.custom.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/jquery.uniform.js"></script>
	<script src="${ctx}/js/select2.min.js"></script>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
	<script src="${ctx}/js/matrix.js"></script>
	<script src="${ctx}/js/matrix.tables.js"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<script src="${ctx}/js/mypage.js"></script>
	<script src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
	<script src="${ctx}/js/hourTime/hourTime.js"></script>
	<script src="${ctx}/js/dialog/dialog_common.js"></script>
	<script src="${ctx}/js/dialog/dialog_subModal.js"></script>
</body>
</html>

<script type="text/javascript">
	var shopId = "${shop.company_shop_id }";
	var deliverOk = "${shop.deliver_ok}";
	$("#companyShopId").val(shopId);

	$(function() {
		
		if(deliverOk!='T'&&deliverOk!='TZ'){
			$("#disabledOutSend").hide();
		}

		//店铺配送范围   1级
		$
				.ajax({
					type : "post",
					url : '${ctx}/shop!findShopStairDistributionArea.action',
					dataType : 'json',
					//      data :{tagId:tagid},   
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="areaName(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["areaId"]
										+ '">' + msg.rows[i]["areaName"]
										+ '</li>');
							}
							$('#areaStair').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
		//一级地址
		$.ajax({
			type : "post",
			url : '${ctx}/area!findArea.action',
			dataType : 'json',
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					var array = [];
					for ( var i = 0; i < msg.rows.length; i++) {
						array.push('<option class="tag_content"');
						array.push('	 value="' + msg.rows[i]["areaId"] + '">'
								+ msg.rows[i]["areaName"] + '</option>');
					}
					$('#fristAddress').html(array.join(''));
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

		// 创建AJAX方式上传图片
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload($uploadBtn,
				{
					action : '${ctx}/user!uploadImage.action',
					name : 'upfile',
					type : 2,
					responseType : 'json',
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
							$("#uploadUrl").val(response.rows);
							$("#imgCompany").attr("src",
									"${http_img}" + response.rows);
						} else {
							alert(response.msg);
						}
					}
				});

		addhtmlCSS();
		
		var worktime=$.trim('${shop.work_time}').split('||')[1];
		
		
		if ($.trim(worktime) != '') {
			$('#wTime').hourTime({
				firstTime : '工作时间&nbsp;',
				lastTime : '非工作时间',
				setData : $.parseJSON(worktime)
			});
		} else {
			$('#wTime').hourTime({
				firstTime : '工作时间&nbsp;',
				lastTime : '非工作时间'
			});
		}
		var servicetime=$.trim('${shop.service_time}').split('||')[1];

		if ($.trim(servicetime) != '') {
			$('#sTime').hourTime({
				firstTime : '外送时间&nbsp;',
				lastTime : '非外送时间',
				setData : $.parseJSON(servicetime)
			});
		} else {
			$('#sTime').hourTime({
				firstTime : '外送时间&nbsp;',
				lastTime : '非外送时间'
			});
		}
		addpayType();
	});

	function addhtmlCSS() {
		var str = "Fontface,FontSize,Bold,Italic,Underline,FontColor,";
		str += "SelectAll,Removeformat,Align,List,Source,Preview";
		$('#content11').xheditor({
			tools : str
		});
	}

	function addpayType() {
		var payType = "${shop.pay_type}";
		var menu = [ '', '到店支付', '货到付款(现金)', '货到付款(一卡通)', '货到付款(银行卡)',
				'线上支付(一卡通)', '线上支付(银行卡)' ];
		var str = '';
		var strpay = [];
		if (payType != null && payType != '') {
			strpay = payType.split(',');
		}
		for ( var i = 1; i < 7; i++) {
			if (i % 2 == 1) {
				str += '<tr>';
			}
			str += '<td><label>';
			var b = false;
			for ( var j = 0; j < strpay.length; j++) {
				if ($.trim(strpay[j]) == i) {
					b = true;
				}
			}
			if (b) {
				str += '<input type="checkbox"  name="payType" checked value="'+i+'"/>';
			} else {
				str += '<input type="checkbox"  name="payType" value="'+i+'"/>';
			}
			str += menu[i] + '</label></td>';
			if (i % 2 == 0) {
				str += '</tr>';
			}
		}
		$('#payTypeIds').html(str);
	}

	function all_check(index) {
		var rt = $('#' + index).prop('checked');
		$("[name=name" + index + "]").prop('checked', rt);
		alert(rt);

	}

	//二级地址：
	function onChanges(parm) {
		var areaid = $(parm).attr("value");
		$('#detailedAddress').val('');
		$
				.ajax({
					type : "post",
					url : '${ctx}/area!findSecondArea.action',
					dataType : 'json',
					data : {
						areaId : areaid
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array.push('<option class="tag_content"');
								array.push('	 value="' + msg.rows[i]["areaId"]
										+ '">' + msg.rows[i]["areaName"]
										+ '</option>');
								$("#detailedAddress").data(
										"'" + msg.rows[i]["areaId"] + "'",
										+msg.rows[i]["lat"] + "#"
												+ msg.rows[i]["lng"]);
							}
							$('#secondAddress').html(array.join(''));
							$('#lat').html(array.join(''));
							$('#lng').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}
	//第二个地址 联动经纬度 
	function latlngInputValue(parm) {//fristAddress
		$("#detailedAddress").val(
				$('#fristAddress').find("option:selected").text()
						+ $(parm).find("option:selected").text());
		$('#hiddenAddress').val(
				$('#fristAddress').find("option:selected").text()
						+ $(parm).find("option:selected").text());
		var detailedAddress = $(parm).find("option:selected").val();
		var address = $("#detailedAddress").data("'" + detailedAddress + "'");
		var str = new Array();
		str = address.split("#");
		$("#lat").val(str[0]);
		$("#lng").val(str[1]);
		if ($("#lat").val(str[0])) {
			$("#lat_check").html("");
		}
		if ($("#lng").val(str[1])) {
			$("#lng_check").html("");
		}
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
										.push('<li class="tag_content"	onclick="selectLabelName(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
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

	var selectLabelCount = 0;
	function selectLabelName(li) {
		selectLabelCount = $("#selectLabel").find("span").length;
		if (selectLabelCount > 5) {
			alert("不能超过6个");
			return;
		}
		var currentLabelCount = $(li).val();//判断是否重复 
		var flag = true;
		$("#selectLabel").find("span").each(function() {
			if ($(this).attr("value") == currentLabelCount) {
				alert("标签不可重复");
				flag = false;
			}
		});

		if (flag == true) {
			selectLabelCount = selectLabelCount + 1;
			$("#selectLabel")
					//已选标签 
					.append(
							"<span  value="
									+ $(li).attr("value")
									+ ">"
									+ $(li).text()
									+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>");
		}
	}
	//删除标签
	function delLabel(li) {
		$(li).prev().remove();
		$(li).remove();
	}

	//店铺配送范围   2级  附属园区
	function areaName(li) {
		var areaid = $(li).attr("value");
		$
				.ajax({
					type : "post",
					url : '${ctx}/shop!findShopSecondLevelDistributionArea.action',
					dataType : 'json',
					data : {
						areaId : areaid
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="selected(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["areaId"]
										+ '">' + msg.rows[i]["areaName"]
										+ '</li>');
							}
							$('#areaSecondLevel').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	var count = 1;
	function selected(li) {
		/* if (count > 6) {
			alert("不能超过6个");
			return;
		} */
		var currentLabel = $(li).val();//判断是否重复 
		var flag = true;
		$("#selectedArea").find("span").each(function() {
			if ($(this).attr("value") == currentLabel) {
				alert("区域不可重复");
				flag = false;
			}
		});
		if (flag == true) {
			count = count + 1;
			var tdCount = $("#selectedArea tr:last td").length;
			if (tdCount == 0 || tdCount >= 5) {
				//已选标区域
				$("#selectedArea")
						.append(
								"<tr><td><span  value="
										+ $(li).attr("value")
										+ ">"
										+ $(li).text()
										+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a></td></tr>");
			} else {

				//已选区域 
				$("#selectedArea tr:last")
						.append(
								"<td><span  value="
										+ $(li).attr("value")
										+ ">"
										+ $(li).text()
										+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a></td>");
			}

		}
	}

	function delLabel(li) {
		count = count - 1;
		$(li).prev().remove();
		$(li).remove();
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
	function contentOnBlur() {

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

	 

	function saveShop() {
		flag = true;
		
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
			flag = false;
		} else if (!reg.test(consumptionPer)) {
			$("#consumptionPer_check").html("只能为数字!");
			flag = false;
		} else if ($.trim($("#consumptionPer").val().length) > 9) {
			$("#consumptionPer_check").html("长度不能超过9个字符!");
			flag = false;
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
		var labelValue = "";
		var deliverOk = $('input[name="deliverOk"]:checked').val();
		if (deliverOk == 'T' || deliverOk == 'N') {
			//园区名称 

			$("#selectedArea").find("span").each(function() {
				labelValue = labelValue + $(this).attr("value") + ",";
			});
			if ($.trim(labelValue).length == 0) {
				alert('请选择配送区域!');
				return;
			}
		}
		$("#hiddenAreaId").val(labelValue);
		//以上匹配后执行       
		if (flag) {
			$("#shopTypeId").val($("#shopType").val());
			$("#shopTypeName").val($('#shopType option:selected').text());
			//已选标签
			var labelValue = "";
			$("#selectLabel").find("span").each(function() {
				labelValue = labelValue + $(this).attr("value") + ",";
			});
			$("#thirdCategoryTag").val(labelValue);
			
			var workTime=JSON.stringify($('#wTime').hourTime('newStrData'));
			var workTimetext=JSON.stringify($('#wTime').hourTime('textData'));
			var serviceTime=JSON.stringify($('#sTime').hourTime('newStrData'));
			var serviceTimetext=JSON.stringify($('#sTime').hourTime('textData'));
			$("#workTime").val(workTimetext+"||"+workTime);
			$("#serviceTime").val(serviceTimetext+"||"+serviceTime);

			var data = $("#formDivId").serialize();
			$.ajax({
				type : "post",
				url : '${ctx}/shop!updateShopInfoSave.action',
				dataType : 'json',
				data : data,
				timeout : 10000,
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("更新成功！");
						window.history.go(-1);
					} else {
						alert("保存失败！");
					}
				}
			});
		}
	}

	//点击外送否 禁用相关输入框
	function disabledOutSend() {
		var deliverOk = $('input[name="deliverOk"]:checked').val();
		if (deliverOk == 'T') {			
			$("#disabledOutSend").show();
		} else {			
			$("#disabledOutSend").hide();
		}
	}

	//地图选择
	function openwindow() {
		var lng = $.trim($('#lng').val());
		var lat = $.trim($('#lat').val());
		if (lng == '' || lat == '') {
			lng = 121.23456;
			lat = 33.223456;
		}
		showPopWin('', '${ctx}/common/map_address5.jsp?lng=' + lng + '&lat='
				+ lat, 1100, 530, gotopage);
	}
	function gotopage(data) {
		$('#lng').val(data["lng"]);
		$('#lat').val(data["lat"]);
	}
</script>
