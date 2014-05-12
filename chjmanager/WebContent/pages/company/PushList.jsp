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
				<i class="icon-home"></i> 主页</a> <a href="javascript:void(0)" onclick="" class="current">推送管理</a>
			</div>
		</div>

		<div class="container-fluid">
		
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>推送管理</h5>
						</div>
<input type="hidden" id="deleteFlag" name="deleteFlag"  value="2" />
					<table class="table table-bordered table-striped">
						<div class="widget-content nopadding">
						<div  style="float: right;top:background-position: " >
						<div class="container-fluid"> 
									<thead>
									<tr>
										<th>  <input type="checkbox" /> 全选</th>
										<th>申请企业/店铺</th>
										<th>推送内容</th>
										<th>推送方式</th>
										<th>申请人</th>
										<th>申请时间</th>
									    <th>状态</th>
									    <th colspan="2">操作</th>
									   
									</tr>
								</thead>
								<input type="hidden" name="selectpushId"
											id="selectpushId">
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
									<button class="btn btn-warning" onclick="addPushInfo()">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-warning" onclick="deletePushInfo()">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
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
					url : '${ctx}/push!findPushListInfo.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr>');
								array.push('<td>'+ '<input type="checkbox" value="' + data["push_id"]+ '"/>'+ '</td>');
								array.push('<td><a href="javascript:void(0)" onclick="window.location.href=\'${ctx}/push!pushInfoDetail.action?pushId='+data["push_id"]+'\'">' + data["organizationName"] + '</a></td>');
								array.push('<td>' + data["content"]+ '</td>');
								
								if(data["manner"]=='-1'){array.push('<td>全部</td>');}
								if(data["manner"]=='1'){array.push('<td>短信</td>');}
								if(data["manner"]=='2'){array.push('<td>App</td>');}
								
								array.push('<td>' + data["username"]+ '</td>');
								array.push('<td>' + data["apply_time"]+ '</td>');
								
								if(data["status"]=='0'){array.push('<td>未审核</td>');}
								if(data["status"]=='1'){array.push('<td>审核中</td>');}
								if(data["status"]=='2'){array.push('<td>审核未通过</td>');}
								if(data["status"]=='3'){array.push('<td>审核通过</td>');}//1 审核中  2 审核未通过 3 审核通过 
							    array.push('<td>'+ '<a href="javascript:void(0)" onclick="window.location.href=\'${ctx}/push!pushInfoDetail.action?pushId='+data["push_id"]+'\'">' + "查看" + '</a>'+ '</td>');
					
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
	
	
	  
 //删除  假删 
	function deletePushInfo(){
		
			if ($("#table_content").find("input[type=checkbox]:checked").size() == 0) {
				alert("请选择需要删除的记录！");
			} else {
				if (confirm("您确认删除此记录吗？")) {
					var label = [];
					$("#table_content").find("input[type=checkbox]:checked").each(
							function() {
								label.push($(this).attr("value"));
					});
					
					$.ajax({
						type : "post",
					    data : {selectpushId : label.join(',')}, 
						url : '${ctx}/push!updatePushInfoDeleteFlag.action',
						dataType : 'json',
						success : function(msg, status) {
							if (msg.status == 200) {
								alert("删除成功!");
								window.location.reload(true);
							}
							else{
								alert('删除失败!')
							}
							
						}
					});
				}
			}
	}
//修改对象  	
	function updatePush(pushId) {
		location.href = "${ctx}/push!findPushInfo.action?pushId="+pushId;
	} 
//新增推送对象  	
	function addPushInfo() {
		location.href = "${ctx}/pages/company/PushInfo.jsp";
	} 
</script>
</body>
</html>
