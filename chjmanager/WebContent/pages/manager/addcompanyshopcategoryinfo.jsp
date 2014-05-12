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
<link rel="stylesheet" href="${ctx}/css/pager.css" />



</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="./CompanyType.jsp"
					title="企业类型维护" class="tip-bottom"><i class="icon-home"></i>企业类型维护</a>
				<a href="#" class="current">创建企业类型</a>
			</div>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>创建企业类型</h5>
						</div>

						<form class="form-horizontal" id="basic_validate">
							<hr>
							<table>
								<tr>
									<td>
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label">企业类型名称：</label>
												<div class="controls">
													<input id="name" name="name" type="text"
														style="width: 254px;" onblur="nameOnBlur()" /> <span><font
														color="red" id="name_check"> </font></span>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</table>

							<div class="form-actions">
								<button class="btn btn-warning" type="button"
									class="btn btn-success" onclick="addCompanyType()">确认保存</button>
							</div>
						</form>
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
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
	<script src="${ctx}/js/matrix.js"></script>
	<script src="${ctx}/js/matrix.tables.js"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>

	<script src="${ctx}/js/mypage.js"></script>
	<script src="${ctx}/js/jquery.pager.js"></script>
	<jsp:include page="/common/buttom.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
	//支付名称
	function nameOnBlur() {
		var name = $.trim($("#name").val());
		if ($.trim($('#name').val()).length == 0) {
			$("#name_check").html("企业类型名称不能为空！");
		} else if ($.trim($("#name").val()).length > 20) {
			$("#name_check").html("长度不能超过20个字符!");
		} else {
			$("#name_check").html("");
		}
	}

	//保存支付名称
	function addCompanyType() {
		flag = true;
		//支付名称
		var name = $.trim($("#name").val());
		if ($.trim($('#name').val()).length == 0) {
			$("#name_check").html("企业类型名称不能为空！");
			flag = false;
		} else if ($.trim($("#name").val()).length > 20) {
			$("#name_check").html("长度不能超过20个字符!");
			flag = false;
		} else {
			$("#name_check").html("");
		}

		if (flag != false) {
			var data = $("#basic_validate").serialize();
			$
					.ajax({
						type : "post",
						data : data,
						url : '${ctx}/company!seveCompanyShopCategory.action',
						dataType : 'json',
						success : function(msg, status) {
							if (msg.status == 200) {
								alert("保存成功！");
								window.location.href = "${ctx}/pages/manager/CompanyType.jsp";
							} else if (msg.status == 400) {
								alert("保存失败");
							}
						}
					});
		}
	}
</script>