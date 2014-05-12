<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>新增位置</title>
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
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="${ctx}/css/pager.css" />
</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="/chjmanager/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="./LocationManage.jsp" title="位置管理"
					class="tip-bottom"><i class="icon-home"></i>位置管理</a>
			</div>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>新增位置</h5>
						</div>
						<div class="widget-content nopadding">
							<form class="form-horizontal" method="post"
								action="${ctx}/locationmanage!addPLocationManageList.action"
								name="basic_validate" id="basic_validate"
								novalidate="novalidate">
								<br>
								<hr>
								<br>
								<table>

									<tr>
										<td>
											<div id="form-wizard-1" class="step">

												<label class="control-label">名称：</label>
												<div class="controls">
													<input id="locationName" name="locationName" type="text"
														style="width: 254px;" onblur="locationNameOnBlur()" /> <span><font
														color="red" id="locationName_check"> </font></span>
												</div>
											</div>

										</td>

									</tr>

								<!-- 	<tr>
										<td>
											<div id="form-wizard-1" class="step">

												<label class="control-label">详细地址：</label>
												<div class="controls">
													<input id="locationAdderss" name="locationAdderss"
														type="text" style="width: 254px;"
														onblur="locationAdderssOnBlur()" /> <span><font
														color="red" id="locationAdderss_check"> </font></span>
												</div>
											</div>

										</td>

									</tr> -->
								<!-- 	<tr>
										<td>
											<div id="form-wizard-1" class="step">

												<label class="control-label">获取位置：</label>
												<div class="controls">
													<input id="acquireLocation" name="acquireLocation"
														type="button" style="width: 254px;" />
												</div>
											</div>

										</td>

									</tr> -->
								<!-- 	<tr>
										<td>
											<div id="form-wizard-1" class="step">

												<label class="control-label">经度：</label>
												<div class="controls">
													<input id="lat" name="lat" type="text"
														style="width: 254px;"  onblur="latOnBlur()"/> <span><font color="red"
														id="lat_check"> </font></span>
												</div>
											</div>

										</td>

									</tr> -->
								<!-- 	<tr>
										<td>
											<div id="form-wizard-1" class="step">

												<label class="control-label">纬度：</label>
												<div class="controls">
													<input id="lng" name="lng" type="text"
														style="width: 254px;" onblur="lngOnBlur()"/> <span><font color="red"
														id="lng_check"> </font></span>
												</div>
											</div>

										</td>
									</tr> -->
								</table>
							</form>
						</div>
					</div>
					<div class="form-actions">

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-warning" type="button"
							class="btn btn-success" onclick="saveLoactionManageInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-warning" type="button"
							onclick="location.reload()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
					</div>
					</form>
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
	<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<jsp:include page="/common/buttom.jsp"></jsp:include>
<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">
	function saveLoactionManageInfo() {
		
		flag = true;
		var locationName = $.trim($("#locationName").val());
		if (locationName == "") {
			$("#locationName_check").html("不能为空！");
			flag = false;
		} else if ($.trim($("#locationName").val()).length > 20) {
			$("#locationName_check").html("长度不能超过20个字符!");
			flag = false;
		} else {
			$("#locationName_check").html("");
			flag = true;
			}
		if(flag == true){
		/* 	$("#basic_validate").submit();
			alert("添加成功"); */
			$.ajax({
				type : "post",
				url : '${ctx}/locationmanage!addPLocationManageList.action',
				dataType : 'json',
				data : {
					locationName:locationName
				},
				success : function(msg, status) {
					if (msg.status == '200') {
						alert("添加成功");
						window.location = "LocationManage.jsp";
					} else
						alert("添加失败");
				}
			});
			
		}
	}
	var reg = new RegExp("^[0-9--]*$");
	var reg1 = new RegExp("[\u4e00-\u9fa5]"); //中文 字母
	var reg2 = new RegExp("[A-Za-z0-9\u0391-\uffe5]"); // 中文 字母 数字 
	var reg4 = new RegExp("^[1-9]d*.d*|0.d*[1-9]d*$");//正浮点数 
	/*  var reg5 = new RegExp("[\u4e00-\u9fa5--,，]"); */

	//话题名称 
	function locationNameOnBlur() {
		var locationName = $.trim($("#locationName").val());
		if (locationName == "") {
			$("#locationName_check").html("不能为空！");
		} else if ($.trim($("#locationName").val()).length > 20) {
			$("#locationName_check").html("长度不能超过20个字符!");
		} else {
			$("#locationName_check").html("");
			}
	}
</script>