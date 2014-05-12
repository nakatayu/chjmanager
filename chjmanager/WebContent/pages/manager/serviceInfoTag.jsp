<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"chjservice"+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>企业列表</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-media.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/pager.css" />	  
	  	<style type="text/css">
.tag_content {
	margin: 0px;
	padding: 4px 0 4px 0;
	list-style: none;
	line-height: 20px;
	font-size:15px;
}

.shop_announcement {
	width: 557px;
	high: 57px;
	overflow-x: visible;
	overflow-y: visible;
}

#a1{background-color:skyblue
}
#a2{font-right:
}
</style>
	  
</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> 
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
							<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服务信息</h3>
							<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary" style="background: #FF6600"
						onclick="addCompanyInfo()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新增&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<br>
					<br>
					
					<div class="widget-title">
					
					   <h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息内容 <h6>
					</div>
					
					<div class="widget-content">
									<form action="#" method="get" class="form-horizontal">
										<div class="row-fluid">
				                      <div class="span12">
					                 <div class="widget-box">
					                 <table width="100%">
					                 <tr>
					                 <td>
					                 <div class="control-group">
											<label class="control-label">信息标题</label>
											<div class="controls">
												<input id="name" type="text" />
											</div>
										</div>
										<div class="control-group" >
                                        <label class="control-label">目标栏目</label>
                                        <div class="controls">
                                        <select class="span5">
                                        <option>1</option>
                                        </select>
                                        </div>
                                        </div>
                                         <div class="row-fluid">
                                         <form>
                                          <label class="control-label">信息内容</label>
                                          <div class="controls">
                                         <textarea class="textarea_editor span10" rows="6" placeholder="Enter text ..."></textarea>
                                         </div>
                                        </form>
                                         </div>
                                        </div>
                                      </div>
					                 </td>
					                 </tr>
					                 </table>
					                 </div>
					                 </div>
					                 </div>
					                 </form>
					                 
								<div class="widget-content">
									<form action="#" method="get" class="form-horizontal">
										<div class="row-fluid">
				                      <div class="span12">
					                 <div class="widget-box">
	                                <div class="widget-title">
							      <span class="icon"> <i class="icon-info-sign"></i></span>
							          <h5>企业标签</h5>
						          </div>						
							        <table>
										<tr>
											<td><label class="control-label" id="sort">标签分类：</label>
												</td>
													<td><label class="control-label">标签名称：</label></td>
														</tr>
															<tr>
																	<td>
																		<div class="control-group">
																			<div class="controls">
																				<div
																					style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
																					class="tag_content">
																					<ul id="tagSecond">
																					</ul>
																				</div>
																			</div>
																		</div>
																	</td>
																	<td>
																		<div class="control-group">
																			<div class="controls">
																				<div
																					style="width: 270px; height: 200px; overflow: auto; border-style: solid; border-width: 1px; border-color: gray;"
																					class="tag_content">
																					<ul id="tagThird">
																					</ul>
																				</div>
																			</div>
																		</div>
																	</td>
																</tr>
															</table>
															<div class="control-group">
																<label class="control-label">已选标签：</label>
																<div class="controls" name="" id="choosenLabel" titie="labelstyle"></div>
														</div>
												        <td colspan="15">
													<div>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<button class="btn btn-primary"
															style="background: #FF6600">&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;</button>
														&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
														<button class="btn btn-primary"
															style="background: #FF6600">&nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;</button>
															&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
												  </div>
												 </td>
						                       </div>
					                          </div>
					                          </form>
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
    <script src="${ctx}/js/bootstrap-colorpicker.js"></script> 
    <script src="${ctx}/js/bootstrap-datepicker.js"></script> 
    <script src="${ctx}/js/jquery.toggle.buttons.html"></script> 
    <script src="${ctx}/js/masked.js"></script>
    <script src="${ctx}/js/wysihtml5-0.3.0.js"></script> 
    <script src="${ctx}/js/jquery.peity.min.js"></script> 
    <script src="${ctx}/js/bootstrap-wysihtml5.js"></script> 
	<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">

	function updateCompanyInfo() {
		$.ajax({
			type : "post",
			url : '${ctx}/user!updateCompanyInfo.action',
			dataType : 'json',
			data : {
				updateCompanyId : $('#txtcompanyId').val(),
				name : $('#name').val(),
				operateScope : $('#operateScope').val(),
				email : $('#email').val(),
				companyType : $('#companyType').val(),
				linkman : $('#linkman').val(),
				linkmanTel : $('#linkmanTel').val(),
				address : $('#address').val(),
				companyInfo : $('#companyInfo').val(),
				companyURL : $('#companyURL').val()
 			},
			success : function(msg, status) {
				if (msg.status == 200) {
					location.href="${ctx}/pages/manager/companyList.jsp";
				} else {
					alert("修改失败")

				}
			}
		})
	}
	
	
	
	 $(function() {
		  //普通2级标签   
		$.ajax({
					type : "post",
					url : '${ctx}/tag!findTagSecondList.action',
					dataType : 'json',
					//      data :{tagId:tagid},   
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array.push('<li class="tag_content"	onclick="choos(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('	 value="' + msg.rows[i]["tagId"]
										+ '">' + msg.rows[i]["tagName"]
										+ '</li>')
							}
							$('#tagSecond').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
		  
	 
	});    

	function choos(li) {
		/* 普通3级标签 */
		var tagid = $(li).attr("value");
		$.ajax({
					type : "post",
					url : '${ctx}/tag!findTagThirdList.action',
					dataType : 'json',
					data : {
						tagId : tagid
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array.push('<li class="tag_content"	ondblclick="chooseabel(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push('value="' + msg.rows[i]["tagId"]+ '">' + msg.rows[i]["tagName"]+ '</li>')
							}
							$('#tagThird').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}

	function submit() {
		var labelValue = "";
		$("#choosenLabel").find("span").each(function() {
			labelValue = labelValue + $(this).attr("value") + ",";
		});
		$("#choosenLabelValue").val(labelValue);
		$("#basic_validate").submit();
	}

	var count = 1;
	function chooseabel(li) {
		if (count > 6) {
			alert("不能超过6个");  
			return;
		}
		count = count + 1;
		$("#choosenLabel")
				.append(
						"<span  value="
								+ $(li).attr("value")
								+ ">"
								+ $(li).text()
								+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>");
	}

	function delLabel(li) {
		count = count - 1;
		$(li).prev().remove();  
		$(li).remove();
	}
	//服务范围2级,3级标签
	function findSecondArea(opt){
		var areaId = $(opt).find("option:selected").val(); 
		$.ajax({
					type : "post",
					url : '${ctx}/area!findSecondArea.action',
					dataType : 'json',
					data : {
						areaId : areaId
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							array
							.push('<td><label><input type="radio"	name="secondArea" checked   ondblclick="chooseabel(this)" ');
					array.push('	 value="' + 0
							+ '" />' +"开发区全部区域"
							+ '</label></td>');
							for ( var i = 0; i < msg.rows.length; i++) {
								array.push('<td><label><input type="radio" name="secondArea" ondblclick="chooseabel(this)" ');
								array.push('	 value="' + msg.rows[i]["areaId"]
										+ '" />' + msg.rows[i]["areaName"]
										+ '</label></td>');
							}
							$('#secondAreaId').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}
	

	$('.textarea_editor').wysihtml5();

	
</script>