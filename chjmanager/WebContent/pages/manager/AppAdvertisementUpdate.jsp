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
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a
					href="${ctx}/pages/manager/AppAdvertisement.jsp" title="广告设置"
					class="tip-bottom"><i class="icon icon-bookmark"></i> 广告设置</a> <a
					href="#" class="tip-bottom">app广告图片操作</a>
			</div>
		</div>
		<div class="widget-box">
			<h3>app广告图片操作</h3>
		</div>

		<input type="hidden" name="style" id="style">
		<div style="margin-right: 40px; border: none;">
			<div class="form-horizontal" style="width: 60%; float: left;">
				<div class="control-group">
					<label class="control-label">选择广告图片所属类别：</label>
					<div class="controls" style="width: 464px;">
						<select style="width: 464px;" id="firstExtend" name="firstList">
							<c:if test="${advertisementInfo.style==1}">
								<option value="1" selected="selected">app首页广告图片</option>
							</c:if>
							<c:if test="${advertisementInfo.style!=1}">
								<option value="1">app首页广告图片</option>
							</c:if>
							<c:if test="${advertisementInfo.style==2}">
								<option value="2" selected="selected">app便捷漕河泾广告图片</option>
							</c:if>
							<c:if test="${advertisementInfo.style!=2}">
								<option value="2">app便捷漕河泾广告图片</option>
							</c:if>
							<c:if test="${advertisementInfo.style==3}">
								<option value="3" selected="selected">app共享漕河泾广告图片</option>
							</c:if>
							<c:if test="${advertisementInfo.style!=3}">
								<option value="3">app共享漕河泾广告图片</option>
							</c:if>
							<c:if test="${advertisementInfo.style==4}">
								<option value="4" selected="selected">app菁英漕河泾广告图片</option>
							</c:if>
							<c:if test="${advertisementInfo.style!=4}">
								<option value="4">app菁英漕河泾广告图片</option>
							</c:if>

						</select>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">广告标题：</label>
					<div class="controls">
						<input id="pictureTitle" name="pictureTitle" type="text"
							value="${advertisementInfo.picture_title}"
							onblur="pictureTitleOnBlur()" style="width: 454px;" />
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">链接地址：</label>
					<div class="controls">
						<textarea id="linkAddress" name="linkAddress" class="span11"
							style="width: 454px; height: 150px;">${advertisementInfo.link_address}</textarea>
						<span><font color="red" id="linkAddress_check"></font></span>
					</div>
				</div>


				<div class="control-group">
					<button class="btn btn-warning" style="margin: 40px 0 30px 150px;"
						class="btn btn-success" onclick="saveAdvertiSementInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
				</div>
			</div>
			<div style="width: 30%; margin: 10px 0 0 0; float: left;">
				<div style="text-align: center; padding: 0 0 0 60px;">
					<img style="width: 320px; height: 160px;" id="imgCompany"
						src="${http_img}${advertisementInfo.picture_address}" /> <input
						type="hidden" id="pictureAddress" name="pictureAddress"
						value="${advertisementInfo.picture_address}">
				</div>
				<div style="padding: 30px 0 0 60px; text-align: center;">
					<a id="uploadButton" class="btn btn-primary">浏&nbsp;&nbsp;&nbsp;&nbsp;览</a>
					<br /> <font color="red">(上传尺寸：320*160px 限制上传：150KB )</font>
				</div>
			</div>
		</div>
	</div>

	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/jquery.ui.custom.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/jquery.uniform.js"></script>
	<script src="${ctx}/js/select2.min.js"></script>
	<script src="${ctx}/js/jquery.validate.js"></script>
	<script src="${ctx}/js/matrix.js"></script>
	<script src="${ctx}/js/matrix.form_validation.js"></script>
	<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
	<script src="${ctx}/js/jquery.peity.min.js"></script>
	<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
	<script src="${ctx}/js/masked.js"></script>
	<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<script type="text/javascript"
		src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
	<script>
		$('.textarea_editor').wysihtml5();
	</script>

	<jsp:include page="/common/buttom.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
	var advertisementId = "${advertisementInfo.advertisement_id}";

	$(function() {
		// 创建AJAX方式上传文件
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload($uploadBtn,
				{
					action : '${ctx}/user!uploadImage.action',
					name : 'upfile',
					responseType : 'json',
					onSubmit : function(file, ext) {
						//ext 文件后缀
					},
					onComplete : function(file, response) {
						if (response.status == 200) {
							$("#pictureAddress").val(response.rows);
							$("#imgCompany").attr("src",
									"${http_img}" + response.rows);
						} else {
							alert(response.msg);
						}
					}
				});
	});

	//标题验证  
	function pictureTitleOnBlur() {
		var pictureTitle = $.trim($("#pictureTitle").val());
		if (pictureTitle.length == 0) {
			$("#pictureTitle_check").html("标题不能为空！");
		} else if (pictureTitle.length > 20) {
			$("#pictureTitle_check").html("长度不能超过20个字符!");
		} else {
			$("#pictureTitle_check").html("");
		}
	}

	function saveAdvertiSementInfo() {
		//上传文件判断 
		var a = document.getElementById("pictureAddress").value;
		if (a == null || a == "") {
			alert("请选择上传的图片!");
			return;
		}
		var data = {};
		data["advertisementId"] = advertisementId;
		data["pictureAddress"] = $.trim($("#pictureAddress").val());
		data["style"] = $.trim($("#firstExtend").val());
		data["pictureTitle"] = $.trim($("#pictureTitle").val());
		data["linkAddress"] = $.trim($("#linkAddress").val());
		$.ajax({
			type : "post",
			url : '${ctx}/advertisement!updateAdvertiSementInfo.action',
			dataType : 'json',
			data : data,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("保存成功!");
					window.history.go(-1);
				} else {
					alert(msg.msg);
				}
			}
		});
	}
</script>