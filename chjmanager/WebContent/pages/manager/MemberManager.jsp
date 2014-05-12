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
	<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="${ctx}/css/pager.css" />
	<style type="text/css">
		.dataTables_filter{
			top:0
		}
		.select2-container{
			width: 130px; top: 4px; left: 4px;
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
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">会员维护</a>
		</div>
	</div>

	<div class="container-fluid">

		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title" >
						<select onchange="chanage(this)">
							<option value="编号">编号</option>
							<option value="昵称" selected="selected">昵称</option>
							<option value="杉德卡号">杉德卡号</option>
							<option value="电话">电话</option>
						</select>
						<input style="margin: 3px 0px 2px 5px" align="right" type="text" id="txtName" placeholder="请输入关键字"  onblur="loadData(1)">
						<input style="margin: 2px 0px 2px 5px"  type="button"   onkeydown="loadData(1)" value="查询" class="btn btn-success" onclick="loadData(1)">
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped ">
							<thead>
							<tr>
								<th>
									<input type="checkbox">全选
								</th>
								<th >用户编号</th>
								<th >昵称</th>
								<th >电话</th>
								<th >杉德卡号</th>
								<th >活跃度</th>
								<th >注册时间</th>
								<th >最后登录时间</th>
							</tr>
							</thead>
							<input type="hidden" name="selectedUserId" id="selectedUserId">
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
							<%--<button class="btn btn-warning" onclick="addUser()">新增会员</button>--%>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-warning" onclick="delUser()">删除会员</button>
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
			
	var name=$('#txtName').val();
	
	 if(key=="userId"){
		 name="and (user_id like '%"+name+"%') ";
	 }else if(key=="nickName"){
		 name="and (nick_name like '%"+name+"%') ";
	 }else if(key=="phone"){
		 name="and (phone like '%"+name+"%') ";
	 }else if(key=="shandCardNo"){
		 name="and (shand_cardno like '%"+name+"%') ";
	 }else{
		 name="and (nick_name like '%"+name+"%') ";
	 }
	
	pageinfo["name"] = name;
	pageinfo["key"]=key;
	$.ajax({
		type : "post",
		url : '${ctx}/user!findUserList.action',
		dataType : 'json',
		data : pageinfo,
		success : function(msg, status) {
			var array = [];
			if (msg.status == 200) {

				for(var i=0; i<msg.rows.length;i++){
					var data = msg.rows[i];

					array.push('<tr class="gradeA"><td><input type="checkbox" value="'+data["user_id"]+'">');
					array.push('<td><a href="javascript:void(0)" onclick="findUserInfo('+ data["user_id"]+ ')">'+data["user_id"]+'</a></td>');
					array.push('<td><a href="javascript:void(0)" onclick="findUserInfo('+ data["user_id"]+ ')">'+data["nick_name"]+'</a></td>');
					array.push('<td>'+data["phone"]+'</td>');
					array.push('<td class="center">'+data["shand_cardno"]+'</td>');
					array.push('<td>'+data["active_value"]+'</td>');
					array.push('<td>'+data["register_time"]+'</td>');
					array.push('<td>'+data["last_login_time"]+'</td></tr>');
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
function findUserInfo(userId) {
	location.href = "${ctx}/pages/manager/findUserInfo.jsp?userId=" + userId;
}

function chanage(obj){
	document.getElementById('txtName').placeholder="请输入"+obj.value;
	if (obj.value=="编号") {
		key="userId";
	}else if(obj.value=="电话"){
		key="phone";
	}else if(obj.value=="杉德卡号"){
		key="shandCardNo";
	}else if(obj.value=="昵称"){
		key="nickName";
	}
}


function delUser(){
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
					selectedUserId : label
				},
				url : '${ctx}/user!deleteUserListInfo.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("删除成功！");
						window.location = "MemberManager.jsp";
					}else if(msg.status == 400){
						alert("删除失败！");
						window.location = "MemberManager.jsp";
					}
				}
			});
		}
	}
}


function addUser(){
	location.href = "${ctx}/pages/manager/addMember.jsp";
}
</script> 
</body>
</html>
