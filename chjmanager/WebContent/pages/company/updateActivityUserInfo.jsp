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
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>
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
				</a> <a href="#" class="current">活动人员</a>
			</div>
		</div>
		
<div style="padding:10px 0 0 20px;"> 
<table style="width: 100%;font-size: 12px;">
<tr style="font-size: 16px;font-weight: bold;">
<td id="companyInfo" colspan="8"><span id="circleName"></span> 活动人员列表：</td></tr>
<tr valign="middle" align="right">
<td width="80px">成员状态： </td>
<td width="100px"> <div class="controls">
<select style="height: 25px;width: 100px;" id="activityMemberStatus"> 
           <option value="" selected="selected">全部</option>           
            <option value="1">待审核</option> 
            <option value="3">审核通过</option>                   
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
							<th width="30px"><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
							<th width="250px">名称</th>
							<th width="160px">联系方式</th>
							<th width="250px">邮箱</th>
							<th width="150px">加入时间</th>		 									
							<th width="100px">审核状态</th>
							<th width="100px">查看证件</th>
						</tr>
					</thead>
									
					<tbody id="table_content">
					 
					</tbody>
		
					</table>
			<div class="widget-title"
							style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
    
         <div class="btn-group" style="margin-top: 6px;float: left;">
          <button class="btn btn-warning" style="margin: 0 5px;" onclick="updatetUserAStatus(3)">审核通过</button>
          <button class="btn btn-warning" style="margin: 0 5px;" onclick="updatetUserAStatus(2)">审核不通过</button>
          <button class="btn btn-warning" style="margin: 0 5px;" onclick="updatetbActivityUserFlag(2)">移除活动</button>
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
var activityId = <%=request.getParameter("activityId")%>

var listData = [];//每一页的数据

var statusResult=["未知","未审核","审核未通过","审核通过","已退出","被移除"];

$(function() {
	$('.datepicker').datepicker();
	loadData(1);

});

function getUseruserId(){
	var str='';
	$('input[name="actiMemBoc"]:checked').each(function(){ 
        if($(this).attr("checked")){
            str += $(this).val()+',';
        }
    });
	return str;
}

function updatetUserAStatus(lues){
	var str=getUseruserId();
	if(str.length<1){
		alert('请选择对象！');
		return; 
	} 	
	$.ajax({
		type : "post",
		url : '${ctx}/activity!updatetUserAStatus.action',
		dataType : 'json',
		data : {userId:str,activityId:activityId,status:lues},
		success : function(msg, status) {
			if(msg.status==200){
				alert('修改成功！');
				window.location.reload();
			}else
				alert(msg.msg);
		}			
	});	
}

function updatetbActivityUserFlag(lues){
	var str=getUseruserId();
	if(str.length<1){
		alert('请选择对象！');
		return; 
	} 
	if(confirm("您确认删除这些成员吗？")){
		$.ajax({
			type : "post",
			url : '${ctx}/activity!updateActivityUserflag.action',
			dataType : 'json',
			data : {userId:str,activityId:activityId,status:lues},
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

function checkTheTopInfo(userId){
	showPopWin('查看活动人员证件','${ctx}/user!checkMemberCredentials.action?activityId='+activityId+'&userId='+userId, 450, 500,  null);
}

function loadData(page, size, name) {
	 pageinfo["fontTime"]=$('#fontTime').val();
	 pageinfo["backTime"]=$('#backTime').val();
	 pageinfo["status"]=$('select[id="activityMemberStatus"]').val();
	 pageinfo["activityId"] = activityId; 
	  
	  
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
	/* $.each(pageinfo,function(k,v){
		  alert(k+'------'+v);		  
	  }); */
	$.ajax({
		type : "post",
		url : '${ctx}/activity!findActivityOfUserList.action',
		dataType : 'json',
		data : pageinfo,
		success : function(msg, status) {
			var str = '';
			if (msg.status == 200) {
				for ( var i = 0; i < msg.rows.length; i++) {
					var data = msg.rows[i];
					str+='<tr><td><input type="checkbox" name="actiMemBoc" value="'+data["user_id"]+'"/></td>';
					var name=data["user"]["name"];
					if(data["user"]["name"]==null){
						name='';
					}
					var phone=data["user"]["phone"];
					if(data["user"]["phone"]==null){
						phone='';
					}
					var email=data["user"]["email"];
					if(data["user"]["email"]==null){
						email='';
					}
					str+='<td>'+name+'</td>';
					str+='<td>'+phone+'</td>';
					str+='<td>'+email+'</td>';
					str+='<td>'+data["create_time"]+'</td>';
					str+='<td>'+statusResult[data["status"]]+'</td>';
					if(data["checkCard"]=='T'){
						str+='<td><a href="javascript:void(0)" onclick="checkTheTopInfo(' + data["user_id"]+ ')">查看证件</a></td>';
					}else{
						str+='<td></td>';
					}
							
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