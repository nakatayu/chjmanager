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
/*  遮罩层 */
.black_overlay {
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
	filter: alpha(opacity =80);
}

.white_content {
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
				</a> <a href="#" class="current">菁汇维护</a>
			</div>
		</div>



		<div style="padding: 10px 0 0 20px;">
			<table style="width: 100%; font-size: 14px; font-weight: bold;">
				<tr>
					<td align="right">公司：</td>
					<td><select id="companyId" style="width: 200px;">
							<option selected="selected" value="">全部公司</option>
					</select></td>
					<td width="50px">状态：</td>
					<td width="100px">
						<div class="controls">
							<select style="height: 25px; width: 100px;" id="circleStatus">
								<option value="">全部</option>
								<option value="3">待审核</option>
								<option value="2">审核不通过</option>
								<option value="1">审核通过</option>
								<option value="T">被推荐</option>
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
						style="float: right; margin-top: 8px;" placeholder="名称/摘要" /></td>
					<td align="left"><button class="btn btn-success"
							onclick="loadnewData(10)"
							style="font-size: 20px; cursor: pointer;">查询</button></td>
				</tr>
			</table>
		</div>


		<div class="row-fluid"
			style="background-color: #FFF; padding-left: 20px; padding-bottom: 10px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">

					<table class="table table-bordered table-striped with-check"
						style="margin-bottom: 0px; float: right; border: 1px solid #ccc;">
						<thead>
							<tr>
								<th width="30px">全选<br> <input type="checkbox"
									id="title-table-checkbox" name="title-table-checkbox" /></th>
								<th width="50px">圈子ID</th>
								<th width="110px">圈子名称</th>
								<th width="150px">圈子摘要</th>
								<th width="130px">创建时间</th>
								<th width="180px">创建人（企业）</th>
								<th width="50px">总人数</th>
								<th width="130px">当前状态</th>
								<th width="50px">手机首<br />页推荐
								</th>
								<th width="50px">手机菁<br />英推荐
								</th>
								<th width="50px">web首<br />页推荐
								</th>
								<th width="50px">web菁<br />英推荐
								</th>
							</tr>
						</thead>
						<tbody id="circleList">
						</tbody>
					</table>

					<div class="widget-title"
						style="height: 40px; border: 1px solid #ccc; float: right; width: 100%;">
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
							style="margin-left: 30px; margin-top: 6px; float: right;">
							<div id="pager"></div>
						</div>

					</div>



					<div class="widget-title"
						style="width: 100%; border: 1px solid #ccc; float: right; height: auto;">

						<div class="btn-group" style="float: left;">

							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnCircle(0,1,0)">手机首页推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnCircle(0,0,0)">取消手机首页</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnCircle(1,1,0)">手机菁英推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnCircle(1,0,0)">取消手机菁英</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnCircle(2,1,3)">web首页推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnCircle(2,0,0)">取消web首页</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnCircle(3,1,6)">web菁英推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnCircle(3,0,0)">取消web菁英</button>
							<br />

							<button class="btn btn-warning" style="margin: 5px;"
								onclick="addNewCircle()">新&nbsp;&nbsp;增</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="updateCircle(0)">修&nbsp;&nbsp;改</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="updateCircleExamine(1)">审核通过</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="updateCircleExamine(2)">审核不通过</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="addLevelCircle()">圈子升级</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="updateDeteleFlag()">删&nbsp;&nbsp;除</button>
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

	<div id="divWhite" class="white_content"
		style="padding: 10px 0px 0px 10px;" id="contentDiv"></div>

	<div id="divBlack" class="black_overlay"></div>
</body>
</html>
<script type="text/javascript">
	var listData = [];//每一页的数据	
	var circleStatus = [ "未知", "创建待审核", "修改待审核", "请求升级", "请求关闭" ];
	var examineResult = [ "未知", "审核通过", "审核未通过", "未审核" ];
	var circleLevel = [ "未知", "一级", "二级", "三级", "四级", "五级", "六级", "七级" ];

	var circle = [ 1, 2, 3, 4, 5, 6 ];

	var pgsize = 10;
	var pagenumber = 0;
	var rolen = 0;

	$(function() {
		$.ajax({
			type : "post",
			url : '${ctx}/topic!topicCreateOfUser.action',
			dataType : 'json',
			data : {},
			success : function(msg, status) {
				if (msg.status == 200) {
					var str = '';
					for ( var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];
						str += '<option value="'+data["company_id"]+'" >'
								+ data["name"] + '</option>';
					}
					$('#companyId').append(str);
					loadData(1);
				} else
					alert(msg.msg);
			}
		});
	});

	function loadData(page) {
		pagenumber = page;
		pageinfo["companyId"] = $('#companyId').val();
		pageinfo["circleStatus"] = $('#circleStatus').val();
		pageinfo["fontTime"] = $('#fontTime').val();
		pageinfo["backTime"] = $('#backTime').val();
		pageinfo["likeName"] = $('#likeName').val();
		pageinfo["size"] = pgsize;
		pageinfo["page"] = page;
		var astatus = $('#circleStatus').val();
		if (astatus == 'T') {
			pageinfo["circleStatus"] = '';
			pageinfo["top"] = 1;
		} else {
			pageinfo["top"] = 0;
			pageinfo["circleStatus"] = astatus;
		}

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
								str += '<tr><td><input type="checkbox" name="circleBoc" value="'+data["circle_id"]
								+'" status="'+data["status"]+'"  result="'+data["examine_result"]+'"';
								str+='companyId="'+data["company_id"]+'"';								
								str+='/></td><td><p style="color:red;"  href="javascript:void(0)">'
										+ data["circle_id"] + '</td>';
								var name = data["name"];
								if (name.length > 8) {
									name = name.substring(0, 8) + '...';
								}
								var summary = data["summary"];
								if (summary == null) {
									summary = '';
								} else if (summary.length > 12) {
									summary = summary.substring(0, 10) + '...';
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
								if (data["company_id"] != null
										&& data["user"] != null) {
									var userName = data["user"]["name"];
									if (userName != null
											&& userName.length > 10) {
										userName = userName.substring(0, 8)
												+ '...';
									}
									str += '<td>企业：' + userName + '</td>';
								} else if (data["user_id"] != null) {
									var userName = data["user"];
									if (userName != null
											&& userName.length > 10) {
										userName = userName.substring(0, 8)
												+ '...';
									}
									str += '<td>个人：' + userName + '</td>';
								} else {
									str += '<td></td>';
								}
								str += '<td style="text-align:center;">'
										+ data["addUserCount"] + '</td>';

								str += '<td style="text-align:center;">'
										+ circleStatus[data["status"]] + ':'
										+ examineResult[data["examine_result"]]
										+ '</td>';

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
								if (data["is_extend_index"] > 0) {
									str += '<td style="text-align:center;">web首页<br /><span style="color:red;">第'
											+ data["is_extend_index"]
											+ '位<span></td>';
								} else {
									str += '<td></td>';
								}
								if (data["is_extend"] > 0) {
									str += '<td style="text-align:center;">web菁英<br /><span style="color:red;">第'
											+ data["is_extend"]
											+ '位<span></td>';
								} else {
									str += '<td></td>';
								}
								str += '</tr>';
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
							$('#circleList').html(
									'<tr><td colspan="7">' + msg.msg
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
		if (circleId != 0) {
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
					loadData(1);
				} else
					alert(msg.msg);
			}
		});
	}

	function updateCircleExamine(examine) {
		var str = '';
		var b = false;
		$('input[name="circleBoc"]:checked').each(function() {
			if ($(this).attr("checked")) {
				if ($(this).attr("status") == 3) {
					b = true;
					return;
				}
				str += $(this).val() + ',';
			}
		});
		if (b) {
			alert('升级圈子不能审核！');
			return;
		}
		if (str.length < 1) {
			alert('请选择对象！');
			return;
		}
		$.ajax({
			type : "post",
			url : '${ctx}/circle!updateCircleExamine.action',
			dataType : 'json',
			data : {
				circleId : str,
				examine : examine
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
		if (confirm('您确认删除这些圈子吗？')) {
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
						loadData(1);
					} else
						alert(msg.msg);
				}
			});
		}
	}

	function setRelationOnCircle(filName, filValue, filnum) {
		var str = '';
		var i = 0;
		$('input[name="circleBoc"]:checked').each(function() {
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
			alert('设定数量超出' + filnum + '个范围！');
			return;
		}
		if (filValue == 1) {
			if (filnum > 0) {
				filValue = prompt('请输入推荐顺序(范围：1-' + filnum + ')，最多可推荐' + filnum
						+ '个', '1');
			} else {
				filValue = prompt('请输入推荐顺序', '1');
			}
			if (filValue == '' || filValue == null) {
				return;
			} else if (isNaN(filValue)) {
				alert('请输入数字！');
				return;
			}
		}
		var setData = {};
		setData["filName"] = filName;
		setData["filValue"] = filValue;
		setData["filnum"] = filnum;
		setData["circleId"] = str;

		$.ajax({
			type : "post",
			url : '${ctx}/circle!updaCircleLstop.action',
			dataType : 'json',
			data : setData,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('修改成功！');
					loadData(1);
				} else {
					alert(msg.msg);
				}
			}
		});
	}

	var crilId = '';
	function addLevelCircle() {
		var array = [];
		var compId = '';
		$('input[name="circleBoc"]:checked').each(function() {
			if ($(this).attr("checked")) {
				array.push($(this).val());
				compId = $(this).attr('companyId');
			}
		});
		if (array.length == 0) {
			alert('请选择圈子!');
			return;
		} else if (array.length > 1) {
			alert('只能选择一个圈子!');
			return;
		}

		crilId = array[0];
		if (compId == '${user.companyId}') {
			saveDialog(1);
		} else {
			$
					.ajax({
						type : "post",
						url : '${ctx}/circle!findCircleAddLevel.action',
						dataType : 'json',
						data : {
							circleId : crilId
						},
						success : function(msg, status) {

							if (msg.status == 200) {
								var data = msg.rows;
								if (data != null && data != '') {
									var str = '<div style="width: 100%;font-size: 20px;">';
									var level = parseInt(msg.msg);
									if (msg.total == 1) {
										str += '<h4 style="text-align: center;" id="title">圈子从'
												+ circleLevel[level]
												+ '升级到'
												+ circleLevel[level + 1]
												+ '</h4>';
									} else {
										str += '<h4 style="text-align: center;" id="title">圈子已升级到'
												+ circleLevel[level] + '</h4>';
									}
									if (data["file_path"] != null
											&& data["file_path"] != '') {
										str += '<div style="text-align: center;"><img style="min-width:350px;max-width:400px;border: 1px;height: 250px;" src="${http_img}'+data["file_path"]+'"></div>';
									}
									str += '<div style="margin: 10px;font-size: 14px;">';

									str += '<p><span style="font-size: 20px;font-weight: bold;">升级原因：</span>';
									str += data["reason"]
											+ '</p></div></div><div>';
									if (msg.total == 1) {
										str += '<a class="btn btn-warning" style="margin: 5px 0px 10px 50px;"';
										str += 'onclick="saveDialog(1)">升级通过</a>';
										str += '<a class="btn btn-warning" style="margin: 5px 0px 10px 50px;"';
										str += 'onclick="saveDialog(2)">升级不通过</a>';
										str += '<a class="btn btn-warning" style="margin: 5px 0px 10px 50px;" ';
										str += 'onclick="closeDialog()">关闭</a></div>';
									} else {
										str += '<a class="btn btn-warning" style="margin: 5px 0px 10px 200px;" ';
										str += 'onclick="closeDialog()">关闭</a></div>';
									}
									$('#divWhite').html(str);
									document.getElementById('divWhite').style.display = 'block';
									document.getElementById('divBlack').style.display = 'block';
								} else {
									alert('暂无升级资料！');
								}
							} else {
								alert(msg.msg);
							}
						}
					});
		}
	}

	function closeDialog() {
		document.getElementById('divWhite').style.display = 'none';
		document.getElementById('divBlack').style.display = 'none';
	}

	function saveDialog(examine) {
		$.ajax({
			type : "post",
			url : '${ctx}/circle!AddCircleLevel.action',
			dataType : 'json',
			data : {
				circleId : crilId,
				examine : examine
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('升级成功！');
					closeDialog();
					loadData(1);
				} else {
					alert(msg.msg);
				}
			}
		});
	}
</script>


