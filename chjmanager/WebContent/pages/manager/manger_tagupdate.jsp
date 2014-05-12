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
 <style type="text/css">
 .btn{
 border: 2px;margin: 0;background-color: #888000;font-size: 18px;padding: 5px 10px;margin-right: 30px; 
 }
 </style>
</head>
<body>
		<c:if test="${param.tagId!=null}">
	  <div id="newNameTagp" style="width: 300px;padding: 20px 0 0 20px;font-size: 20px;">
	  <h5>将标签《<%=new String( request.getParameter("tagName").getBytes("iso-8859-1"),"UTF-8") %>》修改为：</h5>
	  <p><input type="text" id="newTagF" onblur=""></p>
		<p><button class="btn" onclick="addTheTagInfo(${param.tagId})">确定</button>
		<button class="btn" onclick="window.top.hidePopWin(false);">返回</button></p>
	  </div>
	  </c:if>
	  <c:if test="${param.cateId!=null}">
	  <div id="newNameCatep" class="secUpde">
	  <h5>将商品分类《<%=new String( request.getParameter("tagName").getBytes("iso-8859-1"),"UTF-8") %>》修改为：</h5>
	  <p><input type="text" id="newCateDF" onblur=""></p>
		<p><button class="btn" onclick="addTheCateInfo(${param.cateId})">确定</button>
		<button class="btn" onclick="window.top.hidePopWin(false);">返回</button></p>
	  
	  
	  </div>
	  
	  
	  </c:if>
	  
	  
	<script src="${ctx}/js/jquery.min.js"></script>
		 

</body>
</html>
<script type="text/javascript">

function addTheCateInfo(cateId){
	var data={};
	var name=$.trim($('#newCateDF').val());
	if(name.length>10||name==''){
		 alert('请输入修改名称！');		 
		return;
	}
	data["name"]=name;
	data["categoryId"]=cateId;
	$.ajax({
		type: "POST",
	     url : '${ctx}/category!updateTheTagNames.action',
	     dataType:'json',
	     data:data,
	     success: function(msg,status){
	    	 if(msg.status==200){
	    		 alert('修改成功！');
	    		 window.top.hidePopWin(true);
	    	 }else{
	    		 alert(msg.msg);
	    	 }
	     }
	});
}

function addTheTagInfo(tagId){
	var name=$.trim($('#newTagF').val());
	if(name.length>10||name==''){
		 alert('请输入修改名称！');		 
		return;
	}	
	$.ajax({
		type: "POST",
	     url : '${ctx}/tag!updateTheTagList.action',
	     dataType:'json',
	     data:{tagId:tagId,tagName:name,fthod:2},
	     success: function(msg,status){
	    	 if(msg.status==200){
	    		 alert('修改成功！');
	    		 window.top.hidePopWin(true);
	    	 }else{
	    		 alert(msg.msg);
	    	 }
	     }
	});
}




</script>
