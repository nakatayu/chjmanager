<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>企业后台维护人员账号管理</title>
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
<style type="text/css">
.ulclss {
	float: left;
}

.liclss {
	float: left;
}

tr:hover {
	background-color: #FFF;
}
</style>
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
					<i class="icon-home"></i> 主页
				</a> <a href="#" class="current">角色维护</a>
			</div>
		</div>

		<div class="container-fluid">

			<div class="row-fluid">
				<div class="span12">
					<form action="" method="post" id="frm" name="frm">
						<div
							style="float: left; width: 150px; border: 1px #cccccc solid; height: 500px; background-color: #FFF;">
							<table style="width: 100%;">
								<tr>
									<th valign="middle" style="font-size: 22px; height: 50px;">设置角色</th>
								</tr>
								<c:choose>
									<c:when test="${role!=null}">
										<c:forEach items="${role}" var="role">
											<tr>
												<td valign="top"
													style="padding: 10px 0 0 10px; font-size: 14px; font-weight: bold;">
													<input type="radio" name="role" value="${role.ID}"
													roleValue="${role.value}" onclick="checkRole(this)" /> <span>${role.RoleName}</span>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<th>无数据!!!</th>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>

						<div
							style="float: right; width: 920px; border: 1px #cccccc solid; padding: 3px; background-color: #FFF;">
							<table style="font-size: 12px;">
								<tr>
									<th height="50px" style="font-size: 22px;">设置权限</th>
								</tr>
								<tr>
									<td
										style="font-size: 12px; border: 3px #CCCC96 solid; margin: 2px; padding: 2px;">
										<table>
											<tr>
												<td width="130px" align="left"
													style="padding: 0px; font-weight: bold;"><input
													type="checkbox" value="${action.ID}" name="action"
													parentID="${action.ParentID}" onclick="checkAction(this)" />
													${action.Action} <c:if test="${action.Action==null}">${action.Controller}</c:if>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<c:if test="${action.next!=null}">
									<c:forEach items="${action.next}" var="action0">
										<tr>
											<td height="2px"></td>
										</tr>
										<tr>
											<td
												style="border: #CCCC96 3px solid; margin: 2px; padding: 2px;">
												<table>
													<tr valign="top">
														<td width="145px"
															style="border: #CCCCCC 2px solid; font-weight: bold;">
															<input type="checkbox" value="${action0.ID}"
															name="action" parentID="${action0.ParentID}"
															onclick="checkAction(this)" /> ${action0.Action} <c:if
																test="${action0.Action==null}">${action0.Controller}</c:if>
														</td>

														<c:if test="${action0.next!=null}">
															<c:forEach items="${action0.next}" var="action1">
																<td valign="top" width="140px"
																	style="border: #CCCCCC 2px solid;"><input
																	type="checkbox" value="${action1.ID}" name="action"
																	parentID="${action1.ParentID}"
																	onclick="checkAction(this)" /> ${action1.Action} <c:if
																		test="${action1.Action==null}">${action1.Controller}</c:if>

																	<c:if test="${action1.next!=null}">
																		<table width="100%">
																			<c:forEach items="${action1.next}" var="action2">
																				<tr valign="top">
																					<td
																						style="padding: 5px 0 0 10px; border-top: 1px #330033 solid;">
																						<input type="checkbox" value="${action2.ID}"
																						name="action" parentID="${action2.ParentID}"
																						onclick="checkAction(this)" /> ${action2.Action}
																						<c:if test="${action2.Action==null}">${action2.Controller}
																							</c:if> <c:if test="${action2.next!=null}">
																							<table width="100%">
																								<c:forEach items="${action2.next}" var="action3">
																									<tr valign="top">
																										<td
																											style="padding: 5px 0 0 10px; border-top: 1px #330033 solid;">
																											<input type="checkbox" value="${action3.ID}"
																											name="action" parentID="${action3.ParentID}"
																											onclick="checkAction(this)" />
																											${action3.Action} <c:if
																												test="${action3.Action==null}">${action3.Controller}
																							</c:if>
																										</td>
																									</tr>
																								</c:forEach>
																							</table>
																						</c:if>
																					</td>
																				</tr>
																			</c:forEach>
																		</table>
																	</c:if></td>
															</c:forEach>
														</c:if>
													</tr>
												</table>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
					</form>
					<div
						style="height: 100px; padding-top: 50px; width: 100%; float: right;">
						<div class="btn-group" style="float: left; padding-left: 200px;">

							<button class="btn btn-warning" style="margin: 0 20px 0 20px;"
								onclick="addnewRole()">生成角色</button>

							<button class="btn btn-warning" style="margin: 0 20px 0 20px;"
								onclick="updtrueRole()">修改角色</button>


							<button class="btn btn-warning" style="margin: 0 20px 0 20px;"
								onclick="window.history.go(-1)">返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/common/buttom.jsp"></jsp:include>

	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="${ctx}/js/matrix.js"></script>


</body>
</html>
<script type="text/javascript">
	function checkAction(obj) {
		var Id = $(obj).attr('value');
		var paId = $(obj).attr('parentID');
		if ($(obj).attr('checked') == true
				|| $(obj).attr('checked') == "checked") {
			$('input[value="' + paId + '"]').attr("checked", "checked");
			checkAction($('input[value="' + paId + '"]').get(0));
		} else {
			$('input[parentID="' + Id + '"]').each(function() {
				if (this.checked) {
					$(this).attr("checked", false);
					checkAction(this);
				}
			});
		}
	}

	function checkRole(obj) {
		$('input[name="action"]').each(function() {
			if (this.checked) {
				$(this).attr("checked", false);
			}
		});
		var list = $('input[name="role"]:checked').attr('roleValue');
		var lt = list.replace('[', '').replace(']', '').split(',');

		$.each(lt, function(k, v) {
			$('input[value="' + $.trim(v) + '"]').attr("checked", true);
		});
	}

	function addnewRole() {
		var name = prompt('请输入角色名称', '');
		if (name == null || name == '') {
			return;
		}
		var action = [];
		$('input[name="action"]').each(function() {
			if (this.checked) {
				action.push($(this).val());
			}
		});
		if (action.length == 0) {
			alert('请选择角色权限!');
			return;
		}
		var actions = action.join(',');

		$.ajax({
			type : "post",
			url : '${ctx}/personnel!addnewRolePersonnel.action',
			dataType : 'json',
			data : {
				actions : actions,
				name : name,
				type : '${type}'
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('角色设置成功!');
					window.location.reload();
				} else {
					alert(msg.msg);
				}
			}
		});
	}

	function updtrueRole() {

		var roleID = $('input[name="role"]:checked').val();
		var oldName = $('input[name="role"]:checked').next().html();
		if (roleID == null && roleID == '') {
			alert('请选择修改角色!');
			return;
		}
		name = prompt('请修改角色名称', oldName);
		if ($.trim(name) == $.trim(oldName)) {
			name = '';
		}

		var action = [];
		$('input[name="action"]').each(function() {
			if (this.checked) {
				action.push($(this).val());
			}
		});
		if (action.length == 0) {
			alert('请选择角色权限!');
			return;
		}
		var actions = action.join(',');

		$.ajax({
			type : "post",
			url : '${ctx}/personnel!updRolePenel.action',
			dataType : 'json',
			data : {
				roleID : roleID,
				actions : actions,
				name : name
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('设置成功!');
					window.location.reload();
				} else {
					alert(msg.msg);
				}
			}
		});
	}
</script>

