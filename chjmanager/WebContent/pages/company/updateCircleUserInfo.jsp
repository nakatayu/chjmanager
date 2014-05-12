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
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<style type="text/css">
.tag_content {
	margin: 0px;
	padding: 2px 0 2px 0;
	list-style: none;
	line-height: 20px;
	font-size: 15px;
}

.shop_announcement {
	width: 557px;
	high: 57px;
	overflow-x: visible;
	overflow-y: visible;
}

#a1 {
	background-color: skyblue
}

[titie~=labelstyle] {
	font-size: 20px;
}

.tdstyle {
	font-size: 20px;
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
				</a> <a href="#" class="current">圈子人员</a>
			</div>
		</div>
		
<div style="padding:10px 0 0 20px;"> 
<table style="width: 100%;font-size: 12px;">
<tr style="font-size: 16px;font-weight: bold;">
<td id="companyInfo" colspan="8"><span id="circleName"></span> 圈子人员列表：</td></tr>
<tr valign="middle" align="right">
<td width="80px">成员角色： </td>
<td width="100px"> <div class="controls">
<select style="height: 25px;width: 100px;" id="circleMemberStatus"> 
           <option value="" selected="selected" role="">全部</option>           
            <option value="3" role="status">待审核</option> 
            <option value="1" role="status">审核通过</option>             
            <option value="1" role="circle_role">管理员</option>
            <option value="0" role="circle_role">普通成员</option>             
            </select>            
            </div></td>
            
<td  width="50px" style="">时间：</td>
<td  width="160px"> <div class="controls"><div  data-date="2012-12-02" class="input-append date datepicker" style="margin-top: 8px;">
                  <input type="text" id="fontTime" value=""  data-date-format="yyyy-mm-dd" style="width: 120px;">
                  <span class="add-on"><i class="icon-th"></i></span></div></div></td>
<td  width="15px" align="center">至  </td>
<td  width="160px"> <div class="controls"><div  data-date="2012-12-02" class="input-append date datepicker" style="margin-top: 8px;">
                  <input type="text" id="backTime" value=""  data-date-format="yyyy-mm-dd" style="width: 120px;">
                  <span class="add-on"><i class="icon-th"></i></span></div></div></td>
                  <td width="10px"></td>
                  
<!-- <td width="160px"> <input id="likeName" type="text" value="" style="float: right;margin-top: 8px;"/></td> -->
<td align="left"><button class="btn btn-success" onclick="loadData(1)" style="font-size: 20px;cursor: pointer;">查询</button>
</td>
</tr>
</table> 				
</div>	
		

		<div class="row-fluid" style="background-color: #FFF;padding-left:20px;">
			<div class="span12">
				<div class="widget-box"  style="margin-right: 40px;">
 			<input type="hidden" id="cir" name="circleId"/>
			<input type="hidden" name="selectedCirleIds" id="selectedCirleIds">
					 
					<table class="table table-bordered table-striped">
						 <thead>
						  <tr>
							<th width="20px"><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
							<th>名称</th>
							<th>加入时间</th>							 
							<th>角色</th>											
							<th>审核状态</th>
						</tr>
					</thead>									
					<tbody id="table_content">					 
					</tbody>		
					</table>
			<div class="widget-title"
							style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
    
         <div class="btn-group" style="margin-top: 6px;float: left;">
          <button class="btn btn-warning" style="margin: 0 5px;" onclick="updatetUserDStatus(3)">审核通过</button>
          <button class="btn btn-warning" style="margin: 0 5px;" onclick="updatetUserDStatus(2)">审核不通过</button>
          <button class="btn btn-warning" style="margin: 0 5px;" onclick="updatetbUserDRoles(1)">设为管理员</button>
          <button class="btn btn-warning" style="margin: 0 5px;" onclick="updatetbUserDRoles(0)">取消管理员</button>
          <button class="btn btn-warning" style="margin: 0 5px;" onclick="updatetbUserDFlag(2)">移除圈子</button>
         </div>
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
							<ul id="ul-page">

							</ul>
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
	<script src="${ctx}/js/bootstrap-datepicker.js"></script> 

</body>
</html>
<script type="text/javascript">
var circleId = <%=request.getParameter("circleId")%>
$('#cir').val(circleId);
var listData = [];//每一页的数据

var statusResult=["未知","未审核","审核未通过","审核通过"];

$(function() {
	$('.datepicker').datepicker();
	loadData(1);

});

function getUseruserId(){
	var str='';
	$('input[name="cirMemBoc"]:checked').each(function(){ 
        if($(this).attr("checked")){
            str += $(this).val()+',';
        }
    });
	
	return str;
}

function updatetUserDStatus(filedDValue){
	var str=getUseruserId();
	if(str.length<1){
		alert('请选择对象！');
		return; 
	} 
	$.ajax({
		type : "post",
		url : '${ctx}/circle!updatetUserDStatus.action',
		dataType : 'json',
		data : {userIdsa:str,circleId:circleId,status:filedDValue},
		success : function(msg, status) {
			if(msg.status==200){
				alert('修改成功！');
				window.location.reload();
			}else
				alert(msg.msg);
		}			
	});
}

function updatetbUserDRoles(filedDValue){
	var str=getUseruserId();
	if(str.length<1){
		alert('请选择对象！');
		return; 
	} 
	$.ajax({
		type : "post",
		url : '${ctx}/circle!updatetbUserDRoles.action',
		dataType : 'json',
		data : {userIdsa:str,circleId:circleId,status:filedDValue},
		success : function(msg, status) {
			if(msg.status==200){
				alert('设置成功！');
				window.location.reload();
			}else
				alert(msg.msg);
		}			
	});
}

function updatetbUserDFlag(filedDValue){
	var str=getUseruserId();
	if(str.length<1){
		alert('请选择对象！');
		return; 
	} 
	if(confirm("您确认删除此记录吗？")){
		$.ajax({
			type : "post",
			url : '${ctx}/circle!updatetbUserDFlag.action',
			dataType : 'json',
			data : {userIdsa:str,circleId:circleId,status:filedDValue},
			success : function(msg, status) {
				if(msg.status==200){
					alert('删除成功！');
					window.location.reload();
				}else
					alert(msg.msg);
			}			
		});
	}
}

function loadData(page, size, name) {
	 pageinfo["fontTime"]=$('#fontTime').val();
	 pageinfo["backTime"]=$('#backTime').val();
	 pageinfo["filedDValue"]=$('select[id="circleMemberStatus"]').val();
	 pageinfo["filedDname"]=$('#circleMemberStatus option:selected').attr("role");
	 pageinfo["circleId"] = circleId; 
	 /*  $.each(pageinfo,function(k,v){
		  alert(k+'------'+v);		  
	  }); */   
	  
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
		url : '${ctx}/circle!findCircleUserList.action',
		dataType : 'json',
		data : pageinfo,
		success : function(msg, status) {
			var str = '';
			if (msg.status == 200) {
				for ( var i = 0; i < msg.rows.length; i++) {
					var data = msg.rows[i];
					str+='<tr><td><input type="checkbox" name="cirMemBoc" value="'+data["user_id"]+'"/></td>';
					str+='<td>'+data["user"]+'</td>';
					str+='<td>'+data["create_time"]+'</td>';
					if(data["circle_role"]=='1'){
						str+='<td>管理员</td>';
					}else{
						if(data["status"]=='3'){
							str+='<td></td>';
						}else
						str+='<td>成员</td>';
					}					
					str+='<td>'+statusResult[data["status"]]+'</td>';
					str+='</tr>';					
				}
				
				$('#table_content').html(str);
				
				if(msg.total > pageinfo["size"]){
				var arrayPage = [];
				pageinfo["t"] = msg.total;
				if (msg.total % pageinfo["size"] == 0) {
					pageinfo["tp"] = msg.total / pageinfo["size"];
				} else {
					//向上取值
					pageinfo["tp"] = Math.ceil(msg.total
							/ pageinfo["size"]);
				}

				//如果最大页或当前页是1 上一页变灰不能点
				if (pageinfo["tp"] == 1 || pageinfo["page"] == 1
						|| pageinfo["tp"] == 0) {
					arrayPage
							.push('<li class="disabled"><a href="javascript:void(0)">上页</a></li>');
				} else {
					//变手型 （href="javascript:void(0)"）
					arrayPage
							.push('<li><a href="javascript:void(0)" onclick="loadData(-1)">上页</a></li>');
				}

				for ( var i = 1; i <= pageinfo["tp"]; i++) {
					if (i == pageinfo["page"]) {
						arrayPage
								.push('<li class="active"> <a href="javascript:void(0)" onclick="loadData('
										+ i
										+ ')">'
										+ i
										+ '</a></li>');
					} else {
						arrayPage
								.push('<li> <a href="javascript:void(0)" onclick="loadData('
										+ i
										+ ')">'
										+ i
										+ '</a> </li>');
					}

				}
				if (pageinfo["tp"] == pageinfo["page"]
						|| pageinfo["tp"] == 0) {
					arrayPage
							.push('<li class="disabled"><a href="javascript:void(0)">下页</a></li>');
				} else {
					arrayPage
							.push('<li><a href="javascript:void(0)" onclick="loadData(-2)">下页</a></li>');
				}

				$('#ul-page').html(arrayPage.join(''));
				}else
					$('#ul-page').html('');
			} else {
				$('#table_content').html('<tr><td colspan="5">'+msg.msg+'</td></tr>');
				$('#ul-page').html('');
			}
		}
	});
}


/* function delCircleUserInfo(user_id,circle_id){	
	if(confirm("您确认删除此记录吗？")){
			$.ajax({
				type : "post",
				data : {
					userId : user_id,
			       circleId : circle_id
				},
				url : '${ctx}/circle!delCircleUserInfo.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("删除成功！");
						window.location = "updateCircleUserInfo.jsp";
					}
				}
			});
		}
} */

</script>