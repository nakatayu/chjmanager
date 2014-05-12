
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>版本管理</title>
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
<link rel="stylesheet" href="${ctx}/css/pager.css" />
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
	filter: alpha(opacity =80);
}

.white_content {
	display: none;
	position: fixed;
	top: 30%;
	left: 35%;
	width: 350px;
	height: 300px;
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
				</a> <a href="#" class="current">app版本管理</a>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"><i class="icon-th"></i></span>
						<h5>app版本管理</h5>
					</div>

					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>类型</th>
									<th>下载地址</th>
									<th>版本号</th>
									<th>是否强制更新</th>
								</tr>
							</thead>
							<tbody id="table_content">								
							</tbody>
						</table>
						<div class="widget-title"
							style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
							<div class="pagination alternate"
								style="margin-left: 0px; margin-top: 8px; float: left;"></div>
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
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<script src="${ctx}/js/mypage.js"></script>
	<script src="${ctx}/js/jquery.pager.js"></script>
	<div id="dialog_div" class="white_content"
		style="padding: 30px 0px 0px 30px;">
		
		<div style="width: 100%;font-size: 20px;">
		<center><h4>App版本修改</h4></center>
		<br />
		<p><label style="margin-left: 43px;">版本号：<input id="version" /></label></p>
		<p><label id="updtype"></label></p>
		<p><label>版本下载地址：<textarea cols="10" rows="2" id="appUrl"></textarea></label></p>
		</div>
		<div>
		<a class="btn btn-warning" style="margin: 5px 30px 20px 30px;"
						onclick="saveDialog()">保&nbsp;&nbsp;&nbsp;&nbsp;存</a>
		<a class="btn btn-warning" style="margin: 5px 30px 20px 30px;"
						onclick="closeDialog()">关&nbsp;&nbsp;&nbsp;&nbsp;闭</a>
			 
	</div></div>
	<div id="dialog_black" class="black_overlay"></div>
	
</body>
</html>

<script type="text/javascript">
	//加载已经选择推广类型	
	var appType = [ "iphone", "android", "winphone" ];

	$(function() {
		$.ajax({
			type : "post",
			url : '${ctx}/common!findNewVersion.action',
			dataType : 'json',
			success : function(msg, status) {
				var array = [];
				if (msg.status == 200) {
					for ( var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];
						array.push('<tr style="cursor:pointer;text-align:center;" onclick="updappVersion(this,'+data["type"]+')">');
						array
								.push('<td>' + appType[data["type"] - 1]
										+ '</td>');
						array.push('<td>' + data["url"] + '</td>');
						array.push('<td>' + data["versionNo"] + '</td>');
						array.push('<td>'
								+ (data["isUpdate"] == 'T' ? '是' : '否')
								+ '</td>');
						array.push('</tr>');
					}
					$('#table_content').html(array.join(''));
				}else{
					alert(msg.msg);
				}
			}
		});
	});
	var Notype='';
	function updappVersion(obj,Notp){
		Notype=Notp;
		$(obj).find('td').each(function(k,v){
			if(k==1){
				$('#appUrl').val($(v).html());
			}else if(k==2){
				$('#version').val($(v).html());
			}else if(k==3){
				var str='是否强制更新：';				
				var ttp=$(v).html()=='是'?'checked="checked"':'';
				var ftp=$(v).html()=='是'?'':'checked="checked"';
				str+='<input name="updtype" type="radio" value="T"'+ttp+'/>是';
				str+='<input name="updtype" type="radio" value="F" '+ftp+' style="margin-left:30px;"/>否';								
				$('#updtype').html(str);
			}			
		});
		
		
		document.getElementById('dialog_div').style.display = 'block';
		document.getElementById('dialog_black').style.display = 'block';
	}
	//关闭遮罩层
	function closeDialog() {
		document.getElementById('dialog_black').style.display = 'none';
		document.getElementById('dialog_div').style.display = 'none';
	}
	function saveDialog(){
		var data={};
		data["updtype"]=$.trim($('input:radio[name="updtype"]:checked').val());
		data["version"]=$.trim($('#version').val());
		data["appUrl"]=$.trim($('#appUrl').val());
		data["Notype"]=Notype;
				
		$.ajax({
			type : "post",
			url : '${ctx}/common!updateAppVersion.action',
			dataType : 'json',
			data : data,
			success : function(msg, status) {
				if(msg.status==200){
					alert('修改成功！');					
					location.reload();
				}else{
					alert(msg.msg);
				}			
			}
		});
	}

</script>
