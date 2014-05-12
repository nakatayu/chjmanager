<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>服务供应商维护</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
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
</style>

</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="Go to Home"
					class="tip-bottom"><i class="icon-home"></i> 主页</a> <a href="#"
					class="current">${user.name}菁彩维护</a>
			</div>
		</div>



		<div style="padding: 10px 0 0 20px;">
			<table style="width: 100%; font-size: 14px; font-weight: bold;">

				<tr valign="middle" align="right">
					<td width="80px">审核状态：</td>
					<td width="115px">
						<div class="controls">
							<select style="height: 25px; width: 115px;" id="actStatus">
								<option value="" selected="selected">全部</option>
								<option value="3">待审核</option>
								<option value="2">审核不通过</option>
								<option value="1">审核通过</option>
							</select>
						</div>
					</td>

					<td width="80px">活动状态：</td>
					<td width="115px">
						<div class="controls">
							<select style="height: 25px; width: 115px;" id="actAction">
								<option value="" selected="selected">全部</option>
								<option value="1">未开始</option>
								<option value="2">未结束</option>
								<option value="3">已结束</option>
							</select>
						</div>
					</td>

					<td width="80px" align="right">时间：</td>

					<td width="140px" valign="bottom"><input id="fontTime"
						type="text" name="beginTime" value="" class="Wdate"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						style="width: 130px;" /></td>
					<td width="15px" align="center">至</td>
					<td width="140px" valign="bottom"><input id="backTime"
						type="text" name="beginTime" value="" class="Wdate"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						style="width: 130px;" /></td>
					<td width="10px"></td>

					<td width="100px"><input id="likeName" type="text" value=""
						style="float: right; margin-top: 8px; width: 100px;" /></td>
					<td align="left"><button class="btn btn-success"
							onclick="loadData(1)" style="font-size: 20px; cursor: pointer;">查询</button>
					</td>
				</tr>
			</table>
		</div>



		<div class="row-fluid"
			style="background-color: #FFF; padding-left: 20px;">
			<div class="span12">

				<div class="widget-box" style="margin-right: 40px;">

					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th width="15px"><input type="checkbox"
									id="title-table-checkbox" name="title-table-checkbox" /></th>
								<th width="80px">活动标题</th>
								<th width="150px">活动摘要</th>
								<th width="35px">人数上限</th>
								<th width="50px">已参加人数</th>
								<th width="130px">开始时间</th>
								<th width="130px">结束时间</th>
								<th width="150px">当前状态</th>
								<th width="90px">成员管理</th>
								<th width="90px">评论管理</th>
								<th width="90px">照片管理</th>
							</tr>
						</thead>
						<tbody id="table_content">
						</tbody>
					</table>

					<div class="widget-title"
						style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
						<div class="btn-group" style="margin-top: 6px; float: right;">
							<button class="btn" id="pagesize">10</button>
							<button data-toggle="dropdown" class="btn dropdown-toggle">
								<span class="caret" style="height: 6px;"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0)" onclick="loadData(1,10)">10</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadData(1,20)">20</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadData(1,50)">50</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadData(1,100)">100</a></li>
							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 30px; margin-top: 8px; float: right;">
							<div id="pager"></div>
						</div>
						<div class="pagination alternate"
							style="margin-left: 0px; margin-top: 8px; float: left;">
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="addactivityinfo()">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="updateActivity()">修&nbsp;&nbsp;&nbsp;&nbsp;改</button>
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="deleteActList()">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
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
	<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
	<script src="${ctx}/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">
	var listData = [];//每一页的数据
	var actStatus = [ "创建待审核", "修改申请", "申请关闭" ];//活动状态
	var activityStatus = [ "", "创建待审核", "修改待审核", "请求关闭" ];
	var examineResult = [ "", "审核通过", "审核未通过", "未审核" ];

	$(function() {
		loadData(1);
	});

	function loadData(page, size, name) {
		pageinfo["examineResult"] = $('#actStatus').val();
		pageinfo["actAction"] = $('#actAction').val();
		pageinfo["fontTime"] = $('#fontTime').val();
		pageinfo["backTime"] = $('#backTime').val();
		pageinfo["likeName"] = $('#likeName').val();

		if (size != undefined) {
			pageinfo["size"] = size;
			$('#pagesize').html(size);
		}
		if (page == -1)
			pageinfo["page"]--;
		else if (page == -2)
			pageinfo["page"]++;
		else {
			if (page >= pageinfo["tp"] && pageinfo["tp"] > 0)
				pageinfo["page"] = pageinfo["tp"];
			else
				pageinfo["page"] = page;
		}

		$
				.ajax({
					type : "post",
					url : '${ctx}/activity!findActivityAndUserList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								var name = data["activity_title"];
								if (name != null && name.length > 6) {
									name = name.substring(0, 5) + '...';
								}
								var summary = data["summary"];
								if (summary != null && summary.length > 11) {
									summary = summary.substring(0, 9) + '...';
								}

								array.push('<tr>');
								array
										.push('<td>'
												+ '<input type="checkbox" value="' + data["activity_id"]+ '" name="activityBoc"/>'
												+ '</td>');
								array
										.push('<td><span style="cursor:pointer;" onclick="updateActivity('
												+ data["activity_id"]
												+ ')">'
												+ name + '</span></td>');
								array
										.push('<td><span style="cursor:pointer;" onclick="updateActivity('
												+ data["activity_id"]
												+ ')">'
												+ summary + '</span></td>');
								array.push('<td>' + data["user_max"] + '</td>');
								array.push('<td>' + data["addUserCount"]
										+ '</td>');
								array.push('<td>' + data["begin_time"]
										+ '</td>');
								if (data["end_time"] == null) {
									data["end_time"] = "";
								}
								array.push('<td>' + data["end_time"] + '</td>');
								array.push('<td>'
										+ activityStatus[data["status"]] + ':'
										+ examineResult[data["examine_result"]]
										+ '</td>');
								array
										.push('<td><a href="javascript:void(0)" onclick="queryUserOfActivity('
												+ data["activity_id"]
												+ ')">成员管理</a></td>');
								if (data["acommCount"] > 0) {
									array
											.push('<td align="center"><a href="javascript:void(0)" onclick="queryCommOfActiv('
													+ data["activity_id"]
													+ ')">查看评论</a></td>');
								} else {
									array.push('<td align="center">暂无</td>');
								}
								array
										.push('<td><a href="javascript:void(0)" onclick="qryCommActivPict('
												+ data["activity_id"]
												+ ')">进入图片</a></td>');
								array.push('</tr>');
							}

							$('#table_content').html(array.join(''));

							if (msg.total > pageinfo["size"]) {
								if (msg.total % pageinfo["size"] == 0)
									pageinfo["tp"] = msg.total
											/ pageinfo["size"];
								else
									pageinfo["tp"] = Math.ceil(msg.total
											/ pageinfo["size"]);
								$("#pager").pager({
									pagenumber : pageinfo["page"],
									pagecount : pageinfo["tp"],
									buttonClickCallback : PageClick
								});

							} else {
								$('#pager').html('');
							}
						} else {
							$('#pager').html('');
							$('#table_content').html(
									'<tr><td colspan="11">' + msg.msg
											+ '</td></tr>');
						}
					}
				});
	}
	PageClick = function(pageclickednumber) {
		$("#pager").pager({
			pagenumber : pageclickednumber,
			pagecount : pageinfo["tp"],
			buttonClickCallback : PageClick
		});
		loadData(pageclickednumber);
	}

	function queryCommOfActiv(activityId) {
		window.location.href = "${ctx}/pages/manager/ActivityComment.jsp?activityId="
				+ activityId;
	}
	function qryCommActivPict(activityId) {
		window.location.href = "${ctx}/pages/manager/ActivityPicture.jsp?activityId="
				+ activityId;
	}
	function queryUserOfActivity(activityId) {
		window.location.href = "${ctx}/pages/company/updateActivityUserInfo.jsp?activityId="
				+ activityId;
	}

	function loadnewData(valn) {
		$('#pagesize').html(valn);
		pgsize = valn;
		loadData(1);
	}
	function updateActivity(activityId) {
		var array = [];
		if (activityId != 0) {
			array.push(activityId);
		} else {
			$('input[name="activityBoc"]:checked').each(function() {
				if ($(this).attr("checked")) {
					array.push($(this).val());
				}
			});
		}
		if (array.length == 0) {
			alert('请选择活动!');
			return;
		} else if (array.length > 1) {
			alert('只能修改一条活动!');
			return;
		}
		window.location.href = "${ctx}/activity!insertActivityInfoPage.action?id="
				+ array[0];
	}

	function gotothePage(vals) {
		pagenumber = pagenumber + vals;
		loadData(pagenumber);
	}

	function deleteActList() {
		var str = '';
		$('input[name="activityBoc"]:checked').each(function() {
			if ($(this).attr("checked")) {
				str += $(this).val() + ',';
			}
		});
		if (str.length < 1) {
			alert('请选择对象！');
			return;
		}
		if (confirm("您确认删除此记录吗？")) {
			$.ajax({
				type : "post",
				data : {
					selectedActivityIds : str
				},
				url : '${ctx}/activity!deleteActList.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("删除成功！");
						window.location.reload();
					}
				}
			});
		}
	}

	function addactivityinfo() {
		location.href = "${ctx}/pages/company/ActivityInfo.jsp";
	}

	function updateActStatus(activity_id, astatus) {
		$.ajax({
			type : "post",
			url : '${ctx}/activity!updateAstatus.action',
			dataType : 'json',
			data : {
				ActivityId : activity_id,
				ast : astatus
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					window.location.reload(true);

				}
			}
		});
	}
	//查看报名
	function showAttend(activity_id) {
		window.location = "showAttendList.jsp?activity_id=" + activity_id;
	}
</script>

