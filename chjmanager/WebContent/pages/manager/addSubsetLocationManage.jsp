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
								action="${ctx}/locationmanage!addLocationManageList.action"
								name="basic_validate" id="basic_validate"
								novalidate="novalidate">
								<br>
								<hr>
								<br>
								<table>
									<tr>
	                               <td valign="top">
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
												<input id="Parea_id" name = "areaId" type="hidden">
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
														onblur="locationAdderssOnBlur()" /> <span><font
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
														style="width: 254px;"  onblur="lngOnBlur()"/> <span><font color="red"
														id="lng_check"> </font></span>
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
														style="width: 254px;" onblur="latOnBlur()"/> <span><font color="red"
														id="lat_check"> </font></span>
												</div>
											</div>

										</td>
									</tr>
			               </table>
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
							class="btn btn-success" onclick="saveLoactionManageInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-warning" type="button"
							onclick="window.history.go(-1)">返&nbsp;&nbsp;&nbsp;&nbsp;回</button>
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
var areaId = <%=request.getParameter("area_id")%>
$("#Parea_id").val(areaId);
var lat = 31.166691,lng=121.409225;
function showMap(){
	showPopWin('', '${ctx}/common/map_address5.jsp?lng=' + lng + '&lat='
			+ lat, 1100, 530, gotopage);

}
function gotopage(data) {
	$('#lng').val(data["lng"]);
	$('#lat').val(data["lat"]);
}
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
	
		var locationAdderss = $.trim($("#locationAdderss").val());
		if (locationAdderss == "") {
			$("#locationAdderss_check").html("不能为空！");
			flag = false;
		} else if ($.trim($("#locationAdderss").val().length) > 50) {
			$("#locationAdderss_check").html("长度不能超过50个字符!");
			flag = false;
		} else if (!reg2.test(locationAdderss)) {
			$("#locationAdderss_check").html("只能为汉字，字母！ ");
			flag = false;
		} else {
			$("#locationAdderss_check").html("");
			flag = true;
		}
		
		var lat = $.trim($("#lat").val());
		if (lat == "") {
			$("#lat_check").html("不能为空！");
			flag = false;
		} else if ($.trim($("#lat").val().length) > 20) {
			$("#lat_check").html("长度不能超过20个字符!");
			flag = false;
		} else if (!reg4.test(lat)) {
			$("#lat_check").html("只能为数字！ ");
			flag = false;
		} else {
			$("#lat_check").html("");
			flag = true;
		}
		
		var lng = $.trim($("#lng").val());
		if (lng == "") {
			$("#lng_check").html("不能为空！");
			flag = false;
		} else if ($.trim($("#lng").val().length) > 20) {
			$("#lng_check").html("长度不能超过20个字符!");
			flag = false;
		} else if (!reg4.test(lng)) {
			$("#lng_check").html("只能为数字！ ");
			flag = false;
		} else {
			$("#lng_check").html("");
			flag = true;
		}
		
		if(flag == true){
			/* $("#basic_validate").submit();
			alert("添加成功");
			window.location = "LocationManage.jsp"; */
			$.ajax({
				type : "post",
				url : '${ctx}/locationmanage!addLocationManageList.action',
				dataType : 'json',
				data : {
					locationName:locationName,
				   lat:lat,
				   lng:lng,
				   areaId: areaId,
				   locationAdderss:locationAdderss
				},
				success : function(msg, status) {
					if (msg.status == '200') {
						alert(msg.msg);
						window.location = "LocationManage.jsp";
					} else
						alert(msg.msg);
				}
			});
		}
	}
	var reg = new RegExp("^[0-9--]*$");
	var reg1 = new RegExp("[\u4e00-\u9fa5]"); //中文 字母
	var reg2 = new RegExp("[A-Za-z0-9\u0391-\uffe5]"); // 中文 字母 数字 
	var reg4 = new RegExp("^[1-9]d*.d*|0.d*[1-9]d*$");//正浮点数 
	/*  var reg5 = new RegExp("[\u4e00-\u9fa5--,，]"); */
 	//位置名称 
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
	//地址详情
	function locationAdderssOnBlur() {
		var locationAdderss = $.trim($("#locationAdderss").val());
		if (locationAdderss == "") {
			$("#locationAdderss_check").html("不能为空！");
		} else if ($.trim($("#locationAdderss").val().length) > 50) {
			$("#locationAdderss_check").html("长度不能超过50个字符!");
		} else if (!reg2.test(locationAdderss)) {
			$("#locationAdderss_check").html("只能为汉字，字母！ ");
		} else {
			$("#locationAdderss_check").html("");
		}
	}
	//经度
		function latOnBlur() {
		var lat = $.trim($("#lat").val());
		if (lat == "") {
			$("#lat_check").html("不能为空！");
		} else if ($.trim($("#lat").val().length) > 20) {
			$("#lat_check").html("长度不能超过20个字符!");
		} else if (!reg4.test(lat)) {
			$("#lat_check").html("只能为数字！ ");
		} else {
			$("#lat_check").html("");
		}
	}
	//纬度
	function lngOnBlur() {
		var lng = $.trim($("#lng").val());
		if (lng == "") {
			$("#lng_check").html("不能为空！");
		} else if ($.trim($("#lng").val().length) > 20) {
			$("#lng_check").html("长度不能超过20个字符!");
		} else if (!reg4.test(lng)) {
			$("#lng_check").html("只能为数字！ ");
		} else {
			$("#lng_check").html("");
		}
	}
	
	function map_location(){
		var name = $.trim($("#locationName").val());
		var address = $.trim($("#locationAdderss").val());
		if(name=="" || address==""){
			alert('请输入位置信息!');
			return;
		}
		geocoder(name+address);
	}
	function geocoder(address) {  
	
		mapObj.clearMap();
	    var MGeocoder;  
	    //加载地理编码插件  
	    mapObj.plugin(["AMap.Geocoder"], function() {          
	        MGeocoder = new AMap.Geocoder({   
	            city:"上海市漕河泾", //城市，默认：“全国”  
	            radius:1000 //范围，默认：500  
	        });  
	        //返回地理编码结果   
	        AMap.event.addListener(MGeocoder, "complete", geocoder_CallBack);   
	        //地理编码  
	        MGeocoder.getLocation(address);   
	    });  
	}    
	var latlngList=[];
	//地理编码返回结果展示     
	function geocoder_CallBack(data){ 
		latlngList=[];
	    //地理编码结果数组  
	    var geocode = new Array();  
	    geocode = data.geocodes;    
	    for (var i = 0; i < geocode.length; i++) {  
	    	latlngList.push(geocode[i].location);
	        var markerOption = {  
	            map:mapObj,  
				draggable :true,			
	            icon:"http://www.amap.com/images/mark.png",   
	            position:new AMap.LngLat(geocode[i].location.getLng(),geocode[i].location.getLat())  
	        };              
	        
	        var mar = new AMap.Marker(markerOption);    
	          
	          
	        if(i==0){
	        	$('#lng').val(mar.getPosition().getLng());
				$('#lat').val(mar.getPosition().getLat());
	        }
			
			 AMap.event.addListener(mar,"dragend",function(e){     
				 $('#lng').val(e.lnglat.lng);
					$('#lat').val(e.lnglat.lat);
			});
			
	    }  
	   
	    mapObj.setFitView();     
	    
	}   
	
</script>