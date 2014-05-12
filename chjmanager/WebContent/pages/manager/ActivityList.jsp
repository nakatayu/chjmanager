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
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="${ctx}/css/pager.css" />

<style type="text/css"> 
.activityId{color:#FF0000;}
</style>

</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a href="#" class="current">菁彩维护</a> 
			</div>
		</div>
		 

 
<div style="padding:10px 0 0 20px;"> 
<table style="width: 100%;font-size: 14px;font-weight: bold;">

<tr valign="middle" align="right">
<td width="80px">审核状态： </td>
<td width="115px"> <div class="controls">
<select style="height: 25px;width: 115px;" id="actStatus"> 
           <option value="" selected="selected">全部</option>
            <option value="3">待审核</option>
            <option value="2">审核不通过</option> 
            <option value="1">审核通过</option> 
            <option value="T">被推荐</option>
            </select></div></td>
            
<td width="80px">活动状态： </td>
<td width="115px"> <div class="controls">
<select style="height: 25px;width: 115px;" id="actAction"> 
           <option value="" selected="selected">全部</option>
            <option value="1">未开始</option>
            <option value="2">正在进行</option> 
            <option value="3">已结束</option>
            </select></div></td>
                        
<td  width="80px" align="right">时间：</td>

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
                  
<td width="100px"> <input id="likeName" type="text" value="" placeholder="名称/摘要" style="float: right;margin-top: 8px;width: 200px;"/></td>
<td align="left"><button class="btn btn-success" onclick="loadData(1)" style="font-size: 20px;cursor: pointer;">查询</button>
</td>
</tr>
</table>
</div>		
 
    <div class="row-fluid" style="background-color: #FFF;padding-left:20px;padding-bottom: 10px;">
	    <div class="span12">		
		<div class="widget-box" style="margin-right: 40px;">				 			
		 
			<table class="table table-bordered table-striped with-check" style="margin-bottom: 0px;float: right;border: 1px solid #ccc;">
				<thead>
					<tr>
						<th width="35px"><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
						<th width="50px">活动ID</th>
						<th width="80px">活动标题</th>
						<th width="150px">活动摘要</th>
						 <th width="35px">人数上限</th>
						<th width="50px">已参加人数</th>
						<th width="130px">创建人</th>
						<th width="140px">当前状态</th>						
						<th width="50px">手机首<br />页推荐</th>
						<th width="50px">手机菁<br />英推荐</th>
						<th width="50px">web首<br />首推荐</th>	
						<th width="50px">web菁<br />英推荐</th>	
						<th width="70px">评论管理</th>
						<th width="60px">活动图片</th>
					</tr>
				</thead>
				<tbody id="table_content">
			 
				</tbody>
			</table>
			  						
			<div class="widget-title" style="width: 100%;height: 40px; border: 1px solid #ccc;float: right;">
				<div class="btn-group" style="margin-top: 6px; float: right;">
					<button class="btn" id="pagesize">10</button>
					<button data-toggle="dropdown" class="btn dropdown-toggle">
						<span class="caret" style="height: 6px;"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="javascript:void(0)" onclick="loadData(1,10)">10</a></li>
						<li class="divider"></li>
						<li><a href="javascript:void(0)" onclick="loadData(1,20)">20</a></li>
						<li class="divider"></li>
						<li><a href="javascript:void(0)" onclick="loadData(1,50)">50</a></li>
						<li class="divider"></li>
						<li><a href="javascript:void(0)" onclick="loadData(1,100)">100</a></li>
					</ul>
				</div>
				<div class="pagination alternate"
					style="margin-left: 30px; margin-top: 6px; float: right;">
					<div id="pager">

					</div>
				</div>
			</div>
	     		
		 
		<div class="widget-title"
				style="height: auto; border: 1px solid #ccc;float: right;width: 100%;">
          
          <div class="btn-group" style="float: left;">
			<button class="btn btn-warning" style="margin: 5px;" onclick="setRelationOnActivity(0,1,0)">手机首页推荐</button>
	        <button class="btn btn-warning" style="margin: 5px;" onclick="setRelationOnActivity(0,0,0)">取消手机首页</button>
	        <button class="btn btn-warning" style="margin: 5px;" onclick="setRelationOnActivity(1,1,0)">手机菁英推荐</button>
	        <button class="btn btn-warning" style="margin: 5px;" onclick="setRelationOnActivity(1,0,0)">取消手机菁英</button>
			<button class="btn btn-warning" style="margin: 5px;" onclick="setRelationOnActivity(2,1,3)">web首页推荐</button>			
			<button class="btn btn-warning" style="margin: 5px;" onclick="setRelationOnActivity(2,0,0)">取消web首页</button>
			<button class="btn btn-warning" style="margin: 5px;" onclick="setRelationOnActivity(3,1,6)">web菁英推荐</button>
			<button class="btn btn-warning" style="margin: 5px;" onclick="setRelationOnActivity(3,0,0)">取消web菁英</button>
			<br />
			<button class="btn btn-warning" style="margin: 5px;" onclick="addactivityinfo()">新&nbsp;&nbsp;增</button>
			<button class="btn btn-warning" style="margin: 5px;" onclick="updateActivity(0)">修&nbsp;&nbsp;改</button>
			<button class="btn btn-warning" style="margin: 5px;" onclick="updateActivityExamine(1)">审核通过</button>
			<button class="btn btn-warning" style="margin: 5px;" onclick="updateActivityExamine(2)">审核不通过</button>
            <button class="btn btn-warning" style="margin: 5px;" onclick="deleteActList()">删&nbsp;&nbsp;除</button>
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
	var listData = [];//每一页的数据
	var actStatus = [ "创建待审核", "修改申请","申请关闭"];//活动状态
	var activityStatus = [ "","创建待审核","修改待审核","请求关闭"];
	var examineResult=["","审核通过","审核未通过","未审核"];

	$(function() {
		loadData(1);
	});

	function loadData(page, size, name) {
		var astatus=$('#actStatus').val();
		if( astatus=='T'){
			pageinfo["examineResult"] = '';
			pageinfo["top"]=1;
		}else{
			pageinfo["top"]=0;
			pageinfo["examineResult"] = astatus;
		}
		pageinfo["actAction"]=$('#actAction').val();
		pageinfo["fontTime"]=$('#fontTime').val();
		pageinfo["backTime"]=$('#backTime').val();
		pageinfo["likeName"]=$('#likeName').val();
		
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
			type : "post",
			url : '${ctx}/activity!findActivityAndUserList.action',
			dataType : 'json',
			data : pageinfo,
			success : function(msg, status) {
				var array = [];
				if (msg.status == 200) {
					for ( var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];
						var name=data["activity_title"];
						if(name!=null&&name.length>5){
							name=name.substring(0,4)+'...';
						}
						var summary=data["summary"];
						if(summary!=null&&summary.length>10){
							summary=summary.substring(0,8)+'...';
						}						
						array.push('<tr>');
						array.push('<td>'+ '<input type="checkbox" value="' + data["activity_id"]+ '" name="activityBoc"/>'+ '</td>');
						array.push('<td><p class="activityId"  href="javascript:void(0)">'+ data["activity_id"]+ '</td>');
						array.push('<td><span style="cursor:pointer;" onclick="updateActivity('+data["activity_id"]+')">' + name+ '</span></td>');
						array.push('<td><span style="cursor:pointer;" onclick="updateActivity('+data["activity_id"]+')">' + summary + '</span></td>');
						array.push('<td>' + data["user_max"] + '</td>');
						array.push('<td>' + data["addUserCount"]+ '</td>');
						
						if(data["company_id"]!=null){
							var userName=data["user"]["name"];
							if(userName!=null&&userName.length>5){
								userName=userName.substring(0,4)+'...';
							}						
							array.push('<td>企业：'+userName+'</td>');
						}else if(data["create_user_id"]!=null){
							var userName=data["user"];
							if(userName!=null&&userName.length>5){
								userName=userName.substring(0,4)+'...';
							}
							array.push('<td>个人：'+userName+'</td>');
						}else{
							array.push('<td></td>');
						}					
						if(data["examine_result"]!='1'&&data["status"]!='3'){
							array.push('<td>'+activityStatus[data["status"]]+':'
									+examineResult[data["examine_result"]]+ '</td>');
						}else if(data["status"]!='3'){
							var d=new Date(data["begin_time"].replace('-','/').replace('-','/'));
							var date=new Date(); 
							if(date<d){
								array.push('<td>活动未开始</td>');
							}else if(data["end_time"]!=null){
								var dd=new Date(data["end_time"].replace('-','/').replace('-','/'));
								if(date>dd){
									array.push('<td>活动已结束</td>');
								}else{
									array.push('<td>活动正在进行</td>');
								}
							}else if(date>d){
								array.push('<td>活动正在进行</td>');
							}
						}else{
							array.push('<td>活动已关闭</td>');
						}
						if(data["first_phone_extend"]>0){
							array.push('<td style="text-align:center;">手机首页<br /><span style="color:red;">第'+data["first_phone_extend"]+'位<span></td>');
						}else{
							array.push('<td></td>');
						}
						if(data["relation_phone_extend"]>0){
							array.push('<td style="text-align:center;">手机菁英<br /><span style="color:red;">第'+data["relation_phone_extend"]+'位<span></td>');
						}else{
							array.push('<td></td>');
						}
						if(data["is_extend_index"]>0){
							array.push('<td style="text-align:center;">web推荐<br /><span style="color:red;">第'+data["is_extend_index"]+'位<span></td>');
						}else{
							array.push('<td></td>');
						}
						if(data["is_extend"]>0){
							array.push('<td style="text-align:center;">web推荐<br /><span style="color:red;">第'+data["is_extend"]+'位<span></td>');
						}else{
							array.push('<td></td>');
						}						
						if(data["acommCount"]>0){
							array.push('<td style="text-align:center;"><a href="javascript:void(0)" onclick="queryCommOfActiv('+data["activity_id"]+')">查看评论</a></td>');
						}else{
							array.push('<td></td>');
						}
						if(data["pictCount"]>0){
							array.push('<td style="text-align:center;"><a href="javascript:void(0)" onclick="qryCommActivPict('+data["activity_id"]+')">进入图片</a></td>');							
						}else{
							array.push('<td></td>');
						}
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
					$('#table_content').html('<tr><td colspan="14">'+msg.msg+'</td></tr>');
				}
			}
		});
	}
	
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    loadData(pageclickednumber);
	};
	
	function qryCommActivPict(activityId){
		window.location.href="${ctx}/pages/manager/ActivityPicture.jsp?activityId="+activityId;
	}
	function queryCommOfActiv(activityId){
		window.location.href="${ctx}/pages/manager/ActivityComment.jsp?activityId="+activityId;
	}
	
	function loadnewData(valn){
		$('#pagesize').html(valn);
		pgsize=valn;
		loadData(1);
	}	
	function updateActivity(activityId){
		var array=[];
		if(activityId!=0){
			 array.push(activityId);
		}else{
			$('input[name="activityBoc"]:checked').each(function(){ 
			    if($(this).attr("checked")){
			        array.push($(this).val());
			    }
			});
		}		
		if(array.length==0){
			alert('请选择活动!');
			return;
		}
		else if(array.length>1){
			alert('只能修改一条活动!');
			return;
		}
		
		window.location.href="${ctx}/activity!insertActivityInfoPage.action?id="+array[0];
		
	}
	
	function gotothePage(vals){
		pagenumber=pagenumber+vals;
		loadData(pagenumber);
	}
	
	function updateActivityExamine(values){
		var str='';
		$('input[name="activityBoc"]:checked').each(function(){ 
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
			url : '${ctx}/activity!updateActivityExamine.action',
			dataType : 'json',
			data : {activityId:str,examineResult:values},
			success : function(msg, status) {
				if(msg.status==200){
					alert('修改成功！');
					loadData(1);
				}else{
					alert(msg.msg);
					
				}
			}
		});		
	}
	 		
	function deleteActList() {
		var str='';
		$('input[name="activityBoc"]:checked').each(function(){ 
	        if($(this).attr("checked")){
	            str += $(this).val()+',';
	        }
	    });
		if(str.length<1){
			alert('请选择对象！');
			return; 
		}
		if (confirm("您确认删除此记录吗？")) {
			$.ajax({
				type : "post",
				data : {selectedActivityIds : str},
				url : '${ctx}/activity!deleteActList.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("删除成功！");
						loadData(1);
					}
				}
			});
		}
	}

	function addactivityinfo() {
		location.href = "${ctx}/pages/company/ActivityInfo.jsp";
	}
	
	function setRelationOnActivity(filName,filValue,filnum){
		var str='';var i=0;
		$('input[name="activityBoc"]:checked').each(function(){ 
	        if($(this).attr("checked")){
	            str += $(this).val()+',';i++;
	        }
	    });
		if(str.length<1){
			alert('请选择对象！');
			return; 
		}
		if(filnum!=0&&i>filnum){
			alert('设定数量超出'+filnum+'个范围！');
			return;
		}
		
		if(filValue==1){
			if (filnum > 0) {
				filValue = prompt('请输入推荐顺序(范围：1-' + filnum + ')，最多可推荐' + filnum
						+ '个', '1');			
			}else{
				filValue = prompt('请输入推荐顺序', '1');
			}			
			if(filValue==''||filValue==null){
				return;
			}else if(isNaN(filValue)){									
				alert('请输入数字！');
				return;
			}
		}		
		var setData={};
		setData["filName"]=filName;
		setData["filValue"]=filValue;
		setData["filnum"]=filnum;
		setData["activityId"]=str;
		
		$.ajax({
			type : "post",
			url : '${ctx}/activity!updaActivityLtop.action',
			dataType : 'json',
			data : setData,
			success : function(msg, status) {
				if(msg.status==200){
					alert('修改成功！');
					loadData(1);
				}else{
					alert(msg.msg);
				}
			}
		});
		
	}
	 
</script>

