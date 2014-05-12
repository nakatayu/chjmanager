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
<title>商品分类类别</title>
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
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>	
<style type="text/css">	
.titleSpan{font-size: 16px;font-weight: bold;}
.firUpde{
height: 120px;width: 280px;background-color: #DDDD00;padding:20px 0 20px 40px;
margin:-80px 0 0 200px;display: block;z-index: 999999;position: relative;
}
.secUpde{
height: 120px;width: 280px;background-color: #DDDD00;padding:20px 0 20px 40px;
margin:-100px 0 -10px 200px;display: block;z-index: 999999;position: relative;
}

.astyle{
 font-weight: normal;font-family: '微软雅黑';cursor: pointer;font-size: 12px;text-shadow: none;
}
.btnbtn{ 
padding: 0px;font-size: 16px;background-color: #f3f3ee;color:#000;font-family: '微软雅黑';padding: 2px 5px;
}
</style>
</head>
<body>
<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>
		
	<div id="content">	
	<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">商品分类列表</a>
			</div>
		</div>
		
		<div class="container-fluid">		
		<div class="row-fluid" style="width: 1000px;">
    <div class="span6">
	<div class="widget-box" style="width: 500px;height: 250px;">
        <div class="widget-title" style="padding: 10px 10px 0 20px;">
         <span class="titleSpan">一级类别：</span> 
                           
        </div>
        <div id="parentCateLt" style="padding-top: 10px;width: 500px;height: 250px;">
         <ul id="parentCateList" class="thumbnails">
                
         
        </ul>
        </div>
      </div> 
      </div>
      
      <div class="span6">
	<div class="widget-box" style="border: 0;">
	
	
      <div class="widget-title" style="height:250px;float:right;width:480px;border: 1px solid #ccc;">
       
      
      <div style="float: left;width: 220px;padding: 20px 10px 0 10px;">
      <div class="control-group">
              <label class="control-label">分类名称:</label>
              <div class="controls">
                <input id="cateName" onblur="checkTheCate" type="text" placeholder="新建分类" style="width: 190px;margin: 0 0 5px 5px;"/>
              </div>
            </div>
      
              <div class="control-group">
              <label class="control-label">背景颜色：</label>
              <div class="controls">
                <div data-color-format="hex" data-color="#000000"  class="input-append color colorpicker">
                  <input id="backColor" type="text" value="#000000" class="span4" style="width: 170px;">
                  <span class="add-on"><i id="backColori" style="background-color: #000000"></i></span> </div>
              </div>
            </div>
            <input type="hidden" id="image" value="">
            <div>
            <button class="btn" onclick="pnsertTheCate(0)">确定添加</button>
            <button class="btn" id="UpdateNewInfo">确定修改</button>           
            </div>
       </div>
       <div style=" float: right;padding: 10px;">
       <img id="theImage" src="" style="width:200px;height: 200px;" alt="">
       <div style="padding: 5px;text-align: center;">
       <button class="btn" id="addImages">浏&nbsp;&nbsp;&nbsp;&nbsp;览</button>
       </div>
       </div>
      </div></div>
      </div></div>
      
		<!--  -->
		<div class="row-fluid" style="width: 1000px;">
    <div class="span6">
	<div class="widget-box" style="height: 300px;width: 1000px;padding: 0px;">
        <div class="widget-title" style="padding: 10px 10px 0 20px;">
          <span class="titleSpan">二级类别：<span id="paCatename" style="color: red;"></span> 
         <button class="btn" onclick="pnsertTheCate(1)" style="float: right;margin-top: 0px;">新&nbsp;&nbsp;&nbsp;&nbsp;建</button>
         <input type="text" id="newCategory1" placeholder="新建分类" style="height: 20px;float: right;" onblur="checkTheCate(this)">
         </span>
        </div>
        <div id="chidrenCateLt" style="padding-top: 10px;height:300px;width: 1000px;padding-left: 8px;">
         <ul class="thumbnails" id="chidrenCateList">
         </ul>
        </div>
      </div> 
	 </div></div></div></div>
		
		<jsp:include page="/common/buttom.jsp"></jsp:include>
	
	
	<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/jquery.ui.custom.js"></script>
		<script src="${ctx}/js/bootstrap.min.js"></script>
		<script src="${ctx}/js/bootstrap-colorpicker.js"></script> 
		<script src="${ctx}/js/bootstrap-datepicker.js"></script>	
		<script src="${ctx}/js/jquery.uniform.js"></script>
		<script src="${ctx}/js/select2.min.js"></script>
		<script src="${ctx}/js/jquery.validate.js"></script>
		<script src="${ctx}/js/matrix.js"></script>
		<script src="${ctx}/js/masked.js"></script>
		<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
		<script src="${ctx}/js/myself/ajaxupload.js"></script>
		<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
		<script src="${ctx}/js/jquery.peity.min.js"></script>		
		<%--<script src="${ctx}/js/matrix.form_common.js"></script>  --%>
		<script>
			$('.textarea_editor').wysihtml5();
		</script>
	<script src="${ctx}/js/jquery.pager.js"></script>

