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
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<script type="text/javascript" src="/chjmanager/js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="${ctx}/css/pager.css" />
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	
		<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> 
					<a href="${ctx}/pages/companyInfoManager.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 企业列表</a><a href="#" class="current">店铺列表</a>
					
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>基本信息</h5>
						</div>

						<div class="widget-content nopadding">
							<form class="form-horizontal" method="post"
								action="${ctx}/companyinfomanager!updateCompanyInfo.action"  name="basic_validate" 
								id="basic_validate"  novalidate="novalidate">
								<input name="companyId" id="companyId" type="hidden" value="${company.companyId }" />
								<table>
										<tr>
											<td width="60%">
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">企业名称：</label>
															<div class="controls">
															<input  type="text"  id="name"  name="name"  style="width: 250px;"   onblur="nameOnBlur()"  value="${company.name}"
																/>
																<span ><font color="red"  id="name_check"> </font></span>	
														</div>
														</div>
												</div>		
											</td>
										<!-- 	<td width="40%">
											</td> -->
											<td  rowspan="7"   align=left >
														<div style="width: 150px; height: 280px; margin: 10px 0 0 30px; border: 1px solid #ccc; float: center;">
																		<img style="width: 150px; height: 160px;" id="imgCompany"
																			src="${http_img}${company.logo}" /> <input type="hidden"
																			id="uploadUrl" name="logo"> <br />
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		&nbsp;&nbsp;&nbsp;&nbsp;<br /> <br /> <br />
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		&nbsp;&nbsp;&nbsp;&nbsp;
																		<button id="uploadButton" class="btn btn-primary"
																			style="background: #339999">浏&nbsp;&nbsp;&nbsp;&nbsp;览</button>
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	</div>
											</td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">企业地址：</label>
															<div class="controls">
																<input  type="text"  id="address"  name="address"  style="width: 250px;" value="${company.address}" />
															<!-- 	<span ><font color="red"  id="address_check"> </font></span> -->	
														</div>
														</div>
												</div>		
											</td>
											<td></td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">企业邮箱：</label>
															<div class="controls">
																<input  type="text"  id="email"  name="email"  style="width: 250px;"  value="${company.email}" />
																<!-- <span ><font color="red"  id="email_check"> </font></span>	 -->
														</div>
													</div>
												</div>		
											</td>
											<td></td>
										</tr>
										<tr>
											<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">注册时间：</label>
															<div class="controls">
											  <input style="width: 250px" type="text"
												id="registDate" name="registDate" 
													class="Wdate"  value="${company.registDate}"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/>
													
															<!-- 	<input  readonly  type="text"  id="registDate"  name="registDate"  style="width: 250px;" value="${company.registDate}" />
																<span ><font color="red"  id="registDate_check"> </font></span> -->	
														</div>  
														</div></div>		
											</td>
											<td></td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">联系人：</label>
															<div class="controls">
																<input  type="text"  id="linkman"  name="linkman"  style="width: 250px;" value="${company.linkman}"/>
																<span ><font color="red"  id="logo_check"> </font></span>
														</div></div></div>
											</td>
											<td></td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">联系电话：</label>
															<div class="controls">
																<input  type="text"  id="linkmanTel"  name="linkmanTel"  style="width: 250px;" value="${company.linkmanTel}"/>
																<span ><font color="red"  id="logo_check"> </font></span>
														</div></div></div>
											</td>
											<td></td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">企业类型：</label>
															<div class="controls">
																<input  type="text"  id="companyType"  name="companyType"  style="width: 250px;" value="${company.companyType}" />
															<!-- 	<span ><font color="red"  id="linkman_check"> </font></span>	 -->
														</div> </div></div>  
											</td>
											<td></td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">企业网址：</label>
															<div class="controls">
																<input  type="text"  id="companyURL"  name="companyURL"  style="width: 250px;" value="${company.companyURL}"/>
																<!-- <span ><font color="red"  id="companyURL_check"> </font></span>	 -->
														</div>
															</div>
												</div>	
											</td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group"  style="height: 170px">
																	<label class="control-label">企业信息：</label>
															<div class="controls" >
																<textarea id="companyInfo"  name="companyInfo"  style="width: 500px;height: 100px" >${company.companyInfo} </textarea>
															<!-- 	<span ><font color="red"  id="companyInfo_check"> </font></span>	 -->
														</div>
													</div>
												</div>
											</td>
										</tr>
								</table>
								
									<div class="form-actions">
												<button class="btn btn-warning" type="button"    class="btn btn-success"
													onclick="saveCompany()">确认修改</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											
											</div>
										
							</form>
						</div>
					</div>
				</div>
			</div>
	</div>
</div>
	

		    <script src="${ctx}/js/jquery.min.js"></script>
			<script src="${ctx}/js/jquery.ui.custom.js"></script>
			<script src="${ctx}/js/bootstrap.min.js"></script>
			<script src="${ctx}/js/jquery.uniform.js"></script>
			<script src="${ctx}/js/select2.min.js"></script>
			<script src="${ctx}/js/jquery.validate.js"></script>
			<script src="${ctx}/js/matrix.js"></script>
	<%-- <script src="${ctx}/js/matrix.form_validation.js"></script> --%>
			<%-- <script src="${ctx}/js/bootstrap-datepicker.js"></script> --%>
			<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
			<script src="${ctx}/js/jquery.peity.min.js"></script>
		 	<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
			<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
			<script src="${ctx}/js/masked.js"></script> 
			<script src="${ctx}/js/myself/ajaxupload.js"></script>

			<script>
				$('.textarea_editor').wysihtml5();
			</script>

			<jsp:include page="/common/buttom.jsp"></jsp:include>
<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">
$(function(){
	var  flag= "${flag}" ;
	if(flag!="" && flag=="true"){
		alert("更新成功");
	}
	
	// 创建AJAX方式上传文件
	var $uploadBtn = $("#uploadButton");
	new AjaxUpload($uploadBtn, {
		action : '${ctx}/user!uploadImage.action',
		name : 'upfile',
		responseType : 'json',
		onSubmit : function(file, ext) {
			//ext 文件后缀
		},
		onComplete : function(file, response) {
			if (response.status == 200) {
				$("#uploadUrl").val(response.rows);
				$("#imgCompany").attr("src", "${http_img}" + response.rows);
			} else {
				alert(response.msg);
			}
		}
	});
});


//企业名称 
	function nameOnBlur() {
		var name = $.trim($("#name").val());
		if (name == "") {
			$("#name_check").html("不能为空！");
		} else if ($.trim($("#name").val().length) > 30) {
			$("#name_check").html("长度不能超过30个字符!");
		} else {
			$("#name_check").html("");
		}
	}
	function saveCompany(){
		//企业名称
		flag=true;
		var name = $.trim($("#name").val());
		if (name == "") {
			$("#name_check").html("不能为空！");
			flag = false;
		} else {
			$("#basic_validate").submit();
		}
	}

</script>
