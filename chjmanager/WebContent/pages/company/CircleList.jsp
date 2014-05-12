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
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
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
	width: 557px;
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
	font-size: 20px;
}

/*  遮罩层 */
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 0%;
	height:0%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: absolute;
	top: 30%;
	left: 10%;
	width: 350px;
	height: 220px;
	border: 2px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

.white_content_small {
	display: none;
	position: absolute;
	top: 20%;
	left: 30%;
	width: 10%;
	height: 20%;
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
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">圈子维护</a>
			</div>
		</div>
		<div class="container-fluid">

			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>圈子列表</h5>
						</div>
						<table class="table table-bordered table-striped">
							<div class="widget-content nopadding">
								<div style="float: right; top: background-position:">
									<div class="container-fluid">
										<thead>
											<tr>
												<th>序号</th>
												<th>圈子名称</th>
											<!-- 	<th>圈子摘要</th> -->
												<th>创建时间</th>
												<th>圈子级别</th>
												<!-- <th>总人数</th>
												<th>话题数</th>
												<th>当前状态</th>
												<th>是否审核</th> -->
												<th>修改</th>
											<!-- 	<th>操作</th>
												<th>驳回</th> -->
												<th>人员管理</th>
											</tr>
										</thead>
										<input id="ccc" type="hidden">
										<input type="hidden" name="selectedCirleIds"
											id="selectedCirleIds">
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
							<div class="pagination alternate"
								style="margin-left: 0px; margin-top: 8px; float: left;">
								<button class="btn btn-warning" onclick="addcircleinfo()">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="btn btn-warning" type=""
									onclick="deleteCirList()">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
							</div>
						</div>
						
						
						<!-- 遮罩层  -->
			<div id="white" class="white_content"
				style="padding: 30px 0px 0px 50px;">
				<div
					style="text-align: right; cursor: default; height: 40px; padding: 0px 20px 0px 0px;">
					<a href="#"><span style="font-size: 16px;"
						onclick="CloseDiv('white','black')"> <font color="orange">关闭
						</font></span></a>
				</div>
				<table>
					<tr>
						<td><label class="control-label">驳回理由：</label></td>
						<td><textarea  type="hidden" id="modifyNum"  rows="4" cols="5"></textarea>
							<div class="controls">
							</div></td>
					</tr>
				</table>
				<br>
				<br>
				<table>
					<tr>
						<td>
							<button class="btn btn-warning" type="button"
								onclick="saveFrom('white','black')">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<button class="btn btn-warning" type="button"
								onclick="clearFrom()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="black" class="black_overlay"></div>

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
	var Cstatus = [ "创建待审核", "创建成功", "升级申请", "升级成功", "申请关闭", "关闭圈子" ];
	var circle = [ 1, 2, 3, 4, 5, 6 ];

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

		pageinfo["name"] = $('#txtName').val();
		$
				.ajax({
					type : "post",
					url : '${ctx}/circle!findCircleList.action',
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
												+ '<input type="checkbox" value="' + data["circle_id"]+ '"/>'
												+ '</td>');
								array.push('<td>' + data["name"] + '</td>');
							/* 	array.push('<td>' + data["summary"] + '</td>'); */

								array.push('<td>'+ data["create_time"]+ '</td>');
								array.push('<td>' + data["level"] + '</td>');

								array.push('<td>'+ '<a href="javascript:void(0)" onclick="updateCircleInfo('+ data["circle_id"] + ')">'+ "修改" + '</a>' + '</td>');
								/* 	if (data["status"] == 1) {
									array.push('<td>'+ '<a href="javascript:void(0)" onclick="closeCircle('+ data["circle_id"] + ','+ circle[data["status"]]+ ',' + data["level"]+ ')">' + "创建" + '</a>'+ '</td>');
									if(data["examine_result"]=='1'){
										array.push('<td>'+ '<a href="javascript:void(0)" onclick="updateBoHuiCircle('+ data["circle_id"] + ')">'+ "驳回" + '</a>' + '</td>');
									}else{
										array.push('<td>'+  "已驳回" + '</td>');
									}
								} else if (data["status"] == 2) {
									array.push('<td>'	+ '<a href="javascript:void(0)" onclick="closeCircle('+ data["circle_id"] + ','+ circle[data["status"]]+ ',' + data["level"]+ ')">' + "已创建／关闭" + '</a>'+ '</td>');
									if(data["examine_result"]=='1'){
										array.push('<td>'+ '<a href="javascript:void(0)" onclick="updateBoHuiCircle('+ data["circle_id"] + ')">'+ "驳回" + '</a>' + '</td>');
									}else{
										array.push('<td>'+  "已驳回" + '</td>');
									}
								} else if (data["status"] == 3) {
									array.push('<td>'+ '<a href="javascript:void(0)" onclick="closeCircle('+ data["circle_id"] + ','+ circle[data["status"]]+ ',' + data["level"]+ ')">' + "升级" + '</a>'+ '</td>');
									if(data["examine_result"]=='1'){
										array.push('<td>'+ '<a href="javascript:void(0)" onclick="updateBoHuiCircle('+ data["circle_id"] + ')">'+ "驳回" + '</a>' + '</td>');
									}else{
										array.push('<td>'+  "已驳回" + '</td>');
									}
								} else if (data["status"] == 4) {
									array.push('<td>'+ '<a href="javascript:void(0)" onclick="closeCircle('+ data["circle_id"] + ','+ circle[data["status"]]+ ',' + data["level"]+ ')">' + "已升级／关闭" + '</a>'+ '</td>');
									if(data["examine_result"]=='1'){
										array.push('<td>'+ '<a href="javascript:void(0)" onclick="updateBoHuiCircle('+ data["circle_id"] + ')">'+ "驳回" + '</a>' + '</td>');
									}else{
										array.push('<td>'+  "已驳回" + '</td>');
									}
								} else if (data["status"] == 5) {
									array.push('<td>'+ '<a href="javascript:void(0)" onclick="closeCircle('+ data["circle_id"] + ','+ circle[data["status"]]+ ',' + data["level"]+ ')">' + "关闭" + '</a>'+ '</td>');
									if(data["examine_result"]=='1'){
										array.push('<td>'+ '<a href="javascript:void(0)" onclick="updateBoHuiCircle('+ data["circle_id"] + ')">'+ "驳回" + '</a>' + '</td>');
									}else{
										array.push('<td>'+  "已驳回" + '</td>');
									}
								} else if (data["status"] == 6) {
									array.push('<td>已关闭</td>');
									array.push('<td>已关闭</td>');
								} else {
									array
											.push('<td>'
													+ '<a href="javascript:void(0)" onclick="closeCircle('+ data["circle_id"] + ','+ circle[6] + ','+ data["level"] + ')">'+ "关闭" + '</a>' + '</td>');
									if(data["examine_result"]=='1'){
										array.push('<td>'+ '<a href="javascript:void(0)" onclick="updateBoHuiCircle('+ data["circle_id"] + ')">'+ "驳回" + '</a>' + '</td>');
									}else{
										array.push('<td>'+  "已驳回" + '</td>');
									}
								}
 */
	                            array.push('<td>'+ '<a href="javascript:void(0)" onclick="updateCircleUserInfo('+ data["circle_id"] + ')">'+ "编辑人员信息" + '</a>' + '</td>');
								array.push('</tr>');
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

	//删除选中店铺  			
	function deleteCirList() {

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
						selectedCirleIds : label
					},
					url : '${ctx}/circle!deleteCirList.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							window.location = "CircleList.jsp";
						}
					}
				})
			}
		}
	}

	function addcircleinfo() {
		location.href = "${ctx}/pages/company/CircleInfo.jsp";
	}
	//操作圈子
	function closeCircle(circle_id, opStatus, level) {
		$.ajax({
			type : "post",
			url : '${ctx}/circle!closeCircle.action',
			dataType : 'json',
			data : {
				circleId : circle_id,
				opStatus : opStatus,
				level : level,
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					window.location.reload(true);

				}
			}
		})
	}
	//修改圈子
	function updateCircleInfo(circle_id) {
		window.location = "${ctx}/circle!updateCle.action?circle_id=" + circle_id;

	}
	//驳回操作
	function updateBoHuiCircle(circle_id){
		clearFrom();
		document.getElementById('white').style.display = 'block';
		document.getElementById('black').style.display = 'block';
		$('#ccc').val(circle_id);
		}
	//关闭遮罩层
	function CloseDiv(show_div, bg_div) {
		document.getElementById(show_div).style.display = 'none';
		document.getElementById(bg_div).style.display = 'none';
	};
	//遮罩层内容  取消
	function clearFrom() {
		$('#modifyNum').val("");
	}

	//自定义遮罩层
	function definitionAttribute(attr) {
		document.getElementById('white').style.display = 'block';
		document.getElementById('black').style.display = 'block';
		$("#attributeName").val($(attr).parents("tr").find("font").html());
		$("#attributeTrait").val(
				$(attr).parents("tr").find("<option  selected ></option>")
						.val());
		$("#modifyNum").val($(attr).attr("num"));
	}

	//删除属性
	function delAttribute(attr) {
		$("#attributeName").val($(attr).parents("tr").remove());
	}
	//自定义放值
	function definitionSaveFrom() {
		var name = document.getElementById("definitionAttributeName").value;
		var trait = document.getElementById("definitionAttributeTrait").value;

		document.getElementById("definitionAddAttributeName").innerHTML = "<span><font size='4px'>"
				+ name + ":" + "</font></span>";

		$("#definitionAddAttributeValue")
				.append(
						"<input type='text' class='span11' style='width: 262px;'   id='addinput'  value='" + trait +"''/>");
		$("#definitionAddButton")
				.append(
						"<button class='btn btn-info btn-mini' type='button' >&nbsp;删&nbsp;&nbsp;除&nbsp;</button>");
		}
	
	function saveFrom(show_div, bg_div){
		   $.ajax({
				type : "post",
				url : '${ctx}/circle!updateBoHuiCircle.action',
				dataType : 'json',
				data : {
					circleId :  $('#ccc').val() ,
					AdminMessage : $('#modifyNum').val() ,
				},
				success : function(msg, status) {
					if (msg.status == 200) {

						 CloseDiv(show_div, bg_div);
						window.location.reload(true);
					}
				}
			});  
			}
	function updateCircleUserInfo(circle_id){
		
		window.location="updateCircleUserInfo.jsp?circleId="+circle_id;
		
	}
</script>
</body>
</html>

