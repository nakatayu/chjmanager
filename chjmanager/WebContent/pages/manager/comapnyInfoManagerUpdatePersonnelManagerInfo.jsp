<%@page import="com.chj.entity.Personnel"%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>企业信息维护</title>
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
<script type="text/javascript"
	src="/chjmanager/js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="${ctx}/css/pager.css" />
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>


	<div id="content" class="form-horizontal">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> 
					 <a href="${ctx}/pages/manager/comapnyInfoManagerPersonnelManagerList.jsp" class="current"><i class=" icon-edit"></i>开发区人员账号管理列表</a>
					<a href="#" class="current">修改开发区人员账号</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>人员账号管理</h5>
						</div>
					<form class="widget-content nopadding"  id="formDivId">	
								<div class="control-group"  >
								<label class="control-label">用户账号：</label>
								<div class="controls">
									<input type="text"  style="width: 250px;"  id="userNameId"  name="userName"  
									value="${personnel.userName}"  onblur="checkUserName()"/>
									 <span><font color="red" id="userName_check"> </font></span>
								</div>
							</div>
							
							<div class="control-group"  id="newPwsDiv">
								<label class="control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
								<div class="controls">
									<input type="password"  style="width: 250px;" id="newPwsId"  
									value="${personnel.pwd}"  onblur="checkNewPws()"/>
									 <span><font color="red" id="newPws_check"> </font></span>
								</div>
							</div>
							<div class="control-group" id="oldPwsDiv">
								<label class="control-label">确认密码：</label>
								<div class="controls">
									<input type="password"  style="width: 250px;" id="oldPwsId" name="pwd" 
									value="${personnel.pwd}"   onblur="checkOldPws()"/>
									 <span><font color="red" id="oldPws_check"> </font></span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">用户昵称：</label>
								<div class="controls">
									<input type="text"  style="width: 250px;" id="nameId"  name="name" 
									value="${personnel.name}"   onblur="checkName()" />
									<span><font color="red" id="name_check"> </font></span>
								</div>
							</div>
							<div class="control-group"  >
								<label class="control-label">卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
								<div class="controls">
									<input type="text"  style="width: 250px;"  id="cardNoId"  
									value="${personnel.cardNo}"  name="cardNo"  onblur="checkCardNo()"/>
									 <span><font color="red" id="userName_check"> </font></span>
								</div>
							</div>
					<div class="control-group">
						<label class="control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<div class="controls">
							<table>
								<tr>
									<td>
											<label> 男
													<c:if test="${personnel.gender=='男'}">
														<input type="radio" name="gender"  value="男"  checked />
													</c:if> 
													<c:if test="${personnel.gender != '男' }">
														<input type="radio" name="gender"  value="男" />
													</c:if>
											</label>
									</td>
									<td>
											<label> 女
													<c:if test="${personnel.gender=='女'}">
														<input type="radio" name="gender"  value="女"  checked />
													</c:if> 
													<c:if test="${personnel.gender != '女' }">
														<input type="radio" name="gender"  value="女" />
													</c:if>
											</label>
									</td>
									</tr>
								</table>	
							</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">联系电话：</label>
								<div class="controls">
									<input type="text"  style="width: 250px;" id="phoneId" 
									value="${personnel.phone}"  name="phone" onblur="checkPhone()"/>
									<span><font color="red" id="phone_check"> </font></span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">用户邮箱：</label>
								<div class="controls">
									<input type="text"  style="width: 250px;" id="emailId"  
									value="${personnel.email}"  name="email"  onblur="checkEmail()"/>
									<span><font color="red" id="email_check"> </font></span>
								</div>
							</div>
							
							</div>
						</div>
						
							<div class="form-actions">
								<button class="btn btn-warning" type="button"
									class="btn btn-success" onclick="savePersonnel()">确认保存</button>
							</div>
							<input name="personnelId"  id="personnelId"  type="hidden">
							</form>
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
var personnelId = <%=request.getParameter("personnelId")%>
$("#personnelId").val(personnelId);

var reg = new RegExp("[a-zA-Z0-9]*");//字母和数字
//检查账号
function checkUserName(){
	var username='${personnel.userName}';
	var name=$.trim($("#userNameId").val());
	
	if(name!=username){	
		if (name == "") {
			$("#userName_check").html("不能为空！");
		}else if ($.trim($("#userNameId").val().length) > 15) {
			$("#userName_check").html("长度不能超过15个字符!");
		} else if (!reg.test(name)) {
			$("#userName_check").html("账号只能为字母或者数字！");
		} else{
			$.ajax({
				type : "post",
				url : '${ctx}/personnel!checkName.action?name=' + name,
				dataType : 'json',
				timeout : 10000,
				success : function(msg, status) {
					if (msg.status == 200) {
						$("#userName_check").html("");
					} else if (msg.status == 400) {
						alert("账号重复，请重新输入！");
						$("#userName_check").html("账号重复，请重新输入！");
					}
				}
			});	
		}
	}else{
		$("#userName_check").html("");
	}
}

