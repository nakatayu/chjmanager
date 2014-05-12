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
<style type="text/css">
</style>


</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
					<i class="icon-home"></i> 主页 </a>
				<c:choose>
					<c:when test="${not empty param.circleId}">
						<a href="#" class="current">圈子下话题维护</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="current">瞩目漕河泾维护</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>


		<c:if test="${empty param.circleId}">
			<div style="padding: 10px 0 0 20px;">
				<table style="width: 100%; font-size: 14px; font-weight: bold;">
					<tr valign="middle" align="right">
						<td width="50px">状态：</td>
						<td width="100px">
							<div class="controls">
								<select style="height: 25px; width: 100px;" id="topicStatus">
									<option value="">全部</option>
									<option value="3">待审核</option>
									<option value="2">审核不通过</option>
									<option value="1">审核通过</option>
								</select>
							</div>
						</td>
						<td width="50px" align="right">时间：</td>

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
							style="float: right; margin-top: 8px;" /></td>
						<td align="left"><button class="btn btn-success"
								onclick="loadnewData(10)"
								style="font-size: 20px; cursor: pointer;">查询</button></td>
					</tr>
				</table>
			</div>
		</c:if>
		<div class="row-fluid"
			style="background-color: #FFF; padding-left: 20px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">

					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th width="4%"><input type="checkbox"
									id="title-table-checkbox" name="title-table-checkbox" /></th>
								<th width="15%">标题</th>
								<th width="20%">摘要</th>
								<th width="15%">创建时间</th>
								<th width="7%">评论数</th>								
								<c:if test="${empty param.circleId}">
								<th width="15%">状态</th>
								</c:if>								
								<c:if test="${not empty param.circleId}">
								<th width="10%">置顶</th>
								</c:if>
								<th width="10%">查看评论</th>
							</tr>
						</thead>
						<tbody id="topicListlist">
						</tbody>
					</table>

					<div class="widget-title"
						style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
						<div class="btn-group" style="margin-top: 6px; float: left;">
						<c:choose>
						<c:when test="${empty param.circleId}">
						<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="addnewTopic()">新&nbsp;&nbsp;&nbsp;增</button>
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="updateTopic()">修&nbsp;&nbsp;&nbsp;改</button>
						</c:when>
						<c:otherwise>
						<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(0,1,0)">置&nbsp;&nbsp;&nbsp;顶</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(0,0,0)">取消置顶</button>
						</c:otherwise>
						</c:choose>							
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="updatetheStatus(4)">删&nbsp;&nbsp;&nbsp;除</button>
						</div>
						<div class="btn-group" style="margin-top: 6px; float: right;">
							<button class="btn" id="pagesize" style="width: 40px;">10</button>
							<button data-toggle="dropdown" class="btn dropdown-toggle">
								<span class="caret" style="height: 6px;"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a onclick="loadnewData(10)">10</a></li>
								<li class="divider"></li>
								<li><a onclick="loadnewData(20)">20</a></li>
								<li class="divider"></li>
								<li><a onclick="loadnewData(50)">50</a></li>
								<li class="divider"></li>
								<li><a onclick="loadnewData(100)">100</a></li>
							</ul>
						</div>
						<div class="pagination alternate"
							style="margin: 0px 10px; margin-top: 8px; float: right;">
							<ul id="pager">
							</ul>
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
	<script src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx}/js/jquery.pager.js"></script>

