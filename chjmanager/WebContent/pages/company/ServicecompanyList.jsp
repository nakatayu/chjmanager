<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>共享漕河泾维护</title>
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
<style type="text/css">
.serviceCheckPassCss{color:#009933;}  
.serviceCheckCss{color:#FF0000;}
</style>
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">共享漕河泾列表</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box" style="margin-bottom: 0px;">
<div align="left" class="widget-title"  >
<table>
		<tr>
			<td>
						<span>状态：</span>
					<select style="width: 120px;" id="serviceStatusId"
							name="serviceStatusName">
							<option value="">全部</option>
							<option value="1">审核通过</option>
							<option value="2">审核不通过</option>
							<option value="3">未审核</option>
							<option value="4">关闭</option>
						</select>
			</td>
			<td>
						<span>目标栏目：</span> 
					<select	style="width: 150px;" id="serviceTypeId"  name="serviceTypeList">
							<option value="">全部</option>
							<option value="1">服务优惠送</option>
							<option value="2">生活小贴士</option>
							<option value="3">政策早解读</option>
							<option value="4">公益你我他</option>
							<option value="5">招商直通车</option>
						</select>
			</td>
			<td>
			<span>关键词：</span>
						<input style="margin: 3px 0px 2px 5px" align="right" type="text"
							id="serviceKeyWordId" name="serviceKeyWord" placeholder="请输入信息标题" onblur="loadData(1)">
						<input style="margin: 2px 0px 2px 5px" type="button" value="查询"
							class="btn btn-success" onclick="loadData(1)">
			</td>
		</tr>
</table>
		</div>
					<table class="table table-bordered table-striped">
						<div class="widget-content nopadding">
							<div class="container-fluid">
						<thead>
							<tr>
								<th style="width: 7%"><input type="checkbox">全选</th>
								<th>信息标题</th>
								<th>目标栏目</th>
								<th>发布时间</th>
								<th>状态</th>
							</tr>
						</thead>
						<input type="hidden" name="serivceId"  id="serivceId">
						<tbody id="table_content">

						</tbody>
						</div></div>
					</table>
					<div class="widget-title"
						style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">

						<div class="btn-group" style="margin-top: 6px; float: right;">
							<button class="btn" id="pagesize">10</button>
							<button data-toggle="dropdown" class="btn dropdown-toggle">
								<span class="caret" style="height: 6px;"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0)" onclick="loadData(1,10)">10</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadData(1,20)">20</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadData(1,50)">50</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadData(1,100)">100</a></li>
							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 30px; margin-top: 8px; float: right;">
							<ul id="pager">

							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 0px; margin-top: 8px; float: left;">
							<button class="btn btn-warning" style="margin:0px 5px;" onclick="addserviceinfo()">新增信息</button>
							<button class="btn btn-warning" style="margin:0px 5px;" onclick="deleteServicelist()">删除信息</button>
							 <button class="btn btn-warning" style="margin:0px 5px;" onclick="applyCloseOrOpenService(3)">申请关闭</button>
							 <button class="btn btn-warning" style="margin:0px 5px;" onclick="applyCloseOrOpenService(4)">申请开启</button>			 
						</div>
					</div>
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
	var listData = [];//每一页的数据
    var serviceStatus = ["","创建待审核", "修改申请","申请关闭","申请开启"]; //共享漕河泾审核状态 
    var examineResult=["","审核通过","审核不通过","未审核","关闭"];
	$(function() {
		loadData(1);
	});
	function loadData(page, size, name) {
		if (size != undefined) {
			pageinfo["size"] = size;
			$('#pagesize').html(size);
		}
		if (page == -1)
			pageinfo["page"]--;
		else if (page == -2)
			pageinfo["page"]++;
		else {
			if (page >= pageinfo["tp"] && pageinfo["tp"] > 0)
				pageinfo["page"] = pageinfo["tp"];
			else
				pageinfo["page"] = page;
		}

		pageinfo["serviceStatus"] = $('#serviceStatusId').val();//状态
		pageinfo["serviceTypeList"] = $('#serviceTypeId').val();//栏目
		pageinfo["serviceKeyWord"] = $('#serviceKeyWordId').val();//关键词
		
		$.ajax({
					type : "post",
					url : '${ctx}/servicelist!findServiceList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr>');
								array.push('<td>'
												+ '<input type="checkbox" style="margin:0px 0px 0px 15px;padding:0px" value="' + data["service_id"]+ '" estatus="'+data["status"]+'"/>'
												+ '</td>');
								array.push('<td>' +'<a href="javascript:void(0)" onclick="updateServiceinfo('+ data["service_id"]+ ')">'+ data["title"] + '</td>');
								
								if(data["service_type"]==1){array.push('<td>服务优惠送</td>');} 
								else if(data["service_type"]==2){array.push('<td>生活小贴士</td>');}
								else if(data["service_type"]==3){array.push('<td>政策早解读</td>');}
								else if(data["service_type"]==4){array.push('<td>公益你我他</td>');}
								else if(data["service_type"]==5){array.push('<td>招商直通车</td>');}
								else{array.push('<td>服务优惠送</td>');}	
								
								array.push('<td>' + data["release_time"] + '</td>');
								array.push('<td>'+serviceStatus[data["status"]]+":"+examineResult[data["examineResult"]]+'</td>');
								array.push('</tr>');
							}
							$('#table_content').html(array.join(''));
							
							if(msg.total>pageinfo["size"]){
								if(msg.total%pageinfo["size"]==0)
					    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
					    	 else
					    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
					    	 $("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
					    	
							}else{
								$('#pager').html('');	
							}					 
						} else {
							$('#pager').html('');	
							$('#table_content').html('<tr><td colspan="5">'+msg.msg+'</td></tr>');
						}
					}
				});
	}
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    loadData(pageclickednumber);
	}
	  /*
	  *修改页面 
	  */
	function updateServiceinfo(serviceId){
		window.location = "${ctx}/servicelist!findServiceInfo.action?serviceId="+serviceId;
	}
	
	 
	 //申请关闭
	 function applyCloseOrOpenService(type){
		 var checkedCount  = $("input[type=checkbox]:checked").size();
		 if(checkedCount!=1){
			 alert("每次只能选择一条数据!");
		 }else{
			 var label='';  
			 $("#table_content").find("input[type=checkbox]:checked").each(
					function() {
						if(type==$(this).attr("estatus")){
							alert("此信息已"+type==3?"关闭！":"开启！");
						}else{
							label =$(this).attr("value");
						}						
				});
			 if($.trim(label)==''){
				 return;
			 }
			 $.ajax({
					type : "post",
					data : {serviceId:label,serviceStatus:type},
					url : '${ctx}/servicelist!applyCloseServiceListInfo.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("申请成功！");
							window.location.reload(true);
						}else if(msg.status==500){
						 	alert("不可重复！");
						}else{
							alert("申请失败！");
						}
					}
				});
		 } 
	 }
	
	//删除选中共享漕河泾  			
	function deleteServicelist() {
		if (confirm("您确认删除此记录吗？")) {
			if ($("#table_content").find("input[type=checkbox]:checked").size() == 0) {
				 alert("请选择需要删除的记录！");
			} else {
				var label = "";
				$("#table_content").find("input[type=checkbox]:checked").each(function() {
							label = label + $(this).attr("value") + ",";
				});
				$.ajax({
					type : "post",
					data : {
						serivceId : label
					},
					url : '${ctx}/servicelist!deleteSerList.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							window.location.reload(true);
						}else{
							alert("删除失败");
						}
					}
				});
			}
		}
	}
	//增加
	function addserviceinfo() {
		location.href = "${ctx}/pages/company/ServiceInfoAdd.jsp";
	}
	
	
	//审核通过  //1审核通过2审核不通过3未审核 4关闭
	/* function serviceInfoPass(){
		 var checkedCount  = $("input[type=checkbox]:checked").size();
		 if(checkedCount>1){
			 alert("每次只能选择一条数据");
		 }else if(checkedCount==0){
			 alert("请选择数据");
		 }else{
			 var companyPass= $("input[type=checkbox]:checked").parents("tr").find("td:eq(4)").find("p").html();
			 if(companyPass=="审核通过"){
				alert("不可重复审核");
			}else{
				 var label = $("#table_content").find("input[type=checkbox]:checked").val();
			  $.ajax({
						type : "post",
						data : {
							serivceId : label
						},
						url : '${ctx}/servicelist!updateServiceStatus.action?status='+1,
						dataType : 'json',
						success : function(msg, status) {
							if (msg.status == 200) {
								alert("审核成功，审核状态更改为审核通过！");
								window.location.reload(true);
							}else if(msg.status == 400){
								alert("系统繁忙，请稍后再试！");
								window.location.reload(true);
							}
						}
					}); 
				}
		 }
	}
	//审核不通过 //1审核通过2审核不通过3未审核 4关闭
	function serviceInfoNoPass(){
		var checkedCount  = $("input[type=checkbox]:checked").size();
		 if(checkedCount>1){
			 alert("每次只能选择一条数据");
		 }else if(checkedCount==0){
			 alert("请选择数据");
		 }else{
			 var companyPass= $("input[type=checkbox]:checked").parents("tr").find("td:eq(4)").find("p").html();
			 if(companyPass=="审核不通过"){
				alert("不可重复审核");
			}else{
				 var label = $("#table_content").find("input[type=checkbox]:checked").val();
			 $.ajax({
						type : "post",
						data : {
							serivceId : label
						},
						url : '${ctx}/servicelist!updateServiceStatus.action?status='+2,
						dataType : 'json',
						success : function(msg, status) {
							if (msg.status == 200) {
								alert("审核成功，审核状态更改为审核不通过！");
								window.location.reload(true);
							}else if(msg.status == 400){
								alert("系统繁忙，请稍后再试！");
								window.location.reload(true);
							}
						}
					});
				}
		 }
	}
	//关闭信息  //1审核通过2审核不通过3未审核 4关闭
	function serviceInfoClose(){
		var checkedCount  = $("input[type=checkbox]:checked").size();
		 if(checkedCount>1){
			 alert("每次只能选择一条数据");
		 }else if(checkedCount==0){
			 alert("请选择数据");
		 }else{
			 var companyPass= $("input[type=checkbox]:checked").parents("tr").find("td:eq(4)").find("p").html();
			 if(companyPass=="关闭"){
				alert("不可重复审核");
			}else{
				 var label = $("#table_content").find("input[type=checkbox]:checked").val();
			 $.ajax({
						type : "post",
						data : {
							serivceId : label
						},
						url : '${ctx}/servicelist!updateServiceStatus.action?status='+4,
						dataType : 'json',
						success : function(msg, status) {
							if (msg.status == 200) {
								alert("关闭成功");
								window.location.reload(true);
							}else if(msg.status == 400){
								alert("系统繁忙，请稍后再试！");
								window.location.reload(true);
							}
						}
					});
				}
		 }
	} */
</script>


