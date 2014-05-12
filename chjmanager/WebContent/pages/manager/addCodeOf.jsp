<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>服务供应商维护</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<style type="text/css">
.slect {
	width: 250px;
	height: 30px;
	border: 1px #ccc solid;
}

.input-in {
	width: 250px;
	height: 25px;
	border: 1px #ccc solid;
}

.btn-suc {
	width: 80px;
	padding: 5px 10px 5px 10px;
	background-color: #CC0;
	border: 1px #ccc solid;
	font-size: 16px;
	color: #FFF;
	font-family: '微软雅黑';
}
</style>
</head>
<body>
	<div></div>
	<table width="265px" style="margin: 10px 0 0 10px;font-weight: bold;">
		<tr>
			<td>请选择部门：</td>
		</tr>
		<tr>
			<td><select class="slect" id="seLect">
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
			</select></td>
		</tr>
		<tr>
			<td>请输入数量：</td>
		</tr>
		<tr>
			<td><input type="text" class="input-in" id="txtCode" onblur="txtCodeOnblur(this)" /></td>
		</tr>
		<tr>
			<td align="center"><button style="margin: 10px 40px 0 0;" 
					class="btn-suc" onclick="addNewCodeOfUser()">确&nbsp;&nbsp;&nbsp;定</button>
					<button style="margin: 10px 0 0 10px;"
					class="btn-suc" onclick="top.hidePopWin(false);">返&nbsp;&nbsp;&nbsp;回</button>
					</td>
		</tr>
	</table>

</body>
</html>
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript">

function txtCodeOnblur(obj){
	var reg = new RegExp("^[0-9--]*$");
	if(!reg.test($.trim($(obj).val()))){
		alert('只能输入数字！');
		$('#txtCode').val('');
		return;
	}
}
function addNewCodeOfUser(){

	var data={};
	data["name"]=$('#seLect').val();
	var reg = new RegExp("^[0-9--]*$");
	var qty=$.trim($('#txtCode').val());
	if(!reg.test(qty)){
		alert('只能输入数字！');
		$('#txtCode').val('');
		return;
	}else if(qty==null&&qty==''){
		alert('请输入数字！');
		return;
	}
	data["numCode"]=qty;	
	top.hidePopWin(true,data);	
}

</script>

