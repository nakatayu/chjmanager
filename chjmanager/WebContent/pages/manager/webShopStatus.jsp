<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: fixed;
	top: 30%;
	left: 30%;
	width: 400px;
	height: 200px;
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
				</a> <a href="#" class="current">店铺状态提示语</a>
			</div>
		</div>
		<div class="row-fluid"
			style="background-color: #FFF; padding-left: 20px; padding-bottom: 10px; height: 600px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">
					<table class="table table-bordered"
						style="margin-bottom: 0px; float: right; border: 1px solid #ccc;">
						<thead>
							<tr>
								<th width="35%">提示信息</th>
								<th width="50%">提示信息解释</th>
								<th width="15%">修改提示信息</th>
							</tr>
						</thead>
						<tbody id="table_content">
						</tbody>
					</table>
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
	<!-- 遮罩层  -->
	<div id="dialog_div" class="white_content"
		style="padding: 30px 0px 0px 50px;">

		<div style="width: 100%; font-size: 20px;">
			<p>请输入修改信息：</p>
			<label><textarea id="codeValue"
					style="width: 340px; height: 80px; overflow-x: hidden;">
		</textarea></label>
		</div>
		<div>
			<a class="btn btn-warning" style="margin: 5px 50px 20px 50px;"
				onclick="saveDialog()">保&nbsp;&nbsp;&nbsp;&nbsp;存</a> <a
				class="btn btn-warning" style="margin: 5px 50px 20px 50px;"
				onclick="closeDialog()">关&nbsp;&nbsp;&nbsp;&nbsp;闭</a>

		</div>
	</div>
	<div id="dialog_black" class="black_overlay"></div>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$
				.ajax({
					type : "post",
					url : '${ctx}/shop!shopWebStatus.action',
					dataType : 'json',
					data : {},
					success : function(msg, status) {
						var str = '';
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								str += '<tr><td id="'+msg.rows[i]["code"]+'">';
								str += msg.rows[i]["value"] + '</td><td></td>';
								str += '<td style="text-align:center;">';
								str += '<a href="javascript:void(0)" onclick="updShopStatusInfo(\'';
								str += msg.rows[i]["code"]
										+ '\')">修改</a></td></tr>';
							}
						} else {
							str = '<tr><td colspan="3">' + msg.msg
									+ '</td></tr>';
						}
						$('#table_content').html(str);
					}
				});
	});
	var code = '';
	//打开遮罩层
	function updShopStatusInfo(icode) {
		code = icode;
		$('#codeValue').val($('#' + code).html());
		document.getElementById('dialog_div').style.display = 'block';
		document.getElementById('dialog_black').style.display = 'block';
	}
	//关闭遮罩层
	function closeDialog() {
		document.getElementById('dialog_black').style.display = 'none';
		document.getElementById('dialog_div').style.display = 'none';
	}
	function saveDialog() {
		$.ajax({
			type : "post",
			url : '${ctx}/shop!shopUpdWebStatus.action',
			dataType : 'json',
			data : {
				code : code,
				codeValue : $.trim($('#codeValue').val())
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('修改成功！');
					$('#' + code).html($.trim($('#codeValue').val()));
					closeDialog();
				} else {
					alert(msg.msg);
				}
			}
		});
	}
</script>
