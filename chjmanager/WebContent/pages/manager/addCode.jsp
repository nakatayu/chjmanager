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

<link rel="stylesheet" type="text/css"
	href="${ctx}/js/dialog/dialog_subModal.css" />
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<script src="${ctx}/js/dialog/dialog_common.js"></script>
<script src="${ctx}/js/dialog/dialog_subModal.js"></script>
<style type="text/css">
.dataTables_filter {
	top: 0
}

.select2-container {
	width: 130px;
	top: 4px;
	left: 4px;
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
				</a> <a href="#" class="current">邀请码生成</a>
			</div>
		</div>

		<div class="container-fluid">

			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<select onchange="chanage(this)" id="namename">
								<option value="">请选择部门</option>
								<option value="董事长室">董事长室</option>
								<option value="总经理室">总经理室</option>
								<option value="顾问">顾问</option>
								<option value="党办、办公室">党办、办公室</option>
								<option value="工会">工会</option>
								<option value="组织处、人力资源部">组织处、人力资源部</option>
								<option value="审计室">审计室</option>
								<option value="计财部">计财部</option>
								<option value="建设部">建设部</option>
								<option value="招商中心">招商中心</option>
								<option value="投资经营部">投资经营部</option>
								<option value="科技部">科技部</option>
								<option value="园区管理中心">园区管理中心</option>
								<option value="土地管理部">土地管理部</option>
								<option value="企业服务部">企业服务部</option>
								<option value="战略发展部">战略发展部</option>
								<option value="开发区企业协会">开发区企业协会</option>
								<option value="泽阳">泽阳</option>
								<option value="企业服务公司">企业服务公司</option>
								<option value="4008热线">4008热线</option>
								<option value="各服务提供方">各服务提供方</option>
								<option value="项目组机动">项目组机动</option>
							</select> <input style="margin: 3px 0px 2px 5px" align="right" type="text"
								id="txtCode" placeholder="请输入邀请码"> <input
								style="margin: 2px 0px 2px 5px" type="button" value="查询"
								class="btn btn-success" onclick="loadData(1)">
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped ">
								<thead>
									<tr>
										<th width="10%"><input type="checkbox">全选</th>
										<th width="15%">部门</th>
										<th width="15%">邀请码</th>
										<th width="15%">是否使用</th>
										<th width="45%">使用者名称</th>
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
								<div id="pager">
								</div>
							</div>
						</div>
						<div class="widget-title"
							style="height: 40px; border: 1px solid #ccc; padding: 4px 0 4px 5px;">

							<div class="btn-group" style="float: left;">

								<button class="btn btn-warning" style="margin: 0 5px 0 5px;"
									onclick="newInvitationCode()">生成邀请码</button>
								<button class="btn btn-warning" style="margin: 0 5px 0 5px;"
									onclick="delInvitationCode()">删除邀请吗</button>
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
	var key = "";

	$(function() {
		loadData(1);
	});

	function delInvitationCode(){
		var str='';
		$('input[name="codeBoc"]:checked').each(function(){ 
	        if($(this).attr("checked")){
	            str += $(this).val()+',';
	        }
	    });
		if(str.length<1){
			alert('请选择对象！');
			return; 
		}
		if (confirm("您确认删除这些记录吗？")) {
			$.ajax({
				type : "post",
				data : {codeIdes: str},
				url : '${ctx}/user!deleteTbCodelst.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("删除成功！");
						loadData(1);
					}else{
						alert(msg.msg);
					}
				}
			});
		}
	}
	
	function newInvitationCode() {
		showPopWin('生成邀请码', '${ctx}/pages/manager/addCodeOf.jsp', 320, 220,
				oncptuuj);
	}
	oncptuuj=function(serdata){
		$.ajax({
			type : "post",
			url : '${ctx}/user!addUserOfCode.action',
			dataType : 'json',
			data : serdata,
			success : function(msg, status) {
				if(msg.status==200){
					alert('生成成功！');
					loadData(1);
				}else{
					alert(msg.msg);
				}
			}			
		});
	}

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
 
		pageinfo["name"]=$('#namename').val();
		pageinfo["userCode"]=$('#txtCode').val();
		
		$.ajax({
			type : "post",
			url : '${ctx}/user!findUserCodeInfolt.action',
			dataType : 'json',
			data : pageinfo,
			success : function(msg, status) {
				
				if (msg.status == 200) {
					var str='';
					for ( var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];
						
						str+='<tr>';
						str+='<td><input type="checkbox" value="' + data["code_id"]+ '" name="codeBoc"/></td>';
						str+='<td>'+data["depart"]+'</td>';
						str+='<td>'+data["code"]+'</td>';
						if(data["be_used"]=='T'){
							str+='<td>已用</td>';
							str+='<td>'+data["user"]+'</td>';
						}else if(data["be_used"]=='F'){
							str+='<td>未用</td>';
							str+='<td></td>';
						}						
						str+='</tr>';
					}
					$('#table_content').html(str);
					
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
</script>
