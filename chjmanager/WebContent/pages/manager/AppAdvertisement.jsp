
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>app广告图片设置</title>
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
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
					<i class="icon-home"></i> 主页
				</a> <a href="#" class="current">广告设置</a>
			</div>
		</div>
		<div class="widget-title"
			style="padding: 20px 0 30px 50px; width: 100%; float: left;">
			<h3>App手机端信息推荐设置：</h3>
		</div>

		<div
			style="width: 100%; background-color: #FFF; float: left; margin: 30px 0 50px 0;">
			<div
				style="width: 35%; float: left; padding: 0 0 0 50px; background-color: #FFF;">
				<div class="control-group">
					<label class="control-label">首页显示列表设置：</label>
					<div class="controls">
						<select style="width: 268px;" id="firstList" name="firstList">
							<option value="11" <c:if test="${extendInfo.firstType==11}">selected</c:if>>菁汇漕河泾</option>
							<option value="12" <c:if test="${extendInfo.firstType==12}">selected</c:if>>瞩目漕河泾</option>
							<option value="13" <c:if test="${extendInfo.firstType==13}">selected</c:if>>菁彩漕河泾</option>
							<option value="14" <c:if test="${extendInfo.firstType==14}">selected</c:if>>菁典漕河泾</option>
							<option value="21" <c:if test="${extendInfo.firstType==21}">selected</c:if>>推荐商品</option>
							<option value="22" <c:if test="${extendInfo.firstType==22}">selected</c:if>>推荐店铺</option>
							<option value="31" <c:if test="${extendInfo.firstType==31}">selected</c:if>>服务优惠送</option>
							<option value="32" <c:if test="${extendInfo.firstType==32}">selected</c:if>>生活小贴士</option>
							<option value="33" <c:if test="${extendInfo.firstType==33}">selected</c:if>>政策早解读</option>
							<option value="34" <c:if test="${extendInfo.firstType==34}">selected</c:if>>公益你我他</option>
							<option value="35" <c:if test="${extendInfo.firstType==35}">selected</c:if>>招商直通车</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">菁英漕河泾列表设置：</label>
					<div class="controls">
						<select style="width: 268px;" id="shareList" name="shareList">
							<option value="11" <c:if test="${extendInfo.relationType==11}">selected</c:if>>菁汇漕河泾</option>
							<option value="12" <c:if test="${extendInfo.relationType==12}">selected</c:if>>瞩目漕河泾</option>
							<option value="13" <c:if test="${extendInfo.relationType==13}">selected</c:if>>菁彩漕河泾</option>
							<option value="14" <c:if test="${extendInfo.relationType==14}">selected</c:if>>菁典漕河泾</option>
						</select>
					</div>
				</div>
			</div>
			<div style="width: 30%; float: left; background-color: #FFF;">
				<div class="control-group">
					<label class="control-label">便捷漕河泾列表设置：</label>
					<div class="controls">
						<select style="width: 268px;" id="productList" name="productList">
							<option value="21" <c:if test="${extendInfo.productType==21}">selected</c:if>>推荐商品</option>
							<option value="22" <c:if test="${extendInfo.productType==22}">selected</c:if>>推荐店铺</option>
						</select>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">共享漕河泾列表设置：</label>
					<div class="controls">
						<select style="width: 268px;" id="relationList"
							name="relationList">
							<option value="31" <c:if test="${extendInfo.serviceType==31}">selected</c:if>>服务优惠送</option>
							<option value="32" <c:if test="${extendInfo.serviceType==32}">selected</c:if>>生活小贴士</option>
							<option value="33" <c:if test="${extendInfo.serviceType==33}">selected</c:if>>政策早解读</option>
							<option value="34" <c:if test="${extendInfo.serviceType==34}">selected</c:if>>公益你我他</option>
							<option value="35" <c:if test="${extendInfo.serviceType==35}">selected</c:if>>招商直通车</option>
						</select>
					</div>
				</div>
			</div>
			<div style="width: 20%; float: left; background-color: #FFF;text-align: center;padding-top: 30px;">
				<button class="btn btn-warning" onclick="saveAdvertiSementIn()">确认修改</button>
			</div>
		</div>


		<div class="widget-title"
			style="padding: 20px 0 30px 50px; width: 100%; float: left;">
			<h3>App广告设置:</h3>
		</div>
		<input type="hidden" id="selectedShopId" name="selectedShopId" />
		<div class="row-fluid"
			style="padding-left: 20px; background-color: #FFF; padding-bottom: 10px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">
					<table class="table table-bordered table-striped with-check"
						style="margin: 0px; float: right; border: 1px solid #ccc;">
						<thead>
							<tr>
								<th style="width:40px;">全选<br /> 
								<input type="checkbox" />
								</th>
								<th>标题</th>
								<th>类别</th>
								<th width="500px">链接地址</th>
							</tr>
						</thead>
						<tbody id="table_content">
						</tbody>
					</table>

					<div class="widget-title"
						style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
						<div class="pagination alternate"
							style="margin-left: 0px; margin-top: 8px; float: left;">
							<button class="btn btn-warning" onclick="addPicture()">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-warning" onclick="deletePicture(this)">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
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
	//加载已经选择推广类型	

	$(function() {
		
		$.ajax({
			type : "post",
			url : '${ctx}/advertisement!findAdvertiSementList.action',
			dataType : 'json',
			success : function(msg, status) {
				var array = [];
				if (msg.status == 200) {
					for ( var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];
						array.push('<tr>');
						array
								.push('<td>'
										+ '<input type="checkbox" value="' +  data["advertisement_id"] + '"/>'
										+ '</td>');
						array
								.push('<td>'
										+ '<a href="javascript:void(0)" onclick="updatePicture('
										+ data["advertisement_id"]
										+ ')">' + data["picture_title"]
										+ '</td>');
						if (data["style"] == 1) {
							array.push('<td>app首页广告图片</td>');
						} else if (data["style"] == 2) {
							array.push('<td>便捷漕河泾广告图片</td>');
						} else if (data["style"] == 3) {
							array.push('<td>共享漕河泾广告图片</td>');
						} else if (data["style"] == 4) {
							array.push('<td>菁英漕河泾广告图片</td>');
						}else{
							array.push('<td></td>');
						}
						array.push('<td>' +  '<a href="javascript:void(0)" onclick="updatePicture('
								+ data["advertisement_id"]+ ')">'+data["link_address"]+'</a>'
								+ '</td>');
						array.push('</tr>');
					}
					$('#table_content').html(array.join(''));
				}
			}
		});
	});
	
	function checkVale(){
		$.ajax({
			type : "post",
			url : '${ctx}/advertisement!tbFirstExtend.action',
			dataType : 'json',
			success : function(msg, status) {
			    
				$("#firstList").attr("value", msg.rows["firstType"]);
				$("#shareList").val(msg.rows["relationType"]);
				$("#productList").val(msg.rows["productType"]);
				$("#relationList").val(msg.rows["serviceType"]);
			}
		});
	}
	
	
	/**
	 *更新app广告列表的数值
	 */
	function saveAdvertiSementIn() {
		var data = {};
		data["firstType"] = $("#firstList").val();
		data["relationType"] = $("#shareList").val();
		data["productType"] = $("#productList").val();
		data["serviceType"] = $("#relationList").val();
		
		$.ajax({
			type : "post",
			url : '${ctx}/advertisement!updateAppToFirstExtendInfo.action',
			dataType : 'json',
			data : data,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("更新成功!");
					checkVale();
				}else{
					alert(msg.msg);
				}
			}
		});

	}

	//新增app的广告页 
	function addPicture() {
		location.href = "${ctx}/pages/manager/AppAdvertisementAdd.jsp";
	}

	//删除广告
	function deletePicture() {
		if (confirm("您确认删除此记录吗？")) {
			if ($("#table_content").parent().find(
					"input[type=checkbox]:checked").size() == 0) {
				alert("请选择需要删除的记录！");
				return;
			} else {
				var label = "";
				$("#table_content").parent().find(
						"input[type=checkbox]:checked").each(function() {
					label = label + $(this).attr("value") + ",";
				});
				$.ajax({
					type : "post",
					url : '${ctx}/advertisement!deleteAdvertiSementInfo.action',
					dataType : 'json',
					data : {
						selectedShopId : label
					},
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							document.location.reload();//加载当前页面 
						}
					}
				});
			}
		}
	}

	//更新app的广告页 
	function updatePicture(advertisementId) {
		location.href = "${ctx}/advertisement!findAdvertiSementInfo.action?advertisementId="
				+ advertisementId;

	}
</script>
