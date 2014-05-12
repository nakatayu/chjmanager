<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">服务信息</a>
			</div>
		</div>

		<div class="container-fluid">
		
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>共享漕河泾</h5>
						</div>
						<div class="widget-content nopadding">
						<div  style="float: right;top:background-position: " >
						<div class="container-fluid"> 
						<input type="hidden" name="selectedShopIds" id="selectedShopIds">
					<table class="table table-bordered table-striped">					
									<thead>
									<tr>
										<th>序号</th>
										<th>信息标题</th>
										<th>目标栏目</th>
										<th>发布人</th>
										<th>发布时间</th>
										<th>状态</th>
									    <th></th>
									</tr>
								</thead>									
								<tbody id="table_content">

								</tbody>
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
										<li><a href="javascript:void(0)"
											onclick="loadData(1,100)">100</a></li>
									</ul>
								</div>
								<div class="pagination alternate"
									style="margin-left: 30px; margin-top: 8px; float: right;">
									<ul id="pager">

									</ul>
								</div>
								 <div class="pagination alternate"
									style="margin-left: 0px; margin-top: 8px; float: left;">
									<button class="btn btn-warning" onclick="addserviceinfo()">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-warning" type="" onclick="deleteServicelist()">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
								</div>
						  </div>
						 
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div></div>
					
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

		pageinfo["name"] = $('#txtName').val();
		$.ajax({
					type : "post",
					url : '${ctx}/servicelist!findChjServiceList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr>');
								array
										.push('<td>'
												+ '<input type="checkbox" value="' + data["service_id"]+ '"/>'
												+ '</td>');
								array.push('<td>' + data["title"] + '</td>');
								
								if(data["service_type"]==1){array.push('<td>服务优惠送</td>');} 
								else if(data["service_type"]==2){array.push('<td>生活小贴士</td>');}
								else if(data["service_type"]==3){array.push('<td>政策早解读</td>');}
								else if(data["service_type"]==4){array.push('<td>公益你我他</td>');}
								else if(data["service_type"]==5){array.push('<td>招商直通车</td>');}
								else{array.push('<td>服务优惠送</td>');}	
		
								array.push('<td>' + data["name"] + '</td>');
								array.push('<td>' + data["release_time"] + '</td>');
								
								if(data["status"]==1){
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle'> 已审核<span class='caret'></span></button>"
								 			+"<ul class='dropdown-menu'>"
								 			+"<li><a href='javascript:void(0)' onclick='updatestatus(2,"+data["service_id"]+")'>未审核</a></li>"
								 			+"</ul></div>" 
											+ "</td>"); 
								}else {
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle'>未审核<span class='caret'></span></button>"
								 			+"<ul class='dropdown-menu'>"
								 			+"<li><a href='javascript:void(0)' onclick='updatestatus(1,"+data["service_id"]+")'>已审核</a></li>"
								 			+"</ul></div>" 
											+ "</td>"); 
								}
								
								array.push('<td>'+ '<a href="javascript:void(0)" onclick="updateServiceinfo('+ data["service_id"] + ')">' + "修改" + '</a>'+ '</td>');
								
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
							alert(msg.msg);

						}
					}
				});
	}
	
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    loadData(pageclickednumber);
	};

	  //修改页面 
	function updateServiceinfo(serviceId){
		window.location = "${ctx}/servicelist!findServiceInfo.action?serviceId="+serviceId;
	}
	
	
	  
	//付款状态 
	 function updatestatus(status,serviceId){
			 var ps = status;
		   	 var  ser = serviceId;		
			$("#status").val(ps);
			$("#serviceId").val(ser); 
			$.ajax({
				type : "post",
				url : '${ctx}/servicelist!updateServiceStatus.action',
				dataType : 'json',
				data : {
					status : ps,
					serviceId:ser
				},
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("审核状态修改成功！");
						loadData(1);
					}
				}
			})
	 }
	 
	//删除选中共享漕河泾  			
	function deleteServicelist() {

		if (confirm("您确认删除此记录吗？")) {
		
			if ($("#table_content").find("input[type=checkbox]:checked").size() == 0) {
				 alert("请选择需要删除的记录！");
			} else {
				var label = "";
				$("#table_content").find("input[type=checkbox]:checked").each(
						function() {
							label = label + $(this).attr("value") + ",";
				});
				
				$.ajax({
					type : "post",
					data : {
						selectedServicelistIds : label
					},
					url : '${ctx}/servicelist!deleteSerList.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							window.location = "ServiceList.jsp";
						}
					}
				});
			}
		}
	}
	
	function addserviceinfo() {
		location.href = "${ctx}/pages/company/ServiceInfo.jsp";
	}
</script>

