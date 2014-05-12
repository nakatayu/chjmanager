<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html>
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

<link rel="stylesheet" type="text/css"
	href="${ctx}/js/dialog/dialog_subModal.css" />
<link rel="stylesheet" href="${ctx}/css/pager.css" />

<style type="text/css">
.divOfimg {
	width: 142px;
	height: 160px;
	margin: 5px;
	border: #FF0 1px solid;
	float: left;
}

</style>
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
					<i class="icon-home"></i> 主页
				</a> <a href="#" class="current">活动照片评论维护</a>
			</div>
		</div>
		
		<div class="container-fluid">
		<div class="row-fluid" id="pictureList">
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
	<script src="${ctx}/js/dialog/dialog_common.js"></script>
	<script src="${ctx}/js/dialog/dialog_subModal.js"></script>
	<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">
var activityId = "${param.activityId}";

$(function() {
	 $.ajax({
	 type : "post",
	 url : '${ctx}/activity!selectPictureOfActiv.action',
	 dataType : 'json',
	 data : {activityId:activityId},
	 success : function(msg, status) {
		 if(msg.status==200){	
			 var str='';
			 for(var i=0;i<msg.rows.length;i++){
				 str+='<img src="${http_img}'+msg.rows[i]["file_path"]+
				 '" class="divOfimg" onclick="queryOfNumberPict('+i+')" />';
			 }
			 $('#pictureList').html(str);
		 }else
			 $('#pictureList').html(msg.msg);
		 }
	 });
}); 

function queryOfNumberPict(i) {
	 showPopWin('活动照片','${ctx}/pages/manager/photo.jsp?activityId='+activityId+'&pages='+i, 1100, 500,nexttypesteot);
}
nexttypesteot=function(value){
	window.location.href="${ctx}/pages/manager/ActivityPhotoComment.jsp?activPictureId="+value;
}
</script>


