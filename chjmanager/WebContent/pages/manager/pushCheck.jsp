  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>推送审核意见 </title>
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-media.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body style="background:#eee;">
	
	<table width="100%">
	<tr><td height="30" colspan="2"></td></tr>
	<tr><td width="120"><label class="control-label">审核意见：</label></td>
	<td width="440px"><textarea style="width:340px;height:120px;" id="txtCheckContent"></textarea></td>
	</tr>
	</table>
	
	 	 <div class="pagination alternate"
									style="margin-left: 200px; margin-top: 8px; float: left;">
									
									<a class="btn btn-warning" onclick="checkPush()">确定</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-warning" onclick="window.top.hidePopWin(false)">取消</button>
		  </div>
	 
	    
</body>
</html>
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript">
function checkPush(){
	if($.trim($('#txtCheckContent').val()).length==0){
		alert('请输入审核意见!');
		return;
	}
	window.top.checkResult(1,$.trim($('#txtCheckContent').val()));
	
	
}


</script>
