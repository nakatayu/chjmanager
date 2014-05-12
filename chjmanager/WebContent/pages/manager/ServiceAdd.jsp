<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>共享漕河泾详情</title>
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
	width: 450px;
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
			<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> 
				<a href="${ctx}/pages/manager/ServiceList.jsp" title="共享漕河泾列表" class="current"><i class="icon-key"></i> 共享漕河泾列表</a>
				 <a href="#" class="current">新增共享漕河泾信息</a>
			</div>
			
		</div>
		<div class="container-fluid">
		
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>共享漕河泾详情</h5>
						</div>

						<form class="widget-content nopadding"  id="formDivId">
							<div	class="form-horizontal" >
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息：</h5>
								<hr>   
								<table>
										<tr >
											<td style="width:600px;">
											       <div id="form-wizard-1" class="step">
														<div class="control-group">
															<label class="control-label">信息标题：</label>
															<div class="controls">
																<input id="title"  name="title"  type="text"
																	onblur="titleOnBlur()" style="width: 250px;" /> <span><font
																	color="red"  id="title_check"> </font></span>
															</div>
														</div>
													</div>
													
													  <div class="control-group">
													<label class="control-label">目标栏目：</label>
													<div class="controls">
														<select name="serviceType" id="serviceType" style="width: 260px;" onchange="serviceTypeOnBlur()">
															<option value="-1" id="serviceType">--请选择--</option>
															<option id="serviceType" value="1">服务优惠送</option>
															<option id="serviceType" value="2">生活小贴士</option>
															<option id="serviceType" value="3">政策早解读</option>
															<option id="serviceType" value="4">公益你我他</option>
															<option id="serviceType" value="5">招商直通车</option>
															
														</select>
														<span><font color="red" id="serviceType_check" > </font></span>
													</div>
												</div>
												
													<div id="form-wizard-1" class="step">
															<div class="control-group">
																<label class="control-label">联系人号码：</label>
																<div class="controls">
																	<input id="phone" type="text" name="phone"
																		style="width: 250px;" onblur="phoneOnBlur()" /> 
																		<span><font	color="red" id="phone_check"> </font></span>
																</div>
															</div>
														</div>	
											</td>
											
											<td>
											<table>
											  <tr>
											  <td style="padding-left:50px" >
													<div style="width:290px; height: 170px; border: 1px solid #ccc; float: center;">
													 <img style="width:290px; height: 170px;" id="imgCompany"/> 
													 <input type="hidden" id="uploadUrl" name="image">
													</div>
											   </td>
											  </tr>
											  	  <tr>
											  	   <td style="padding-left:70px">图片上传尺寸：290*170px 限制上传：150KB</td>
											  </tr>
											  <tr>
											    <td style="padding-left:100px" >
								                 <button id="uploadButton" class="btn btn-primary" style="background:#339999; ">浏&nbsp;&nbsp;&nbsp;&nbsp;览</button>
								                </td>
											  </tr>
											</table>
										 </td>
										</tr>
 								</table>
								 
													 <div id="form-wizard-1" class="step" >
														<label class="control-label"> 信息内容：</label>
														<div class="controls"  style="height: 300px;width:800px">
															<textarea type="text" style="height: 300px;width:800px" name="content"  id="serviceContentId"></textarea>
															<span><font color="red" id="content_check">
															</font></span>
														</div>
													</div>
											<hr>
											<table>
												<tr>
													<td style="font-weight: normal;"></td>
													<td align="left" valign="bottom"
														style="height: 15px; font-size: 15px; padding: 10px;">一级服务范围选择：</td>
													<td align="left" valign="bottom"
														style="height: 15px; font-size: 15px; padding: 10px;">二级服务范围选择：</td>
												</tr>
												<tr>
													<td style="width: 10%"></td>
													<td style="width: 27%">
														<div
															style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
															class="tag_content">
															<ul id="areaStair">
															</ul>
														</div>
													</td>
													<td style="width: 27%">
														<div
															style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
															class="tag_content">
															<ul id="areaSecondLevel">
															</ul>
														</div>
													</td>
													<td style="width: 27%"></td>
												</tr>
											</table>
											<div class="control-group" >
												<label class="control-label" >已选范围：</label> 
									<input name="hiddenAreaName" id="hiddenAreaId" type="hidden">
												<div class="controls" id="selectedArea"  titie="labelstyle" >
												</div>
											</div>		
										<hr>			
													</table>
												
							<!-- 						<br>
													 <input type="hidden" name="flavorsIds" id="flavorsIds">
                                                    <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品标签：</h5>
													<hr> -->
									<table>
														<tr>
															<td></td>
															<td align="left" valign="bottom" style="height: 15px; font-size: 15px; padding: 10px;">标签一级分类选择：</td>
															<td align="left" valign="bottom" style="height: 15px; font-size: 15px; padding: 10px;">标签二级分类选择：</td>
															<td align="left" valign="bottom" style="height: 15px; font-size: 15px; padding: 10px;">标签三级分类选择：</td>
														</tr>
										<tr>
									    <td style="width: 10%"></td>
										<td style="width: 27%">
												<div
													style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
													class="tag_content">
													<ul id="tagFirst">
													</ul>
												</div>
											</td>
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
											<div class="control-group" style="height:68px;">
												<label class="control-label" style="height: 30px;">已选标签：</label> <input
													name="thirdCategoryTag" id="thirdCategoryTag" type="hidden">
												<div class="controls" id="selectLabel"  titie="labelstyle" style="height: 30px;">
												</div>
											</div>
												<div class="form-actions">
													<button class="btn btn-warning" type="button"
														class="btn btn-success" onclick="saveServiceInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button class="btn btn-warning" type="button"
														onclick="location.reload()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
												</div>
							</form>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>

 	<div id="uploadButton"> </div>

			<script src="${ctx}/js/jquery.min.js"></script>
			<script src="${ctx}/js/jquery.ui.custom.js"></script>
			<script src="${ctx}/js/bootstrap.min.js"></script>
			<script src="${ctx}/js/jquery.uniform.js"></script>
			<%-- <script src="${ctx}/js/select2.min.js"></script> --%>
			<script src="${ctx}/js/jquery.validate.js"></script>
			<script src="${ctx}/js/matrix.js"></script>
