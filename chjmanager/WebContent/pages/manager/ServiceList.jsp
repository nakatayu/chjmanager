<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>共享漕河泾维护</title>
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
.serviceCheckPassCss {
	color: #009933;
}

.serviceCheckCss {
	color: #FF0000;
}
/*遮罩层 */
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
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: fixed;
	top: 20%;
	left: 35%;
	width: 280px;
	height: 250px;
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
				</a> <a href="#" class="current">共享漕河泾列表</a>
			</div>
		</div>

		<div style="padding: 10px 0 0 20px;">
			<table style="width: 100%; font-size: 14px; font-weight: bold;">
				<tr>
					<td><span>状态：</span> <select style="width: 120px;"
						id="serviceStatusId" name="serviceStatusName">
							<option value="">全部</option>
							<option value="3">未审核</option>
							<option value="1">审核通过</option>
							<option value="2">审核不通过</option>
							<option value="4">关闭</option>
							<option value="T">手机(web)推荐</option>
					</select></td>
					<td><span>目标栏目：</span> <select style="width: 150px;"
						id="serviceTypeId" name="serviceTypeList">
							<option value="">全部</option>
							<option value="1">服务优惠送</option>
							<option value="2">生活小贴士</option>
							<option value="3">政策早解读</option>
							<option value="4">公益你我他</option>
							<option value="5">招商直通车</option>
					</select></td>
					<td><span>关键词：</span> <input
						style="margin: 1px 0px 2px 3px; width: 120px;" align="right"
						type="text" id="serviceKeyWordId" name="serviceKeyWord"
						placeholder="请输入信息标题" onblur="loadData(1)"> <span>企业名称：</span>
						<input style="margin: 1px 0px 2px 3px; width: 120px;"
						align="right" type="text" id="nameId" name="name"
						placeholder="请输入企业名称" onblur="loadData(1)"> <input
						style="margin: 2px 0px 2px 3px" type="button" value="查询"
						class="btn btn-success" onclick="loadData(1)"></td>
				</tr>
			</table>
		</div>

		<input type="hidden" name="serivceId" id="serivceId">

		<div class="row-fluid"
			style="padding-left: 20px; background-color: #FFF; padding-bottom: 10px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">

					<table class="table table-bordered table-striped with-check"
						style="margin: 0px; float: right; border: 1px solid #ccc;">

						<thead>
							<tr>
								<th style="width: 20px"><input type="checkbox"></th>
								<th width="200px">企业名称</th>
								<th>信息标题</th>
								<th width="80px">目标栏目</th>
								<th width="135px">发布时间</th>
								<th width="135px">状态</th>
								<th width="50px">手机首页推荐</th>
								<th width="50px">手机共享推荐</th>
								<th width="50px">web<br />推荐
								</th>
							</tr>
						</thead>
						<tbody id="table_content">
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
							<ul id="pager">
							</ul>
						</div>
					</div>
					<div class="widget-title"
						style="border: 1px solid #ccc; float: right; width: 100%; height: auto;">

						<div class="btn-group" style="float: left;">
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="addserviceinfo()">新增信息</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="deleteServicelist()">删除信息</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="serviceInfoStatus(1)">审核通过</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="serviceInfoStatus(2)">审核不通过</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="serviceInfoCloseOrOpen(1,3)">开启信息</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="serviceInfoCloseOrOpen(3,1)">关闭信息</button><br />
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnService(1,1,0)">手机首页推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnService(1,0,0)">取消手机首页</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnService(2,1,0)">手机共享推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnService(2,0,0)">取消手机共享</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnService(0,1,2)">web共享推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="setRelationOnService(0,0,0)">取消web共享</button>
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
	<script src="${ctx}/js/jquery.pager.js"></script>

