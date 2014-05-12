<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="/common/checklogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<title>服务供应商维护</title>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css"/>
	<link rel="stylesheet" href="${ctx}/css/uniform.css"/>
	<link rel="stylesheet" href="${ctx}/css/select2.css"/>
	<link rel="stylesheet" href="${ctx}/css/matrix-style.css"/>
	<link rel="stylesheet" href="${ctx}/css/matrix-media.css"/>
	<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet"/>
	<link
			href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
			rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${ctx}/css/colorpicker.css"/>
	<link rel="stylesheet" href="${ctx}/css/datepicker.css"/>
	<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css"/>
	<script type="text/javascript" src="/chjmanager/js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="${ctx}/css/pager.css" />
</head>
<body>

<jsp:include page="/common/head.jsp"></jsp:include>
<jsp:include page="/common/leftmenue.jsp"></jsp:include>


<div id="content">
	<div id="content-header">
		<div id="breadcrumb">
			<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">用户信息</a>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title"><span class="icon"> <i class="icon-info-sign"></i> </span>
						<h5>基础资料</h5>
					</div>
					<div class="widget-content">
						<form class="form-horizontal" method="POST" action="${ctx}/user!updateMemberInfo.action"
						      name="basic_validate" id="basic_validate"
						      novalidate="novalidate">
							<table>
								<tbody style="max-width: 1200px;">
								<tr>
									<td rowspan="3" style="width: 444px">
										<label class="control-label">昵称：</label>

										<div class="controls">
											<input type="text" name="nickName" id="nickName">
										</div>
										<label class="control-label">出生日期：</label>

										<div class="controls">
											<input type="text" name="birthDate" id="birthDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})">
										</div>

										<label class="control-label">姓:</label>

										<div class="controls">
											<input class="span4" type="text" name="firstName" id="firstName">
											<label style="display: inline-block;padding-top: 5px;">
												名:</label>
											<input class="span6" type="text" name="lastName" id="lastName">
										</div>

										<label class="control-label">全名</label>

										<div class="controls">
											<input type="text" name="realName" id="realName">
										</div>

										<label class="control-label">性别：</label>

										<div class="controls">
											<select class="select2-default gender" name="sex" id="gender">
												<option value="M">男</option>
												<option value="W">女</option>
												<option>未知</option>
											</select>
										</div>

										<label class="control-label">证件类型：</label>

										<div class="controls">
											<select class="select2-default idCardType" id="idCardType"
											        name="idCardType">
												<option value="1">身份证</option>
												<option value="2">警官证</option>
												<option value="3">学生证</option>
												<option value="4">其它</option>
											</select>
										</div>

										<label class="control-label">城市：</label>

										<div class="controls">
											<input type="text" class="text" id="city" name="city">
										</div>

										<label class="control-label">工作地点：</label>

										<div class="controls">
											<input type="text" class="text" id="workAddress" name="workAddress">
										</div>

										<label class="control-label">公司：</label>

										<div class="controls">
											<input type="text" class="text" id="companyName" name="companyName">
										</div>

										<label class="control-label">杉德卡号：</label>

										<div class="controls">
											<input type="text" class="text" id="shandCardNo" name="shandCardNo">
										</div>

										<label class="control-label">活跃度：</label>

										<div class="controls">
											<input type="text" class="text" id="activeValue" name="activeValue">
										</div>

										<label class="control-label">诚信度：</label>

										<div class="controls">
											<input type="text" class="text" id="sincerityValue" name="sincerityValue">
										</div>


										<label class="control-label">注册日期：</label>

										<div class="controls">
											<input readonly type="text" class="date" id="registerTime" name="registerTime">
										</div>

										<label class="control-label">电话：</label>

										<div class="controls">
											<input type="text" id="phone" name="phone">
										</div>

										<label class="control-label">邮箱：</label>

										<div class="controls">
											<input type="text" id="email" name="email">
										</div>

										<label class="control-label">个人主页</label>

										<div class="controls">
											<input type="text" name="url" id="url">
										</div>
										<label class="control-label">个人介绍:</label>

										<div class="controls">

											<textarea id="info" name="info" class="info"
											          style="height: 100px"> </textarea>
										</div>
										　

									</td>
									<td>
										<label class="control-label">头像:</label>

										<div class="controls">
											<img width="230" height="230" class="img-rounded" id="headPicture">
											<input type="hidden" id="uploadUrl" name="headPicture"> <br> <br>
											<center>
												<button id="uploadButton" class="icon-cloud-upload"> 浏&nbsp;&nbsp;&nbsp;&nbsp;览</button>
											</center>

										</div>
									</td>
								</tr>
								<tr></tr>
								<tr></tr>
								<tr>
									<td colspan="2">
										<div>
											<button type="button" class="btn-success" onclick="saveUser()">保存</button>
										</div>
									</td>
								</tr>

								</tbody>
							</table>
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
<%-- <script src="${ctx}/js/matrix.form_validation.js"></script> --%>
<%-- <script src="${ctx}/js/bootstrap-datepicker.js"></script> --%>
<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
<script src="${ctx}/js/jquery.peity.min.js"></script>
<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
<script src="${ctx}/js/masked.js"></script>
<script src="${ctx}/js/myself/ajaxupload.js"></script>

<script>
	$('.textarea_editor').wysihtml5();