<%-- 			<script src="${ctx}/js/matrix.form_validation.js"></script> --%>
			<script src="${ctx}/js/bootstrap-datepicker.js"></script>
			<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
			<script src="${ctx}/js/jquery.peity.min.js"></script>
			<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
			<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
			<script src="${ctx}/js/masked.js"></script>
			<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
			<script src="${ctx}/js/myself/ajaxupload.js"></script>
			<script type="text/javascript" src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
			<%--<script src="${ctx}/js/matrix.form_common.js"></script>  --%>
			<script>
				$('.textarea_editor').wysihtml5();
			</script>
<script src="${ctx}/js/jquery.pager.js"></script>
			<jsp:include page="/common/buttom.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
var temp={};
temp['index'];
$(function() {
	
	//配送范围选择 一级
	$.ajax({
		type : "post",
		url : '${ctx}/shop!findShopStairDistributionArea.action',
		dataType : 'json',
		//      data :{tagId:tagid},   
		timeout : 10000,
		success : function(msg, status) {
			if (msg.status == 200) {
				var array = [];
				for ( var i = 0; i < msg.rows.length; i++) {
					array.push('<li class="tag_content"	onclick="areaName(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
					array.push('	 value="' + msg.rows[i]["areaId"]
							+ '">' + msg.rows[i]["areaName"]
							+ '</li>')
				}
				$('#areaStair').html(array.join(''));
			} else
				alert(msg.msg);
		}
	});
	
	
	
			//标签分类 1级 
			$.ajax({
						type : "post",
						url : '${ctx}/tag!findTagFirstList.action',
						dataType : 'json',
						timeout : 10000,
						success : function(msg, status) {
							if (msg.status == 200) {
								var array = [];
								for ( var i = 0; i < msg.rows.length; i++) {
									array
											.push('<li class="tag_content"	onclick="tagname2(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
									array.push('	 value="' + msg.rows[i]["tagId"]
											+ '">' + msg.rows[i]["tagName"]
											+ '</li>');
								}
								$('#tagFirst').html(array.join(''));
							} else
								alert(msg.msg);
						}
					});

	
// 创建AJAX方式上传图片
	var $uploadBtn = $("#uploadButton");
	new AjaxUpload($uploadBtn, {
		action : '${ctx}/user!uploadImage.action',
		name : 'upfile',
		type:11,
		responseType : 'json',
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
				$("#uploadUrl").val(response.rows);
				$("#imgCompany").attr("src", "${http_img}" + response.rows);
			} else {
				alert(response.msg);
			}
		}
	});
	
	$(pageInit);
	function pageInit()
	{
		var str = "Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat";
		str +=",Align,List,Outdent,Indent,Link,Unlink,Anchor,Img,Hr,Emot,Table,Source,Preview";
		$('#updatecontent').xheditor({tools:str,upImgUrl:"${ctx}/user!uploadHtmlFile.action",upImgExt:"jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG"});
		
		var str = "Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat";
		str +=",Align,List,Outdent,Indent,Link,Unlink,Anchor,Img,Hr,Emot,Table,Source,Preview";
		$('#serviceContentId').xheditor({tools:str,upImgUrl:"${ctx}/user!uploadHtmlFile.action",upImgExt:"jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG"});
		
	}
	
	
});

