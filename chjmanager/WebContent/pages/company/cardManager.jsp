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
<title>活动人员证件查看</title>
<style type="text/css">
.btns {
	border: 1px;
	background-color: yellow;
	font-size: 16px;
	width: 80px;
	height: 30px;
}

.btns:HOVER {
	background-color: red;
}
</style>
</head>

<body>
<c:choose>
<c:when test="${fn:length(userCard)>0}">
<table width="100%">
<tr><td align="center" valign="top"><img src="${http_img}${userCard.file_path}" width="400" height="350"/></td></tr>
<tr><td align="left" style="font-size: 16px;height:20px;font-family: '微软雅黑'; ">
<span style="font-size: 22px;font:bold;">申请理由：</span>${userCard.reason}</td></tr>
</table>
</c:when>
<c:otherwise>
没有相关证件！
</c:otherwise>
</c:choose>
 </body>
 
 </html>

 
 
 
 
 
 
 