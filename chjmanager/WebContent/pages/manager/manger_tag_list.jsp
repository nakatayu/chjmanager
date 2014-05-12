<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "chjservice" + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>标签列表</title>
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
<link rel="stylesheet" type="text/css"
	href="${ctx}/js/dialog/dialog_subModal.css" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>
<style type="text/css">
.titleSpan {
	font-size: 16px;
	font-weight: bold;
	font-family: '微软雅黑';
}

.firUpde {
	height: 120px;
	width: 280px;
	background-color: #FFF;
	padding: 20px 0 20px 40px;
	margin-left: 20px;
	display: block;
	z-index: 9999;
	border: 2px;
}

.secUpde {
	height: 120px;
	width: 280px;
	background-color: #FFF;
	padding: 20px 0 20px 40px;
	margin-left: 100px;
	display: block;
	z-index: 9999;
	border: 2px;
}

.a-style {
	font-weight: normal;
	font-family: '微软雅黑';
	cursor: pointer;
	font-size: 12px;
	text-shadow: none;
}

.btnbtn {
	padding: 0px;
	font-size: 16px;
	background-color: #f3f3ee;
	color: #000;
	font-family: '微软雅黑';
	padding: 2px 5px;
}
</style>

</head>
<body id="maintt">
	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>



	<div id="content">

		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"> <i
					class="icon-home"></i> 主页
				</a> <a href="#" class="current">标签列表</a>
			</div>
		</div>

		<div style="width: 1120px;">
			<div style="width: 300px; float: left;">

				<div class="container-fluid">
					<div class="row-fluid" style="width: 1000px;">
						<div class="span6" style="width: 980px;">
							<div class="widget-box">
								<div class="widget-title" style="padding: 10px 10px 0 20px;">
									<span class="titleSpan">一级标签列表：</span>
									<button class="btn label-warning" onclick="createNewTag(1)"
										style="float: right;">新增</button>
									<input type="text" id="newtag1" placeholder="新建分类"
										style="height: 20px; float: right;"
										onblur="ckeck_newTag(this)">

								</div>
								<div style="padding-top: 10px; height: 90px;">
									<ul id="chuTagList" class="thumbnails">

									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
			<div style="width: 1000px;">
				<div class="container-fluid">

					<div class="row-fluid">
						<div class="span6" style="width: 980px;">
							<div class="widget-box">
								<div class="widget-title" style="padding: 10px 10px 0 20px;">
									<span class="titleSpan">二级标签列表：</span><span id="nextName"
										style="color: red;"></span>
									<button class="btn label-warning" onclick="createNewTag(2)"
										style="float: right;">新增</button>
									<input type="text" id="newtag2" placeholder="新建分类"
										style="height: 20px; float: right;"
										onblur="ckeck_newTag(this)">

								</div>
								<div id="firstTag" style="padding-top: 10px; height: 120px;">
									<ul id="firstTagList" class="thumbnails">


									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>



			</div>
		</div>

		<div style="width: 1000px;">
			<div class="container-fluid">

				<div class="row-fluid">
					<div class="widget-box" style="width: 980px;">
						<div class="widget-title" style="padding: 10px 10px 0 20px;">
							<span class="titleSpan">三级标签列表：</span> <span id="nextNextName"
								style="color: red;"></span>
							<button class="btn label-warning" onclick="createNewTag(3)"
								style="float: right;">新增</button>
							<input type="text" id="newtag3" placeholder="新建分类"
								style="height: 20px; float: right;" onblur="ckeck_newTag(this)">
						</div>

						<div id="sectag" style="padding-top: 10px; height: 300px;">
							<ul id="sectaglist" class="thumbnails">


							</ul>
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
</body>
</html>
<script type="text/javascript">
	var firstTagId = 0;
	var secondTagId = 0;

	$(function() {
		findTags(0);
	});

	function findTags(tagId) {

		$
				.ajax({
					type : "POST",
					url : '${ctx}/tag!findTagList.action',
					dataType : 'json',
					data : {
						tagParentId : 0
					},
					success : function(msg, status) {
						if (msg.status == 200) {
							var str = '';
							for ( var i = 0; i < msg.rows.length; i++) {
								data = msg.rows[i];
								str += '<li style="padding-right: 5px;">'
										+ '<span class="label" style="background-color: #FFFFFF;padding: 0px;font-size: 18px;">'
										+ '<button onclick="findNextTags('
										+ data["tag_id"]
										+ ')" class="btn btnbtn">'
										+ data["tag_name"]
										+ '</button>'
										+ '<a title="修改" onclick="updateTheTag('
										+ data["tag_id"]
										+ ',1)" class="a-style">[改]</a>'
										+ '<a title="删除" onclick="deleteTheTag('
										+ data["tag_id"]
										+ ',1)" class="a-style">[删]</a></span>'
										+ '<input type="hidden" id="tagName'+data["tag_id"]+'" name="tagId" value="'+data["tag_name"]+'">'
										+ '<input type="hidden" id="tagId'+data["tag_id"]+'" name="tagId" value="'+data["tag_id"]+'">'
										+ '</li>';
							}
							$('#chuTagList').html(str);
							findNextTags(msg.rows[0]["tag_id"]);

						} else {
							alert(msg.msg);
						}
					}
				});
	}

	function findNextTags(tagId) {
		firstTagId = tagId;
		$('#nextName').html('属于：' + $('#tagName' + tagId).val());
		$
				.ajax({
					type : "POST",
					url : '${ctx}/tag!findTagList.action',
					dataType : 'json',
					data : {
						tagParentId : tagId
					},
					success : function(msg, status) {
						if (msg.status == 200) {
							var str = '';
							for ( var i = 0; i < msg.rows.length; i++) {
								data = msg.rows[i];
								str += '<li style="padding-right: 5px;font-weight: lighter;font-family: \'微软雅黑\';">'
										+ '<span class="label" style="background-color: #FFFFFF;padding: 0px;font-size: 18px;">'
										+ '<button onclick="findNextNextTags('
										+ data["tag_id"]
										+ ')" class="btn btnbtn">'
										+ data["tag_name"]
										+ '</button>'
										+ '<a title="修改" onclick="updateTheTag('
										+ data["tag_id"]
										+ ',2)" class="a-style">[改]</a>'
										+ '<a title="删除" onclick="deleteTheTag('
										+ data["tag_id"]
										+ ',2)" class="a-style">[删]</a></span>'
										+ '<input type="hidden" id="tagName'+data["tag_id"]+'" name="tagId" value="'+data["tag_name"]+'">'
										+ '<input type="hidden" id="tagId'+data["tag_id"]+'" name="tagId" value="'+data["tag_id"]+'">'
										+ '</li>';
							}
							$('#firstTagList').html(str);
							findNextNextTags(msg.rows[0]["tag_id"]);

						} else {
							alert(msg.msg);
						}
					}
				});
	}

	function findNextNextTags(tagId) {
		secondTagId = tagId;
		$('#nextNextName').html('属于：' + $('#tagName' + tagId).val());
		$
				.ajax({
					type : "POST",
					url : '${ctx}/tag!findTagList.action',
					dataType : 'json',
					data : {
						tagParentId : tagId
					},
					success : function(msg, status) {
						if (msg.status == 200) {
							var str = '';
							for ( var i = 0; i < msg.rows.length; i++) {
								data = msg.rows[i];
								str += '<li style="padding-right: 5px;">'
										+ '<span class="label" style="background-color: #FFFFFF;padding: 0px;font-size: 18px;">'
										+ '<button class="btn btnbtn">'
										+ data["tag_name"]
										+ '</button>'
										+ '<a title="修改" onclick="updateTheTag('
										+ data["tag_id"]
										+ ',3)" class="a-style">[修改]</a>'
										+ '<a title="删除" onclick="deleteTheTag('
										+ data["tag_id"]
										+ ',3)" class="a-style">[删除]</a></span>'
										+ '<input type="hidden" id="tagName'+data["tag_id"]+'" name="tagId" value="'+data["tag_name"]+'">'
										+ '<input type="hidden" id="tagId'+data["tag_id"]+'" name="tagId" value="'+data["tag_id"]+'">'
										+ '</li>';
							}
							$('#sectaglist').html(str);

						} else {
							alert(msg.msg);
						}
					}
				});
	}

	function ckeck_newTag(obj) {
		var name = $.trim($(obj).val());
		if (name == '' || name.length > 10) {
			alert("名称不为空且长度应小于10!");
			$(obj).val('');
		}
	}

	function createNewTag(con) {
		var name = $.trim($('#newtag' + con).val());
		alert(name);
		if (name == '' || name.length > 10) {
			alert("名称不为空且长度应小于10!");
			return;
		}
		var parentId = 0;
		if (con == 2) {
			parentId = firstTagId;
		} else if (con == 3) {
			parentId = secondTagId;
		}
		$.ajax({
			type : "POST",
			url : '${ctx}/tag!updateTheTagList.action',
			dataType : 'json',
			data : {
				tagId : parentId,
				tagName : name,
				fthod : 1
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("新增成功！");
					$('#newtag' + con).val('');
					if (con == 2) {
						findNextTags(parentId);
					} else if (con == 3) {
						findNextNextTags(parentId);
					} else
						window.location.reload();
				} else {
					alert(msg.msg);
				}
			}
		});
	}

	function deleteTheTag(tagId, con) {
		if (con == 2) {
			findNextNextTags(tagId);
		} else if (con == 1) {
			findNextTags(tagId);
		}
		var name = $.trim($('#tagName' + tagId).val());
		if (confirm("你确定要删除" + name + "标签及它的子标签吗？")) {

			$.ajax({
				type : "POST",
				url : '${ctx}/tag!updateTheTagList.action',
				dataType : 'json',
				data : {
					tagId : tagId,
					tagName : name,
					fthod : 3
				},
				success : function(msg, status) {
					if (msg.status == 200) {
						alert('删除成功！');
						if (con == 2) {
							findNextTags(firstTagId);
						} else if (con == 3) {
							findNextNextTags(secondTagId);
						} else
							window.location.reload();
					} else {
						alert(msg.msg);
					}
				}
			});
		}
	}

	var con = '';
	function updateTheTag(tagId, n) {
		con = n;
		var name = $.trim($('#tagName' + tagId).val());
		name = encodeURIComponent(name);
		showPopWin('标签修改', '${ctx}/pages/manager/manger_tagupdate.jsp?tagName='
				+ name + '&tagId=' + tagId, 350, 230, oncptuuj);

	}
	oncptuuj = function() {
		if (con == 2) {
			findNextTags(firstTagId);
		} else if (con == 3) {
			findNextNextTags(secondTagId);
		} else
			window.location.reload();
	}
</script>
