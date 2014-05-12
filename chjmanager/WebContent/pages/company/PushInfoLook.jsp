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
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="javascript:void(0)" onclick="window.history.go(-1)" title="推送管理"
					class="tip-bottom"><i class="icon-home"></i> 推送管理</a> <a href="#"
					class="current">推送详情</a>
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
							<h5>基本信息</h5>
						</div>
						<div class="widget-content nopadding">
							<form class="form-horizontal" method="post"
								action="${ctx}/push!insertPushInfo.action" name="form_Id"
								id="form_Id"  novalidate="novalidate">
		<input type="hidden" name="status" id="status"  value="0">
								
											 <div class="control-group">
													<label class="control-label">推送：</label>
													<div class="controls">
														<c:if test="${push.manner==-1}">全部</c:if>
														<c:if test="${push.manner==1}">短信推送</c:if>
														<c:if test="${push.manner==2}">App推送</c:if>
													</div>
												</div>
												 <div class="control-group">
													<label class="control-label">性别：</label>
													<div class="controls">
														
														<c:if test="${push.sex==-1}">全部</c:if>
														<c:if test="${push.sex==1}">男</c:if>
														<c:if test="${push.sex==2}">女</c:if>
															
													</div>
												</div>
												   <div class="control-group">
													<label class="control-label">年龄范围：</label>
													<div class="controls">
														
															<c:if test="${push.age==-1}">全部</c:if>
														<c:if test="${push.age==1}">小于20</c:if>
														<c:if test="${push.age==2}">21-25</c:if>
														<c:if test="${push.age==3}">26-30</c:if>
														<c:if test="${push.age==4}">31-40</c:if>
														<c:if test="${push.age==5}">41以上</c:if>
													</div>
												</div>
													<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标签：</h5>
											<hr>
											
							
						<div class="control-group" style="height: 68px;">
							<label class="control-label" style="height: 30px;">已选标签：</label>
							<input name="thirdCategoryTag" id="thirdCategoryTag"
								type="hidden">
							<div class="controls" id="choosenLabel" titie="labelstyle"
								style="height: 30px;">
								
								<c:forEach var="item" items="${tagList}" >
								<span  value="${item.tagId}">${item.tagName}</span>
							    
								</c:forEach>
								
								</div>
						</div>
											<div class="control-group">
													<label class="control-label">关联类别：</label>
														<div class="controls">
														  <c:if test="${fn:contains(push.relevanceType,'1')}">
																<label  for="chboxShop"> <input  disabled="disabled" id="chboxShop" type="checkbox"
																	name="relevanceCheckbox" checked  value="1"/>购买过本店铺的人
																</label>
														   </c:if>	
														    <c:if test="${!fn:contains(push.relevanceType,'1')}">
																<label  for="chboxShop"> <input disabled="disabled"  id="chboxShop" type="checkbox"
																	name="relevanceCheckbox"  value="1"/>购买过本店铺的人
																</label>
														   </c:if>	 
														   <c:if test="${fn:contains(push.relevanceType,'2')}">
																  <label  for="chboxShop1"> <input disabled="disabled"  id="chboxShop1" type="checkbox"
																	name="relevanceCheckbox" checked value="2"/>关注过本店铺的人
																</label>
															</c:if>
															 <c:if test="${!fn:contains(push.relevanceType,'2')}">
																  <label  for="chboxShop1"> <input disabled="disabled"  id="chboxShop1" type="checkbox"
																	name="relevanceCheckbox" value="2"/>关注过本店铺的人
																</label>
															</c:if>
															<c:if test="${fn:contains(push.relevanceType,'3')}">
																<label  for="chboxCircle"> <input disabled="disabled"  id="chboxCircle" type="checkbox"
																		name="relevanceCheckbox" checked value="3"/>圈友
																	</label>
															</c:if>
															<c:if test="${!fn:contains(push.relevanceType,'3')}">
																<label  for="chboxCircle"> <input disabled="disabled"  id="chboxCircle" type="checkbox"
																		name="relevanceCheckbox" value="3"/>圈友
																	</label>
															</c:if>
																	
															</div>	 
											</div>	
												<div class="control-group">
														<label class="control-label"> 推送内容：</label>
														
															<textarea style="height: 100px;width:500px" disabled="disabled">${push.content}</textarea>
															
														    
													</div>
													<div class="control-group">
														<label class="control-label"> 审核意见：</label>
														
															<textarea style="height: 100px;width:500px" disabled="disabled">${push.opinion}</textarea>
														    
													</div>
													<br/>
												
												
							</form>
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
$(function() {
	
	
});	

</script>