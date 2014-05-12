<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
	// 将 expire 时间置为很久以前的时间
	response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");

	// 设置标准的 HTTP/1.1 no-cache 首部
	response.setHeader("Cache-Control",
			"no-store, no-cache, must-revalidate");

	// 设置 IE 扩展 HTTP/1.1 no-cache 首部（利用 addHeader）
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");

	// 设置标准的 HTTP/1.0 no-cache 首部
	response.setHeader("Pragma", "no-cache");
	if (request.getSession(false) != null) {
		session.setAttribute("user", "");
		session.invalidate();
	}
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<base href="<%=basePath%>">
<title>漕河泾e服务后台系统</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-login.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>

<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {

	});
	function logintest() {

		var username = $('#username').val();
		var pass = $('#pass').val();
		if (username == "" || pass == "") {
			alert('账号和密码不为空');
			return;
		}
		$.ajax({
			type : "post",
			url : '${ctx}/user!login.action',
			dataType : 'json',
			data : {
				username : username,
				password : pass
			},
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200){
					reset();
					location.href = "${ctx}/pages/index.jsp";
				}	
				else
					alert('账号或密码错误!');
			}

		});
	}
	function reset() {
		$('#username').val('');
		$('#pass').val('');
	}
</script>


</head>

<body>
	<div id="loginbox">
		<form id="loginform" class="form-vertical"  style="border-top-style: none;"
			action="http://themedesigner.in/demo/matrix-admin/index.html">
			<div class="control-group normal_text">
				<h3>
					<img src="${ctx}/img/logo.png" alt="Logo" />
				</h3>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_lg"><i class="icon-user"></i></span><input
							type="text" placeholder="Username"  id="username"  value=""/>
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><i class="icon-lock"></i></span><input
							type="password" placeholder="Password"  id="pass" value=""/>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<span class="pull-left"><a href="#"	class="flip-link btn btn-info" id="to-recover">Lost password?</a></span> 
				<span class="pull-right"><a type="button" onclick="logintest()"
					class="btn btn-success"> Login</a></span>
			</div>
		</form>
		<form id="recoverform" action="#" class="form-vertical">
			<p class="normal_text">Enter your e-mail address below and we
				will send you instructions how to recover a password.</p>

			<div class="controls">
				<div class="main_input_box">
					<span class="add-on bg_lo"><i class="icon-envelope"></i></span><input
						type="text" placeholder="E-mail address" />
				</div>
			</div>

			<div class="form-actions">
				<span class="pull-left"><a href="#"
					class="flip-link btn btn-success" id="to-login">&laquo; Back to
						login</a></span> <span class="pull-right"><a class="btn btn-info">Reecover</a></span>
			</div>
		</form>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/matrix.login.js"></script>

</body>
</html>