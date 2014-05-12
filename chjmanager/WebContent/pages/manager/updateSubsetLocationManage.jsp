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
<link rel="stylesheet" href="${ctx}/js/dialog/dialog_subModal.css" />
</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="./pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="./pages/manager/LocationManage.jsp" title="位置管理"
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
								action="${ctx}/locationmanage!updateLoactionManageInfo.action" name="basic_validate"
								id="basic_validate" novalidate="novalidate">
								<br>
								<hr>
								<br>
								<table>

									<tr>
										<td>
										
								<table>

									<tr>
										<td>
											<div id="form-wizard-1" class="step">

												<label class="control-label">名称：</label>
												<div class="controls">
													<input id="locationName" name="locationName" type="text"
														style="width: 254px;" value="${area.area_name }"/> <span><font
														color="red" id="locationName_check"> </font></span>
												</div>
											</div>

										</td>

									</tr>

									<tr>
										<td>
											<div id="form-wizard-1" class="step">

												<label class="control-label">详细地址：</label>
												<div class="controls">
													<input id="locationAdderss" name="locationAdderss"
														type="text" style="width: 254px;"
														 value="${area.detailed_address }"/> <span><font
														color="red" id="locationAdderss_check"> </font></span>
												</div>
											</div>

										</td>

									</tr>
									
									<tr>
										<td>
											<div id="form-wizard-1" class="step">

												<label class="control-label">经度：</label>
												<div class="controls">
													<input id="lng" name="lng" type="text"
														style="width: 254px;"  value="${area.lng}" /> <span><font
														color="red" id="lat_check"> </font></span>
												</div>
											</div>

										</td>

									</tr>
									<tr>
										<td>
											<div id="form-wizard-1" class="step">

												<label class="control-label">纬度：</label>
												<div class="controls">
													<input id="lat" name="lat" type="text"
														style="width: 254px;"  value="${area.lat}"/> <span><font
														color="red" id="lng_check"> </font></span>
												</div>
												<input type="hidden" id= "areaId" name="areaId">
											</div>

										</td>

									</tr>
									<tr>
									<td style="padding-left:200px;">
									<div id="form-wizard-1" class="step">
									
									<button class="btn btn-warning" type="button"
							       class="btn btn-success" onclick="showMap()">查看地图位置</button>
							       </div>
									</td>
									</tr>
								</table>
								
								</td>
								 
								 
								</tr>
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
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-warning" type="button"
							class="btn btn-success" onclick="updateLoactionManageInfo()">确认修改</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	<script type="text/javascript"	src="http://webapi.amap.com/maps?v=1.2&key=57a5a7b350ad90c9bf5b9889b360f37e"></script>
<script src="${ctx}/js/jquery.pager.js"></script>
<script src="${ctx}/js/dialog/dialog_common.js"></script>
	<script src="${ctx}/js/dialog/dialog_subModal.js"></script>
</body>
</html>
<script type="text/javascript">
var mapObj;
var lat = 31.166691,lng=121.409225;

if("${area.lat}"!='null' && "${area.lat}".length>0){
	lat = parseFloat("${area.lat}");
}
if("${area.lng}" !='null' && "${area.lng}".length>0){
	lng = parseFloat("${area.lng}");
}

	function updateLoactionManageInfo(){
		var areaId = <%=request.getParameter("area_id")%>;
		//$("#areaId").val(aeraId);
		/* $("#basic_validate").submit();
			alert("修改成功");
			window.location="/chjmanager/pages/manager/LocationManage.jsp"; */
			var locationName  =$.trim($("#locationName") .val());
			var locationAdderss  =$.trim($("#locationAdderss") .val());
			if(locationAdderss.lenght==0 || locationName.length==0){
				alert('名称地址不为空!');
				return;
			}
		$.ajax({
			type : "post",
			url : '${ctx}/locationmanage!updateLoactionManageInfo.action',
			dataType : 'json',
			data : {
				lat:$("#lat") .val(),
				lng:$("#lng") .val(),
				locationName:locationName,
				areaId:areaId,
			   locationAdderss:locationAdderss
			},
			success : function(msg, status) {
				if (msg.status == '200') {
					alert("修改成功");
					window.location="/chjmanager/pages/manager/LocationManage.jsp";	
				} else
					alert("修改失败");
			}
		});
	}
	
function showMap(){
	showPopWin('', '${ctx}/common/map_address5.jsp?lng=' + lng + '&lat='
			+ lat, 1100, 530, gotopage);

}
function gotopage(data) {
	$('#lng').val(data["lng"]);
	$('#lat').val(data["lat"]);
}

	
</script>