</body>
</html>
<script type="text/javascript">
$(function(){
	$('.colorpicker').colorpicker();
	
	$.ajax({
		type: "POST",
	     url : '${ctx}/category!findCategoryList.action',
	     dataType:'json',
	     data:{categoryId:0},
	     success: function(msg,status){
	    	 if(msg.status==200){
	    		 var array=[];
	    		 for ( var i = 0; i < msg.rows.length; i++) {
	    			 var data=msg.rows[i];
	    			 
	    			 array.push('<li style="padding-right: 5px;">'+
	    			 '<span onclick="findTheChildernCate('+data["product_category_id"]+')" class="label" style="background-color: #FFFFFF;padding: 0px;font-size: 18px;">'+
	    			 '<button class="btn btnbtn">'+data["name"]+'</button>'+
	    			 '<a class="astyle" onclick="deleteTheCate('+data["product_category_id"]+',0)">[删]</a></span>'+
	    			 '<input type="hidden" id="categoryName'+data["product_category_id"]+'" name="categoryId" value="'+data["name"]+'">'+
	    			 '<input type="hidden" id="categoryId'+data["product_category_id"]+'" name="categoryId" value="'+data["product_category_id"]+'">'+
	    			 '<input type="hidden" id="image'+data["product_category_id"]+'" name="image" value="'+data["image"]+'">'+
	    			 '<input type="hidden" id="color'+data["product_category_id"]+'" name="color" value="'+data["color"]+'"></li>');
				}
	    		$('#parentCateList').html(array.join('')); 
	    		
	    		findTheChildernCate(msg.rows[0]["product_category_id"]);
	    	 }else{
	    		 alert(msg.msg);
	    	 }
	     }
	});	
	var $uploadBtn = $("#addImages");
	new AjaxUpload($uploadBtn, {
		action : '${ctx}/user!uploadImage.action',
		name : 'upfile',
		responseType : 'json',
		type:11,//个人头像1企业所有图片2店铺所有图片3圈子图片4话题图片5活动图片6商品图片7广告图片8个人证件图片9二维码图片10其他图片11
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
				$('#theImage').attr("src","${http_img}"+response.rows);
        		$('#image').val(response.rows); 
			} else {
				alert(response.msg);
			}
		}
	});
	 
    
    
   $('#UpdateNewInfo').click(function(){
	   var bdata={};
	   var name=$.trim($('#cateName').val());
		if(name.length>10||name==''){
			alert("名称不能为空或长度应小于10!");
			return;
		}
		bdata["name"]=name;
		bdata["categoryId"]=categoryId;
		bdata["color"]=$('#backColor').val();
		bdata["image"]=$('#image').val();
		 
    	$.ajax({
    		type: "POST",
    	     url : '${ctx}/category!pinnterCategoryImage.action',
    	     dataType:'json',
    	     data:bdata,
    	     success: function(msg,status){
    	    	 if(msg.status==200){
    	    		alert('保存成功！');
    	    		window.location.reload();
    	    	 }else{
    	    		 alert(msg.msg);
    	    	 }
    	     }
    	});
    });   
}); 

