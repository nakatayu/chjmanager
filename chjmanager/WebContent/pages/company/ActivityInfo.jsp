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
	font-color: 20px;
}

.spanstyle {
	font-color: red;
}

ul.ul-image li {
	width: 80px;
	height: 90px;
	float: left;
	list-style: none;
	margin: 10px;
}
</style>



</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<input type="hidden" name="lat" value="${activity.lat}"
		id="hiddenAddressLat" />
	<input type="hidden" name="lng" value="${activity.lng}"
		id="hiddenAddressLng" />

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="javascript:void(0)"
					onclick="history.go(-1)" title="活动列表" class="tip-bottom"><i
					class="icon-home"></i>活动列表</a> <a href="#" class="current">发表活动</a>
			</div>
			<h1>发表活动</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>发表活动</h5>
						</div>
						<h5 id=tp>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;活动图片：
							<button id="uploadButton" class="btn btn-primary"
								style="background: #339999">浏&nbsp;&nbsp;&nbsp;览</button>
						</h5>
						<div
							style="width: 180px; height: 120px; margin: 10px 0 0 100px; border: 1px solid #ccc; float: center;">
							<ul class="ul-image" id="activity_image">
								<c:if test="${activity!=null}">
									<li>
										<div
											style="position: absolute; margin-left: 60px; margin-top: 2px;">
											<img src="${ctx}/images/lable_del.png"
												style="cursor: pointer;" onclick="removeCircleImage()" />
										</div> <span> <img style="border: 1px solid #ccc;"
											src="${http_img}${activity.activity_image}" width="80"
											height="80" />
									</span>
									</li>
								</c:if>
							</ul>
						</div>

						<div class="widget-content nopadding">
							<form class="form-horizontal">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">活动标题：</label>
										<div class="controls">
											<input id="title" name="title" type="text"
												value="${activity.activity_title}" style="width: 513px;"
												onblur="titleOnBlur()" /> <span><font color="red"
												id="title_check"> </font></span>

										</div>
									</div>
									<div class="control-group">
										<label class="control-label">活动摘要：</label>
										<div class="controls">
											<input id="summary" type="text" name="summary"
												value="${activity.summary}" style="width: 513px;"
												onblur="summaryIdOnBlur()" /> <span><font
												color="red" id="summaryId_check"> </font></span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">地址：</label>
										<div class="controls">
											<select id="areaFirst" onchange="areaSecondLoad()"
												style="width: 242px;">
												<option value="-1">--请选择--</option>
											</select> <span>&nbsp;&nbsp;----&nbsp;&nbsp;</span> <select
												id="areaSecond" onchange="addressLoad()"
												style="width: 250px;">
												<option value="-1">--请选择--</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">活动详细地址:</label>
										<div class="controls">
											<input id="address" type="text" name="address"
												value="${activity.address}" style="width: 512px;"
												onblur="addressOnBlur()" /> <span><font color="red"
												id="address_check"> </font></span> <img
												src="${ctx}/images/activity_map.png"
												style="cursor: pointer;" onclick="openwindow()" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">交通推荐：</label>
										<div class="controls">
											<input id="traffic" type="text" name="traffic"
												value="${activity.traffic}" style="width: 513px;" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">是否收费：</label>
										<div class="controls">
											<table>
												<tr>
													<td width="80"><c:if test="${activity.is_money=='T'}">
															<label> <input type="radio" name="isMoney"
																value="T" checked="checked" />是
															</label>
														</c:if> <c:if test="${activity.is_money!='T'}">
															<label> <input type="radio" name="isMoney"
																value="T" />是
															</label>
														</c:if></td>
													<td><c:if test="${activity.is_money=='T'}">
															<label> <input type="radio" id="deliverOk"
																name="isMoney" value="F" />否
															</label>
														</c:if> <c:if test="${activity.is_money!='T'}">
															<label> <input type="radio" checked="checked"
																name="isMoney" value="F" />否
															</label>
														</c:if></td>
												</tr>
											</table>
										</div>
									</div>
									<div id="moneyDetailInfo">
										<div class="control-group">
											<label class="control-label">付款方式：</label>
											<div class="controls">
												<table>
													<tr>
														<td><c:if
																test="${fn:contains(activity.pay_type,'杉德卡')}">
																<label> <input type="checkbox" value="杉德卡"
																	checked name="payType" />杉德卡
																</label>
															</c:if> <c:if test="${!fn:contains(activity.pay_type,'杉德卡')}">
																<label> <input type="checkbox" value="杉德卡"
																	name="payType" />杉德卡
																</label>
															</c:if></td>
														<td><c:if
																test="${fn:contains(activity.pay_type,'银行卡')}">
																<label> <input type="checkbox" value="银行卡"
																	checked name="payType" />银行卡
																</label>
															</c:if> <c:if test="${!fn:contains(activity.pay_type,'银行卡')}">
																<label> <input type="checkbox" value="银行卡"
																	name="payType" />银行卡
																</label>
															</c:if></td>
														<td><c:if
																test="${fn:contains(activity.pay_type,'现金')}">
																<label> <input type="checkbox" value="现金"
																	checked name="payType" />现金
																</label>
															</c:if> <c:if test="${!fn:contains(activity.pay_type,'现金')}">
																<label> <input type="checkbox" value="现金"
																	name="payType" />现金
																</label>
															</c:if></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">活动费用：</label>
											<div class="controls">
												<input id="moneynum" type="text" name="moneynum"
													value="${activity.moneyNum}" style="width: 250px;"
													onblur="textOnBlur(this,10)"
													onkeyup="value=value.replace(/[^\d]/g,'')" />元 <span><font
													color="red" id="moneynumCheck"></font></span>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">费用明细：</label>
											<div class="controls">
												<input id="moneyDetail" type="text" name="moneyDetail"
													value="${activity.money_detail}" style="width: 513px;" />100字内
											</div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">报名日期：</label>
										<div class="controls">
											开始时间： <input id="txtEnrollBeginTime"
												onblur="textOnBlur('txtEnrollBeginTime',22)" type="text"
												value="${activity.enroll_begin_time}" class="Wdate"
												onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'txtEnrollEndTime\');}',dateFmt:'yyyy-MM-dd HH:mm'})"
												style="width: 180px;" /> <span><font color="red"
												id="txtEnrollBeginTimeCheck"></font></span> 结束时间：<input
												id="txtEnrollEndTime"
												onblur="textOnBlur('txtEnrollEndTime',22)" type="text"
												value="${activity.enroll_end_time}" class="Wdate"
												onfocus="WdatePicker({minDate:'#F{$dp.$D(\'txtEnrollBeginTime\');}',dateFmt:'yyyy-MM-dd HH:mm'})"
												style="width: 180px;" /> <span><font color="red"
												id="txtEnrollEndTimeCheck"></font></span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">活动日期：</label>
										<div class="controls">
											开始时间： <input id="txtBeginTime"
												onblur="textOnBlur('txtBeginTime',22)" type="text"
												name="beginTime" value="${activity.begin_time}"
												class="Wdate"
												onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'txtEndTime\');}',minDate:'#F{$dp.$D(\'txtEnrollEndTime\');}',dateFmt:'yyyy-MM-dd HH:mm'})"
												style="width: 180px;" /> <span><font color="red"
												id="txtBeginTimeCheck"> </font></span> 结束时间：<input id="txtEndTime"
												onblur="textOnBlur('txtEndTime',22)" type="text"
												name="endTime" value="${activity.end_time}" class="Wdate"
												onfocus="WdatePicker({minDate:'#F{$dp.$D(\'txtBeginTime\');}',dateFmt:'yyyy-MM-dd HH:mm'})"
												style="width: 180px;" /> <span><font color="red"
												id="txtEndTimeCheck"> </font></span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">人数上限：</label>
										<div class="controls">
											<input id="userMax" type="text" name="userMax"
												value="${activity.user_max}" style="width: 250px;"
												onblur="userMaxOnBlur()"
												onkeyup="value=value.replace(/[^\d]/g,'')" />人<span><font
												color="red" id="userMax_check"></font></span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">对活动成员进行审核：</label>
										<div class="controls">
											<table>
												<tr>
													<td width="80"><c:if test="${activity.is_check=='T'}">
															<label> <input type="radio" name="isCheck"
																value="T" checked="checked" />是
															</label>
														</c:if> <c:if test="${activity.is_check!='T'}">
															<label> <input type="radio" name="isCheck"
																value="T" />是
															</label>
														</c:if></td>
													<td><c:if test="${activity.is_check=='T'}">
															<label> <input type="radio" id="deliverOk"
																name="isCheck" value="F" />否
															</label>
														</c:if> <c:if test="${activity.is_check!='T'}">
															<label> <input type="radio" checked="checked"
																name="isCheck" value="F" />否
															</label>
														</c:if></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">活动类型：</label>
										<div class="controls">
											<table>
												<tr>
													<td width="80"><c:if test="${activity.join_type=='2'}">
															<label><input type="radio" name="joinType"
																value="1" />普通</label>
														</c:if> <c:if test="${activity.join_type!='2'}">
															<label><input type="radio" name="joinType"
																checked="checked" value="1" />普通</label>
														</c:if></td>
													<td><c:if test="${activity.join_type=='2'}">
															<label> <input type="radio" checked="checked"
																name="joinType" value="2" />订票
															</label>
														</c:if> <c:if test="${activity.join_type!='2'}">
															<label> <input type="radio" name="joinType"
																value="2" />订票
															</label>
														</c:if></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">是否需要生成二维码签到：</label>
										<div class="controls">
											<table>
												<tr>
													<td width="80"><c:if test="${activity.is_qrcode=='T'}">
															<label> <input type="radio" name="isQrcode"
																value="T" checked="checked" />是
															</label>
														</c:if> <c:if test="${activity.is_qrcode!='T'}">
															<label> <input type="radio" name="isQrcode"
																value="T" />是
															</label>
														</c:if></td>
													<td><c:if test="${activity.is_qrcode=='T'}">
															<label> <input type="radio" id="deliverOk"
																name="isQrcode" value="F" />否
															</label>
														</c:if> <c:if test="${activity.is_qrcode!='T'}">
															<label> <input type="radio" checked="checked"
																name="isQrcode" value="F" />否
															</label>
														</c:if></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">活动介绍：</label>
										<div class="controls" style="height: 200px">
											<textarea name="content"
												class="shop_announcement"
												style="height: 180px; width: 602px;" id="content11">${activity.activity_content}</textarea>
											<span><font color="red" id="content_check"> </font></span>
										</div>
									</div>

									<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;活动标签：</h5>
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
											style="height: 30px;">
											<c:forEach var="item" items="${tagList}">
												<span value="${item.tagId}">${item.tagName}</span>
												<a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>
											</c:forEach>

										</div>
									</div>

									<div class="form-actions">
										<c:if test="${empty activity}">
											<a class="btn btn-warning"
												style="margin: 10px 50px 40px 50px;"
												onclick="saveActivith()">保&nbsp;&nbsp;&nbsp;&nbsp;存</a>
										</c:if>
										<c:if
											test="${not empty activity&&not empty activity.company_id&&activity.company_id==user.companyId}">
											<a class="btn btn-warning"
												style="margin: 10px 50px 40px 50px;"
												onclick="saveActivith()">保&nbsp;&nbsp;&nbsp;&nbsp;存</a>
										</c:if>
										<a class="btn btn-warning"
											style="margin: 10px 50px 40px 50px;"
											onclick=" window.history.go(-1);">返&nbsp;&nbsp;&nbsp;&nbsp;回</a>
									</div>
								</div>
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
	<script type="text/javascript"
		src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
	<script type="text/javascript"
		src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx}/js/dialog/dialog_common.js"></script>
	<script src="${ctx}/js/dialog/dialog_subModal.js"></script>
