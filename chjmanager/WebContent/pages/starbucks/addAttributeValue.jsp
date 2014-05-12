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
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	
		<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a
					href="${ctx}/pages/company/CustomizeFlavors.jsp" title="商品附加属性"
					class="tip-bottom"><i class="icon-home"></i>商品附加属性</a> <a href="#"
					class="current">商品附加属性值(添加)</a>
			</div>
			<h1>商品附加属性值</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>商品附加属性(添加)</h5>
						</div>

						<div class="widget-content nopadding">
							<form class="form-horizontal" method="post"
								action="${ctx}/addproductattribute!insertProductAttribute.action"  name="attributeForm" 
								id="attributeForm"  >
								<input type="hidden" name="parentId" id="parentId"/>
								<input type="hidden" name="isCkeckbox" value="${param.checkBoxType}"/>
								<table>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">附加属性值名称：</label>
															<div class="controls">
																<input  type="text"  id="name"  name="name"  style="width: 250px;"
																	onblur="nameOnBlur()"/>
																<span ><font color="red"  id="name_check"> </font></span>	
														</div>
											</td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">附加属性值价格：</label>
															<div class="controls">
																<input   onblur="priceOnBlur()"  type="text"  id="price"  name="price"  style="width: 250px;" />
																<span ><font color="red"  id="price_check"></font></span>	
														</div>
											</td>
										</tr>
								</table>
								
									<div class="form-actions"> 
												<button class="btn btn-warning" type="button"    class="btn btn-success"
													onclick="addAttributeValue()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<button class="btn btn-warning" type="button"
													onclick="history.go(-1)" >返&nbsp;&nbsp;&nbsp;&nbsp;回</button>
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
			<script src="${ctx}/js/matrix.form_validation.js"></script>
			<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
			<script src="${ctx}/js/jquery.peity.min.js"></script>
			<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
			<script src="${ctx}/js/masked.js"></script>
			<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
			<script src="${ctx}/js/myself/ajaxupload.js"></script>
			<script>
				$('.textarea_editor').wysihtml5();
			</script>

			<jsp:include page="/common/buttom.jsp"></jsp:include>

</body>
</html>



<script type="text/javascript">
		var appendId = <%=request.getParameter("appendId")%>
		$("#parentId").val(appendId);
		
		//value 验证  
		function nameOnBlur() {
			var name = $.trim($("#name").val());
			if ($.trim($('#name').val()).length==0) {
				$("#name_check").html("属性名称不能为空！");
			} else if ($.trim($("#name").val()).length > 20) {
				$("#name_check").html("长度不能超过20个字符!");
			} else {
				$("#name_check").html("");
			}
		}
		//价格验证
		function priceOnBlur() {
			var price = $.trim($("#price").val());
			if ($.trim($('#price').val()).length==0) {
				$("#price_check").html("价格不能为空！");
			} else if ($.trim($("#price").val()).length > 9) {
				$("#price_check").html("长度不能超过9个字符!");
			} else if (!reg.test(price)){
				$("#price_check").html("价格只能为数字!");
			}else {
				$("#price_check").html("");
			}
		}
		var reg = new RegExp("^[0-9--]*$");
		var reg1 = new RegExp("^[1-9]d*.d*|0.d*[1-9]d*$");//正浮点数
		// 提交附加属性表单内容 
		function addAttributeValue(){
			flag = true;
			//名称验证 
			var name = $.trim($("#name").val());
			if ($.trim($('#name').val()).length==0) {
				$("#name_check").html("属性名称不能为空！");
					flag = false;
			} else if ($.trim($("#name").val()).length > 20) {
				$("#name_check").html("长度不能超过20个字符!");
				   flag= false;
			} 
			//价格验证  
			var price = $.trim($("#price").val());
			if ($.trim($('#price').val()).length==0) {
				$("#price_check").html("价格不能为空！");
				flag=false;
			} else if ($.trim($("#price").val()).length > 9) {
				$("#price_check").html("长度不能超过9个字符!");
				flag=false;
			} else if (!reg.test(price)){
				$("#price_check").html("价格只能为数字!");
				flag=false;
			}
			
			if(flag!=false){
				$("#attributeForm").submit();	
			}
			
		}
</script>


