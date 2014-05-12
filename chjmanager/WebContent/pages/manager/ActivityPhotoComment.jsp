<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html>
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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
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
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">活动照片评论维护</a>
			</div>
		</div>
		
<div style="padding:10px 0 0 20px;"> 
<table style="width: 100%;font-size: 14px;font-weight: bold;">
<tr valign="middle" align="right">
<td align="left" style="font-size: 20px;font-weight: bold;">活动照片评论列表：</td>  
<td  width="50px" align="right">时间：</td>
<td  width="140px" valign="bottom">
<input id="fontTime" type="text" name="beginTime" value=""
	class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"  
	style="width: 130px;" />
 </td>
<td  width="15px" align="center">至  </td>
<td  width="140px" valign="bottom"> 
 <input id="backTime" type="text" name="beginTime" value=""
	class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"  
	style="width: 130px;" />                            
</td>                
 <td width="10px"></td>
                  
<td width="100px"> <input id="likeName" type="text" value="" style="float: right;margin-top: 8px;"/></td>
<td align="left"><button class="btn btn-success" onclick="loadnewData(10)" style="font-size: 20px;cursor: pointer;">查询</button>
</td>
</tr>
</table>
</div>	  
	      
      <div class="row-fluid" style="background-color: #FFF;padding-left:20px;">
     <div class="span12">
     <div class="widget-box"  style="margin-right: 40px;">
           
            <table class="table table-bordered table-striped with-check">
              <thead>
                <tr>
                  <th width="30px"><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
                  <th width="150px">评论人</th>
                  <th width="650px">评论内容</th>
                  <th width="150px">评论时间</th>
                  <th width="80px">被回复次数</th> 
                </tr>
              </thead>
              <tbody id="activCommlst">
              
              </tbody>
            </table>
           
            <div class="widget-title"
				style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
          <div class="btn-group" style="margin-top: 6px;float: left;">
          <button class="btn btn-warning" style="margin: 0 5px;" onclick="updatCommentDelete()">删&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;除</button>
         </div>
          <div class="btn-group" style="margin-top: 6px; float: right;">
				<button class="btn" id="pagesize" style="width: 40px;">10</button>
				<button data-toggle="dropdown" class="btn dropdown-toggle">
					<span class="caret" style="height: 6px;"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a  onclick="loadnewData(10)">10</a></li>
					<li class="divider"></li>
					<li><a onclick="loadnewData(20)">20</a></li>
					<li class="divider"></li>
					<li><a onclick="loadnewData(50)">50</a></li>
					<li class="divider"></li>
					<li><a onclick="loadnewData(100)">100</a></li>
				</ul>
			</div>
			<div class="pagination alternate"
				style="margin:0px 10px; margin-top: 8px; float: right;">
				<ul id="pager">
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
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
	<script src="${ctx}/js/matrix.js"></script>
	<script src="${ctx}/js/matrix.tables.js"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<script src="${ctx}/js/mypage.js"></script> 
	<script src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
	 <script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">

var activityPhotoId="${param.activPictureId}";
var pgsize=10;
$(function() {
	loadData(1);
});

function updatCommentDelete(){
	var str='';
	$('input[name="comBoc"]:checked').each(function(){ 
        if($(this).attr("checked")){
            str += $(this).val()+',';
        }
    });
	if(str.length<1){
		alert('请选择对象！');
		return; 
	}
	$.ajax({
		type : "post",
		url : '${ctx}/activity!updActPhoCommels.action',
		dataType : 'json',
		data : {activCommId:str,activityPhotoId:activityPhotoId},
		success : function(msg, status) {
			if(msg.status==200){
				alert('修改成功！');
				window.location.reload();
			}else
				alert(msg.msg);
		}
	});	
}

function loadData(page) {
	 pagenumber=page;
	 pageinfo["activityPhotoId"]=activityPhotoId;
	 pageinfo["fontTime"]=$('#fontTime').val();
	 pageinfo["backTime"]=$('#backTime').val();
	 pageinfo["likeName"]=$('#likeName').val();
	 pageinfo["size"]=pgsize;
	 pageinfo["page"]=page;
	 
	  $.ajax({
		type : "post",
		url : '${ctx}/activity!findActPhotCommlt.action',
		dataType : 'json',
		data : pageinfo,
		success : function(msg, status) {
			if(msg.status==200){
				var str='';
				for(var i=0;i<msg.rows.length;i++){
					var data=msg.rows[i];
					str+='<tr><td><input type="checkbox" name="comBoc" value="'+data["activity_comment_id"]+'"/></td>';
					var name=data["user"];
					if(name!=''&&name.length>11){
						name=name.substring(0,10)+'...';
					}					
					str+='<td>'+name+'</td>';
					str+='<td>'+data["content"]+'</td>';
					str+='<td>'+data["comment_time"]+'</td>';					 
					str+='<td align="center">'+data["comCount"]+'</td>';
					str+='</tr>';
				}
				$('#activCommlst').html(str);
				
				if(msg.total>pageinfo["size"]){
					if(msg.total%pageinfo["size"]==0)
						pageinfo["tp"]=msg.total/pageinfo["size"];
				 else
						pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
				 $("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
				
				}else{
					$('#pager').html('');	
				}
				 
			}else{
				$('#activCommlst').html('<tr><td colspan="5">'+msg.msg+'</td></tr>');
				$('#pager').html('');
			}			
		}				
   }); 
}



PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
    loadData(pageclickednumber);
};

function gotothePage(vals){
	pagenumber=pagenumber+vals;
	loadData(pagenumber);
}
function loadnewData(valn){
	$('#pagesize').html(valn);
	pgsize=valn;
	loadData(1);
}	 
</script>

 
