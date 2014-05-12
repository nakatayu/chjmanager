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

<link rel="stylesheet" type="text/css"
	href="${ctx}/js/dialog/dialog_subModal.css" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<style type="text/css">
.dataTables_filter {
	top: 0
}

.select2-container {
	width: 130px;
	top: 4px;
	left: 4px;
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
				</a> <a href="#" class="current">圈子等级维护</a>
			</div>
		</div>

		<div class="container-fluid">

			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped ">
								<thead>
									<tr>
										<th width="8%">全选<input type="checkbox"></th>
										<th width="10%">级别</th>
										<th width="10%">人数上限</th>
										<th width="72%">信息描述</th>
									</tr>
								</thead>

								<tbody id="table_content">

								</tbody>
							</table>
						</div>
						 <div class="widget-title"
							style="height: 40px; border: 1px solid #ccc; padding: 4px 0 4px 5px;">

							<div class="btn-group" style="float: left;">

								<button class="btn btn-warning" style="margin: 0 5px 0 5px;"
									onclick="addNewLevel(1)">新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增</button>
								<button class="btn btn-warning" style="margin: 0 5px 0 5px;"
									onclick="addNewLevel(2)">修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改</button>
							</div>
						</div>
						
						
						<div id="circleLevel" style="display: none;">
						 <div class="widget-content"
							style="border: 1px solid #ccc;padding: 10px 200px 20px 200px;font-size: 16px;font-weight: bold;">
							
							
							<table class="table table-bordered">
							<caption id="totile" style="font-size: 20px;margin: 10px;">新建圈子</caption>
							<tr valign="middle" align="center"><td width="20%">人数上限:</td>
							<td width="40%"><input type="text" id="userNum"/></td>
							<td align="center" width="40%">
							<button class="btn btn-warning" onclick="updcirclelevel(1)">保&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</button>
							<button class="btn btn-warning" style="margin-left: 20px;" onclick="updcirclelevel(0)">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</button>
							
							</td></tr>
							<tr><td valign="middle">信息描述:</td><td colspan="2">
							<textarea id="levelInfo" rows="5" style="width: 500px;overflow: hidden;"></textarea>
							</td>
							</tr>						
							</table>
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
	<script src="${ctx}/js/myself/ajaxupload.js"></script>

	<script src="${ctx}/js/mypage.js"></script>
</body>
</html>
<script type="text/javascript">

var level=["","一级","二级","三级","四级","五级","六级","七级"];

$(function() {
	$.ajax({
		type : "post",
		url : '${ctx}/circle!findCircleLevelt.action',
		dataType : 'json',
		data : pageinfo,
		success : function(msg, status) {
			
			if (msg.status == 200) {
				var str='';
				for ( var i = 0; i < msg.rows.length; i++) {
					var data = msg.rows[i];
					str+='<tr id="level'+data["type"]+'">';
					str+='<td><input type="checkbox" value="' + data["type"]+ '" name="levelBoc"/></td>';
					str+='<td>'+level[data["type"]]+'</td>';
					str+='<td>'+data["num"]+'</td>';
					str+='<td>'+data["info"]+'</td>';
					str+='</tr>';
				}
				$('#table_content').html(str);				 
			} else {				
				$('#table_content').html('<tr><td colspan="5">'+msg.msg+'</td></tr>');
			}
		}
	});
});

var array=[];
function addNewLevel(num){
	if(num==1){
		array=[];
		$('#totile').html('圈子级别新增');
		$('#userNum').val('');
		$('#levelInfo').val('');
	}else if(num==2){
		array=[];
		$('input[name="levelBoc"]:checked').each(function(){ 
		    if($(this).attr("checked")){
		        array.push($(this).val());
		    }
		});
		if(array.length==0){
			alert('请选择修改对象!');
			return;
		}
		else if(array.length>1){
			alert('每次只能修改一条!');
			return;
		}
		var level=$('#level'+array[0]).find('td').eq(1).html();
		$('#level'+array[0]).find('td').eq(2).html();
		$('#level'+array[0]).find('td').eq(3).html();	
		$('#totile').html(''+level+'圈子级别修改');
		$('#userNum').val($('#level'+array[0]).find('td').eq(2).html());
		$('#levelInfo').val($('#level'+array[0]).find('td').eq(3).html());	
	}	
	$('#circleLevel').show();
}


function updcirclelevel(valt){
	if(valt==0){
		$('#circleLevel').hide();
	}else if(valt==1){
		var setData={};
		if($.trim($('#userNum').val()).length==0||$.trim($('#levelInfo').val()).length==0){
			return;
		}
		
		setData["userNum"]=$('#userNum').val();
		setData["levelInfo"]=$('#levelInfo').val();
		
		if(array.length==1){
			setData["levelId"]=array[0]; 
		}else{
			setData["levelId"]=0;
		}	 
	 		
		$.ajax({
			type : "post",
			url : '${ctx}/circle!updCircleLevel.action',
			dataType : 'json',
			data : setData,
			success : function(msg, status) {
				if(msg.status==200){
					alert('修改保存成功！');
					window.location.reload();
				}else{
					alert(msg.msg);
				}
			}			
		});
		
	}
}
	

</script>