</body>
</html>

<script type="text/javascript">
	var activityImage = '${activity.activity_image}';
	$(function() {
		$('input[name="isMoney"]').click(function() {
			if ($(this).val() == "T") {
				$('#moneyDetailInfo').show();
			} else {
				$('#moneyDetailInfo').hide();
			}
		});
		if ('${activity.is_money}' == 'T') {
			$('#moneyDetailInfo').show();
		} else {
			$('#moneyDetailInfo').hide();
		}

		$(pageInit);
		function pageInit() {

			var str = "Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat";
			str += ",Align,List,Outdent,Indent,Link,Unlink,Anchor,Img,Flash,	Media,Hr,Emot,Table,Source,Preview";
			$('#content11').xheditor({
				tools : str,
				upLinkUrl : "${ctx}/common!uploadHtmlFile.action",
				upLinkExt : "word,pdf,zip,rar,txt",
				upImgUrl : "${ctx}/common!uploadHtmlFile.action",
				upImgExt : "jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG",
				upFlashUrl : "${ctx}/common!uploadHtmlFile.action",
				upFlashExt : "swf",
				upMediaUrl : "${ctx}/common!uploadHtmlFile.action",
				upMediaExt : "MP4,mp4,MP3,mp3,avi,AVI"
			});
		}
		$.ajax({
			type : "post",
			url : '${ctx}/area!findArea.action',
			dataType : 'json',
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {

					for ( var i = 0; i < msg.rows.length; i++) {
						$('#areaFirst')
								.append(
										'<option value="'+msg.rows[i]["areaId"]+'">'
												+ msg.rows[i]["areaName"]
												+ '</option>');
					}

				} else {
					alert(msg.msg);
				}
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

		// 创建AJAX方式上传文件
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload(
				$uploadBtn,
				{
					action : '${ctx}/user!uploadImage.action',
					name : 'upfile',
					responseType : 'json',
					data : {
						type : 5
					},//个人头像1企业所有图片2店铺所有图片3圈子图片4话题图片5活动图片6商品图片7广告图片8个人证件图片9二维码图片10其他图片11
					onSubmit : function(file, ext) {
						//ext 文件后缀
						if ($("#activity_image li").length >= 1) {
							alert("最多只能上传 一张");
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
							activityImage = response.rows;
							$('#activity_image')
									.append(
											'<li>'
													+ '<div style="position:absolute;margin-left:60px;margin-top:2px;">'
													+ '<img src="${ctx}/images/lable_del.png" style="cursor:pointer;" onclick="removeCircleImage()"/>'
													+ '</div>'
													+ '<span>'
													+ '  <img style="border:1px solid #ccc;" src="${http_img}'+response.rows+'" width="80" height="80" />'
													+ '</span>' + '</li>');

						} else {
							alert(response.msg);
						}
					}
				});

	});
	function addressLoad() {
		$('#address').val(
				$('#areaFirst').find('option:selected').text()
						+ $('#areaSecond').find('option:selected').text());
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
										+ '</li>')
							}
							$('#tagThird').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	function selectLabelName(li) {
		if ($("#choosenLabel").find("span").length >= 6) {
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

			changedFlag["tag"] = true;
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
		changedFlag["tag"] = true;
		$(li).prev().remove();
		$(li).remove();
	}
	var changedFlag = {
		tag : false,
		img : false
	};
	function removeCircleImage() {
		if ("${activity.activityId}" != "") {
			$('#activity_image').html('');
			activityImage = '';
			return;
		}

		$.ajax({
			type : "POST",
			url : '${ctx}/common!deleteUploadFile.action',
			dataType : 'json',
			data : {
				upliadFilePath : activityImage
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					activityImage = '';
					$('#activity_image').html('');
				} else
					alert(msg.msg);
			}
		});

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
	function textOnBlur(obj, leg) {
		var id = '#' + obj + 'Check';
		var title = $.trim($('#' + obj).val());
		if (title == "") {
			$(id).html("不能为空！");
			return false;
		} else if (title.length > leg) {
			$(id).html("长度不能超过" + leg + "个字符!");
			return false;
		} else {
			$(id).html("");
			return true;
		}
	}

	// 服务范围  单选框 2级  
	function areaSecondLoad() {
		$('#address').val('');
		var areaId = $('#areaFirst').find("option:selected").val();
		if (areaId == "") {
			$('#areaSecond').html("");
			return;
		} else {
			$.ajax({
				type : "post",
				url : '${ctx}/area!findSecondArea.action',
				dataType : 'json',
				data : {
					areaId : areaId
				},
				timeout : 10000,
				success : function(msg, status) {
					if (msg.status == 200) {
						var str = '';
						for ( var i = 0; i < msg.rows.length; i++) {
							str += '<option value="'+msg.rows[i]["areaId"]+'">'
									+ msg.rows[i]["areaName"] + '</option>';
						}
						$('#areaSecond').html(str);
					} else
						$('#areaSecond').html('');
					$('#areaSecond').val('');
				}
			});
		}
	}

	var reg = new RegExp("^[0-9--]*$");
	var reg1 = new RegExp("[\u4e00-\u9fa5]"); //中文 字母
	var reg2 = new RegExp("[A-Za-z0-9\u0391-\uffe5]"); // 中文 字母 数字 
	var reg4 = new RegExp("^[1-9]d*.d*|0.d*[1-9]d*$");//正浮点数 
	/*  var reg5 = new RegExp("[\u4e00-\u9fa5--,，]"); */
	//活动标题验证
	function titleOnBlur() {
		var title = $.trim($("#title").val());
		if (title == "") {
			$("#title_check").html("不能为空！");
			return false;
		} else if ($.trim($("#title").val().length) > 15) {
			$("#title_check").html("长度不能超过15个字符!");
			return false;
		} else {
			$("#title_check").html("");
			var badChar = "`~!@#$%^&()-_=+]\\\\|:;\"\\\'<,>?*/";
			for ( var i = 0; i < title.length; i++) {
				//字符串str中的字符
				var c = title.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#title_check").html("不能输入特殊字符!");
					return false;
				}
			}
		}
		return true;
	}

	//活动摘要验证 
	function summaryIdOnBlur() {
		var summaryId = $.trim($("#summary").val());
		if (summaryId == "") {
			$("#summaryId_check").html("不能为空！");
			return false;
		} else if (summaryId.length > 20) {
			$("#summaryId_check").html("长度不能超过20个字符!");
			return false;
		} else {
			$("#summaryId_check").html("");
			var badChar = "`~!@#$%^&()-_=+]\\\\|:;\"\\\'<,>?*/";
			for ( var i = 0; i < summaryId.length; i++) {
				//字符串str中的字符
				var c = summaryId.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#summaryId_check").html("不能输入特殊字符!");
					return false;
				}
			}
		}
		return true;
	}
	//活动地址验证
	function addressOnBlur() {
		var address = $.trim($("#address").val());

		if (address == "") {
			$("#address_check").html("不能为空!");
			return false;
		} else {
			$("#address_check").html("");
			return true;
		}
	}

	//人数上限验证
	function userMaxOnBlur() {
		var userMax = $.trim($("#userMax").val());
		if (userMax == "") {
			$("#userMax_check").html("不能为空!");
			return false;
		} else if (!reg.test(userMax)) {
			$("#userMax_check").html("只能为数字!");
			return false;
		} else if ($.trim($("#userMax").val().length) > 10) {
			$("#userMax_check").html("长度不能超过10位数!");
			return false;
		} else {
			$("#userMax_check").html("");
			return true;
		}
	}

	//保存活动信息
	function saveActivith() {
		var param = {
			activityImage : "",
			id : "${activity.activity_id}",
			lat : "${activity.lat}",
			lng : "${activity.lng}"
		};

		if (activityImage.length == 0) {
			alert('请上传活动照片!');
			return;
		}
		param["activityImage"] = activityImage;

		if (!titleOnBlur())
			return;
		param["title"] = $('#title').val();
		if (!summaryIdOnBlur())
			return;
		param["summary"] = $('#summary').val();
		if (!addressOnBlur())
			return;
		param["address"] = $('#address').val();
		if ($('#hiddenAddressLat').val().length == 0
				|| $('#hiddenAddressLng').val().length == 0) {
			alert('请定位经纬度!');
			return;
		}
		param["lat"] = $('#hiddenAddressLat').val();
		param["lng"] = $('#hiddenAddressLng').val();

		param["isMoney"] = $('input[name="isMoney"]:checked').val();
		if (param["isMoney"] == 'T') {
			var paytype = [];
			$('input[name="payType"]:checked').each(function() {
				paytype.push($(this).val());
			});
			if (paytype.length == 0) {
				alert('请选择付费方式!');
				return;
			} else {
				param["payType"] = paytype.join(',');
			}
			if ($.trim($('#moneynum').val()).length == 0) {
				alert('请输入费用!');
				return;
			}
			param["moneynum"] = $.trim($('#moneynum').val());
		}

		if (!textOnBlur("txtEnrollBeginTime", 22)) {
			return;
		}
		param["enrollBeginTime"] = $.trim($('#txtEnrollBeginTime').val());
		if (!textOnBlur("txtEnrollEndTime", 22)) {
			return;
		}
		param["enrollEndTime"] = $.trim($('#txtEnrollEndTime').val());
		if (!textOnBlur("txtBeginTime", 22)) {
			return;
		}
		param["beginTime"] = $.trim($('#txtBeginTime').val());
		if (!textOnBlur("txtEndTime", 22)) {
			return;
		}
		param["endTime"] = $.trim($('#txtEndTime').val());
		if (!userMaxOnBlur())
			return;
		param["userMax"] = $.trim($('#userMax').val());
		if ($.trim($('#content11').val()).length == 0) {
			alert('需要填写内容!');
			return;
		}
		param["moneyDetail"] = $('#moneyDetail').val();
		param["traffic"] = $('#traffic').val();
		param["isCheck"] = $('input[name="isCheck"]:checked').val();
		param["isQrcode"] = $('input[name="isQrcode"]:checked').val();
		param["joinType"] = $('input[name="joinType"]:checked').val();

		param["content"] = $.trim($('#content11').val());

		var arrayTag = [];
		$("#choosenLabel").find("span").each(function() {
			arrayTag.push($(this).attr("value"));

		});
		if (arrayTag.length == 0) {
			alert('请选择标签!');
			return;
		}
		if ("${activity.activity_d}" != "" && !changedFlag["tag"]) {
			param["tagList"] = "";
		} else {
			param["tagList"] = arrayTag.join(',');
		}

		$.ajax({
			type : "POST",
			url : '${ctx}/activity!insertActivityInfo.action',
			dataType : 'json',
			data : param,
			success : function(msg, status) {
				if (msg.status == 200) {
					if ("${activity.activity_id}" != "") {
						alert('修改成功!');
					} else {
						alert('添加成功!');
					}
					window.history.go(-1);

				} else {
					alert(msg.msg);
				}
			}
		});

	}

	function openwindow() {
		var lng = $.trim($('#hiddenAddressLng').val());
		var lat = $.trim($('#hiddenAddressLat').val());
		if (lng == '' || lat == '') {
			lng = 121.23456;
			lat = 33.223456;
		}

		showPopWin('', '${ctx}/common/map_address5.jsp?lng=' + lng + '&lat='
				+ lat, 1100, 530, gotopage);

	}
	function gotopage(data) {
		$('#hiddenAddressLng').val(data["lng"]);
		$('#hiddenAddressLat').val(data["lat"]);
	}
</script>