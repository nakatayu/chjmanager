﻿ <%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<!-- <body onload="mapInit()">
                             <div id="mapdiv"  style="width:800px;height:600px;">
                           </div>  
 -->
<body onload="mapInit();">
<table align="center">
<tr><td>
    <div id="mapdiv" style="width:800px;height:600px;" ></div>
	</td>
	<td>
	<td>
	</tr></table>
</body> 
 
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

</html>
<script type="text/javascript">
var mapObj;
var lng = <%=request.getParameter("lng")%>;
var lat = <%=request.getParameter("lat")%>;
function mapInit() {
    var opt = {
        level: 13, //设置地图缩放级别  
        center: new AMap.LngLat(lng, lat) //设置地图中心点 
    }
    mapObj = new AMap.Map("mapdiv", opt);
    mapObj.setCenter(new AMap.LngLat(lng,lat));
    
	var marker = new AMap.Marker({
        map:mapObj,
		draggable :true,
        icon: new AMap.Icon({
            image: "http://www.amap.com/images/mark.png",
            size:new AMap.Size(58,30),
            imageOffset: new AMap.Pixel(-32, -0)
        }),
        position: new AMap.LngLat(lng,lat),
        offset: new AMap.Pixel(-5,-30)
    });

	 AMap.event.addListener(marker,"dragend",function(e){  
	 	//$('#lng').val(e.lnglat.lng);
		//$('#lat').val(e.lnglat.lat);
	//	alert($(window.opener.document).find("#lat").val());
		 window.opener.document.getElementById("lng").value=e.lnglat.lng;
		 window.opener.document.getElementById("lat").value=e.lnglat.lat; 
	 });
}
</script>
﻿
