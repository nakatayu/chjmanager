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
<link rel="stylesheet" href="${ctx}/css/pager.css" />


</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>
<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">店铺类型维护</a>
			</div>
		</div>
		<div class="container-fluid">
	<div class="widget-box" style="margin-bottom: 0px;">
					<div  align="left" class="widget-title">
						<input style="margin: 3px 0px 2px 5px" align="right" type="text" id="txtName" placeholder="请输入店铺类型查找"  onblur="loadData(1)">
						<input style="margin: 2px 0px 2px 0px"  type="button" value="查询" class="btn btn-success" onclick="loadData(1)">
					</div>
					
					<input id="ccc" type="hidden">
										<input type="hidden" name="selectedCirleIds"
											id="selectedCirleIds">
						<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th style="width:8%">
									 <input type="checkbox" /> 全选
							</th>
								<th>店铺类型名称</th>
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
								<ul id="ul-page">

								</ul>
							</div>
							<div class="pagination alternate"
								style="margin-left: 0px; margin-top: 8px; float: left;">
								<button class="btn btn-warning" type="button"  onclick="addShopType()">新增类型</button>
								&nbsp;
								<button class="btn btn-warning" type="button"  onclick="deleteShopType()">删除类型</button>
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
	 $(function() {
	 	loadData(1);
	 });
	 function loadData(page, size) {
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
	 	
	 	$.ajax({
	 				type : "post",
	 				url : '${ctx}/company!findShopTypeList.action',
	 				dataType : 'json',
	 				data : pageinfo,
	 				success : function(msg, status) {
	 					var array = [];
	 					if (msg.status == 200) {
	 						listData = msg.rows;
	 						for ( var i = 0; i < msg.rows.length; i++) {
	 							var data = msg.rows[i];
	 							array.push('<tr>');
	 							array
								.push('<td>'
										+ '<input type="checkbox" style="margin:0 0 0 10px"  value="' + data["company_shop_category_id"]+ '"/>'
										+ '</td>');
						 array.push('<td>'+'<a href="javascript:void(0)" onclick="findShopTypeInfo('
									+ data["company_shop_category_id"]
									+ ')">' + data["name"]
									+ '</td>');
								array.push('</tr>');
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
							$('#pager').html('');
							$('#table_content').html('<tr><td colspan="4">'+msg.msg+'</td></tr>');
						}
					}
				});
	 }
	 
	 PageClick = function(pageclickednumber) {
		    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
		    loadData(pageclickednumber);
		};
	
//添加类型
	function addShopType() {
		location.href = "${ctx}/pages/manager/addshoptypeinfo.jsp";
	}
	
	
	//查询店铺信息
	function findShopTypeInfo(companyShopCategoryId){
		location.href = "${ctx}/company!findShopTypeInfo.action?companyShopCategoryId="+companyShopCategoryId;
	}
	
	//删除企业 
	function deleteShopType(){
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
						companyTypeId : label
					},
					url : '${ctx}/company!deleteCompanyType.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							window.location.reload(true);
						}else if(msg.status == 400){
							alert("删除失败！");
							window.location.reload(true);
						}
					}
				});
			}
		}		
	}					
</script>


