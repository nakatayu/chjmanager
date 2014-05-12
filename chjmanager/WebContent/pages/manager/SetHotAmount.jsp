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
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	
		<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a>  <a href="#"
					class="current">热门设置</a>
			</div>
			<h1>热门设置</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>热门设置</h5>
						</div>
						<div class="widget-content nopadding">
							<form class="form-horizontal"  	id="setHotAmountForm"  >
								<input type="hidden" name="hotSetNum" id="hotSetNum"  value="1">
								<table>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">商品设置：</label>
															<div class="controls">
																<input  type="text"  id="productNum"  name="productNum"  style="width: 250px;" 
														value="${setHotAmount.productNum}"	 onblur="productNumOnBlur()" />
																<span ><font color="red"  id="productNum_check" > </font></span>	
														</div>
											</td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">促销设置：</label>
															<div class="controls">
																<input  type="text"  id="promotionNum"  name="promotionNum"  style="width: 250px;"
														value="${setHotAmount.promotionNum}"		onblur="promotionNumOnBlur()" />
																<span ><font color="red"  id="promotionNum_check" > </font></span>	
														</div>
											</td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">post设置：</label>
															<div class="controls">
																<input  type="text"  id="postNum"  name="postNum"  style="width: 250px;"
														value="${setHotAmount.postNum}"		onblur="postNumOnBlur()" />
																<span ><font color="red"  id="postNum_check" > </font></span>	
														</div>
											</td>
										</tr>
											<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">活动设置：</label>
															<div class="controls">
																<input  type="text"  id="activityNum"  name="activityNum"  style="width: 250px;"
														value="${setHotAmount.activityNum}"	onblur="activityNumOnBlur()" />
																<span ><font color="red"  id="activityNum_check" > </font></span>	
														</div>
											</td>
										</tr>
										<tr>
												<td>
														<div id="form-wizard-1" class="step">
															<div class="control-group">
																	<label class="control-label">圈子设置：</label>
															<div class="controls">
																<input  type="text"  id="circleNum"  name="circleNum"  style="width: 250px;"
														value="${setHotAmount.circleNum}"		onblur="circleNumOnBlur()" />
																<span ><font color="red"  id="circleNum_check" > </font></span>	
														</div>
											</td>
										</tr>
								</table>
									<div class="form-actions"> 
												<button class="btn btn-warning" type="button"    class="btn btn-success"
													onclick="updateSetHotAmount()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button class="btn btn-warning" type="button"
													onclick="window.location.reload()" >取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
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
			<script src="${ctx}/js/jquery.pager.js"></script>
			<jsp:include page="/common/buttom.jsp"></jsp:include>

</body>
</html>

<script type="text/javascript">
$(function(){
	var  flag= "${flag}" ;
	if(flag!="" && flag=="true"){
		alert("更新成功");
	}else  if(flag!="" && flag=="false"){
		alert("系统繁忙，请稍后再试！");
	} 
});	

function updateSetHotAmount (){
	flag = true;
	var productNum = $.trim($("#productNum").val());
	 if (!reg.test(productNum)){
		$("#productNum_check").html("只能为数字!");
		flag = false;
	}
	 var activityNum = $.trim($("#activityNum").val());
	 if (!reg.test(activityNum)){
		$("#activityNum_check").html("只能为数字!");
		flag = false;
	}
	 var promotionNum = $.trim($("#promotionNum").val());
	 if (!reg.test(promotionNum)){
		$("#promotionNum_check").html("只能为数字!");
		flag = false;
	}	
	 var circleNum = $.trim($("#circleNum").val());
	 if (!reg.test(circleNum)){
		$("#circleNum_check").html("只能为数字!");
		flag = false;
	}
	 var postNum = $.trim($("#postNum").val());
	 if (!reg.test(postNum)){
		$("#postNum_check").html("只能为数字!");
		flag = false;
	}
	 if(productNum==""&&postNum==""&&circleNum==""&&promotionNum==""&&activityNum==""){
		 alert("未填写，不用保存！");
	 }else{
		 if(flag!=false){
			//提交表单
				var	data = $("#setHotAmountForm").serialize(); 
				  $.ajax({
						type : "post",
					    url : '${ctx}/sethotamount!updateSetHotAmount.action',
					    dataType : 'json',
					    data :data,
					    success : function(msg, status) {
					    	if(msg.status == 200){
					    		alert("保存成功");
					    	}
					    	else{
						    	   alert("保存失败");
					    	}
			           }
				});  
			}
	 }
}

var reg = new RegExp("^[0-9--]*$");
function productNumOnBlur() {
	var productNum = $.trim($("#productNum").val());
		 if (!reg.test(productNum)){
			$("#productNum_check").html("只能为数字!");
		}else {
			$("#productNum_check").html("");
		}
}
function activityNumOnBlur() {
	var activityNum = $.trim($("#activityNum").val());
		 if (!reg.test(activityNum)){
			$("#activityNum_check").html("只能为数字!");
		}else {
			$("#activityNum_check").html("");
		}
}
function promotionNumOnBlur() {
	var promotionNum = $.trim($("#promotionNum").val());
		 if (!reg.test(promotionNum)){
			$("#promotionNum_check").html("只能为数字!");
		}else {
			$("#promotionNum_check").html("");
		}
}
function postNumOnBlur() {
	var postNum = $.trim($("#postNum").val());
		 if (!reg.test(postNum)){
			$("#postNum_check").html("只能为数字!");
		}else {
			$("#postNum_check").html("");
		}
}
function circleNumOnBlur() {
	var circleNum = $.trim($("#circleNum").val());
		 if (!reg.test(circleNum)){
			$("#circleNum_check").html("只能为数字!");
		}else {
			$("#circleNum_check").html("");
		}
}
</script>


