
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>web广告图片管理</title>
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
<link rel="stylesheet" href="${ctx}/css/pager.css" />
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

<div id="content">

		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">web广告图片管理</a>
			</div>
		</div>
	 <div class="container-fluid">
	   <div class="row-fluid">
		 <div class="widget-box" style="margin-bottom: 0px;">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>web广告图片管理</h5>
						</div>
			  <table class="table table-bordered table-striped">
				 <div class="widget-content nopadding">
					<div  style="float: right;top:background-position: " >	
						<table class="table table-bordered table-striped">
						 <div class="widget-content nopadding">
						 <div class="container-fluid">
			             <input type="hidden" id="selectedShopId" name="selectedShopId"  /> 			
							 <thead>
								 <tr>
									 
									<th>页面</th>
									<th>页面位置</th>
									<th>号码</th> 
									<th>图片标题</th> 
									<th>链接网址</th> 
								</tr>
							 </thead>
							 		<tbody id="table_content">

								</tbody>
						 </table>
						 
				<div class="widget-title"
					 style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
					 <div class="pagination alternate" style="margin-left: 0px; margin-top: 8px; float: left;">
			 
					</div>
				 </div>
				</div>
					</div>
				</table>
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
		<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>

<script type="text/javascript">
//加载已经选择推广类型	
 
   $(document).ready(function(){ 
 
		$.ajax({
			type : "post",
			url : '${ctx}/advertisement!findWebAdvertisementList.action',
			dataType : 'json',
			success : function(msg, status) {
				var array = [];
				if (msg.status == 200) {
					for ( var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];
					 array.push('<tr>');
					 array.push('<td>' + '<a href="javascript:void(0)" onclick="selectWebPicture('+ data["advertisement_id"]+ ')">'+data["page_web"] + '</td>');
					 array.push('<td>' +  '<a href="javascript:void(0)" onclick="selectWebPicture('+ data["advertisement_id"]+ ')">'+data["page_web"] +data["page_position"] + '</td>');
					 array.push('<td>' + data["page_name"] + '</td>');
					 array.push('<td>' + data["picture_title"] + '</td>');
					 array.push('<td>' + data["link_address"] + '</td>');
					// array.push('<td>' + '<a href="javascript:void(0)" onclick="updatePicture('+ data
                     //["advertisement_id"]+ ')">'+data["picture_title"] + '</td>');
						 
						 
						 array.push('</tr>');
					}
					$('#table_content').html(array.join(''));
				}
			}
		})});
	 //更新app的广告页 
		function selectWebPicture(advertisementId){
			location.href = "${ctx}/advertisement!selectWebDetail.action?advertisementId="+advertisementId;

		}
</script>	
