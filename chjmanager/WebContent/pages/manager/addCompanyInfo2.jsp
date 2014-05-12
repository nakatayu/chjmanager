<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>添加信息</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-media.css" />
<link rel="stylesheet" href="${ctx}css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}css/datepicker.css" />
<link rel="stylesheet" href="${ctx}css/bootstrap-wysihtml5.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<style type="text/css">
.tag_content {
	margin: 0px;
	padding: 4px 0 4px 0;
	list-style: none;
	line-height: 20px;
	font-size:15px;
}

.shop_announcement {
	width: 557px;
	high: 57px;
	overflow-x: visible;
	overflow-y: visible;
}

#a1{background-color:skyblue
}
#a2{font-right:
}
</style>
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="companyList.jsp" class="current">列表</a>
			</div>
		</div>

		<div class="row-fluid">

			<div class="span10" >
				<div class="widget-box">
              
					<div class="widget-title">
						<span class="icon"> <i class="icon-info-sign"></i>
						</span>
						<h5>添加企业信息</h5>
						<h5 style="margin-left: 60px; color: red;">${result}</h5>
					</div>
					<div class="widget-content nopadding">
					<div style="background: none;">
					<div style="width: 150px; height: 280px; margin: 10px 0 0 30px; border: 1px solid #ccc; float: right;">
											<img style="width: 150px; height: 160px;" id="imgCompany" />
											<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;<br /> <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button id="uploadButton" class="btn btn-primary"style="background: #339999">浏&nbsp;&nbsp;&nbsp;览</button>
						</div>
						
						<div style="float: left; width: 60%">		
						<form class="form-horizontal" method="post"
							action="${ctx}/user!addComPanyInfo.action" name="basic_validate"
							id="basic_validate" novalidate="novalidate">
							<table style="width: 100%;">
								<tr>

									<td>
										<div class="control-group">
											<label class="control-label">企业名称：</label>
											<div class="controls">
												<input id="name" type="text" name="name" class="span10" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">经营范围：</label>
											<div class="controls">
												<input id="operateScope" type="text" name="operateScope"
													class="span10" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">企业邮箱：</label>
											<div class="controls">
												<input id="email" type="text" name="email" class="span10" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">联系人：</label>
											<div class="controls">
												<input id="linkman" type="text" name="linkman" class="span10" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">联系方式：</label>
											<div class="controls">
												<input id="linkmanTel" type="text" name="linkmanTel"
													class="span10" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">企业地址：</label>
											<div class="controls">
												<input id="address" type="text" name="address" class="span10">
											</div>
										</div>

										</div>
										<div class="control-group">
											<label class="control-label">公司类型：</label>
											<div class="controls">
												<input id="companyType" type="text" name="companyType"
													class="span10">
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">企业介绍:</label>
											<div class="controls">
												<textarea id="companyInfo" rows="6" cols="6"
													name="companyInfo" class="span12"></textarea>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">企业网址:</label>
											<div class="controls">
												<input id="companyURL" type="text" name="companyURL"
													class="span12">
											</div>
										</div>
										
										<!-- 	<div class="control-group">
											<label class="control-label">tag:</label>
											<div class="controls">
												<input id="tagid" type="text" name="txttagid"
													class="span12">
											</div>
										</div>
										 -->
										</div>
									</td>
								</tr>
						          </div>						
							        <table>
							        <span class="icon"> </span>
							           <h5>
							            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							          &nbsp; &nbsp;  企业标签</h5>
										<tr>
											<td><label class="control-label" id="sort">标签分类：</label>
												</td>
													<td><label class="control-label">标签名称：</label></td>
														</tr>
															<tr>
																	<td>
																		<div class="control-group">
																			<div class="controls">
																				<div
																					style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
																					class="tag_content">
																					<ul id="tagSecond">
																					</ul>
																				</div>
																			</div>
																		</div>
																	</td>
																	<td>
																		<div class="control-group">
																			<div class="controls">
																				<div
																					style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
																					class="tag_content">
																					<ul id="tagThird">
																					</ul>
																				</div>
																			</div>
																		</div>
																	</td>
																</tr>
															</table>
															<div class="control-group">
																<label class="control-label">已选标签：</label>
																<div class="controls"  id="choosenLabel" titie="labelstyle"></div>
														</div>
												        <td colspan="15">
													<div>
								
							</table>

							<div class="form-actions">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
									value="保&nbsp;&nbsp;&nbsp;&nbsp;存" class="btn btn-success" onclick="saveTag()">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="取&nbsp;&nbsp;&nbsp;&nbsp;消"
									class="btn btn-success" onclick="clearFrom()">
							</div>
						</form>
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
	<script src="${ctx}/js/mypage.js"></script>
	<script src="${ctx}/js/easyui-lang-zh_CN.js"></script>
	<script src="${ctx}/js/jquery.validate.js"></script>
	<script src="${ctx}/js/myself/addCompany.js"></script>
	<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
	<script src="${ctx}/js/bootstrap-datepicker.js"></script>
	<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
	<script src="${ctx}/js/masked.js"></script>
	<script src="${ctx}/js/jquery.uniform.js"></script>
	<script src="${ctx}/js/matrix.form_common.js"></script>
	<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
	<script src="${ctx}/js/jquery.peity.min.js"></script>
	<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<script>
		$('.textarea_editor').wysihtml5();
	</script>