//密码
function checkNewPws(){
	var oldPws=$.trim($("#oldPwsId").val());
	var newPws=$.trim($("#newPwsId").val());
	if (newPws == "") {
		$("#newPws_check").html("不能为空！");
	}else if ($.trim($("#newPwsId").val().length) > 32) {
		$("#newPws_check").html("密码长度不能超过32个字符!");
	}  else{
		$("#newPws_check").html("");
		 if($.trim($("#oldPwsId").val())==""){
			 $("#newPws_check").html("");
		}else{
			 $("#oldPws_check").html("");
		} 
	}
}
//确认密码  
function checkOldPws(){
	var oldPws=$.trim($("#oldPwsId").val());
	var newPws=$.trim($("#newPwsId").val());
	if (oldPws == "") {
		$("#oldPws_check").html("不能为空！");
	}else if ($.trim($("#oldPwsId").val().length) > 32) {
		$("#oldPws_check").html("密码长度不能超过32个字符!");
	}else{
		 $("#oldPws_check").html("");
		  if($.trim($("#oldPwsId").val())!=$.trim($("#newPwsId").val())){
			 $("#oldPws_check").html("二次密码输入不一致！");
		}else{
			 $("#oldPws_check").html("");
		} 
	}
}
//账号昵称
function checkName(){
	var name=$.trim($("#nameId").val());
	if (name == "") {
		$("#name_check").html("不能为空！");
	}else if ($.trim($("#nameId").val().length) > 10) {
		$("#name_check").html("昵称长度不能超过10个字符!");
	}else{
		 $("#name_check").html("");
	}	 
}
//邮箱
var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
function checkEmail(){
	var email=$.trim($("#emailId").val());
	if (email == "") {
		$("#email_check").html("不能为空！");
	}else if (!filter.test(email)) {
		$("#email_check").html("请输入正确的邮箱格式!如:123@123.com");
	}else{
		 $("#email_check").html("");
	}	 
}
//电话
var phoneReg = new RegExp("^[0-9--]*$");
function checkPhone(){
	var phone=$.trim($("#phoneId").val());
	if (phone == "") {
		$("#phone_check").html("不能为空！");
	}else if (!phoneReg.test(phone)) {
		$("#phone_check").html("只能为数字!");
	}else if ($.trim($("#phoneId").val().length) > 11) {
		$("#phone_check").html("昵称长度不能超过11个字符!");
	}else{
		 $("#phone_check").html("");
	}	 
}

//保存表单 
function savePersonnel() {
	flag = true;
	var name=$.trim($("#userNameId").val());
	if (name == "") {
		$("#userName_check").html("不能为空！");
		flag = false;
	}else if ($.trim($("#userNameId").val().length) > 15) {
		$("#userName_check").html("长度不能超过15个字符!");
		flag = false;
	} else if (!reg.test(name)) {
		$("#userName_check").html("账号只能为字母或者数字！");
		flag = false;
	} else{
		$("#userName_check").html("");
		var badChar = "`~!@#$%^&()-_=+]\\\\|:;\"\\\'<,>?*，。、；‘【】|}{[]}/";
		for ( var i = 0; i < name.length; i++) {
			//字符串str中的字符
			var c = name.charAt(i);
			if (badChar.indexOf(c) > -1) {
				$("#userName_check").html("账号只能为字母或者数字！");
				flag = false;
			}
		}
	}
	
	var oldPws=$.trim($("#oldPwsId").val());
	var newPws=$.trim($("#newPwsId").val());
	if (newPws == "") {
		$("#newPws_check").html("不能为空！");
		flag = false;
	}else if ($.trim($("#newPwsId").val().length) > 32) {
		$("#newPws_check").html("密码长度不能超过32个字符!");
		flag = false;
	}  else{
		$("#newPws_check").html("");
		 if($.trim($("#oldPwsId").val())==""){
			 $("#newPws_check").html("");
			 flag = false;
		}
	}
	
	var oldPws=$.trim($("#oldPwsId").val());
	var newPws=$.trim($("#newPwsId").val());
	if (oldPws == "") {
		$("#oldPws_check").html("不能为空！");
		flag = false;
	}else if ($.trim($("#oldPwsId").val().length) > 32) {
		$("#oldPws_check").html("密码长度不能超过32个字符!");
		flag = false;
	}else{
		 $("#oldPws_check").html("");
		  if($.trim($("#oldPwsId").val())!=$.trim($("#newPwsId").val())){
			 $("#oldPws_check").html("二次密码输入不一致！");
			 flag = false;
		} 
	}
	
	var name=$.trim($("#nameId").val());
	if (name == "") {
		$("#name_check").html("不能为空！");
		flag = false;
	}else if ($.trim($("#nameId").val().length) > 10) {
		$("#name_check").html("昵称长度不能超过10个字符!");
		flag = false;
	}	
	
	var email=$.trim($("#emailId").val());
	if (email == "") {
		$("#email_check").html("不能为空！");
		flag = false;
	}else if (!filter.test(email)) {
		$("#email_check").html("请输入正确的邮箱格式!如:123@123.com");
		flag = false;
	}
	
	$("#organizationalID").val($("#shopId").val());
	var phone=$.trim($("#phoneId").val());
	if (phone == "") {
		$("#phone_check").html("不能为空！");
		flag = false;
	}else if (!phoneReg.test(phone)) {
		$("#phone_check").html("只能为数字!");
		flag = false;
	}else if ($.trim($("#phoneId").val().length) > 11) {
		$("#phone_check").html("昵称长度不能超过11个字符!");
		flag = false;
	} 
	//以上匹配后执行       
 	if (flag != false) {
		var	data = $("#formDivId").serialize(); 
		  $.ajax({
				type : "post",
				url : '${ctx}/personnel!updateManagerPersonnelInfo.action',
				dataType : 'json',
				 data :data,   
				timeout : 10000,
				success : function(msg, status) {
					if (msg.status == 200) {
					   alert("更新成功");
					   window.location.href = "${ctx}/pages/manager/comapnyInfoManagerPersonnelManagerList.jsp";
					} else{
					   alert("更新失败");				
					}
				}
			});  
	} 
}	
</script>
