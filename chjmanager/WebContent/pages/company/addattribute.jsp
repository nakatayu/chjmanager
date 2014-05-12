<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tdname {
	font-size: 20px;
	font-weight: bold;
}

.tdvalue {
	
}

.tdtitle {
	color: red;
	font-size: 12px;
}

.btnbtns {
	display: inline-block;
	padding: 4px 12px;
	margin: 30px 20px 10px 20px;
	font-size: 14px;
	line-height: 20px;
	color: #fff;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	background-color: #faa732;
}
</style>
</head>
<body>

	<table style="margin: 30px;">
		<tr>
			<td class="tdname">属性名称：</td>
			<td class="tdvalue"><input type="text" id="attributeName"
				style="width: 250px;" onblur="checkone()"/>				
				</td>
		</tr>
		<tr>
			<td></td>
			<td class="tdtitle" id="checkone">例如:颜色</td>
		</tr>
		<tr>
			<td class="tdname">属性特征：</td>
			<td class="tdvalue"><input type="text" id="attributeTrait"
				style="width: 250px;" onblur="checktwo()"/></td>
		</tr>
		<tr>
			<td></td>
			<td class="tdtitle" id="checktwo">例如:白#黑#黄,不同值用#隔开</td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="btnbtns" onclick="saveFrom()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>

				<button class="btnbtns" onclick="top.hidePopWin(false);">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
			</td>
		</tr>
	</table>
	
</body>
</html>
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript">

function checkone(){
	if($.trim($('#attributeName').val())==''){
		$('#checkone').html('属性名称是空的！');
		return;
	}else{
		$('#checkone').html('例如:颜色');
	}
}
function checktwo(){
	if($.trim($('#attributeTrait').val())==''){
		$('#checktwo').html('属性特征是空的！');
		return;
	}else{
		$('#checktwo').html('例如:白#黑#黄,不同值用#隔开');
	}
}

function saveFrom(){
	checkone();
	checktwo();	
	var data={};
	data["attributeName"]=$.trim($('#attributeName').val());
	data["attributeTrait"]=$.trim($('#attributeTrait').val());
	top.hidePopWin(true,data);		
}

</script>


