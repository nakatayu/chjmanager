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
					class="icon-home"></i> 主页</a> <a href="javascript:void(0)"
					onclick="window.history.go(-1)" title="推送管理" class="tip-bottom"><i
					class="icon-home"></i> 推送管理</a> <a href="#" class="current">添加推送</a>
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
								id="form_Id" novalidate="novalidate">
								<input type="hidden" name="status" id="status" value="0">

								<div class="control-group">
									<label class="control-label">推送：</label>
									<div class="controls">
										<select name="manner" id="manner" style="width: 262px;">
											<option value="-1" id="manner">全部</option>
											<option id="manner" value="1">短信推送</option>
											<option id="manner" value="2">App应用推送</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">性别：</label>
									<div class="controls">
										<select name="sex" id="sex" style="width: 262px;">
											<option value="-1" id="sex">全部</option>
											<option id="sex" value="1">男</option>
											<option id="sex" value="2">女</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">年龄范围：</label>
									<div class="controls">
										<select name="age" id="age" style="width: 262px;">
											<option value="-1" id="age">全部</option>
											<option id="age" value="1">小于20</option>
											<option id="age" value="2">21-25</option>
											<option id="age" value="3">26-30</option>
											<option id="age" value="4">31-40</option>
											<option id="age" value="5">41以上</option>
										</select>
									</div>
								</div>
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标签：</h5>
								<hr>

								<table>
									<tr>
										<td></td>
										<td align="left" valign="bottom"
											style="height: 15px; font-size: 15px; padding: 10px;">标签一级分类选择：</td>
										<td align="left" valign="bottom"
											style="height: 15px; font-size: 15px; padding: 10px;">标签二级分类选择：</td>
										<td align="left" valign="bottom"
											style="height: 15px; font-size: 15px; padding: 10px;">标签三级分类选择：</td>
									</tr>
									<tr>
										<td style="width: 10%"></td>
										<td style="width: 27%">
											<div
												style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
												class="tag_content">
												<ul id="tagFirst">
												</ul>
											</div>
										</td>
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
									<label class="control-label" style="height: 30px;">已选标签：</label>
									<input name="thirdCategoryTag" id="thirdCategoryTag"
										type="hidden">
									<div class="controls" id="choosenLabel" titie="labelstyle"
										style="height: 30px;"></div>
								</div>
								<div class="control-group">
									<label class="control-label">关联类别：</label>
									<div class="controls">
										<label for="chboxShop"> <input id="chboxShop"
											type="checkbox" name="relevanceCheckbox" value="1" />购买过本店铺的人
										</label> <label for="chboxShop1"> <input id="chboxShop1"
											type="checkbox" name="relevanceCheckbox" value="2" />关注过本店铺的人
										</label> <label for="chboxCircle"> <input id="chboxCircle"
											type="checkbox" name="relevanceCheckbox" value="3" />圈友
										</label>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"> 推送内容：</label>

									<textarea type="text" name="content" class="shop_announcement"
										style="height: 100px" id="contentId"></textarea>
									<span><font color="red" id="content_check">100字内
									</font></span>

								</div>

								<div class="form-actions">
									<!-- 1 审核中  2 审核未通过 3 审核通过 -->
									<button class="btn btn-warning" type="button"
										class="btn btn-success" onclick="savePushInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
									<button class="btn btn-warning" type="button"
										class="btn btn-success" onclick="window.history.go(-1)">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
								</div>
							</form>
						</div>
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
	$(function() {
		//标签分类 1级 
		$
				.ajax({
					type : "post",
					url : '${ctx}/tag!findTagFirstList.action',
					dataType : 'json',
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="tagname2(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>');
							}
							$('#tagFirst').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	});
	//标签名称  2级
	function tagname2(li) {
		var tagid = $(li).attr("value");
		$
				.ajax({
					type : "post",
					url : '${ctx}/tag!findTagSecondList.action',
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
										.push('<li class="tag_content"	onclick="tagname(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>');
							}
							$('#tagSecond').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	//标签名称  3级
	function tagname(li) {
		var tagid = $(li).attr("value");
		$
				.ajax({
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
										.push('<li class="tag_content"	onclick="selectLabelName(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
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

	function selectLabelName(li) {
		if ($("#choosenLabel").find("span").length >= 6) {
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

			$("#choosenLabel")
					//已选标签 
					.append(
							"<span  value="
									+ $(li).attr("value")
									+ ">"
									+ $(li).text()
									+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>");
		}
	}

	function delLabel(li) {
		$(li).prev().remove();
		$(li).remove();
	}
	//提交保存 
	function savePushInfo() {
		var lng = $.trim($('#contentId').val()).length;
		if (lng == 0) {
			alert('请输入推送内容!');
			return;
		} else if (lng > 100) {
			alert('内容长度不超过100个字!');
			return;
		}

		var param = $('#form_Id').serialize();
		var array = [];
		$('input[name="relevanceCheckbox"]:checked').each(function() {
			array.push($(this).val());
		});
		param += "&relevanceType=" + array.join(',');
		var arrayTag = [];
		$("#choosenLabel").find("span").each(function() {
			arrayTag.push($(this).attr("value"));

		});
		if (arrayTag.length == 0) {
			alert('请选择标签!');
			return;
		}
		param += "&tagList=" + arrayTag.join(',');

		$.ajax({
			type : "post",
			url : '${ctx}/push!insertPushInfo.action',
			dataType : 'json',
			data : param,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("添加成功");
					window.history.go(-1);
				} else {
					alert("添加失败");
				}
			}
		});
	}

	// 1 审核中  2 审核未通过 3 审核通过 
	function updatePushInfoStatusNoPass(pushId, status) {
		$.ajax({
			type : "post",
			url : '${ctx}/push!updatePushInfoStatus.action?status=' + 2
					+ '&pushId=' +
<%=request.getParameter("pushId")%>
	,
			dataType : 'json',
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("状态,审核未通过..");
					window.location.reload(true);
				}
			}
		});
	}
	function updatePushInfoStatusPass(pushId, status) {
		$.ajax({
			type : "post",
			url : '${ctx}/push!updatePushInfoStatus.action?status=' + 3
					+ '&pushId=' +
<%=request.getParameter("pushId")%>
	,
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