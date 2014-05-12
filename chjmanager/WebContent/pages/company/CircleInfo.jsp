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
.tag_content {
	margin: 0px;
	padding: 2px 0 2px 0;
	list-style: none;
	line-height: 20px;
	font-size: 15px;
}

.shop_announcement {
	width: 486px;
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
	font-color: 20px;
}

.spanstyle {
	font-color: red;
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
					class="icon-home"></i> 主页</a> <a href="./CircleList.jsp" title="创建圈子"
					class="tip-bottom"><i class="icon-home"></i> 圈子维护</a> <a href="#"
					class="current">创建圈子</a>
			</div>
			<h1>创建圈子</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>创建圈子</h5>
						</div>

						<div class="widget-content nopadding">
							<h5 id=cl>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话题图片：
								<button id="uploadButton" class="btn btn-primary"
									style="background: #339999">浏&nbsp;&nbsp;&nbsp;览</button>
							</h5>
							<div
								style="width: 150px; height: 280px; margin: 10px 0 0 30px; border: 1px solid #ccc; float: center; display: none;">
								<img id="Imgeid" /> <br />

							</div>
							<form class="form-horizontal" method="post"
								action="${ctx}/circle!seveCircle.action" name="basic_validate"
								id="basic_validate" novalidate="novalidate">
								<br>
								<hr>
								<br>
								<table>

									<tr>
										<td>
											<div id="form-wizard-1" class="step">
												<label class="control-label">圈子名称：</label>
												<div class="controls">
													<input id="name" name="name" type="text"
														style="width: 254px;" onblur="nameOnBlur()" /> <span><font
														color="red" id="name_check"> </font></span>
												</div>
											</div>

										</td>

									</tr>

									<tr>
										<td>
											<div class="control-group">
												<label class="control-label"></label>
												<div class="controls">
													<table>
														<tr>
															<td><label> <input type="checkbox"
																	id="checkbox" name="checkbox" value="T" /> 对圈子成员进行审核
															</label></td>

														</tr>
													</table>
												</div>
											</div>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>

								</table>
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">圈子摘要：</label>
										<div class="controls">
											<input id="CircleAbstract" type="text" name="CircleAbstract"
												style="width: 250px;" onblur="CircleAbstractOnBlur()" /> <span><font
												color="red" id="CircleAbstract_check"> </font></span>
										</div>
									</div>
								</div>
								<div class="shop_announcement">
									<label class="control-label">圈子介绍：</label>
									<div class="controls" style="height: 200px">
										<textarea type="text" name="info" class="shop_announcement"   onblur="content11OnBlur()"
											style="height: 100px" id="content11"></textarea>
										<span><font color="red" id="content_check"> </font></span> 
										<input	id="tagid" name="labelValue" style="display: none;">
										<input id="loadImgeid" name="Imge" style="display: none;">
									</div>
								</div>
						</div>
						<!-- 		<br>
						<div
							style="width: 440px; height: 120px; margin: 10px 0 0 30px; border: 0px solid #ccc; float: center;">
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr style="padding-top: 10px;" id="tr-img">
								</tr>
							</table>
						</div>
						<hr>

						<br> -->
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;圈子标签：</h5>
						<hr>


						<table>
							<tr>
								<td></td>
								<td align="left" valign="bottom"
									style="height: 15px; font-size: 15px; padding: 10px;">标签分类：</td>
								<td align="left" valign="bottom"
									style="height: 15px; font-size: 15px; padding: 10px;">标签名称：</td>
							</tr>
							<tr>
								<td style="width: 10%"></td>
								<td style="width: 27%">

									<div
										style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
										class="tag_content">
										<ul id="tagSecond">
										</ul>
									</div>
								</td>
								<td style="width: 27%">
									<div
										style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
										class="tag_content">
										<ul id="tagThird">
										</ul>
									</div>
								</td>
								<td style="width: 27%"></td>
							</tr>
						</table>
						<div class="control-group" style="height: 68px;">
							<label class="control-label" style="height: 30px;">已选标签：</label>
							<input name="thirdCategoryTag" id="thirdCategoryTag"
								type="hidden">
							<div class="controls" id="choosenLabel" titie="labelstyle"
								style="height: 30px;"></div>
						</div>

						<div class="form-actions">
							<button class="btn btn-warning" type="button"
								class="btn btn-success" onclick="saveCirleInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-warning" type="button"
								onclick="location.reload()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
						</div>

						</form>
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

		<jsp:include page="/common/buttom.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
	$(function() {
		//标签分类 1级 

		$.ajax({
					type : "post",
					url : '${ctx}/tag!findTagSecondList.action',
					dataType : 'json',
					//      data :{tagId:tagid},   
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="tagname(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>')
							}
							$('#tagSecond').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
		//公共分类 1级 
		$
				.ajax({
					type : "post",
					url : '${ctx}/category!findShopstairtagList.action',
					dataType : 'json',
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="commonalityclassifyvalue(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="'
										+ msg.rows[i]["productCategoryId"]
										+ '">' + msg.rows[i]["Name"] + '</li>')
							}
							$('#Shopstairtag').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});

		// 服务范围 下拉框 1级
		$.ajax({
			type : "post",
			url : '${ctx}/area!findArea.action',
			dataType : 'json',
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					var array = [];
					array.push('<option  selected value=-1>--请选择--</option> ');
					for ( var i = 0; i < msg.rows.length; i++) {
						//alert(msg.rows[i]["areaName"]);
						array.push('<option    class="tag_content"');
						array.push('	 value="' + msg.rows[i]["areaId"] + '">'
								+ msg.rows[i]["areaName"] + '</option>');
					}
					$('#area').html(array.join(''));
				} else
					alert(msg.msg);
			}
		});

		//地址标签
		$.ajax({
			type : "post",
			url : '${ctx}/area!findDetailedAddress.action',
			dataType : 'json',
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					var array = [];
					array.push('<option  selected value=-1>--请选择--</option> ');
					for ( var i = 0; i < msg.rows.length; i++) {
						array.push('<option   class="tag_content"  ');
						array.push('	 value="' + msg.rows[i]["areaId"] + '">'
								+ msg.rows[i]["areaName"] + '</option>');
						$("#detailedAddress").data(
								"'" + msg.rows[i]["areaId"] + "'",
								msg.rows[i]["detailedAddress"] + "#"
										+ msg.rows[i]["lat"] + "#"
										+ msg.rows[i]["lng"])
					}
					$('#lat').html(array.join(''))
					$('#lng').html(array.join(''));
					$('#detailedAddress').html(array.join(''));
				} else
					alert(msg.msg);
			}
		});

		//生成店铺编号  
		$.ajax({
			type : "post",
			url : '${ctx}/shop!generateShopCode.action',
			dataType : 'json',
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					$("#shopNumber").val(msg.rows);
				} else
					alert(msg.msg);
			}
		});

		// 创建AJAX方式上传文件
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload($uploadBtn,
				{
					action : '${ctx}/circle!uploadImage.action',
					name : 'upfile',
					responseType : 'json',
					type:3,//个人头像1企业所有图片2店铺所有图片3圈子图片4话题图片5活动图片6商品图片7广告图片8个人证件图片9二维码图片10其他图片11
					onSubmit : function(file, ext) {
						//ext 文件后缀
						if($("#cl img").length >=1){
							   alert("最多只能上传 一张");
							return false;
						}
					},
					onComplete : function(file, response) {
						if (response.status == 200) {
							$("#loadImgeid").val(response.rows);
						//	$("#loadImgeid").attr("src","${http_img}" + response.rows);
							$("#cl").append('<img src="${http_img}'+  response.rows+'"  style="margin-left:20px;"  width="100" height="100"/>');
							
						} else {
							alert(response.msg);
						}
					}
				});

	});
	//标签名称  2级
	function tagname(li) {
		var tagid = $(li).attr("value");
		$
				.ajax({
					type : "post",
					url : '${ctx}/tag!findTagThirdList.action',
					dataType : 'json',
					data : {
						tagId : tagid
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="selected(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>')
							}
							$('#tagThird').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	var count = 0;
	function selected(li) {
		count = $("#choosenLabel").find("span").length;
		if (count > 5) {
			alert("不能超过6个");
			return;
		}
		var currentLabel = $(li).val();//判断是否重复 
		var flag = true;
		$("#choosenLabel").find("span").each(function() {
			if ($(this).attr("value") == currentLabel) {
				alert("标签不可重复");
				flag = false;
			}
		});
		if (flag == true) {
			count = count + 1;
			$("#choosenLabel")
					//已选标签 
					.append(
							"<span  value="
									+ $(li).attr("value")
									+ ">"
									+ $(li).text()
									+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>");
		}
	}

	function delLabel(li) {
		count = count - 1;
		$(li).prev().remove();
		$(li).remove();
	}

	//分类名称  2级 
	function commonalityclassifyvalue(li) {
		var shoptag = $(li).attr("value");
		$
				.ajax({
					type : "post",
					url : '${ctx}/category!findCategory.action',
					dataType : 'json',
					data : {
						shoptagId : shoptag
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array
										.push('<li class="tag_content"	onclick="shoptag(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="'
										+ msg.rows[i]["productCategoryId"]
										+ '">' + msg.rows[i]["Name"] + '</li>')
							}
							$('#Thirdshoptag').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	function submit() {
		var labelValue = "";
		$("#choosenclassify").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";
		});
		$("#choosenclassifyvalue").val(labelValue);
		$("#basic_validate").submit();
	}

	var shoptagcount = 1;
	function shoptag(li) {
		if (shoptagcount > 1) {
			alert("只能选择一个分类");
			return;
		}

		shoptagcount = shoptagcount + 1;
		$("#delchoosenclassify")
				//已选分类 
				.append(
						"<span  value="
								+ $(li).attr("value")
								+ ">"
								+ $(li).text()
								+ "</span><a onclick='delchoosenclassify(this)'>[X]&nbsp;&nbsp;</a>");
	}
	function delchoosenclassify(li) {
		shoptagcount = shoptagcount - 1;
		$(li).prev().remove();
		$(li).remove();
	}

	function chooseArea(radio) {//多选框 checked 
		var secondAreaId = $(radio).val();
		if (secondAreaId == -1) {
			$("#thirdAreaId").find("input[type=checkbox]").each(function() {
				$(this).attr("checked", true);
			});
		} else {
			$("#thirdAreaId").find("input[type=checkbox]").each(function() {
				if ($(this).attr("parentId") == secondAreaId) {
					$(this).attr("checked", true);
				} else {
					$(this).attr("checked", false);
				}
			});
		}
	}
	// 服务范围  单选框 2级  
	function scopeofservices(opt) {
		var areaId = $(opt).find("option:selected").val();
		if (areaId == -1) {
			$('#secondAreaId').html("");
			$('#thirdAreaId').html("");
			return;
		} else {
			$
					.ajax({
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
										.push('<td><label><input type="radio"	name="secondArea" checked   onclick="chooseArea(this)" ');
								array.push('	 value=-1 />' + "开发区全部区域"
										+ '</label></td>');
								for ( var i = 0; i < msg.rows.length; i++) {
									array
											.push('<td><label><input  type="radio" name="secondArea" onclick="chooseArea(this)" ');
									array.push('	 value="'
											+ msg.rows[i]["areaId"] + '" />'
											+ msg.rows[i]["areaName"]
											+ '</label></td>');
								}
								$('#secondAreaId').html(array.join(''));

								//园区名称  多选框排列   
								var thirdAreaArray = [];
								var rowTr = 3;
								var columnTd = 1;
								for ( var i = 0; i < msg.total.length; i++) {
									//	alert(msg.total[i]["areaId"]);
									rowTr = rowTr + 1;
									if (rowTr % 4 == 0) {
										columnTd = 1;
										thirdAreaArray
												.push('<tr><td><input type="checkbox"  style="font-size: 15px" checked class="tdstyle"');
										thirdAreaArray.push('	 parentId="'
												+ msg.total[i]["parentId"]
												+ '"');
										thirdAreaArray.push('	 value="'
												+ msg.total[i]["areaId"] + '">'
												+ msg.total[i]["areaName"]
												+ '</td>');
									} else {
										columnTd = columnTd + 1;
										if (columnTd == 4) {
											thirdAreaArray
													.push('<td><input type="checkbox"  style="font-size: 15px" checked class="tdstyle"');
											thirdAreaArray.push('	 parentId="'
													+ msg.total[i]["parentId"]
													+ '"');
											thirdAreaArray.push('	 value="'
													+ msg.total[i]["areaId"]
													+ '">'
													+ msg.total[i]["areaName"]
													+ '</td></tr>');
										} else {
											thirdAreaArray
													.push('<td><input type="checkbox"  style="font-size: 15px" checked class="tdstyle"');
											thirdAreaArray.push('	 parentId="'
													+ msg.total[i]["parentId"]
													+ '"');
											thirdAreaArray.push('	 value="'
													+ msg.total[i]["areaId"]
													+ '">'
													+ msg.total[i]["areaName"]
													+ '</td>');
										}
									}
								}
								$('#thirdAreaId').html(thirdAreaArray.join('')); //园区名称  
							} else
								alert(msg.msg);
						}
					})
		}
	}

	//地址输入框
	function addressStreet(opt) {
		var detailedAddress = $(opt).find("option:selected").val();
		if (detailedAddress == -1) {
			$('#address').val("");

		} else {
			var address = $("#detailedAddress").data(
					"'" + detailedAddress + "'");
			//	alert(address);
			var str = new Array();
			str = address.split("#");
			//	alert(str);
			$("#address").val(str[0]);
			$("#lat").val(str[1]);
			$("#lng").val(str[2]);
			if ($("#lat").val(str[1])) {
				$("#lat_check").html("");
			}
			if ($("#lng").val(str[1])) {
				$("#lng_check").html("");
			}
		}
	}

	var reg = new RegExp("^[0-9--]*$");
	var reg1 = new RegExp("[\u4e00-\u9fa5]"); //中文 字母
	var reg2 = new RegExp("[A-Za-z0-9\u0391-\uffe5]"); // 中文 字母 数字 
	
	//圈子名称 
		function nameOnBlur() {
			var name = $.trim($("#name").val());
			if ($.trim($('#name').val()).length==0) {
				$("#name_check").html("圈子名称不能为空！");
			} else if ($.trim($("#name").val()).length > 20) {
				$("#name_check").html("长度不能超过20个字符!");
			} else {
				$("#name_check").html("");
			}
		}
	
	//圈子摘要
	function CircleAbstractOnBlur() {
		var CircleAbstract = $.trim($("#CircleAbstract").val());
		if ($.trim($('#CircleAbstract').val()).length==0) {
			$("#CircleAbstract_check").html("摘要不能为空！");
		} else if ($.trim($("#CircleAbstract").val()).length > 20) {
			$("#CircleAbstract_check").html("长度不能超过20个字符!");
		} else {
			$("#CircleAbstract_check").html("");
		}
	}
	
	//圈子介绍
	function content11OnBlur() {
		var content11 = $.trim($("#content11").val());
		if ($.trim($('#content11').val()).length==0) {
			$("#content_check").html("圈子介绍不能为空！");
		} else if ($.trim($("#content11").val()).length > 500) {
			$("#content_check").html("长度不能超过500个字符!");
		} else {
			$("#content_check").html("");
		}
	}

	//保存圈子
	function saveCirleInfo() {
		flag = true;
		$("font[name=serviceTime_check]").each(function() {
			if ($.trim($(this).html()) != "") {
				flag = false;
			}
		});

		//圈子名称
		var name = $.trim($("#name").val());
			if ($.trim($('#name').val()).length==0) {
				$("#name_check").html("圈子名称不能为空！");
				flag=false;
			} else if ($.trim($("#name").val()).length > 20) {
				$("#name_check").html("长度不能超过20个字符!");
				flag=false;
			} else {
				$("#name_check").html("");
			}
			
		//圈子摘要
		var CircleAbstract = $.trim($("#CircleAbstract").val());
		if ($.trim($('#CircleAbstract').val()).length==0) {
			$("#CircleAbstract_check").html("摘要不能为空！");
			flag=false;
		} else if ($.trim($("#CircleAbstract").val()).length > 20) {
			$("#CircleAbstract_check").html("长度不能超过20个字符!");
			flag=false;
		} else {
			$("#CircleAbstract_check").html("");
		}
		
		//圈子介绍
		var content11 = $.trim($("#content11").val());
		if ($.trim($('#content11').val()).length==0) {
			$("#content_check").html("圈子介绍不能为空！");
			flag=false;
		} else if ($.trim($("#content11").val()).length > 500) {
			$("#content_check").html("长度不能超过500个字符!");
			flag=false;
		} else {
			$("#content_check").html("");
		}
		
		var labelValue = "";
		$("#choosenLabel").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";

		});
			$('#tagid').val(labelValue);
			if(flag!=false){
				submit();
			}
	}
	function addServiceTime() {
		if ($("#addServiceTimeId").find('.controls').length > 2) {
			alert("最多可以加3个时间框！");
			return;
		}
		$("#addServiceTimeId")
				.append(
						"<div class='controls'><div class='input-append'><input type='text' class='span11'style='width: 262px;'  name='serviceTime' onblur='addServiceTimeIdOnBlur(this)'  id='addserviceTime'> </div><span><font color='red'  name='addserviceTime_check'> </font></span></div>");
	}
	function delServiceTime() {
		$("#addServiceTimeId").find("div[class=controls]:last").remove();
	}
</script>