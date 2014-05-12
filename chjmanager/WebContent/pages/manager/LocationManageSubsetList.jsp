<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>漕河泾开发区位置管理</title>
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
<link rel="stylesheet" href="${ctx}/css/pager.css" />
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
				</a> <a href="#" class="current">二级位置管理</a>
			</div>
		</div>

		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">

					<div class="widget-title">
						<span class="icon"> <i class="icon-info-sign"></i>
						</span>
						<h5>二级位置管理</h5>
					</div>
					<table class="table table-bordered table-striped">
						<div class="widget-content nopadding">
							<div style="float: right; top: background-position:">
								<div class="container-fluid">
									<thead>
										<tr>
											<th style="width: 8%"><input type="checkbox">全选</th>
											<th>名称</th>
											<th>详细地址</th>
										</tr>
									</thead>
										<input type="hidden" id="areaid" name="areaid"/>
										<input type="hidden" id="sulml" name="areaId"/>
									<input type="hidden" name="selectedCirleIds"
										id="selectedCirleIds">
									<tbody id="table_content">

									</tbody>
								</div>
							</div>
						</div>
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
							<ul id="pager">

							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 0px; margin-top: 8px; float: left;">
							<button class="btn btn-warning" onclick="addLoactionManage(parentId)">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-warning" type=""
								onclick="deleteLoactionManage()">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
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
var parentId= <%=request.getParameter("parent_id")%>
$("#sulml").val(parentId);
	var listData = [];//每一页的数据
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

		pageinfo["name"] = parentId;
		$.ajax({
					type : "post",
					url : '${ctx}/locationmanage!findLocationManageSubsetList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr>');
								array.push('<td>'+ '<input type="checkbox"  value="' + data["area_id"]+ '"/>'+ '</td>');
								array.push('<td ><a href="javascript:void(0)" onclick="updateLocatiomManage('+ data["area_id"]+ ')">'
										+ data["area_name"]
										+ '</a></td>');
								array.push('<td>' + data["detailed_address"]+ '</td>');
							}
							$('#table_content').html(array.join(''));
							if(msg.total>pageinfo["size"]){
								if(msg.total%pageinfo["size"]==0)
									pageinfo["tp"]=msg.total/pageinfo["size"];
							 else
									pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
							 $("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
							
							}else{
								$('#pager').html('');	
							}
						} else {
							alert(msg.msg);

						}
					}
				});
	}
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    loadData(pageclickednumber);
	};
	
	function deleteLoactionManage() {
		if (confirm("您确认删除此记录吗？")) {
			if ($('#table_content').find("input[type=checkbox]:checked").size() == 0) {
				alert("请选择要删除的记录");
			} else {
				var label="";
				$('#table_content').find("input[type=checkbox]:checked").each(
						function(){
							label=label+$(this).attr("value")+",";
						});
				$.ajax({
					type : "post",
					data : {
						LoctionManageIds : label
					},
					url : '${ctx}/locationmanage!delLocationmanage.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							loadData(1);
						}
					}
				});
			}
		}
	}
	function addLoactionManage(area_id) {
		 window.location="addSubsetLocationManage.jsp?area_id=" + area_id;
	}
	function updateLocatiomManage(area_id){
		$("#areaid").val(area_id);
		window.location = "${ctx}/locationmanage!LocationManageList.action?area_id=" + area_id;
	}
</script>