function all_check(index){
	var rt=$('#'+index).prop('checked');
		$("[name=name"+index+"]").prop('checked',rt);
	alert(rt);
	
}
/**
 * 文本编辑器
 */

//标签名称  2级
	function tagname2(li) {
		var tagid = $(li).attr("value");
		$
				.ajax({
					type : "post",
					url : '${ctx}/tag!findTagSecondList.action',
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
										.push('<li class="tag_content"	onclick="tagname(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>');
							}
							$('#tagSecond').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}



	//标签名称  3级
	function tagname(li) {
			var tagid = $(li).attr("value");
			$.ajax({
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
											.push('<li class="tag_content"	onclick="selectLabelName(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
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

		var selectLabelCount = 1;
		function selectLabelName(li) {
			if (selectLabelCount > 6) {
				alert("不能超过6个");
				return;
			}
			var currentLabelCount = $(li).val();//判断是否重复 
			var flag = true;
			$("#selectLabel").find("span").each(function() {
				if ($(this).attr("value") == currentLabelCount) {
					alert("标签不可重复");
					flag = false;
				}
			});
			if (flag == true) {
				selectLabelCount = selectLabelCount + 1;
				$("#selectLabel")
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
			selectLabelCount = selectLabelCount - 1;
			$(li).prev().remove();
			$(li).remove();
		} 
	
	
	
//配送范围   2级  附属园区
function areaName(li) {
	var areaid = $(li).attr("value");
	$.ajax({
				type : "post",
				url : '${ctx}/shop!findShopSecondLevelDistributionArea.action',
				dataType : 'json',
				data : {
					areaId : areaid
				},
				timeout : 10000,
				success : function(msg, status) {
					if (msg.status == 200) {
						var array = [];
						for ( var i = 0; i < msg.rows.length; i++) {
							array
									.push('<li class="tag_content"	onclick="selected(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
							array.push('	 value="' + msg.rows[i]["areaId"]
									+ '">' + msg.rows[i]["areaName"]
									+ '</li>')
						}
						$('#areaSecondLevel').html(array.join(''));
					} else
						alert(msg.msg);
				}
			});
}

var count = 1;
function selected(li) {
	/* if (count > 6) {
		alert("不能超过6个");
		return;
	} */
	var currentLabel = $(li).val();//判断是否重复 
	var flag = true;
	$("#selectedArea").find("span").each(function() {
		if ($(this).attr("value") == currentLabel) {
			alert("标签不可重复");
			flag = false;
		}
	});
	if (flag == true) {
		count = count + 1;
		$("#selectedArea")
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

var reg = new RegExp("^[0-9--]*$");
var reg1 = new RegExp("[\u4e00-\u9fa5]"); //中文 字母
var reg2 = new RegExp("[A-Za-z0-9\u0391-\uffe5]"); // 中文 字母 数字 

//标题名称 
	function titleOnBlur() {
		var title = $.trim($("#title").val());
		if ($.trim($('#title').val()).length==0) {
			$("#title_check").html("标题名称不能为空！");
		} else if ($.trim($("#title").val()).length > 20) {
			$("#title_check").html("长度不能超过20个字符!");
		} else {
			$("#title_check").html("");
		}
	}
//联系人电话 
function phoneOnBlur() {
	var phone = $.trim($("#phone").val());
	if ($.trim($('#phone').val()).length==0) {
		$("#phone_check").html("联系人电话不能为空！");
	} else if ($.trim($("#phone").val()).length > 20) {
		$("#phone_check").html("长度不能超过20个字符!");
	} else {
		$("#phone_check").html("");
	}
}
//请选择栏目
function serviceTypeOnBlur() {
	var serviceType = $.trim($("#serviceType").val());
	if ($.trim($('#serviceType').val())==-1) {
		$("#serviceType_check").html("请选择栏目！");
	} else {
		$("#serviceType_check").html("");
	}
}






//保存表单 
function saveServiceInfo() {
	//配送范围
	var areaLabelValue = "";
	$("#selectedArea").find("span").each(function() {
		areaLabelValue = areaLabelValue + $(this).attr("value") + ",";
	});
	$("#hiddenAreaId").val(areaLabelValue);
	//已选标签
	var labelValue = "";
	$("#selectLabel").find("span").each(function() {
		labelValue = labelValue + $(this).attr("value") + ",";
	});
	$("#thirdCategoryTag").val(labelValue);
	
	//提交表单
 var	data = $("#formDivId").serialize(); 
  $.ajax({
		type : "post",
		url : '${ctx}/servicelist!seveServicelist.action',
		dataType : 'json',
		 data :data,   
		timeout : 10000,
		success : function(msg, status) {
			if (msg.status == 200) {
			   alert("保存成功");
			   window.location.href = "${ctx}/pages/manager/ServiceList.jsp";
			} else{
			   alert("保存失败");				
			}
		}
	});  
}
	

</script>