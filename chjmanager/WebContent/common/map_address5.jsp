﻿
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
html {
	background-color: #fff;
	font-family: 微软雅黑;
}

button {
	display: inline-block;
	padding: 4px 12px;
	font-size: 14px;
	line-height: 20px;
	color: #fff;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	background-color: #faa732;
}
</style>
</head>
<body>
	<div id="iCenter"
		style="width: 1070px; height: 440px; border: 2px solid #00aacc;"></div>
	<div
		style="padding: 2px 0px 0px 5px; font-size: 20px; margin: 0px 10px;">
		<span style="font-weight: bold;">店铺坐标：</span> X：<input type="text"
			id="lngX" name="lngX" value="${param.lng}" />&nbsp;Y：<input
			type="text" id="latY" name="latY" value="${param.lat}" />
		<button onclick="newLngLat()">确定</button>
	</div>
	

	<script
		src="http://webapi.amap.com/maps?v=1.2&key=57a5a7b350ad90c9bf5b9889b360f37e"></script>

<script src="${ctx}/js/jquery.min.js"></script>
</body>
</html>
<script type="text/javascript">
	var lng = '${param.lng}';
	var lat = '${param.lat}';
	var mapObj,point,tool,view,scale,marker;
	
	$(function() {
		
		point = new AMap.LngLat(lng, lat); // 创建点坐标
		mapObj = new AMap.Map("iCenter", {
			center : point,
			level : 18
		}); // 创建地图实例
		mapObj.plugin([ "AMap.ToolBar", "AMap.OverView", "AMap.Scale" ],
				function() {
					// 加载工具条
					tool = new AMap.ToolBar({
						direction : false,//隐藏方向导航  
						ruler : true,//隐藏视野级别控制尺  
						autoPosition : false//禁止自动定位  
					});
					mapObj.addControl(tool);
					//加载鹰眼  
					view = new AMap.OverView();
					mapObj.addControl(view);
					//加载比例尺  
					scale = new AMap.Scale();
					mapObj.addControl(scale);
				});

		 
	   marker = new AMap.Marker({
		   draggable : true,
	        map:mapObj,  
	        icon:"${ctx}/images/map/1.png",  
	        position:point  
	    }); 
		/* marker = new AMap.Marker({
			map : mapObj,
			draggable : true,
			content:createMyIcon(0),   
			position:point,
			offset: new AMap.Pixel(-50,-70)
		}); */

		AMap.event.addListener(marker, 'dragend', function(e) {
			document.getElementById("lngX").value = e.lnglat.getLng();
			document.getElementById("latY").value = e.lnglat.getLat();
		});
	});
	function newLngLat(){
		var data={};
		data["lng"]=$.trim($('#lngX').val());
		data["lat"]=$.trim($('#latY').val());
		top.hidePopWin(true,data);		
	}
	function createMyIcon(index){
		return '<div><img style="width:40px;height:45px;" src="${ctx}/images/map/'+(index+1)+'.png"/></div>';
	}
</script>
﻿
