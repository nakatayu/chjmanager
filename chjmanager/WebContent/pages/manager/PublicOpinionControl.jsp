<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="/common/checklogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>过滤关键词</title>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css"/>
	<link rel="stylesheet" href="${ctx}/css/uniform.css"/>
	<link rel="stylesheet" href="${ctx}/css/select2.css"/>
	<link rel="stylesheet" href="${ctx}/css/matrix-style.css"/>
	<link rel="stylesheet" href="${ctx}/css/matrix-media.css"/>
	<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet"/>
	<link
			href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
			rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="${ctx}/css/colorpicker.css"/>
	<link rel="stylesheet" href="${ctx}/css/datepicker.css"/>
	<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css"/>
	<link href="font-awesome/css/font-awesome.css" rel="stylesheet"/>
	<link rel="stylesheet" href="${ctx}/css/pager.css" />
</head>
<body>

<jsp:include page="/common/head.jsp"></jsp:include>
<jsp:include page="/common/leftmenue.jsp"></jsp:include>

<div id="content">

	<div id="content-header">
		<div id="breadcrumb">
			<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">过滤关键词</a>
		</div>
	</div>

	<div id="myAlert" class="modal hide">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">×</button>
			<h3>新增过滤关键词</h3>
		</div>
		<div class="modal-body">
			<input id="addControlName" name="addControlName" type="text"/>

		</div>
		<div class="modal-footer"><a data-dismiss="modal" class="btn btn-primary" href="#"
		                             onclick="addControl()">确认添加</a> <a data-dismiss="modal" class="btn" href="#">取消</a>
		</div>
	</div>

	<div id="myAlert2" class="modal hide">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">×</button>
			<h3>修改过滤关键词</h3>
		</div>
		<div class="modal-body">
			<input id=updateControlId name="updateControlId" type="hidden"/>
			<input id=updateControlName name="updateControlName" type="text"/>
		</div>
		<div class="modal-footer"><a data-dismiss="modal" class="btn btn-primary" href="#" onclick="updateControl()">确认修改</a>
			<a onclick="$('#myAlert2').hide()" data-dismiss="modal" class="btn" href="javascript:void(0)">取消</a></div>
	</div>


	<div class="container-fluid">
		<div class="row-fluid">
			<div class="widget-box" style="margin-bottom: 0px;">
				<div class="widget-title">
					<span class="icon"><i class="icon-th"></i></span>
					<h5>过滤关键词</h5>
				</div>

				<table class="table table-bordered table-striped">
									<div class="widget-content nopadding">
										<div class="container-fluid">
										<input type="hidden" id="controlId1" name="controlId1"/>
										<thead>
										<tr>
											<th style="width:7%"><input type="checkbox"/> 全选</th>
											<th>屏蔽关键词名称</th>
											<th>创建时间</th>
										</tr>
										</thead>
										<tbody id="table_content"></tbody>
							</table>
							<div class="widget-title"
									style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
									<div class="btn-group" style="margin-top: 6px; float: right;">
										<button class="btn" id="pagesize">10</button>
										<button data-toggle="dropdown" class="btn dropdown-toggle">
											<span class="caret" style="height: 6px;"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="javascript:void(0)"
												onclick="loadData(1,10)">10</a></li>
											<li class="divider"></li>
											<li><a href="javascript:void(0)"
												onclick="loadData(1,20)">20</a></li>
											<li class="divider"></li>
											<li><a href="javascript:void(0)"
												onclick="loadData(1,50)">50</a></li>
											<li class="divider"></li>
											<li><a href="javascript:void(0)"
												onclick="loadData(1,100)">100</a></li>
										</ul>
									</div>
									<div class="pagination alternate"
										style="margin-left: 30px; margin-top: 8px; float: right;">
										<ul id="pager">
										</ul>
									</div>
								</div>
							
							
							<div class="widget-title"
							     style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
								<div class="pagination alternate"
								     style="margin-left: 0px; margin-top: 8px; float: left;">
									<a href="#myAlert" data-toggle="modal" class="btn btn-warning">新&nbsp;&nbsp;&nbsp;&nbsp;增</a>

									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-warning" onclick="deleteControl(this)">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="uploadButton" class="btn btn-warning">导入关键字</button>
								</div>
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
<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
<script src="${ctx}/js/matrix.tables.js"></script>
<script src="${ctx}/js/myself/ajaxupload.js"></script>
<script src="${ctx}/js/mypage.js"></script>
<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
<script src="${ctx}/js/jquery.peity.min.js"></script>
<script src="${ctx}/js/jquery.pager.js"></script>
<script>
	$('.textarea_editor').wysihtml5();
