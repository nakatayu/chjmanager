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
<script type="text/javascript" src="/chjmanager/js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<link rel="stylesheet" href="${ctx}/xheditor/common.css" media="screen" />
<style type="text/css">
#a1 {
	background-color: skyblue
}
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

[titie~=labelstyle] {
	font-size: 20px;
}

</style>
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>


	<div id="content" class="form-horizontal">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a>
					<a href="${ctx}/pages/manager/companyInfoManager.jsp" title="企业列表" class="current">
				 <i class=" icon-fire"></i>企业列表</a> 	
					<a href="#" class="current">企业信息维护</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>企业信息维护</h5>
						</div>

						<div class="widget-content nopadding">

								<h5>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									基本信息</h5>
								<hr />
								<table width="100%">
									<tr>
										<td>
												<div class="control-group">
													<label class="control-label">企业名称：</label>
													<div class="controls">
														<input type="text" id="name" name="name"  value="${company.name}"
															style="width: 250px;" onblur="nameOnBlur()" /> <span><font
															color="red" id="name_check"> </font></span>
													</div>
												</div>
										</td>
										
										
										<td rowspan="6" >
											<div
												style="width: 290px; height: 170px; margin: 10px 0 0 0px; border: 1px solid #ccc; float: center;">
												<img style="width: 290px; height: 170px;" id="imgCompany"
												src="${http_img}${company.logo}" />
												<input type="hidden" id="uploadUrl" name="logo"> <br />
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;<br /> <br /> <br />
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;
												
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											<div>
											   <span style="margin: 0px 0 0 30px;"><font color="red" >图片上传尺寸：290*170px 限制上传：150KB</font></span>
											</div>
											<div  style="padding-left:50px">
											   <button  id="uploadButton" class="btn btn-primary"
													style="background: #339999">浏&nbsp;&nbsp;&nbsp;&nbsp;览</button>
											</div>											
										</td>
																		
									</tr>
									<tr>
										<td>
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">企业地址：</label>
													<div class="controls">
														<input type="text" id="address" name="address"  value="${company.address}"
														onblur="addressOnBlur()" 	style="width: 250px;" />
															<span ><font color="red"  id="address_check"> </font></span>
													</div>
												</div>
											</div>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>
												<div class="control-group">
													<label class="control-label">企业邮箱：</label>
													<div class="controls">
														<input type="text" id="email" name="email" value="${company.email}"
															style="width: 250px;" />
														<!-- <span ><font color="red"  id="email_check"> </font></span>	 -->
													</div>
												</div>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">注册时间：</label>
													<div class="controls">
														<input style="width: 250px" type="text" id="registDate"  value="${company.registDate}"
															name="registDate" class="Wdate"
															onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" />
													</div>
												</div>
											</div>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">联系人：</label>
													<div class="controls">
														<input type="text" id="linkman" name="linkman"  value="${company.linkman}"
															style="width: 250px;" /> <span><font color="red"
															id="logo_check"> </font></span>
													</div>
												</div>
											</div>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">联系电话：</label>
													<div class="controls">
														<input type="text" id="linkmanTel" name="linkmanTel"  value="${company.linkmanTel}"
															style="width: 250px;" /> <span><font color="red"
															id="linkmanTel_check"> </font></span>
													</div>
												</div>
											</div>
										</td>
										<td></td>
									</tr>

   								<tr>
										<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">企业类型：</label>
														<div class="controls">
															<select id="companyType" name="companyType"  value="${company.companyType}"
																style="width: 262px;"  onclick="companyType(this)">
															</select>
														</div>	
												</div>
											</div>
										</td>
										<td></td>
									</tr>  
									<tr>
										<td>
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">经营范围：</label>
													<div class="controls">
														<input type="text" id="operateScope" name="operateScope"   value="${company.operateScope}"
															style="width: 250px;" />
													</div>
												</div>
											</div>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">企业网址：</label>
													<div class="controls">
														<input type="text" id="companyURL" name="companyURL" value="${company.companyURL}"
															style="width: 250px;" />
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div id="form-wizard-1" class="step">
												<div class="control-group">
													<label class="control-label">企业信息：</label>
													<div class="controls">
														<textarea id="companyInfo" name="companyInfo" 
															style="width: 720px; height: 200px">${company.companyInfo}</textarea>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
								<table>
									<h5>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
										&nbsp; 企业标签</h5>
									<hr />
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
											<div class="control-group" style="height: 68px;">
											<div class="control-group">
									<label class="control-label" style="height: 30px;">已选标签：</label>
									<div class="controls"   id="choosenLabel"  titie="labelstyle"  style="height: 30px;">
														 <c:forEach items="${companyTag }" var="tag">
															<span value="${tag.tag_id}">${tag.tag_name}</span>
															<a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>
														</c:forEach>
									</div>
								</div>
									<div>
										 <input	name="companyId" id="companyId" type="hidden">
                                         <input	name="tagid" id="tagid" type="hidden">
									</table>
									<div class="form-actions">
										<button class="btn btn-warning" type="button"
											class="btn btn-success" onclick="saveCompany()">确认保存</button>
									</div>
							</form>
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
	<script src="${ctx}/js/jquery.validate.js"></script>
	<script src="${ctx}/js/matrix.js"></script>
	<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
	<script src="${ctx}/js/jquery.peity.min.js"></script>
	<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
	<script src="${ctx}/js/masked.js"></script> 
    <script src="${ctx}/js/jquery.toggle.buttons.html"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script> 
	<script src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
	<script>
		$('.textarea_editor').wysihtml5();
	</script>
