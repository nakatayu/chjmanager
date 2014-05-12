<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<title>企业后台维护人员账号管理</title>
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
		.dataTables_filter{
			top:0
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
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">人员账号列表</a>
		</div>
	</div>

	<div class="container-fluid">

		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-content nopadding">
					<input type="hidden" name="selectedUserId" id="selectedUserId" />
						<table class="table table-bordered table-striped ">
							<thead>
							<tr>
								<th  style="width:7%"><input type="checkbox" /> <br/>全选</th>
								<th >正式名称</th>
								<th >登录名称</th>
								<th >手机号码</th>
								<th >级别</th>
								<th >最后登录时间</th>
							</tr>
							</thead>							
							<tbody id="table_content">
							</tbody>
						</table>
					</div>
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
						<div class="row-fluid" style="margin: 6px 0px 0px 0px">
							<button class="btn btn-warning" onclick="addPersonnel()">新增会员</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-warning" onclick="delPersonnel()">删除会员</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-warning" onclick="setPernelManager()">权限设置</button>
						</div>
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
var key="";
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
	$.ajax({
		type : "post",
		url : '${ctx}/personnel!findPersonnelList.action',
		dataType : 'json',
		data : pageinfo,
		success : function(msg, status) {
			var array = [];
			if (msg.status == 200) {
				for(var i=0; i<msg.rows.length;i++){
					var data = msg.rows[i];
					 array.push('<tr>');
					 array.push('<td>'+ '<input type="checkbox" value="' +  data["id"] + '" typeVal="'+data["type"]+'" />'+ '</td>');
					 array.push('<td>' + '<a href="javascript:void(0)" onclick="findPersonnel('+data["id"]
						+ ')">'+data["name"] + '</td>');
					 array.push('<td>' +'<a href="javascript:void(0)" onclick="findPersonnel('+data["id"]
						+ ')">' +data["userName"] + '</td>');
					 array.push('<td>' + data["phone"] + '</td>');
					 if(data["type"]==2){
						 array.push('<td>企业账号</td>');
					 } else if(data["type"]==3){
						 array.push('<td>店铺账号</td>');
					 }else if(data["type"]==4){
						 array.push('<td>企业账号</td>');
					 }else if(data["type"]==5){
						 array.push('<td>店铺账号</td>');
					 }
					 array.push('<td>' + data["endTime"] + '</td>');
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
 

//增加账号
function addPersonnel(){
	 location.href = "${ctx}/pages/company/CompanyManagerAddAccountInfo.jsp";
}
//查询账号
function findPersonnel(personnelId){
	location.href = "${ctx}/personnel!findPersonnelInfo.action?personnelId="+personnelId;
}
//删除账号
function delPersonnel(){
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
					selectedUserId : label
				},
				url : '${ctx}/personnel!delPersonnelInfo.action',
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

function setPernelManager(){
	var lbl = [];
	$("#table_content").find("input[type=checkbox]:checked").each(function() {
		lbl.push($(this).attr("value"));		
	});	
	if(lbl.length>1){
		alert('每次只能选择一位!');
		return;
	}else if(lbl.length==0){
		alert('请选择设置人员!');
		return;
	}else if(lbl[0]=="${user.id}"){
		alert('请不要给自己设置权限!');
		return;
	}
	window.location.href='${ctx}/personnel!seltRoleOfPersonnel.action?personnelId='+lbl[0]+'&type='+1;	
}


</script> 