</body>
</html>
<script type="text/javascript">
	var listData = [];//每一页的数据

	var serviceStatus = [ "", "创建待审核", "修改申请", "关闭申请", "开启申请" ]; //服务信息状态
	var examineResult = [ "", "审核通过", "审核不通过", "未审核", "关闭" ];
	$(function() {
		loadData(1);
	});

	function loadData(page, size, name) {
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

		var serStatus = $('#serviceStatusId').val();

		if (serStatus == 'T') {
			pageinfo["top"] = 1;
			pageinfo["serviceStatus"] = '';
		} else {
			pageinfo["top"] = 0;
			pageinfo["serviceStatus"] = serStatus; //状态
		}
		pageinfo["serviceTypeList"] = $('#serviceTypeId').val();//栏目
		pageinfo["serviceKeyWord"] = $('#serviceKeyWordId').val();//标题
		pageinfo["name"] = $('#nameId').val();//企业名称

		$
				.ajax({
					type : "post",
					url : '${ctx}/servicelist!findServiceList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr>');

								array
										.push('<td>'
												+ '<input type="checkbox" name="serviceBoc" value="'
												+ data["service_id"]+ '" serviceType="'+data["service_type"]+'"/>'
												+ '</td>');
								array
										.push('<td>'
												+ '<a href="javascript:void(0)" onclick="updateServiceinfo('
												+ data["service_id"] + ')">'
												+ data["name"] + '</td>');

								array
										.push('<td>'
												+ '<a href="javascript:void(0)" onclick="updateServiceinfo('
												+ data["service_id"] + ')">'
												+ data["title"] + '</td>');

								if (data["service_type"] == 1) {
									array.push('<td>服务优惠送</td>');
								} else if (data["service_type"] == 2) {
									array.push('<td>生活小贴士</td>');
								} else if (data["service_type"] == 3) {
									array.push('<td>政策早解读</td>');
								} else if (data["service_type"] == 4) {
									array.push('<td>公益你我他</td>');
								} else if (data["service_type"] == 5) {
									array.push('<td>招商直通车</td>');
								} else {
									array.push('<td>服务优惠送</td>');
								}

								array.push('<td>' + data["release_time"]
										+ '</td>');
								array.push('<td>'
										+ serviceStatus[data["status"]] + ":"
										+ examineResult[data["examineResult"]]
										+ '</td>');
								if (data["first_phone_extend"] > 0) {
									array
											.push('<td style="text-align:center;">手机首页<br /><span style="color:red;">第'
													+ data["first_phone_extend"]
													+ '位<span></td>');
								} else {
									array.push('<td></td>');
								}
								if (data["relation_phone_extend"] > 0) {
									array
											.push('<td style="text-align:center;">手机共享<br /><span style="color:red;">第'
													+ data["relation_phone_extend"]
													+ '位<span></td>');
								} else {
									array.push('<td></td>');
								}
								if (data["tui_order"] > 0) {
									array
											.push('<td style="text-align:center;">web推荐<br /><span style="color:red;">第'
													+ data["tui_order"]
													+ '位<span></td>');
								} else {
									array.push('<td></td>');
								}
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
	/*
	 *修改页面 
	 */
	function updateServiceinfo(serviceId) {
		window.location = "${ctx}/servicelist!findServiceInfo.action?serviceId="
				+ serviceId;
	}

	//删除选中共享漕河泾  			
	function deleteServicelist() {
		if (confirm("您确认删除此记录吗？")) {
			if ($("#table_content").find("input[type=checkbox]:checked").size() == 0) {
				alert("请选择需要删除的记录！");
			} else {
				var label = "";
				$("#table_content").find("input[type=checkbox]:checked").each(
						function() {
							label = label + $(this).attr("value") + ",";
						});
				$.ajax({
					type : "post",
					data : {
						serivceId : label
					},
					url : '${ctx}/servicelist!deleteSerList.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							loadData(1);
						} else {
							alert("删除失败!");
						}
					}
				});
			}
		}
	}
	//点击新增 
	function addserviceinfo() {
		location.href = "${ctx}/pages/company/ServiceInfoAdd.jsp";
	}

	//审核通过  //1审核通过2审核不通过3未审核 4关闭
	function serviceInfoStatus(examineResult) {
		if (examineResult == 1) {
			var checkedCount = $("input[type=checkbox]:checked").size();
			if (checkedCount > 1) {
				alert("每次只能选择一条数据！");
			} else if (checkedCount == 0) {
				alert("请选择数据！");
			} else {
				var label = $("#table_content").find(
						"input[type=checkbox]:checked").val();
				$.ajax({
					type : "post",
					data : "serviceId=" + label + "&examineResult="
							+ examineResult,
					url : '${ctx}/servicelist!updateServiceStatus.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("审核成功！");
							loadData(1);
						} else {
							alert(msg.msg);
						}
					}
				});
			}
		} else if (examineResult == 2) {
			var checkedCount = $("input[type=checkbox]:checked").size();
			if (checkedCount > 1) {
				alert("每次只能选择一条数据！");
			} else if (checkedCount == 0) {
				alert("请选择数据！");
			} else {
				var label = $("#table_content").find(
						"input[type=checkbox]:checked").val();
				$.ajax({
					type : "post",
					data : "serviceId=" + label + "&examineResult="
							+ examineResult,
					url : '${ctx}/servicelist!updateServiceStatus.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("审核成功!");
							loadData(1);
						} else {
							alert(msg.msg);
						}
					}
				});
			}
		}
	}

	//关闭信息  //1审核通过2审核不通过3未审核 4关闭
	function serviceInfoCloseOrOpen(status, examineResult) {
		var checkedCount = $("input[type=checkbox]:checked").size();
		if (checkedCount > 1) {
			alert("每次只能选择一条数据！");
		} else if (checkedCount == 0) {
			alert("请选择数据！");
		} else {
			var label = $("#table_content")
					.find("input[type=checkbox]:checked").val();
			$.ajax({
				type : "post",
				data : {
					serviceId : label,
					status : status,
					examineResult : examineResult
				},
				url : '${ctx}/servicelist!serviceInfoCloseOrOpen.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("审核成功!");
						loadData(1);
					} else {
						alert("审核失败!");
					}
				}
			});
		}
	}

	function setRelationOnService(filName, filValue, filnum) {
		str = '';
		var i = 0;
		var type = 0;
		var b=true;
		$('input[name="serviceBoc"]:checked').each(function() {
			if ($(this).attr("checked")) {				
				if(filName==0){
					if (type == 0) {
						type = $(this).attr('serviceType');
					} else {
						if (type != $(this).attr('serviceType')) {
							b=false;
							return;
						}
					}	
				}
				str += $(this).val() + ',';	
				i++;
			}
		});
		if(!b){
			alert('推荐的栏目不一样，请选择同一栏目推荐！');
			return;
		}		
		if (i == 0) {
			alert('请选择对象！');
			return;
		}
		if (filnum != 0 && i > filnum) {
			alert('设定数量超出' + filnum + '个范围！');
			return;
		}
		
		if(filValue==1){
			if (filnum > 0) {
				filValue = prompt('请输入推荐顺序(范围：1-' + filnum + ')，最多可推荐' + filnum
						+ '个', '1');			
			}else{
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
		setData["serviceIds"] = str;
		setData["filName"] = filName;
		setData["filnum"] = filnum;
		setData["filValue"] = filValue;
		if (type != 0) {
			setData["type"] = type;
		}
		$.ajax({
			type : "post",
			url : '${ctx}/servicelist!updServiceRelation.action',
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
</script>

