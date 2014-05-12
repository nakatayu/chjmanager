<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>Web广告图片设置</title>
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
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a
					href="${ctx}/pages/manager/WebAdvertisement.jsp" title="广告设置"
					class="tip-bottom"><i class="icon icon-bookmark"></i> 广告设置</a>
					<a href="#"   class="tip-bottom">Web广告图片操作</a>
			</div>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>Web广告图片操作</h5>
						</div>

		<div class="widget-content nopadding">
		<input type="hidden" id="style" name="style"  /> 
		<input type="hidden" id="advertisementId" name="advertisementId"  /> 							
				 <table>
					 <tr>
                      <td>
				 
				 
				 <div id="form-wizard-1" class="step">
						 <div class="control-group">
								<div class="controls">
								<font size="2";>页&nbsp;&nbsp;&nbsp;&nbsp;面&nbsp;&nbsp;&nbsp;&nbsp;：</font><input id="pageWeb" name="pageWeb" type="text"  value="${advertisementInfo.page_web}" 
									onblur="pictureTitleOnBlur()"  style="width: 254px;"  readonly /> 
								</div>
						</div>
				</div>

				 <div id="form-wizard-1" class="step">
						 <div class="control-group">
								<div class="controls">
						<font size="2";>页面位置：</font><input id="pagePosition" name="pagePosition" type="text"  value="${advertisementInfo.page_position}" 
									onblur="pictureTitleOnBlur()"  style="width: 254px;"  readonly/> 
								</div>
						</div>
				</div>

				 <div id="form-wizard-1" class="step">
						 <div class="control-group">
								<div class="controls">
						<font size="2";>广告位&nbsp;&nbsp;&nbsp;&nbsp;：</font><input id="pageName" name="pageName" type="text"  value="${advertisementInfo.page_name}" 
									onblur="pictureTitleOnBlur()"  style="width: 254px;"  readonly/> 
								</div>
						</div>
				</div>
				
				 <div id="form-wizard-1" class="step">
						 <div class="control-group">
								<div class="controls">
				<font size="2";>广告标题：</font><input id="pictureTitle" name="pictureTitle" type="text"  value="${advertisementInfo.picture_title}" 
									onblur="pictureTitleOnBlur()"  style="width: 254px;"  /> 
								</div>
						</div>
				</div>
				<div id="form-wizard-1" class="step">
					<div class="control-group">
							<div class="controls" style="width: 374px;">
						<font size="2";>链接地址：</font><input id="linkAddress"  name="linkAddress"   type="text"  value="${advertisementInfo.link_address}" 
										style="width: 254px;"  /> 
							</div>
							</div>
					</div>
					</td>
						 <td align=center >
							 <div style="width: 600px; height: 360px; margin: 10px 0 0 0; border: 1px solid #ccc; float: center;">
								 <img style="width: 320px; height: 160px;" id="imgCompany" src="${http_img}${advertisementInfo.picture_address}" />
									 <input type="hidden" id="pictureAddress" name="pictureAddress"  value="${advertisementInfo.picture_address}" />
							  </div> 
						 </td>
				 
				</tr>
			</table>
								<table>
								<td style="width:70%;height:25px;" ></td>
								<td><font color="red">图片上传尺寸：320*230px 限制上传：300KB</font></td>
								<tr>
								<td style="width:70%;height:35px;" ></td>
								<td><button id="uploadButton" class="btn btn-primary" style="background:#339999; ">浏&nbsp;&nbsp;&nbsp;&nbsp;览</button></td>
								</tr>
								</table>
								  <div class="form-actions">
									 <button class="btn btn-warning" type="button"
										 class="btn btn-success" onclick="saveAdvertiSementInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
								 </div>	
						 
						</div>
					</div>
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
			<script src="${ctx}/js/bootstrap-datepicker.js"></script>
			<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
			<script src="${ctx}/js/jquery.peity.min.js"></script>
			<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
			<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
			<script src="${ctx}/js/masked.js"></script>
			<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
			<script src="${ctx}/js/myself/ajaxupload.js"></script>
			<%--<script src="${ctx}/js/matrix.form_common.js"></script>  --%>
			<script>
				$('.textarea_editor').wysihtml5();
			</script>
<script src="${ctx}/js/jquery.pager.js"></script>
			<jsp:include page="/common/buttom.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
var style ="${advertisementInfo.style}";
var advertisementId = "${advertisementInfo.advertisement_id}";

$(function() {

	$("#firstExtend").val(style);
	$("#advertisementId").val(advertisementId);
	// 创建AJAX方式上传文件
	var $uploadBtn = $("#uploadButton");
	new AjaxUpload($uploadBtn, {
		action : '${ctx}/user!uploadImage.action',
		name : 'upfile',
		responseType : 'json',
		data:{type:8},//个人头像1企业所有图片2店铺所有图片3圈子图片4话题图片5活动图片6商品图片7广告图片8个人证件图片9二维码图片10其他图片11
		onSubmit : function(file, ext) {
        	ext=ext. toLowerCase(); //ext 文件后缀     
            if(ext=='bmp'||ext=='jpg'||ext=='jpeg'||ext=='png'){
            	
            }else{
            	alert('图片格式不对');
            	return false;
            }
	    },
		onComplete : function(file, response) {
			if (response.status == 200) {
				$("#pictureAddress").val(response.rows);
				$("#imgCompany").attr("src", "${http_img}" + response.rows);
			} else {
				alert(response.msg);
			}
		}
	});
});

  
	
	function saveAdvertiSementInfo(){
			//上传文件判断 
			var a = $("#pictureAddress").val();
			if(a==null || a==""){
				alert("请选择上传的图片!");
				return;
			}
			var data={};
			
		   data["advertisementId"]=$("#advertisementId").val();
		   data["pictureAddress"]=$("#pictureAddress").val();
		   
		   data["pageWeb"]=$("#pageWeb").val();
		   data["pagePosition"]=$("#pagePosition").val();
		   data["pageName"]=$("#pageName").val();
		   
		   data["pictureTitle"]=$("#pictureTitle").val();
		   data["linkAddress"]=$("#linkAddress").val();
			  $.ajax({
					type : "post",
				    url : '${ctx}/advertisement!updateWebAdvertisementInfo.action',
				    dataType : 'json',
				    data :data,
					success : function(msg, status) {
					if (msg.status == 200) {
						alert("更新成功");
						window.location.href ="${ctx}/pages/manager/WebAdvertisement.jsp";
					}else{
						alert("更新失败");
					}
				}
		});
	}
</script>