<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">
	$(function() {

		// 创建AJAX方式上传文件
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload(
				$uploadBtn,
				{
					action : '${ctx}/activity!uploadImage.action',
					name : 'upfile',
					responseType : 'json',
					data:{type:1},//个人头像1企业所有图片2店铺所有图片3圈子图片4话题图片5活动图片6商品图片7广告图片8个人证件图片9二维码图片10其他图片11
					onSubmit : function(file, ext) {
						if ($("#tp img").length>= 1) {
							alert('只能上传一张图片');
							return false;
						}
					},
					onComplete : function(file, response) {
						if (response.status == 200) {
							$("#uploadUrl").val(response.rows);
							$("#tp").append('<img src="${http_img}'+  response.rows+'"  style="margin-left:20px;"  width="100" height="100"/>');
							} else {
							alert(response.msg);
						}
					}
				});
	});


	function clearFrom() {

		$('#name').val("");
		$('#address').val("");
		$('#email').val([ "" ]);
		$('#registDate').val("");
		$('#logo').val("");
		$('#companyType').val("");
		$('#operateScope').val("");
		$('#linkman').val("");
		$('#linkmanTel').val("");
		$('#companyInfo').val("");
		$('#companyURL').val("");
		$('#companyInfo').val("");
	}
	

	 $(function() {
		  //普通2级标签   
		$.ajax({
					type : "post",
					url : '${ctx}/user!findTagSecondList.action',
					dataType : 'json',
					//      data :{tagId:tagid},   
					timeout : 10000,
					success : function(msg,status) {
						
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array.push('<li class="tag_content"	onclick="choos(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push(' value="' + msg.rows[i]["tagId"]+ '">' + msg.rows[i]["tagName"]+ '</li>')
								
							}
							$('#tagSecond').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
		 
	});    

	function choos(li) {
		/* 普通3级标签 */
		var tagid = $(li).attr("value");
		$.ajax({
					type : "post",
					url : '${ctx}/user!findTagThirdList.action',
					dataType : 'json',
					data : {
						tagId : tagid
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								
								array.push('<li class="tag_content"	onclick="chooseabel(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('value="' + msg.rows[i]["tagId"]+ '">' + msg.rows[i]["tagName"]+ '</li>')
							}
							$('#tagThird').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}


	var count = 1;
	function chooseabel(li) {
		if (count > 6) {
			alert("不能超过6个");  
			return;
		}
		
		var currentLabel = $(li).val();//判断是否重复
		var flag=true;
		$("#choosenLabel").find("span").each(function(){
			if($(this).attr("value")==currentLabel){
				alert("标签不可重复");
				flag = false;
			}
		});
		if(flag==true){
			count = count + 1;
			$("#choosenLabel").append("<span  value="+ $(li).attr("value")+ ">"+ $(li).text()+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>");
			
		  }
		}

	function delLabel(li) {
		count = count - 1;
		$(li).prev().remove();  
		$(li).remove();
	}
	//服务范围2级,3级标签
	function findSecondArea(opt){
		var areaId = $(opt).find("option:selected").val(); 
		$.ajax({
					type : "post",
					url : '${ctx}/area!findSecondArea.action',
					dataType : 'json',
					data : {
						areaId : areaId
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							array
							.push('<td><label><input type="radio"	name="secondArea" checked   ondblclick="chooseabel(this)" ');
					array.push('	 value="' + 0
							+ '" />' +"开发区全部区域"
							+ '</label></td>');
							for ( var i = 0; i < msg.rows.length; i++) {
								array.push('<td><label><input type="radio" name="secondArea" ondblclick="chooseabel(this)" ');
								array.push('value="' + msg.rows[i]["areaId"]+ '" />' + msg.rows[i]["areaName"]+ '</label></td>');
							}
							$('#secondAreaId').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}
	
 	function saveTag(){
		
 		var labelValue = "";
		$("#choosenLabel").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";
			
		});
		 $('#tagid').val(labelValue);
		 $("#basic_validate").submit();
		}  
</script>
