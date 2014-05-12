  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "chjservice" + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>标签列表</title>
 <link rel="stylesheet" href="${ctx}/css/pager.css" />
</head>
<body style="padding: 0px;border: 0;overflow: hidden;">
	
	<table width="100%" style="font-size: 20px;font-weight: bold;">
	<tr height="400px">
	<td valign="middle" align="center" width="5%"><a onclick="ladaData(-1)">上<br>一<br>张</a></td>
	<td width="90%" id="images">
	 
	</td>
	<td valign="middle" align="center" width="5%"><a onclick="ladaData(1)">下<br>一<br>张</a></td>
	</tr>
	<tr></tr>
	</table>
	 
	  <table width="100%" style="padding: 10px 20px 10px 20px;">
	  <tr>
	 <td height="100%">上传人：</td>
	 <td id="updname">上传人上传人上传人上传人</td>
	 <td>上传时间：</td>
	 <td id="creatTime">200-12-13 12:12:23</td>
	  <td align="center" style="font-size: 20px;font: bold;" onclick="ckeckTupicId()">查看图片评论</td>
	  </tr>
	  </table>
	    
</body>
</html>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/jquery.pager.js"></script>
<script type="text/javascript">
var activityId="${param.activityId}";
var pages="${param.pages}";
var pictureId=0;

$(function(){
	ladaData(1);
});

function ladaData(i){
	pages=Number(pages)+i;
	var setData={};
	setData["page"]=pages;
	setData["size"]=1;
	setData["activityId"]=activityId;
	
	$.ajax({
		type : "post",
		url : '${ctx}/activity!chechThePicture.action',
		dataType : 'json',
		data : setData,
		success : function(msg, status) {
			if(msg.status==200){
				
				pictureId=msg.rows[0]["activity_photo_id"];
				$('#images').html('<img src="${http_img}'+msg.rows[0]["file_path"]+'">');
				$('#updname').html(msg.rows[0]["touser"]);
				$('#creatTime').html(msg.rows[0]["upload_time"]);
			}else
				alert(msg.msg);
		}
	});
}

function ckeckTupicId(){
	 window.top.hidePopWin(true,pictureId);
}

</script>
