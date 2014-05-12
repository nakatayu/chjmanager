<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>商品维护</title>
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
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	
<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">商品列表</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
						<div class="widget-box" style="margin-bottom: 0px;">
						<div  align="left" class="widget-title">
						<input style="margin: 3px 0px 2px 5px" align="right" type="text" id="txtName" placeholder="请输入商品名称"  onblur="loadData(1)">
						<input style="margin: 2px 0px 2px 0px"  type="button" value="查询" class="btn btn-success" onclick="loadData(1)">
					</div>
						<table class="table table-bordered table-striped">
							<div class="widget-content nopadding">
								<div class="container-fluid">
									<thead>
									<tr>
										<th style="width:4%">
										  <input type="checkbox" />
										</th>
									    <th  style="width:8%">商品名称</th>
										<th  style="width:8%">商品产地</th>
										<th  style="width:8%">商品厂商</th>
										<th  style="width:30%">商品描述</th>
										<th  style="width:8%">评论管理</th>
									</tr>
								</thead>
									<input type="hidden" name="selectedProductId"  id="selectedProductId">
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
										<li><a href="javascript:void(0)"
											onclick="loadData(1,100)">100</a></li>
									</ul>
								</div>
								<div class="pagination alternate"
									style="margin-left: 30px; margin-top: 8px; float: right;">
									<ul id="pager">

									</ul>
								</div>
								 <div class="pagination alternate"
									style="margin-left: 0px; margin-top: 8px; float: left;">
									<button class="btn btn-warning" onclick="addProductInfo()">新增商品</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-warning" type="" onclick="deleteshop()">删除商品</button>
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

	$.ajax({
		type : "post",
		url : '${ctx}/product!findProductList.action',
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
									+ '<input type="checkbox" style="margin:0px 5px 0px 7px;padding:0px" value="' + msg.rows[i]["product_id"]+ '"/>'
									+ '</td>');
					array.push('<td>' 
							+ '<a href="javascript:void(0)" onclick="updateShopInfo('
							+ msg.rows[i]["product_id"]
							+ ')">'+ data["name"]
							+ '</td>');
					array.push('<td>' 
							+ '<a href="javascript:void(0)" onclick="updateShopInfo('
							+ msg.rows[i]["product_id"]
							+ ')">' 
							+ data["place"] + '</td>');
					array.push('<td>' 
							+ '<a href="javascript:void(0)" onclick="updateShopInfo('
							+ msg.rows[i]["product_id"]
							+ ')">'+ data["factory"] + '</td>');
					array.push('<td>'
							+ '<a href="javascript:void(0)" onclick="updateShopInfo('
							+ msg.rows[i]["product_id"]
							+ ')">'+ data["content"]
							+ '</td>'); 
					/* array.push('<td>'
									+ '<a href="javascript:void(0)" onclick="updateShopInfo('
									+ msg.rows[i]["product_id"]
									+ ')">' + "修改" + '</a>'
									+ '</td>'); */
					
					if(data["comCount"]>0){
						array.push('<td align="center"><a href="javascript:void(0)" onclick="queryCommOfProduct('+data["product_id"]+')">查看评论</a></td>');
					}else{
						array.push('<td align="center"></td>');
					}											
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
				$('#table_content').html('<tr><td colspan="5">'+msg.msg+'</td></tr>');
			}
		}
	});
}
PageClick = function(pageclickednumber) {
	$("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	loadData(pageclickednumber);
}

function queryCommOfProduct(productId){
	window.location.href="${ctx}/pages/manager/ProductComment.jsp?productId="+productId;		
}


 	//删除选中商品			
	function deleteshop() {
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
						selectedProductId : label
					},
					url : '${ctx}/product!deleteProductInfo.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！"); 
							window.location = "ProductList.jsp";
						}
					}
				});
			}
		}
	} 
/**
 * 获取某一个商品的详情，以备修改使用
 */
  function updateShopInfo(productId) {
	  
	  window.location = "${ctx}/product!updateProductInfo.action?productId="+productId;
  }   
  /**
   * 新增加一个商品
   */
	function addProductInfo() {
		 location.href = "${ctx}/pages/starbucks/ProductMaintainAdd.jsp";  
	}
  
</script>
