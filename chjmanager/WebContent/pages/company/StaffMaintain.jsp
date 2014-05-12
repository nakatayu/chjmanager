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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
</head>
<body>
<jsp:include page="/common/head.jsp"></jsp:include>
<jsp:include page="/common/leftmenue.jsp"></jsp:include>

<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">人员维护</a>
			</div>
		</div>

  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>员工维护</h5>  
          </div>
         
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="#" name="basic_validate" id="basic_validate" novalidate="novalidate">
               <div class="form-actions">
             	<button class="btn btn-warning">新增</button>
              </div>
              <div id="form-wizard-1" class="step">
                <div class="control-group">
                  <label class="control-label">登陆账号：</label>
                  <div class="controls">
                    <input id="username" type="text" name="username" />
                  </div>
                </div>
              <div class="control-group">
               <label class="control-label">所属店铺：</label>
              <div class="controls"  >
                <select  style="width:220px;"name="type" id="type"> 
                  <option  value="">星巴克</option>
                  <option  value="">一号店</option>
                </select>
              </div>
            </div>
             <div class="control-group">
               <label class="control-label">员工角色：</label>
              <div class="controls"  >
                <select  style="width:220px;"name="type" id="type"> 
                  <option value="">普通员工</option>
                  <option value="">部门主管</option>
                  <option value="">经理助理</option>
                  <option value="">总经理</option>
                </select>
              </div>
            </div>
               <div id="form-wizard-1" class="step">
                <div class="control-group">
                  <label class="control-label">员工姓名：</label>
                  <div class="controls">
                    <input id="username" type="text" name="username" />
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">手机号码：</label>
                  <div class="controls">
                    <input id="password" type="password" name="password" />
                        <button class="btn btn-info btn-mini">发送手机</button>
                  </div>
                </div>
                 <div class="control-group">
                  <label class="control-label">邮箱地址：</label>
                  <div class="controls">
                    <input id="password" type="password" name="password" />
                  </div>
                </div>
              
             
               <div class="form-actions">
                <!-- <input type="submit" value="提交" class="btn btn-success"> -->
                <button class="btn btn-warning">保存</button>
             	<button class="btn btn-warning">取消</button>
              </div>
                             
            </form>
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
<script src="${ctx}/js/jquery.toggle.buttons.html"></script> 
<script src="${ctx}/js/wysihtml5-0.3.0.js"></script> 
<script src="${ctx}/js/jquery.peity.min.js"></script> 
<script src="${ctx}/js/bootstrap-wysihtml5.js"></script> 

<script src="${ctx}/js/bootstrap-colorpicker.js"></script> 
<script src="${ctx}/js/masked.js"></script> 
<script src="${ctx}/js/matrix.form_common.js"></script> 
<script>
	$('.textarea_editor').wysihtml5();
</script>
</body>
</html>