function checkTheCate(hg){
	var name=$.trim($(hg).val());
	if(name.length>10||name==''){
		alert("名称不能为空或长度应小于10!");
	}
}
//新增分类
function pnsertTheCate(i){
	var bdata={};
	if(i==1){
		var name=$.trim($('#newCategory1').val());
		if(name.length>10||name==''){
			alert("名称不能为空或长度应小于10!");
			return;
		}
		bdata["name"]=name;
		bdata["categoryId"]=categoryId;
	}else if(i==0){
		var name=$.trim($('#cateName').val());
		if(name.length>10||name==''){
			alert("名称不能为空或长度应小于10!");
			return;
		}
		bdata["name"]=name;
		bdata["categoryId"]=0;
		bdata["color"]=$('#backColor').val();
		bdata["image"]=$('#image').val();
	}
		
	$.ajax({
		type: "POST",
	    url : '${ctx}/category!pinnterNewCategory.action',
	     dataType:'json',
	     data:bdata,
	     success: function(msg,status){
	    	 if(msg.status==200){
	    		alert("添加成功！"); 
	    		if(i==0){
	    		window.location.reload();
	    		}else{
	    			findTheChildernCate(categoryId);
	    		}
	    	 }else{
	    		 alert(msg.msg);
	    	 }
	     }
	});
}

var categoryId=0;
function findTheChildernCate(cateId){
	
	categoryId=cateId;
	var url=$('#image'+cateId).val();
	var color=$('#color'+cateId).val();
		
	$('#cateName').val($('#categoryName'+cateId).val());
	$('#paCatename').html($('#categoryName'+cateId).val());
	$('#theImage').attr("src","${http_img}"+url);
	$('#backColor').val(color);
	$('#backColori').css({'background-color':color}); 
	$('#image').val(url);
	
	$.ajax({
		type: "POST",
	     url : '${ctx}/category!findCategoryList.action',
	     dataType:'json',
	     data:{categoryId:cateId},
	     success: function(msg,status){
	    	 if(msg.status==200){
	    		 var array=[];
	    		 for ( var i = 0; i < msg.rows.length; i++) {
	    			 var data=msg.rows[i];
	    			 array.push('<li style="padding-right: 5px;">'+
	    	    			 '<span class="label" style="background-color: #FFFFFF;padding: 0px;font-size: 14px;">'+
	    	    			 '<button class="btn btnbtn">'+
	    	    			 data["name"]+'</button><a class="astyle" onclick="updateTheCate('+data["product_category_id"]+',\''+data["name"]+'\')">[修改]</a>'+
	    	    			 '<a class="astyle" onclick="deleteTheCate('+data["product_category_id"]+',1)">[删除]</a></span>'+
	    	    			 '</li>');
				}
	    		
	    		 $('#chidrenCateList').html(array.join('')); 
	    	 }else{
	    		 alert(msg.msg);
	    	 }
	     }
	});
}


function deleteTheCate(cateId,i){
	if(i==0){
 		findTheChildernCate(categoryId);
 	}
	if(confirm("你确定要删除此分类及它的子类吗？")){		
		$.ajax({
			type: "POST",
		     url : '${ctx}/category!deltheCategoryInfo.action',
		     dataType:'json',
		     data:{categoryId:cateId},
		     success: function(msg,status){
		    	 if(msg.status==200){
		    		 alert('删除成功！');
		    		 if(i==0){
		 	    		window.location.reload();
		 	    	}else if(i==1){
		 	    		findTheChildernCate(categoryId);
		 	    	}
		    	 }else{
		    		 alert(msg.msg);
		    	 }
		     }
		});
	}
}
var crid=0;
function updateTheCate(cateId,name){
	crid=cateId;
	name=encodeURIComponent(name);
	showPopWin('商品分类修改','${ctx}/pages/manager/manger_tagupdate.jsp?tagName='+name+'&cateId='+cateId, 350, 230,pagerepy);
	
}
pagerepy=function(){
	findTheChildernCate(crid);
}

</script>
