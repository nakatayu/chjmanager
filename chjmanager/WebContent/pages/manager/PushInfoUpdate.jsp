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
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="./ServiceList.jsp" title="推送管理"
					class="tip-bottom"><i class="icon-home"></i> 推送管理</a> <a href="#"
					class="current">开发区权限</a>
			</div>
			<h1>开发区权限</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>开发区权限</h5>
						</div>
						<div class="widget-content nopadding">
							<form class="form-horizontal" method="post"
								action="${ctx}/push!updatePushInfo.action" name="form_Id"
								id="form_Id"  novalidate="novalidate">
		<input type="hidden" id="pushId" name="pushId"  /> 	
								<br>
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息：</h5>
								<hr>
											 <div class="control-group">
													<label class="control-label">推送：</label>
													<div class="controls">
														<select name="manner"  id="manner"
															style="width: 262px;">
															<c:if test="${pushInfo.manner==-1}">
																<option value="-1" id="manner" selected>全部</option>
															</c:if>
															<c:if test="${pushInfo.manner!=-1}">
																<option value="-1" id="manner" >全部</option>
															</c:if>
															<c:if test="${pushInfo.manner==1}">
																<option value="1" id="manner"  selected>短信推送</option>
															</c:if>
															<c:if test="${pushInfo.manner!=1}">
																<option value="1" id="manner" >短信推送</option>
															</c:if>
															<c:if test="${pushInfo.manner==2}">
																<option value="2" id="manner"  selected>App应用推送</option>
															</c:if>
															<c:if test="${pushInfo.manner!=2}">
																<option value="2" id="manner" >App应用推送</option>
															</c:if>
														</select>
													</div>
												</div>
												 <div class="control-group">
													<label class="control-label">性别：</label>
													<div class="controls">
														<select name="sex"  id="sex" style="width: 262px;">
														<c:if test="${pushInfo.manner==-1}">
																<option value="-1" id="sex"   selected>全部</option>
															</c:if>
															<c:if test="${pushInfo.manner!=-1}">
																<option value="-1" id="sex" >全部</option>
															</c:if>
															<c:if test="${pushInfo.manner==1}">
																<option value="1" id="sex"  selected>男</option>
															</c:if>
															<c:if test="${pushInfo.manner!=1}">
																<option value="1" id="sex"  >男</option>
															</c:if>
															<c:if test="${pushInfo.manner==2}">
																<option value="2" id="sex"  selected>女</option>
															</c:if>
															<c:if test="${pushInfo.manner!=2}">
																<option value="2" id="sex"  >女</option>
															</c:if>
														</select>
													</div>
												</div>
												   <div class="control-group">
													<label class="control-label">年龄范围：</label>
													<div class="controls">
														<select name="age"  id="age" style="width: 262px;">
														<c:if test="${pushInfo.age==-1}">
																<option value="-1" id="sex"  name="age"  selected>全部</option>
															</c:if>
															<c:if test="${pushInfo.age!=-1}">
																<option value="-1" id="sex" name="age"  >全部</option>
															</c:if>
															<c:if test="${pushInfo.age==1}">
																<option value="1" id="sex" name="age"   selected>小于20</option>
															</c:if>
															<c:if test="${pushInfo.age!=1}">
																<option value="1" id="sex" name="age"  >小于20</option>
															</c:if>
															<c:if test="${pushInfo.age==2}">
																<option value="2" id="sex" name="age"   selected>21-25</option>
															</c:if>
															<c:if test="${pushInfo.age!=2}">
																<option value="2" id="sex" name="age"  >21-25</option>
															</c:if>
															<c:if test="${pushInfo.age==3}">
																<option value="3" id="sex"  name="age"  selected>26-30</option>
															</c:if>
															<c:if test="${pushInfo.age!=3}">
																<option value="3" id="sex" name="age" >26-30</option>
															</c:if>
															<c:if test="${pushInfo.age==4}">
																<option value="4" id="sex"  name="age"  selected>31-40</option>
															</c:if>
															<c:if test="${pushInfo.age!=4}">
																<option value="4" id="sex" name="age" >31-40</option>
															</c:if>
															<c:if test="${pushInfo.age==5}">
																<option value="5" id="sex"  name="age"   selected>41以上</option>
															</c:if>
															<c:if test="${pushInfo.age!=5}">
																<option value="5" id="sex" name="age"  >41以上</option>
															</c:if>
														</select>
													</div>
												</div>
													<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标签：</h5>
											<hr>
											<table>
												<tr>
													<td></td>
													<td align="left" valign="bottom"
														style="height: 15px; font-size: 15px; padding: 10px;">标签分类：</td>
													<td align="left" valign="bottom"
														style="height: 15px; font-size: 15px; padding: 10px;">标签名称：</td>
												</tr>
												<tr>
													<td style="width: 10%"></td>
													<td style="width: 27%">

														<div
															style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
															class="tag_content">
															<ul id="tagSecond">
															</ul>
														</div>
													</td>
													<td style="width: 27%">
														<div
															style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
															class="tag_content">
															<ul id="tagThird">
															</ul>
														</div>
													</td>
													<td style="width: 27%"></td>
												</tr>
											</table>
											<div class="control-group" style="height: 68px;">
												<label class="control-label" style="height: 30px;">已选标签：</label> <input
													name="thirdCategoryTag" id="thirdCategoryTag" type="hidden">
												<div class="controls" id="choosenLabel" titie="labelstyle" style="height: 30px;">
												</div>
											</div>
												<div class="control-group">
													<div class="controls"  id="relevanceTypeId" name="relevanceType"
														value="${pushInfo.relevanceType}">
														<table>
															<tr>
															  <td>
																<label id="relevanceType1"> <input type="checkbox"
																	name="relevanceType"  value="1" />购买过本店铺的人
																</label>
																  </td>
																    <td>
																  <label id="relevanceType2"> <input type="checkbox"
																	name="relevanceType" value="2" />关注过本店铺的人
																</label>
																  </td>
																    <td>
																	<label id="relevanceType3"> <input type="checkbox"
																		name="relevanceType" value="3" /> 圈友
																	</label>
																  </td>
															</tr>
														</table>
												</div>
											</div>	
														<div id="form-wizard-1" class="step">
														<label class="control-label"> 推送内容：</label>
														<div class="controls" style="height: 100px">
															<textarea type="text" name="content" class="shop_announcement" 
																style="height: 100px" id="contentId">${pushInfo.content}</textarea>
															<span><font color="red" id="content_check">
															</font></span>
														</div>
													</div>
													<div id="form-wizard-1" class="step">
														<label class="control-label"> 审核意见：</label>
														<div class="controls" style="height: 100px">
															<textarea type="text" name="opinion"  
																onblur="contentOnBlur()" class="shop_announcement"
																style="height: 100px" id="opinion">${pushInfo.opinion}</textarea>
															<span><font color="red" id="opinion_check">
															</font></span>
														</div>
													</div>
												<div class="form-actions">
												<!-- 1 审核中  2 审核未通过 3 审核通过 --> 
													<button class="btn btn-warning" type="button"
														onclick="updatePushInfoStatusPass()">审核通过</button>
														<button class="btn btn-warning" type="button"
														onclick="updatePushInfoStatusNoPass()">审核未通过</button>
													<button class="btn btn-warning" type="button"
													class="btn btn-success" onclick="updatePushInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
											     	<button class="btn btn-warning" type="button"
													class="btn btn-success"  onclick="location.reload()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
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
var pushId = <%=request.getParameter("pushId")%>
$("#pushId").val(pushId);
$(function() {
	//关联类型_多选框 
	var relevanceType = "${pushInfo.relevance_type}";
	if (relevanceType != "") {
		var strs = new Array(); //定义一数组 
		strs = relevanceType.split(","); //字符分割 
		var flag1 = false;
		var flag2 = false;
		var flag3 = false;
		for (i = 0; i < strs.length; i++) {
			if (strs[i] == 1) {
				flag1 = true;
			} else if (strs[i] == 2) {
				flag2 = true;
			} else if (strs[i] == 3) {
				flag3 = true;
			}
		}
		$("#relevanceType1").html("");
		$("#relevanceType2").html("");
		$("#relevanceType3").html("");
		if (flag1 == true) {
			$("#relevanceType1")
					.append(
							"  <input type='checkbox' name='relevanceType'   checked  value='1' />购买过本店铺的人");
		} else {
			$("#relevanceType1")
					.append(
							" <input type='checkbox' name='relevanceType'  value='1' />购买过本店铺的人");
		}
		if (flag2 == true) {
			$("#relevanceType2")
					.append(
							"<input type='checkbox' name='relevanceType'   checked value='2' />关注过本店铺的人");
		} else {
			$("#relevanceType2")
					.append(
							" <input type='checkbox' name='relevanceType'    value='2' />关注过本店铺的人");
		}
		if (flag3 == true) {
			$("#relevanceType3")
					.append(
							"<input type='checkbox' name='relevanceType'   checked value='3' />圈友");
		} else {
			$("#relevanceType3")
					.append(
							"<input type='checkbox' name='relevanceType'    value='3' />圈友");
		}
	}

	
	
	
	//标签分类 1级 
	$.ajax({
				type : "post",
				url : '${ctx}/tag!findTagSecondList.action',
				dataType : 'json',
				//      data :{tagId:tagid},   
				timeout : 10000,
				success : function(msg, status) {
					if (msg.status == 200) {
						var array = [];
						for ( var i = 0; i < msg.rows.length; i++) {
							array
									.push('<li class="tag_content"	onclick="tagname(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
							array.push('	 value="' + msg.rows[i]["tagId"]
									+ '">' + msg.rows[i]["tagName"]
									+ '</li>')
						}
						$('#tagSecond').html(array.join(''));
					} else
						alert(msg.msg);
				}
			});
});	
	//标签名称  2级
	function tagname(li) {
		var tagid = $(li).attr("value");
		$.ajax({
					type : "post",
					url : '${ctx}/tag!findTagThirdList.action',
					dataType : 'json',
					data : {
						tagId : tagid
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="selected(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>')
							}
							$('#tagThird').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
			}
//标签验证时否重复 	
	var count = 0;
	function selected(li) {
		count = $("#choosenLabel").find("span").length;
		if (count > 5) {
			alert("不能超过6个");
			return;
		}
		var currentLabel = $(li).val();//判断是否重复 
		var flag = true;
		$("#choosenLabel").find("span").each(function() {
			if ($(this).attr("value") == currentLabel) {
				alert("标签不可重复");
				flag = false;
			}
		});
		if (flag == true) {
			count = count + 1;
			$("#choosenLabel")
					//已选中的标签 
					.append(
							"<span  value="
									+ $(li).attr("value")
									+ ">"
									+ $(li).text()
									+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>");
		}
	}
	//标签删除 
	function delLabel(li) {
		$(li).prev().remove();
		$(li).remove();
	}
	
	//提交 更改 
	function updatePushInfo(){
		$("#form_Id").submit();
	}
	// 1 审核中  2 审核未通过 3 审核通过 
	function updatePushInfoStatusNoPass(pushId,status){
		 $.ajax({
				type : "post",
				url : '${ctx}/push!updatePushInfoStatus.action?status='+2+'&pushId='+<%=request.getParameter("pushId")%>,
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("状态,审核未通过..");
						window.location.reload(true);
					}
				}
			})
	}
	function updatePushInfoStatusPass(pushId,status){
		 $.ajax({
				type : "post",
				url : '${ctx}/push!updatePushInfoStatus.action?status='+3+'&pushId='+<%=request.getParameter("pushId")%>,
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("状态,审核通过..");
						window.location.reload(true);
					}
				}
			})
	}




</script>