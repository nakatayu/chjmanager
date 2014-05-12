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
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<style type="text/css">
.tag_content {
	margin: 0px;
	padding: 2px 0 2px 0;
	list-style: none;
	line-height: 20px;
	font-size: 15px;
}

.shop_announcement {
	width: 486px;
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
	font-color: 20px;
}

.spanstyle {
	font-color: red;
}
</style>



</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="${ctx}/pages/manager/CompanyType.jsp" title="企业类型维护"
					class="tip-bottom"><i class="icon-home"></i>企业类型维护</a> <a href="#"
					class="current">创建企业类型</a>
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

							<form class="form-horizontal"  id="basic_validate">
								<input name="companyShopCategoryId" id="companyShopCategoryId" type="hidden" value="${CompanyShopCategory.companyShopCategoryId }" />
								<hr>
								<table>
									<tr>
										<td>
											<div id="form-wizard-1" class="step">
												<label class="control-label">类型名称：</label>
												<div class="controls">
													<input id="name" name="name" type="text"
														style="width: 254px;" value="${CompanyShopCategory.name}" onblur="nameOnBlur()"/> <span><font
														color="red" id="name_check" > </font></span>
												</div>
											</div>

										</td>

									</tr>
								</table>
						
						<div class="form-actions">
							<button class="btn btn-warning" type="button"
								class="btn btn-success" onclick="seveCompanyTypeInfo()">确认修改</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>

						</form>
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
		<script src="${ctx}/js/matrix.form_validation.js"></script>
		<script src="${ctx}/js/bootstrap-datepicker.js"></script>
		<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
		<script src="${ctx}/js/jquery.peity.min.js"></script>
		<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
		<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
		<script src="${ctx}/js/masked.js"></script>
		<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
		<script src="${ctx}/js/myself/ajaxupload.js"></script>
		<%--<script src="${ctx}/js/matrix.form_common.js"></script>  --%>
		<script>
			$('.textarea_editor').wysihtml5();
		</script>
<script src="${ctx}/js/jquery.pager.js"></script>
		<jsp:include page="/common/buttom.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
	var reg = new RegExp("^[0-9--]*$");
	var reg1 = new RegExp("[\u4e00-\u9fa5]"); //中文 字母
	var reg2 = new RegExp("[A-Za-z0-9\u0391-\uffe5]"); // 中文 字母 数字 
	
	//支付名称 
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
	function seveCompanyTypeInfo(){
		//支付名称 
		flag=true;
		var name = $.trim($("#name").val());
		if (name == "") {
			$("#name_check").html("不能为空！");
			flag = false;
		} else {
			$("#name_check").html("");
		}
		if(flag != false){
			var	data = $("#basic_validate").serialize(); 
			$.ajax({
				type : "post",
				data :data,
				url : '${ctx}/company!updateCompanyTypeInfo.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("更新成功！");
						window.location.href="${ctx}/pages/manager/CompanyType.jsp";
					}else if(msg.status == 400){
						alert("更新失败");
					}
				}
			}); 
		}
	}
	
	
		var labelValue = "";
		$("#choosenLabel").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";

		});
		$('#tagid').val(labelValue);
		if(flag!=false){
			submit();
		}
	

</script>