</body>
</html>
<script type="text/javascript">
	var listData = [];//每一页的数据
	var tStatus = [ "审核通过", "审核不通过" ];

	var TopStatus = [ "未知", "新创建", "修改申请" ];
	var topicStatus = [ "未知", "审核通过", "审核不通过", "待审核" ];

	var pgsize = 10;
	var pagenumber = 0;
	var rolen = 0;

	$(function() {
		loadData(1);
	});

	function updateTopic(topId) {
		var array = [];
		if (topId != '') {
			array.push(topId);
		} else {
			$('input[name="topicBoc"]:checked').each(function() {
				if ($(this).attr("checked")) {
					array.push($(this).val());
				}
			});
		}
		if (array.length == 0) {
			alert('请选择话题!');
			return;
		} else if (array.length > 1) {
			alert('只能修改一条话题!');
			return;
		}
		window.location.href = "${ctx}/topic!insertTopicPage.action?classic=0&topicId="
				+ array[0];
	}

	function addnewTopic() {
		window.location.href = "${ctx}/topic!insertTopicPage.action?classic=0";
	}

	function updatetheStatus(status) {
		var str = '';
		$('input[name="topicBoc"]:checked').each(function() {
			if ($(this).attr("checked")) {
				str += $(this).val() + ',';
			}
		});
		$.ajax({
			type : "post",
			url : '${ctx}/topic!updateTopicStatus.action',
			dataType : 'json',
			data : {
				topicId : str,
				status : status
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('修改成功！');
					loadData(1);
				} else
					alert(msg.msg);
			}
		});
	}

	function loadnewData(valn) {
		$('#pagesize').html(valn);
		pgsize = valn;
		loadData(1);
	}

	function loadData(page) {
		pagenumber = page;
		pageinfo["circleId"] = '${param.circleId}';
		pageinfo["topicStatus"] = $('#topicStatus').val();
		pageinfo["fontTime"] = $('#fontTime').val();
		pageinfo["backTime"] = $('#backTime').val();
		pageinfo["likeName"] = $('#likeName').val();
		pageinfo["size"] = pgsize;
		pageinfo["page"] = page;

		$
				.ajax({
					type : "post",
					url : '${ctx}/topic!findTopicList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						if (msg.status == 200) {
							var str = '';
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								str += '<tr><td align="center"><input type="checkbox" name="topicBoc" value="'+data["topic_id"]+'"/></td>';
								var name = data["topic_name"];
								if (name.length > 11) {
									name = name.substring(0, 10) + '...';
								}
								var summary = data["summary"];
								if (summary.length > 20) {
									summary = summary.substring(0, 19) + '...';
								}
								str += '<td><span style="cursor:pointer;" onclick="updateTopic('
										+ data["topic_id"]
										+ ')">'
										+ name
										+ '</span></td>';
								str += '<td><span style="cursor:pointer;" onclick="updateTopic('
										+ data["topic_id"]
										+ ')">'
										+ summary
										+ '</span></td>';
								str += '<td>' + data["create_time"] + '</td>';

								str += '<td align="center">'
										+ data["commentCount"] + '</td>';
								if('${param.circleId}'==null||'${param.circleId}'==''){
									if (rolen == 1) {
										str += '<td align="center">'
												+ topicStatus[data["examine_result"]]
												+ '</td>';
									} else {
										str += '<td align="center">'
												+ TopStatus[data["status"]]
												+ ':'
												+ topicStatus[data["examine_result"]]
												+ '</td>';
									}
								}
								if('${param.circleId}'!=null&&'${param.circleId}'!=''){
									if (data["list_top"] > 0) {
										str += '<td>被置顶</td>';
									} else {
										str += '<td></td>';
									}
								}
								
								if (data["commentCount"] > 0) {
									str += '<td style="text-align:center;"><a href="javascript:void(0)" onclick="queryCommentOfTopic('
											+ data["topic_id"]
											+ ')">查看评论</a></td>';
								} else {
									str += '<td align="center"></td>';
								}
								str += '</tr>';
							}
							$('#topicListlist').html(str);

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
							$('#topicListlist').html(
									'<tr><td colspan="7">' + msg.msg
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

	function gotothePage(vals) {
		pagenumber = pagenumber + vals;
		loadData(pagenumber);
	}

	function queryCommentOfTopic(topicId) {
		window.location.href = "${ctx}/pages/manager/TopicComment.jsp?topicId="
				+ topicId;
	}
	
	function setRelationOnTopic(filName, filValue, filnum) {
		var str = '';
		var i = 0;
		$('input[name="topicBoc"]:checked').each(function() {
			if ($(this).attr("checked")) {
				str += $(this).val() + ',';
				i++;
			}
		});
		
		if (str.length < 1) {
			alert('请选择对象！');
			return;
		}
		if (filnum != 0 && i > filnum) {
			alert('设定数量超出'+filnum+'个范围！');
			return;
		}
		
		var setData = {};
		setData["filValue"] = filValue;	
		setData["topicId"] = str;
		setData["filName"] = filName;
		setData["filnum"] = filnum;
		
		$.ajax({
			type : "post",
			url : '${ctx}/topic!updaTopiclistTop.action',
			dataType : 'json',
			data : setData,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('修改成功！');
					window.location.reload();
				} else
					alert(msg.msg);
			}
		});	
	}
	
</script>


