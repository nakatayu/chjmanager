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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index.html" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="#">参加活动人员信息</a>
			</div>
		</div>
		<div class="container-fluid">

			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>参加活动人员列表</h5>
						</div>
						<table class="table table-bordered table-striped">
							<div class="widget-content nopadding">
								<div style="float: right; top: background-position:">
									<!-- <table class="table table-bordered table-striped">
						<div class="widget-content nopadding"> -->
									<div class="container-fluid">
										<thead>
											<tr>
												<th>序号</th>
												<th>用户名称</th>
												<th>手机</th>
												<th>报名时间</th>
												<th>当前状态</th>
											</tr>
										</thead>
										<input type="hidden" name="selectedShopIds"
											id="selectedShopIds">
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
								<ul id="ul-page">

								</ul>
							</div>
							<!-- 	<div class="pagination alternate"
								style="margin-left: 0px; margin-top: 8px; float: left;">
								<button class="btn btn-warning" onclick="addactivityinfo()">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="btn btn-warning" type=""
									onclick="deleteActList()">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
							</div> -->
						</div>

					</div>
				</div>
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
	var listData = [];//每一页的数据
	var actStatus = [ "创建待审核", "审核通过", "修改申请", "修改审核通过", "申请关闭", "关闭活动" ];//活动状态

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
		var activity_id = <%=request.getParameter("activity_id")%>;
		pageinfo["name"] = $('#txtName').val();
		pageinfo["ActivityId"]=activity_id;
		$.ajax({
			type : "post",
			url : '${ctx}/activity!findActivityUserList.action',
			dataType : 'json',
			data : pageinfo,
			success : function(msg, status) {
				var array = [];
				if (msg.status == 200) {
					for ( var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];
						array.push('<tr>');
						array.push('<td>'+ '<input type="checkbox" value="' + data["activity_id"]+ '"/>'+ '</td>');
						array.push('<td>' + data["realname"]+ '</td>');
						array.push('<td>' + data["phone"] + '</td>');
						array.push('<td>' + data["create_time"] + '</td>');
						if(data["status"]=='T'){
							array.push('<td>' + '允许参加' + '</td>');
						}else if(data["status"]=='F'){
							array.push('<td>' + '不允许参加' + '</td>');
						}else{
							array.push('<td>' +data["status"] + '</td>');
						}
                       }
					$('#table_content').html(array.join(''));
					array = null;

					var arrayPage = [];
					pageinfo["t"] = msg.total;
					if (msg.total % pageinfo["size"] == 0) {
						pageinfo["tp"] = msg.total / pageinfo["size"];
					} else {
						//向上取值
						pageinfo["tp"] = Math.ceil(msg.total
								/ pageinfo["size"]);
					}

					//如果最大页或当前页是1 上一页变灰不能点
					if (pageinfo["tp"] == 1 || pageinfo["page"] == 1
							|| pageinfo["tp"] == 0) {
						arrayPage
								.push('<li class="disabled"><a href="javascript:void(0)">上页</a></li>');
					} else {
						//变手型 （href="javascript:void(0)"）
						arrayPage
								.push('<li><a href="javascript:void(0)" onclick="loadData(-1)">上页</a></li>');
					}

					for ( var i = 1; i <= pageinfo["tp"]; i++) {
						if (i == pageinfo["page"]) {
							arrayPage
									.push('<li class="active"> <a href="javascript:void(0)" onclick="loadData('
											+ i
											+ ')">'
											+ i
											+ '</a></li>');
						} else {
							arrayPage
									.push('<li> <a href="javascript:void(0)" onclick="loadData('
											+ i
											+ ')">'
											+ i
											+ '</a> </li>');
						}

					}
					if (pageinfo["tp"] == pageinfo["page"]
							|| pageinfo["tp"] == 0) {
						arrayPage
								.push('<li class="disabled"><a href="javascript:void(0)">下页</a></li>');
					} else {
						arrayPage
								.push('<li><a href="javascript:void(0)" onclick="loadData(-2)">下页</a></li>');
					}

					$('#ul-page').html(arrayPage.join(''));
					arrayPage = null;

				} else {
					alert(msg.msg);

				}
			}
		});
	}
</script> 




