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
<link rel="stylesheet" href="${ctx}/xheditor/common.css" type="text/css"
	media="screen" />
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

ul.ul-image li {
	width: 80px;
	height: 90px;
	float: left;
	list-style: none;
	margin: 10px;
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
					class="icon-home"></i> 主页</a> <a href="javascript:void(0)" onclick="window.history.go(-1)" title="发表话题"
					class="tip-bottom"><i class="icon-home"></i>话题维护</a> <a href="#"
					class="current">发表话题</a>
			</div>
			<h1>发表话题</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>发表话题</h5>
						</div>
						<h5 id="img_content">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话题图片：
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button id="uploadButton" class="btn btn-primary"
								style="background: #339999">浏&nbsp;&nbsp;&nbsp;览</button>
						</h5>
						<div
							style="margin-left: 100px; border: 1px solid #ccc; height: 140px; width: 700px;">
							<ul class="ul-image" id="ul-image">
								<c:forEach var="item" items="${topicImageList}"
									varStatus="index1">
									<li id="ul-image-${index1.index}">
										<div
											style="position: absolute; margin-left: 60px; margin-top: 2px;">
											<img src="${ctx}/images/lable_del.png"
												style="cursor: pointer;"
												onclick="removeTopicImage(${index1.index})" />
										</div> <span> <img id="topicImage${index1.index}"
											style="border: 1px solid #ccc;"
											src="${http_img}${item.filePath}" width="80" height="80" />
											<c:if
												test="${index1.index<5 && index1.index==fn:length(topicImageList)-1}">
												<span style="font-size: 12px; color: #9a9a9c;">还可以添加${6-fn:length(topicImageList)}</span>
											</c:if>
									</span>
									</li>
								</c:forEach>
							</ul>
						</div>
						
						<br />
						<hr>
						<br />
						<div class="widget-content nopadding">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label">话题名称：</label>
									<div class="controls">
										<input id="topicName" name="topicName" type="text"
											value="${topic.topic_name}" style="width: 586px;"
											onblur="nameOnBlur()" /> <span><font color="red"
											id="topicName_check"></font></span>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">话题摘要：</label>
									<div class="controls">
										<input id=TopicAbstract type="text" name="TopicAbstract"
											value="${topic.summary}" style="width: 586px;"
											onblur="TopicAbstractOnBlur()" /> <span><font
											color="red" id="TopicAbstract_check"> </font></span> <input
											id="updateTId" name="topicId" style="display: none;">
										<input id="TId" name="labelValue" style="display: none;">
										<input type="hidden" id=countId name="Imge">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">话题详情：</label>
									<div class="controls" style="height: 200px">
										<textarea name="info" class="shop_announcement"
											style="height: 180px; width: 602px;" id="content11">${topic.topic_content}</textarea>
										<span><font color="red" id="content_check"> </font></span>
									</div>
								</div>
								<br>
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话题标签：</h5>
								<hr>
								<table>
									<tr>
										<td></td>
										<td align="left" valign="bottom"
											style="height: 15px; font-size: 15px; padding: 10px;">标签一级分类选择：</td>
										<td align="left" valign="bottom"
											style="height: 15px; font-size: 15px; padding: 10px;">标签二级分类选择：</td>
										<td align="left" valign="bottom"
											style="height: 15px; font-size: 15px; padding: 10px;">标签三级分类选择：</td>
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
									<label class="control-label" style="height: 30px;">已选标签：</label>
									<input name="thirdCategoryTag" id="thirdCategoryTag"
										type="hidden">
									<div class="controls" id="choosenLabel" titie="labelstyle"
										style="height: 30px;">
										<c:forEach var="item" items="${tagList}">
											<span value="${item.tagId}">${item.tagName}</span>
											<a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>
										</c:forEach>
									</div>
								</div>

								<div class="form-actions">
									<c:if test="${empty topic}">
										<a class="btn btn-warning"
											style="margin: 10px 50px 40px 50px;" 
											onclick="saveTopicInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</a>
									</c:if>
									<c:if
										test="${not empty topic&&not empty topic.company_id&&topic.company_id==user.companyId}">
										<a class="btn btn-warning"
											style="margin: 10px 50px 40px 50px;" 
											onclick="saveTopicInfo()">保&nbsp;&nbsp;&nbsp;&nbsp;存</a>
									</c:if>

									<a class="btn btn-warning"
										style="margin: 10px 50px 40px 50px;"
										onclick=" window.history.go(-1);">返&nbsp;&nbsp;&nbsp;&nbsp;回</a>
								</div>
							</form>
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
	<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
	<script src="${ctx}/js/jquery.peity.min.js"></script>
	<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
	<script src="${ctx}/js/masked.js"></script>
	<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<script>
			$('.textarea_editor').wysihtml5();
		</script>
	<script src="${ctx}/js/jquery.pager.js"></script>
	<jsp:include page="/common/buttom.jsp"></jsp:include>
	<script type="text/javascript"
		src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
</body>
</html>

<script type="text/javascript">
if("${classic}"!="1" && "${classic}"!="0"){
	alert('参数错误!');
	window.history.go(-1);
}
var imge=null;
	$(function() {
		
		$(pageInit);
		function pageInit()
		{
			
			var str = "Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat";
			str +=",Align,List,Outdent,Indent,Link,Unlink,Anchor,Img,Flash,	Media,Hr,Emot,Table,Source,Preview";
			$('#content11').xheditor({tools:str,upLinkUrl:"${ctx}/common!uploadHtmlFile.action",upLinkExt:"word,pdf,zip,rar,txt",upImgUrl:"${ctx}/common!uploadHtmlFile.action",upImgExt:"jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG",upFlashUrl:"${ctx}/common!uploadHtmlFile.action",upFlashExt:"swf",upMediaUrl:"${ctx}/common!uploadHtmlFile.action",upMediaExt:"MP4,mp4,MP3,mp3,avi,AVI"});
			
		}
		
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
		
		// 创建AJAX方式上传文件
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload($uploadBtn, {
			action : '${ctx}/user!uploadImage.action',
			name : 'upfile',
			responseType : 'json',
			data:{type:4},//个人头像1企业所有图片2店铺所有图片3圈子图片4话题图片5活动图片6商品图片7广告图片8个人证件图片9二维码图片10其他图片11
			onChange: function (file, extension) {
          	  if($('#ul-image li').length>=6){
              	  alert('最多选择6张图片!');
              	  return false;
                }
           },
           onSubmit : function(file, ext) {
				ext=ext. toLowerCase(); //ext 文件后缀
				if(ext=='bmp'||ext=='jpg'||ext=='jpeg'||ext=='png'){

				}else{
					alert('图片格式不对');
					return false;
				}
			},
			onComplete : function(file, response) {
				if(response.status == 200){
          		  var index = $('#ul-image li').length;
          		  var info='';
          		  if(index<5){
          			  info = '<span  style="font-size:12px;color:#9a9a9c;">还可以添加'+(6-index-1)+'张</span>';
          		  }
          		  else{
          			  info = '<span  style="font-size:12px;color:#9a9a9c;"></span>';
          		  }
          		  changedFlag["img"]=true;
          		  $('#ul-image').append('<li id="ul-image-'+index+'">'+
          	          		'<div style="position:absolute;margin-left:60px;margin-top:2px;">'+
                      	    '<img src="${ctx}/images/lable_del.png" style="cursor:pointer;" onclick="removeTopicImage('+index+')"/>'+
                      	'</div>'+
                      	'<span>'+
                      	 '  <img id="topicImage'+index+'" style="border:1px solid #ccc;" src="${http_img}'+response.rows+'" width="80" height="80" />'+
                      	 info+
                      	'</span>'+
                    		'</li>');
          		  
          		  initImageInfo();
          		
          		  
          	  }else{
          		  alert(response.msg);
          	  }
			}
			
		});
		
		
	});
	
	var changedFlag={tag:false,img:false};
	function removeTopicImage(index){
		if("${topic.topic_id}"!=""){
			 $('#ul-image-'+index).remove();
			 initImageInfo();
			changedFlag["img"]=true;
			return;
		}
		$.ajax({
		     type: "POST",
		     url : '${ctx}/common!deleteUploadFile.action',
		     dataType:'json',
		     data:{upliadFilePath:$('#topicImage'+index).attr('src')},
		     success: function(msg,status){
		    	 if(msg.status == 200){
		    		
		    		 $('#ul-image-'+index).remove();
		    		 initImageInfo();
		    	 }	    		
		    	 else
		    		 alert(msg.msg);
		     }
		});

	}
	function initImageInfo(){
		 var length = $('#ul-image li').length;
		 if(length<=6){
			var span = $('#ul-image li');
			for(var index=1;index<=span.length;index++){
				if(index < length){
					$($(span[index-1]).find('span span')[0]).html('');
				}
				else{
					if(index<6)
						$($(span[index-1]).find('span span')[0]).html('还可以添加'+(6-length)+'张');
					else
						$($(span[index-1]).find('span span')[0]).html('');
				}
			}
		 }
		 
	}
	
	
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


	
	function selectLabelName(li) {
		if ($("#choosenLabel").find("span").length >= 6) {
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
			
			changedFlag["tag"]=true;
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
		changedFlag["tag"]=true;
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
										+ '">' + msg.rows[i]["Name"] + '</li>');
							}
							$('#Thirdshoptag').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	
	
	var reg = new RegExp("^[0-9--]*$");
	var reg1 = new RegExp("[\u4e00-\u9fa5]"); //中文 字母
	var reg2 = new RegExp("[A-Za-z0-9\u0391-\uffe5]"); // 中文 字母 数字 
	var reg4 = new RegExp("^[1-9]d*.d*|0.d*[1-9]d*$");//正浮点数 
	/*  var reg5 = new RegExp("[\u4e00-\u9fa5--,，]"); */

	//话题名称 
	function nameOnBlur() {
		var topicName = $.trim($("#topicName").val());
		if (topicName == "") {
			$("#topicName_check").html("不能为空！");
		} else if ($.trim($("#topicName").val()).length > 20) {
			$("#topicName_check").html("长度不能超过20个字符!");
		} else {
			$("#topicName_check").html("");
			var badChar = "`~!@#$%^&()-_=+]\\\\|:;\"\\\'<,>?*/";
			for ( var i = 0; i < topicName.length; i++) {
				//字符串str中的字符
				var c = topicName.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#topicName_check").html("只能为汉字，字母，和数字！");
				}
			}
		}
	}
	//话题摘要
	function TopicAbstractOnBlur() {
		var TopicAbstract = $.trim($("#TopicAbstract").val());
		if (TopicAbstract == "") {
			$("#TopicAbstract_check").html("不能为空！");
		} else if ($.trim($("#TopicAbstract").val().length) > 20) {
			$("#TopicAbstract_check").html("长度不能超过20个字符!");
		} else if (!reg2.test(TopicAbstract)) {
			$("#TopicAbstract_check").html("只能为汉字，字母！ ");
		} else {
			$("#TopicAbstract_check").html("");
			var badChar = "`~!@#$%^&()-_=+]\\\\|:;\"\\\'<,>?*/";
			for ( var i = 0; i < TopicAbstract.length; i++) {
				//字符串str中的字符
				var c = TopicAbstract.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#TopicAbstract_check").html("不能带有特殊符号！");
				}
			}
		}
	}

	//保存话题
	function saveTopicInfo() {
	
		var param={topicId:"${topic.topic_id}",circleId:"${circleId}",imgChanged:"0"};
		
		//话题名称
		var topicName = $.trim($("#topicName").val());
		if (topicName == "") {
			$("#topicName_check").html("不能为空！");
			return;
		} else if ($.trim($("#topicName").val()).length > 20) {
			$("#topicName_check").html("长度不能超过20个字符!");
			return;
		} else {
			$("#topicName_check").html("");
			var badChar = "`~!@#$%^&()-_=+]\\\\|:;\"\\\'<,>?*/";
			for ( var i = 0; i < topicName.length; i++) {
				//字符串str中的字符
				var c = topicName.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#topicName_check").html("只能为汉字，字母，和数字！");
					return;
				}
			}
		}
		param["title"]=topicName;
		
		//话题摘要
		var TopicAbstract = $.trim($("#TopicAbstract").val());
		if (TopicAbstract == "") {
			$("#TopicAbstract_check").html("不能为空！");
			return;
		} else if ($.trim($("#TopicAbstract").val().length) > 20) {
			$("#TopicAbstract_check").html("长度不能超过20个字符!");
			return;
		} else if (!reg2.test(TopicAbstract)) {
			$("#TopicAbstract_check").html("只能为汉字，字母！ ");
			return;
		} else {
			$("#TopicAbstract_check").html("");
			var badChar = "`~!@#$%^&()-_=+]\\\\|:;\"\\\'<,>?*/";
			for ( var i = 0; i < TopicAbstract.length; i++) {
				//字符串str中的字符
				var c = TopicAbstract.charAt(i);
				if (badChar.indexOf(c) > -1) {
					$("#TopicAbstract_check").html("不能带有特殊符号！");
					return;
				}
			}
		}
		param["summary"]=TopicAbstract;
		
		if($.trim($('#content11').val()).length==0){
			alert('需要填写内容!');
			return;
		}
		param["content"]=$.trim($('#content11').val());
		
		
		var arrayImage=[];
		$.each($('#ul-image li'),function(){
			var path = $(this).find('span img:last').attr('src');
			path=path.substr((path.lastIndexOf("${http_img}")+"${http_img}".length));
			arrayImage.push(path);
		});
		
		if(arrayImage.length>0){
			if("${topic.topic_id}"!="" && !changedFlag["img"]){
				$('#hiddenTopicImage').val("");
				param["topicImage"]="";
			}
			else{
				param["imgChanged"]="1";
				param["topicImage"]=arrayImage.join('####');
			}
			
		}
		else{
			if(changedFlag["img"]){
				param["imgChanged"]="1";
			}
			param["topicImage"]="";
		}
		
		var arrayTag = [];
		$("#choosenLabel").find("span").each(function() {
			arrayTag.push($(this).attr("value"));

		});
		if(arrayTag.length==0){
			alert('请选择标签!');
			return;
		}
		if("${topic.topic_id}" !="" && !changedFlag["tag"]){
			param["tagList"]="";
		}
		else{
			param["tagList"]=arrayTag.join(',');
		}
		param["classic"]="${classic}";
		$.ajax({
		    type: "POST",
		    url : '${ctx}/topic!saveTopic.action',
		    dataType:'json',
		    data:param,
		    success: function(msg,status){
		   		if(msg.status == 200){
		   			 if("${topic.topic_id}"!=""){
		   				 alert('修改成功!');
		   			 }
		   			 else{
		   				 alert('添加成功!');
		   			 }
		   			 window.history.go(-1);		   			
		   		}
		   		else{
		   			alert(msg.msg);
		   		}
		    }
		});
	}
	
</script>