</script>

</body>
</html>

<script type="text/javascript">
var listData = [];

	$(function (){
		loadData(1);
		
		var $uploadBtn = $("#uploadButton");
		new AjaxUpload($uploadBtn, {
			action : '${ctx}/advertisement!importControlfromExcel.action',
			name : 'upfile',
			responseType : 'json',
			onSubmit : function(file, ext) {
				ext=ext. toLowerCase(); //ext 文件后缀
				if(ext=='xls'||ext=='xlsx'){

				}else{
					alert('文件格式不对');
					return false;
				}
			},
			onComplete : function(file, response) {
				alert(response.msg)
			}
		});
		
	});


	function loadData(page, size) {
			if (size != undefined) {
				pageinfo["size"] = size;
				$('#pagesize').html(size);
			}
			if (page == -1)
				pageinfo["page"]--;
			else if (page == -2)
				pageinfo["page"]++;
			else {
				if (page >= pageinfo["tp"] && pageinfo["tp"] > 0)
					pageinfo["page"] = pageinfo["tp"];
				else
					pageinfo["page"] = page;
			}
		$.ajax({
			type: "post",
			url: '${ctx}/advertisement!selectControl.action',
			dataType: 'json',
			data : pageinfo,
			success: function (msg, status) {
				var array = [];
				if (msg.status == 200) {
					for (var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];
						array.push('<tr>');
						array.push('<td>' + '<input type="checkbox" value="' + data["control_id"] + '"/>' + '</td>');
						array.push('<td>' + '<a href="javascript:void(0)" onclick="show_dialog(' + data["control_id"] + ',\'' + data["control_name"] + '\')" >' + data["control_name"] + '</td>');
						array.push('<td>' + '<a href="javascript:void(0)" >' + data["create_time"] + '</td>');
						array.push('</tr>');
					}
					$('#table_content').html(array.join(''));
					
					if(msg.total>pageinfo["size"]){
						if(msg.total%pageinfo["size"]==0)
			    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
			    	 else
			    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
			    	 $("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
			    	
					}else{
						$('#pager').html('');	
					}					
				} else {
					$('#pager').html('');	
					$('#table_content').html('<tr><td colspan="5">'+msg.msg+'</td></tr>');
				}
			}
		});
	}
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    loadData(pageclickednumber);
	}
	
	$(document).ready(function () {
		initInfo();
	});
	function show_dialog(id, name) {
		$("#updateControlId").val(id);
		$("#updateControlName").val(name);
		$('#myAlert2').show();
	}
	//增加关键词
	function addControl() {
		var a = document.getElementById("addControlName").value;
		if (a == null || a == "") {
			alert("关键词不能为空");
			return;
		}
		var data = {};
		data["addControlName"] = $("#addControlName").val();
		$.ajax({
			type: "post",
			url: '${ctx}/advertisement!addControl.action',
			dataType: 'json',
			data: data,

			success: function (msg, status) {
				if (msg.status == 200) {
					alert("保存成功");
				}
			}});
	}

	//修改关键词
	function updateControl() {

		var a = document.getElementById("updateControlName").value;
		if (a == null || a == "") {
			alert("关键词不能为空");
			return;
		}
		var data = {};
		data["addControlName"] = $("#updateControlName").val();
		data["controlId"] = $("#updateControlId").val();
		$.ajax({
			type: "post",
			url: '${ctx}/advertisement!updateControl.action',
			dataType: 'json',
			data: data,

			success: function (msg, status) {
				if (msg.status == 200) {

					alert("保存成功");
					$('#myAlert2').hide();
				}
			}});
	}

	//删除关键词
	function deleteControl() {
		if (confirm("您确认删除此记录吗？")) {
			if ($("#table_content").parent().find("input[type=checkbox]:checked").size() == 0) {
				alert("请选择需要删除的记录！");
				return;
			} else {
				var label = "";
				$("#table_content").parent().find(
								"input[type=checkbox]:checked").each(function () {
							label = label + $(this).attr("value") + ",";
						});
				$.ajax({
					type: "post",
					url: '${ctx}/advertisement!deleteControl.action',
					dataType: 'json',
					data: {
						controlId1: label
					},
					success: function (msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							document.location.reload();//加载当前页面
						}
					}
				});
			}
		}
	}

</script>	