<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">
var companyId = <%=request.getParameter("companyId")%>;
$("#companyId").val(companyId);

	$(function() {
		
		var str = "Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,";
		str += "BackColor,SelectAll,Removeformat,Align,Source,Preview";
		$('#companyInfo').xheditor({
			tools : str
		});
		
		// 企业类型 下拉框 
		$.ajax({
			type : "post",
			url : '${ctx}/companyinfomanager!findCompanyType.action',
			dataType : 'json',
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					var array = [];
					for ( var i = 0; i < msg.rows.length; i++) {
						array.push('<option    class="tag_content"');
						array.push('	 value="' + msg.rows[i]["name"] + '">'
								+ msg.rows[i]["name"] + '</option>');
					}
					$('#companyType').html(array.join(''));
					$('#companyType').val("${company.companyType}");
					$("#uploadUrl").val("${company.logo}" );
				} else
					alert(msg.msg);
			}
		});
		
		// 创建AJAX方式上传文件
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload($uploadBtn,
				{
					action : '${ctx}/user!uploadImage.action',
					name : 'upfile',
					responseType : 'json',
					data:{type:2},//个人头像1企业所有图片2店铺所有图片3圈子图片4话题图片5活动图片6商品图片7广告图片8个人证件图片9二维码图片10其他图片11
					onSubmit : function(file, ext) {//ext 文件后缀
					},
					onComplete : function(file, response) {
						if (response.status == 200) {
							$("#uploadUrl").val(response.rows);
							$("#imgCompany").attr("src",
									"${http_img}" + response.rows);
						} else {
							alert(response.msg);
						}
					}
				});
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
											.push('<li class="tag_content"	onclick="selected(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
									array.push('	 value="' + msg.rows[i]["tagId"]
											+ '">' + msg.rows[i]["tagName"]
											+ '</li>');
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
		$(li).prev().remove();
		$(li).remove();
	}

	//企业名称 
	function nameOnBlur() {
		var name = $.trim($("#name").val());
		if (name == "") {
			$("#name_check").html("不能为空！");
		} else if ($.trim($("#name").val().length) > 30) {
			$("#name_check").html("长度不能超过30个字符!");
		} else {
			$("#name_check").html("");
		}
	}
	//企业地址 
	function addressOnBlur() {
		var address = $.trim($("#address").val());
		if (address == "") {
			$("#address_check").html("不能为空！");
		} else if ($.trim($("#address").val().length) > 30) {
			$("#address_check").html("长度不能超过30个字符!");
		} else {
			$("#address_check").html("");
		}
	}
	//联系人电话 
	var reg = new RegExp("^[0-9--]*$");
	function linkmanTelOnBlur() {
		var linkmanTel = $.trim($("#linkmanTel").val());
	   if (!reg.test(linkmanTel)) {
			$("#linkmanTel_check").html("只能为数字!");
		} else if ($.trim($("#linkmanTel").val().length) > 15) {
			$("#linkmanTel_check").html("长度不能超过15个字符!");
		} else {
			$("#linkmanTel_check").html("");
		}
	}
	//确认保存 
	function saveCompany() {
		flag=true;
		var name = $.trim($("#name").val());//企业名称
		if (name == "" ) {
			$("#name_check").html("不能为空！");
			flag = false;
		} 
		var address = $.trim($("#address").val());//企业地址
		if(address == ""){
			$("#address_check").html("不能为空！");
			flag = false;
		}
		var linkmanTel = $.trim($("#linkmanTel").val());//联系电话
	    if (!reg.test(linkmanTel)) {
			$("#linkmanTel_check").html("只能为数字!");
				flag = false;
		 } else if ($.trim($("#linkmanTel").val().length) > 15) {
			$("#linkmanTel_check").html("长度不能超过15个字符!");
				flag = false;
		 } 
		if(flag != false){
			var labelValue = "";
			$("#choosenLabel").find("span").each(function() {
				labelValue = labelValue + $(this).attr("value") + ",";
			});
			$('#tagid').val(labelValue);
		 

			//上传文件判断 
			var a = document.getElementById("uploadUrl").value;
			if(a==null||a==""){
			alert("请选择上传的图片!");
			return;
			}
			var data={};
		   data["companyId"]=$("#companyId").val();
		   data["name"]=$("#name").val();
		   data["email"]=$("#email").val();
		   data["linkman"]=$("#linkman").val();
		   data["linkmanTel"]=$("#linkmanTel").val();
		   data["address"]=$("#address").val();
		   data["companyInfo"]=$("#companyInfo").val();
		   data["companyURL"]=$("#companyURL").val();
		   data["registDate"]=$("#registDate").val();
		   data["companyType"]=$("#companyType").val();
		   data["operateScope"]=$("#operateScope").val();
		   data["logo"]=$("#uploadUrl").val();
		   data["type"]=$("#type").val();
		   data["tagid"]=$("#tagid").val();

			  $.ajax({
					type : "post",
				    url : '${ctx}/companyinfomanager!updateCompanyInfo.action',
				    dataType : 'json',
				    data :data,
				    success : function(msg, status) {
					if (msg.status == 200) {
						alert("修改成功!");
						window.history.go(-1);
					} else {
						alert("修改失败!");
					}
				}
			});
		}
	}
</script>
