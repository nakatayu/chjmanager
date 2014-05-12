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
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<style type="text/css">
.back {
	display: none;
	position: fixed;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.font {
	display: none;
	position: fixed;
	top: 5%;
	left: 30%;
	width: 450px;
	height: 520px;
	border: 2px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
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
				</a> <a href="#" class="current">${user.name}菁汇维护</a>
			</div>
		</div>

		<div style="padding: 10px 0 0 20px;">
			<table style="width: 100%; font-size: 12px;">

				<tr valign="middle">
					<td width="40px">状态：</td>
					<td width="100px">
						<div class="controls">
							<select style="height: 25px; width: 100px;" id="circleStatus">
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
					<td><button class="btn btn-success" onclick="loadnewData(10)"
							style="font-size: 20px; cursor: pointer;">查询</button></td>
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
								<th><input type="checkbox" id="title-table-checkbox"
									name="title-table-checkbox" /></th>
								<th>圈子名称</th>
								<th>圈子摘要</th>
								<th>创建时间</th>
								<th>圈子级别</th>
								<th>总人数</th>
								<th>当前状态</th>
								<th>人员管理</th>
								<th>话题管理</th>
							</tr>
						</thead>
						<tbody id="circleList">
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
								<li><a href="javascript:void(0)" onclick="loadnewData(10)">10</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadnewData(20)">20</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadnewData(50)">50</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadnewData(100)">100</a></li>
							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 30px; margin-top: 8px; float: right;">
							<ul id="pager">

							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 0px; margin-top: 8px; float: left;">
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="addNewCircle()">添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</button>
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="updateCircle()">修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改</button>
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="updateTheCircleLevel()">升级信息</button>
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="updateTheCircleStatus(4)">申请关闭</button>
							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="updateDeteleFlag()">删&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;除</button>

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

	<div id="back" class="back"></div>
	<div id="font" class="font" style="padding: 5px;">
		<div style="width: 100%; font-size: 20px;">
			<h3 style="text-align: center;" id="title">恩沃福尔</h3>
			<div
				style="text-align: center; height: 250px; vertical-align: middle;"
				>
				<a style="cursor: pointer; color: red; display: none;"
					id="uploadCard">上传证件照</a>
				<img id="imgInfo" style="min-width: 250px; max-width: 400px; border: 1px #ccc solid; height: 250px;display: none;" src="">	

			</div>

			<div style="margin: 10px; font-size: 14px;">
				<p>
					<span style="font-size: 20px; font-weight: bold;">升级原因：</span>
				</p>
				<p>
					<textarea style="width: 400px;" rows="4" id="reason">wqxx</textarea>
				</p>
			</div>
		</div>
		<div>
			<a class="btn btn-warning" onclick="reqAddlevel()" id="request"
				style="margin: 5px 0px 10px 50px; display: none;">请求升级</a> <a
				class="btn btn-warning" onclick="saveDialog()" id="submit"
				style="margin: 5px 0px 10px 50px; display: none;">保存</a> <a
				class="btn btn-warning" onclick="closeDialog()"
				style="margin: 5px 0px 10px 50px;">返回</a>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var listData = [];//每一页的数据
	var Cstatus = [ "创建待审核", "创建成功", "升级申请", "升级成功", "申请关闭", "关闭圈子" ];
	var circleStatus = [ "未知", "创建待审核", "修改待审核", "请求升级", "请求关闭" ];
	var examineResult = [ "未知", "审核通过", "审核未通过", "未审核" ];
	var circleLevel = [ "未知", "一级", "二级", "三级", "四级", "五级", "六级", "七级" ];

	var circle = [ 1, 2, 3, 4, 5, 6 ];

	var pgsize = 10;
	var pagenumber = 0;
	var rolen = 0;

	var imgUrl = '';
	$(function() {
		loadData(1);

		var $uploadCard = $("#uploadCard");
		new AjaxUpload(
				$uploadCard,
				{
					action : '${ctx}/user!uploadImage.action',
					name : 'upfile',
					responseType : 'json',
					data : {
						type : 9
					},
					onSubmit : function(file, ext) {
						ext = ext.toLowerCase(); //ext 文件后缀
						if (ext == 'bmp' || ext == 'jpg' || ext == 'jpeg'
								|| ext == 'png') {
						} else {
							alert('图片格式不对');
							return false;
						}
					},
					onComplete : function(file, response) {
						if (response.status == 200) {
							$('#imgInfo').attr('src','${http_img}'+response.rows);
							$('#imgInfo').show();
							$('#uploadCard').hide();
							imgUrl = response.rows;
						} else {
							alert(response.msg);
						}
					}
				});

	});
	
	function loadData(page) {
		pagenumber = page;
		pageinfo["circleStatus"] = $('#circleStatus').val();
		pageinfo["fontTime"] = $('#fontTime').val();
		pageinfo["backTime"] = $('#backTime').val();
		pageinfo["likeName"] = $('#likeName').val();
		pageinfo["size"] = pgsize;
		pageinfo["page"] = page;

		$
				.ajax({
					type : "post",
					url : '${ctx}/circle!findCircleList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						if (msg.status == 200) {

							var str = '';
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								str += '<tr><td><input type="checkbox" name="circleBoc" value="'
								+data["circle_id"]+'" result="'+data["examine_result"]+'" status="'
								+data["status"]+'"/></td>';
								var name = data["name"];
								if (name.length > 11) {
									name = name.substring(0, 10) + '...';
								}
								var summary = data["summary"];
								if (summary == null) {
									summary = '';
								} else if (summary.length > 16) {
									summary = summary.substring(0, 15) + '...';
								}
								str += '<td><span style="cursor:pointer;" onclick="updateCircle('
										+ data["circle_id"]
										+ ')">'
										+ name
										+ '</span></td>';
								str += '<td><span style="cursor:pointer;" onclick="updateCircle('
										+ data["circle_id"]
										+ ')">'
										+ summary
										+ '</span></td>';
								str += '<td>' + data["create_time"] + '</td>';
								str += '<td>' + circleLevel[data["level"]]
										+ '</td>';

								str += '<td align="center">'
										+ data["addUserCount"] + '</td>';
								if (rolen == 1) {
									str += '<td align="center">'
											+ examineResult[data["examine_result"]]
											+ '</td>';
								} else {
									str += '<td align="center">'
											+ circleStatus[data["status"]]
											+ ':'
											+ examineResult[data["examine_result"]]
											+ '</td>';
								}
								str += '<td style="text-align:center;">'
										+ '<a href="${ctx}/pages/company/updateCircleUserInfo.jsp?circleId='
										+ data["circle_id"] + '">成员管理</a></td>';
								str += '<td style="text-align:center;">'
										+ '<a href="${ctx}/pages/company/c_topicList.jsp?circleId='
										+ data["circle_id"]
										+ '">话题管理</a></td></tr>';
							}
							$('#circleList').html(str);

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
							$('#circleList').html(
									'<tr><td colspan="9">' + msg.msg
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
	};

	function queryUserOfCircle(cirId) {
		window.location.href = "${ctx}/pages/company/updateCircleUserInfo.jsp?circleId="
				+ cirId;
	}

	function loadnewData(valn) {
		$('#pagesize').html(valn);
		pgsize = valn;
		loadData(1);
	}

	function gotothePage(vals) {
		pagenumber = pagenumber + vals;
		loadData(pagenumber);
	}
	function updateCircle(circleId) {
		var array = [];
		if (circleId != '') {
			array.push(circleId);
		} else {
			$('input[name="circleBoc"]:checked').each(function() {
				if ($(this).attr("checked")) {
					array.push($(this).val());
				}
			});
		}
		if (array.length == 0) {
			alert('请选择圈子!');
			return;
		} else if (array.length > 1) {
			alert('只能修改一条圈子!');
			return;
		}
		window.location.href = "${ctx}/circle!insertCirclePage.action?circleId="
				+ array[0];
	}
	function addNewCircle() {
		window.location.href = "${ctx}/circle!insertCirclePage.action";
	}

	function updateTheCircleStatus(status) {
		var str = '';
		$('input[name="circleBoc"]:checked').each(function() {
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
			url : '${ctx}/circle!updateCircleStatus.action',
			dataType : 'json',
			data : {
				circleId : str,
				status : status
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('修改成功！');
					window.location.reload();
				} else
					alert(msg.msg);
			}
		});
	}

	function updateDeteleFlag() {
		var str = '';
		$('input[name="circleBoc"]:checked').each(function() {
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
			url : '${ctx}/circle!deleteCirList.action',
			dataType : 'json',
			data : {
				selectedCirleIds : str
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('修改成功！');
					window.location.reload();
				} else
					alert(msg.msg);
			}
		});
	}

	criclecardId = '';
	function updateTheCircleLevel() {
		imgUrl = '';
		var str = [];
		var b = true;
		$('input[name="circleBoc"]:checked').each(
				function() {
					if ($(this).attr("checked")) {
						if ($(this).attr('result') == 3
								&& $(this).attr('status') != 3) {
							b = false;
						} else {
							str.push($(this).val());
						}
					}
				});

		if (!b) {
			alert('未审核，不能操作！');
			return;
		} else if (str.length != 1) {
			alert('请选择一个对象！');
			return;
		} else {
			criclecardId = str[0];
			$
					.ajax({
						type : "post",
						url : '${ctx}/circle!findCircleAddLevel.action',
						dataType : 'json',
						data : {
							circleId : criclecardId
						},
						success : function(msg, status) {
							if (msg.status == 200) {
								var data = msg.rows;
								if (data != null && data!='') {
									$('#imgInfo').attr('src','${http_img}'+data["file_path"]);
									$('#imgInfo').show();
									$('#uploadCard').hide();
									$('#reason').val(data["reason"]);
									if (msg.total == 1) {
										$('#request').show();
										$('#submit').hide();
									} else if (msg.total == 0) {
										$('#request').hide();
										$('#submit').hide();
									}
								} else {
									if (msg.total == 1) {
										reqAddlevel();
									} else if (msg.total == 0) {
										alert('暂无升级信息！');
										return;
									}
								}
								document.getElementById('back').style.display = 'block';
								document.getElementById('font').style.display = 'block';
							} else {
								alert(msg.msg);
							}
						}
					});
		}
	}

	function reqAddlevel() {
		imgUrl = '';
		$('#imgInfo').hide();
		$('#uploadCard').show();
		$('#reason').val('');
		$('#submit').show();
		$('#request').hide();
	}

	function closeDialog() {
		document.getElementById('back').style.display = 'none';
		document.getElementById('font').style.display = 'none';
	}
	function saveDialog() {

		var data = {};
		data["circleId"] = criclecardId;
		data["content"] = $.trim($('#reason').val());
		data["Imge"] = imgUrl;
		
		$.ajax({
			type : "post",
			url : '${ctx}/circle!requestCircleAddLevel.action',
			dataType : 'json',
			data : data,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('上传成功！');
					closeDialog();					
				}else{
					alert(msg.msg);
				}
			}
		});
	}
</script>


