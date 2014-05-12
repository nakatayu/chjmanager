<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "chjservice" + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>企业列表</title>
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
<link rel="stylesheet" href="${ctx}/css/pager.css" />
</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="companyList.jsp" class="current">列表</a>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span11">
				<div class="widget-box">
					<div class="widget-title">
						</span>
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人员维护</h3>
					</div>
					<div class="pagination alternate"
						style="margin-left: 0px; margin-top: 8px; float: left;">
						</br> </br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						<button class="btn btn-primary" style="background: #FF6600"
							onclick="addCompany()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							新增&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					</div>
					<div class="widget-content">
						<form action="#" method="get" class="form-horizontal">

							<table style="width: 100%;">
								<tr>
									<td>
										<div class="control-group">
											<label class="control-label">员工账号：</label>
											<div class="controls">
												<input id="name" type="text" class="span6" />
											</div>
										</div>
										<div class="control-group" >
                                        <label class="control-label">所属店铺：</label>
                                        <div class="controls">
                                        <select class="span6" >
                                        <option>1</option>
                                        </select>
                                        </div>
                                        </div>
                                        
										<div class="control-group" >
                                        <label class="control-label">员工角色：</label>
                                        <div class="controls">
                                        <select class="span6" >
                                        <option>1</option>
                                        </select>
                                        </div>
                                        </div>
                                        
											<div class="control-group">
												<label class="control-label">员工姓名：</label>
												<div class="controls">
													<input id="email" type="text" class="span6" />
												</div>
												<div class="control-group">
													<label class="control-label">手机号码：</label>
													<div class="controls" >
														<input id="email" type="text" class="span6" />
														 <input type="button" value="&nbsp;发送密码&nbsp;" class="btn btn-success"
							                              onclick="">
													</div>
													<div class="control-group">
														<label class="control-label">邮箱地址：</label>
														<div class="controls">
															<input id="email" type="text" class="span6" />
														</div>
													</div>
													<div>
													</br>
													</br>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<button class="btn btn-primary"
															style="background: #FF6600">&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;</button>
														&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
														<button class="btn btn-primary"
															style="background: #FF6600">&nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;</button>
														&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
													</div>
													</td>
								</tr>
							</table>
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
</body>
</html>
<script type="text/javascript">
	
</script>