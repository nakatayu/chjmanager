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
.topicIdCss {
	color: #FF0000;
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
				</a> <a href="#" class="current">菁典维护</a>
			</div>
		</div>


		<div style="padding: 10px 0 0 20px;">
			<table style="width: 100%; font-size: 14px; font-weight: bold;">
				<tr valign="middle" align="right">
					<td align="left" width="150px"><input type="checkbox" id="top"
						value="1" />被推荐或置顶</td>
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


		<div class="row-fluid"
			style="background-color: #FFF; padding-left: 20px; padding-bottom: 50px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">

					<table class="table table-bordered table-striped with-check"
						style="margin: 0px; float: right; border: 1px solid #ccc;">
						<thead>
							<tr>
								<th width="40px"><input type="checkbox"
									id="title-table-checkbox" name="title-table-checkbox" /></th>
								<th width="50px">话题ID</th>
								<th width="150px">标题</th>
								<th width="250px">摘要</th>
								<th width="150px">创建时间</th>
								<th width="60px">评论数</th>
								<th width="50px">web<br />置顶</th>
								<th width="50px">手机首<br />页推荐
								</th>
								<th width="50px">手机菁<br />英推荐
								</th>
								<th width="50px">web<br />推荐</th>
								<th width="90px">查看评论</th>
							</tr>
						</thead>
						<tbody id="topicListlist"
							style="word-break: break-all; word-wrap: break-word;">

						</tbody>
					</table>

					<div class="widget-title"
						style="height: 40px; border: 1px solid #ccc; float: right; width: 100%;">

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
							<div id="pager"></div>
						</div>
					</div>
					<div class="widget-title"
						style="height: auto; border: 1px solid #ccc; float: right; width: 100%;">
						<div class="btn-group" style="float: left;">
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="addnewTopic()">新&nbsp;&nbsp;增</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="updateTopic(0)">修&nbsp;&nbsp;改</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="updatetheStatus(4)">删&nbsp;&nbsp;除</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(0,1,6)">web置顶</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(0,0,0)">取消web置顶</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(3,1,15)">web推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(3,0,0)">取消web推荐</button>
							<br />
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(1,1,0)">手机首页推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(1,0,0)">取消手机首页</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(2,1,0)">手机菁英推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnTopic(2,0,0)">取消手机菁英</button>
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
	var rolen = 1;
	var selfRole = 1;//用于区分菁典话题和瞩目话题 

	$(function() {
		loadData(1);
	});

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
			alert('设置数量大于设定！');
			return;
		}
		if (filnum > 0) {
			filValue = prompt('请输入推荐顺序(范围：1-' + filnum + ')，最多可推荐' + filnum
					+ '个', '1');
			if (filValue == '' || filValue == null) {
				return;
			} else if (isNaN(filValue)) {
				alert('请输入数字！');
				return;
			}
		}

		var setData = {};
		setData["filValue"] = filValue;
		setData["topicId"] = str;
		setData["filName"] = filName;
		setData["filnum"] = filnum;
		setData["selfRole"] = selfRole;
		$.ajax({
			type : "post",
			url : '${ctx}/topic!updaTopiclistTop.action',
			dataType : 'json',
			data : setData,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('修改成功！');
					loadData(1);
				} else
					alert(msg.msg);
			}
		});
	}

	function updateTopic(topicId) {
		var array = [];
		if (topicId != 0) {
			array.push(topicId);
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
		window.location.href = "${ctx}/topic!insertTopicPage.action?classic=1&topicId="
				+ array[0];
	}
	function addnewTopic() {
		window.location.href = "${ctx}/topic!insertTopicPage.action?classic=1";
	}

	function updatetheStatus(status) {
		var str = '';
		$('input[name="topicBoc"]:checked').each(function() {
			if ($(this).attr("checked")) {
				str += $(this).val() + ',';
			}
		});
		if (str.length < 1) {
			alert('请选择对象！');
			return;
		}
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
		pageinfo["topicStatus"] = $('#topicStatus').val();
		pageinfo["fontTime"] = $('#fontTime').val();
		pageinfo["backTime"] = $('#backTime').val();
		pageinfo["likeName"] = $('#likeName').val();
		pageinfo["size"] = pgsize;
		pageinfo["page"] = page;
		pageinfo["selfRole"] = selfRole;

		var top = document.getElementById("top");
		if (top.checked) {
			pageinfo["top"] = 1;
		} else {
			pageinfo["top"] = 0;
		}

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
								str += '<tr><td><input type="checkbox" name="topicBoc" value="'+data["topic_id"]+'"/></td>'
										+ '<td><p class="topicIdCss"  href="javascript:void(0)">'
										+ data["topic_id"] + '</p></td>';
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

								if (data["list_top"] > 0) {
									str += '<td style="text-align:center;">web置顶<br /><span style="color:red;">第'
											+ data["list_top"] + '位<span></td>';
								} else {
									str += '<td></td>';
								}
								if (data["first_phone_extend"] > 0) {
									str += '<td style="text-align:center;">手机首页<br /><span style="color:red;">第'
											+ data["first_phone_extend"]
											+ '位<span></td>';
								} else {
									str += '<td></td>';
								}
								if (data["relation_phone_extend"] > 0) {
									str += '<td style="text-align:center;">手机菁英<br /><span style="color:red;">第'
											+ data["relation_phone_extend"]
											+ '位<span></td>';
								} else {
									str += '<td></td>';
								}
								if (data["web_extend"] > 0) {
									str += '<td style="text-align:center;">web推荐<br /><span style="color:red;">第'
											+ data["web_extend"]
											+ '位<span></td>';
								} else {
									str += '<td></td>';
								}

								if (data["commentCount"] > 0) {
									str += '<td  style="text-align:center;"><a href="javascript:void(0)" onclick="queryCommentOfTopic('
											+ data["topic_id"]
											+ ')">查看评论</a></td>';
								} else {
									str += '<td></td>';
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
							$('#topicListlist').html(
									'<tr><td colspan="11">' + msg.msg
											+ '</td></tr>');
							$('#pager').html('');
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
	};

	function gotothePage(vals) {
		pagenumber = pagenumber + vals;
		loadData(pagenumber);
	}

	function queryCommentOfTopic(topicId) {
		window.location.href = "${ctx}/pages/manager/TopicComment.jsp?topicId="
				+ topicId;
	}

	function updatetheStatus(status) {
		var str = '';
		$('input[name="topicBoc"]:checked').each(function() {
			if ($(this).attr("checked")) {
				str += $(this).val() + ',';
			}
		});
		if (str.length < 1) {
			alert('请选择对象！');
			return;
		}
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
</script>