</script>
<script src="${ctx}/js/jquery.pager.js"></script>
<jsp:include page="/common/buttom.jsp"></jsp:include>

</body>
</html>
<script type="text/javascript">
	var pageinfo={page:1,t:0,size:10,tp:0};

	$(function () {
		var userId = request("userId");
		loadUserInfo(userId);
	});


	$(function () {
		var flag = "${flag}";
		if (flag != "" && flag == "true") {
			alert("更新成功");
		}

		// 创建AJAX方式上传文件
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload($uploadBtn, {
			action : '${ctx}/user!uploadImage.action',
			name : 'upfile',
			responseType : 'json',
			data:{type:1},//个人头像1企业所有图片2店铺所有图片3圈子图片4话题图片5活动图片6商品图片7广告图片8个人证件图片9二维码图片10其他图片11
			onSubmit : function(file, ext) {
				ext=ext. toLowerCase(); //ext 文件后缀
				if(ext=='bmp'||ext=='jpg'||ext=='jpeg'||ext=='png'){

				}else{
					alert('图片格式不对');
					return false;
				}
			},
			onComplete : function(file, response) {
				if (response.status == 200) {
					$("#uploadUrl").val(response.rows);  //  隐藏的input  的ID
					$("#headPicture").attr("src", "${http_img}" + response.rows);  //图片ID
				} else {
					alert(response.msg);
				}
			}
		});
	});

	function loadUserInfo(userId) {
		$.ajax({
			type: 'POST',
			url: '${ctx}/user!findUserInfo.action?userId=' + userId,
			dataType: 'json',
			success: function (msg) {
				if (msg.status == 200) {
					var data = msg.rows;
					$("#nickName").val(data["nick_name"]);
					$("#birthDate").attr("value", data["birth_date"]);
					$("#firstName").attr("value", data["first_name"]);
					$("#lastName").attr("value", data["last_name"]);
					$("#realName").attr("value", data["realname"]);

					switch (data["sex"]) {
						case "M":
							$("#gender").get(0).selectedIndex = 0;
							break;
						case "W":
							$("#gender").get(0).selectedIndex = 1;
							break;
						default :
							$("#gender").get(0).selectedIndex = 2;
					}
					switch (data["id_card_type"]) {
						case "I1":
							$("#idCardType").get(0).selectedIndex = 0;
							break;
						default :
							$("#idCardType").get(0).selectedIndex = 3;
					}
					$("#city").attr("value", data["city"]);
					$("#workAddress").val(data["work_address"]);
					$("#companyName").attr("value", data["company_name"]);
					$("#shandCardNo").attr("value", data["shand_cardno"]);
					$("#activeValue").attr("value", data["active_value"]);
					$("#sincerityValue").attr("value", data["sincerity_value"]);
					$("#registerTime").attr("value", data["register_time"]);
					$("#phone").attr("value", data["phone"]);
					$("#email").attr("value", data["email"]);
					$("#url").attr("value", data["my_weburl"]);
					$("#info").val(data["info"]);
					$("#headPicture").attr("src", "/chjservice" + data["head_picture"]);
					$("#uploadUrl").val(data["head_picture"]);
				}
			}
		});
	}

	function saveUser() {
		var nickName=
		pageinfo["nickName"] =$("#nickName").val();
		pageinfo["birthDate"] = $("#birthDate").val();
		pageinfo["firstName"] = $("#firstName").val();
		pageinfo["lastName"] = $("#lastName").val();
		pageinfo["realName"] = $("#realName").val();

		var gender=$("#gender").val();
		switch (gender){
			case "男":
				gender="M";
				break;
			case "女":
				gender="W";
				break;
			case "未知":
				gender="";
				break;
		}
		pageinfo["sex"] = gender;

		var idCardType=$("#idCardType").val();
		switch (idCardType){
			case 1:
				idCardType="I1";
				break;
			case 4:
				idCardType="";
		}
		pageinfo["idCardType"]=idCardType;

		pageinfo["city"] = $("#city").val();
		pageinfo["workAddress"] = $("#workAddress").val();
		pageinfo["shandCardNo"] = $("#shandCardNo").val();
		pageinfo["activeValue"] = $("#activeValue").val();
		pageinfo["sincerityValue"] = $("#sincerityValue").val();
		pageinfo["registerTime"] = $("#registerTime").val();
		pageinfo["phone"] = $("#phone").val();
		pageinfo["url"] = $("#url").val();
		pageinfo["info"] = $("#info").val();
		pageinfo["headPicture"] = $("#uploadUrl").val();
		pageinfo["userId"]=request("userId");

		$.ajax({
			type: "POST",
			url: "${ctx}/user!updateMemberInfo.action",
			dataType: "Json",
			data : pageinfo,
			success: function (msg) {
				if (msg.status == 200) {
					alert("保存成功");
					location.href = "${ctx}/pages/manager/MemberManager.jsp";
				} else {
					alert("保存失败");
				}
			}
		});
	}

	function request(paras) {
		var url = location.href;
		var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
		var paraObj = {}
		for (i = 0; j = paraString[i]; i++) {
			paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
		}
		var returnValue = paraObj[paras.toLowerCase()];
		if (typeof (returnValue) == "undefined") {
			return "";
		} else {
			return returnValue;
		}
	}
</script>
