<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div id="header" style="">
	<img src="${ctx}/img/logo.png" width="220px" height="75px" style="max-width: 220px;max-height: 75px;min-width: 220px;min-height: 75px;" /></div>
<!--Header-part-->
<%-- <div id="header">
  <h1><a href="dashboard.html"><img src="${ctx}/img/logo.png"/></a></h1>
</div> --%>
<!--close-Header-part--> 

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎${user.name}</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-key"></i> 修改密码</a></li>
        <li class="divider"></li>
        <li><a href="javascript:void(0)" onclick="logout()"><i class="icon-user"></i> 退出登录</a></li>
      </ul>
    </li>
   
  </ul>
</div>
<form id="formturn" method="post">
  <input id="shopIdHidden" name="shopId" type="hidden"/>
  <input id="shopNameHidden" name="shopName" type="hidden"/>
  
  <input id="shopCategoryIdHidden" name="shopCategoryId" type="hidden"/>
  <input id="shopCategoryNameHidden" name="shopCategoryName" type="hidden"/>
</form>
</body>
</html>
<script type="text/javascript">
<!--
function logout(){
	if(window.confirm('您确定退出吗?')){
		$.ajax({
		     type: "POST",
		     url : '${ctx}/user!loginOut.action',
		     dataType:'json',
		     data:{},
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		window.location.href="${ctx}";
		    	}
		    	else{
		    		alert(msg.msg);
		    	}
			 } 
		});
		
	}	
}
//-->
</script>
