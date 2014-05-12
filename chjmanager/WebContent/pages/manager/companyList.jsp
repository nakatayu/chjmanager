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
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
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
					class="icon-home"></i> 主页</a> <a href="companyList.jsp" class="current">列表</a>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid" >
						<input type="text" align="right" id="txtName" placeholder="请输入企业名称" style="margin:5px 5px 5px 0 "> 
						<input type="button" value="搜索" class="btn btn-success" onclick="loadData(1)"   >
					</div>
					<div class="widget-box" style="margin-bottom: 0px;">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>企业列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
									    <th>序号</th>
										<th>企业名称</th>
										<th>企业地址</th>
										<th>企业邮箱</th>
										<th>联系人</th>
										<th>联系方式</th>
										<th>经营范围</th>
										<th>注册时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="table_content">
								</tbody>
							</table>
						</div>
					</div>

					<div class="widget-title"
						style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
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
							style="margin-left: 30px; margin-top: 8px; float: right;">
							<ul id="pager">

							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 0px; margin-top: 8px; float: left;">
							<button class="btn btn-warning" 
								onclick="addCompanyInfo()">新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增</button>
						</div>
					</div>
					<div class="row-fluid">
							<div class="widget-box">
								<div class="widget-title">
									<span class="icon"> <i class="icon-align-justify"></i>
									</span>
									<h5>企业信息</h5>
								</div>
								<div class="widget-content">
									<form action="#" method="get" class="form-horizontal">
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息：</h5>
									<hr>
										<table>
											<tr>
												<td>
													<div class="control-group">
														<label class="control-label">企业名称：</label>
														<div class="controls"  style="width: 574px;">
															<input id="name" type="text"  style="width: 250px;"  />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">经营范围：</label>
														<div class="controls">
															<input id="operateScope" type="text" style="width: 250px;" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">企业邮箱：</label>
														<div class="controls">
															<input id="email" type="text" style="width: 250px;" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">企业类型：</label>
														<div class="controls">
															<input id="companyType" type="text" name="companyType"  style="width: 250px;" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">联系人：</label>
														<div class="controls">
															<input id="linkman" type="text" name="linkman"
																style="width: 250px;" />
														</div>
													</div>

													<div class="control-group">
														<label class="control-label">联系方式：</label>
														<div class="controls">
															<input id="linkmanTel" type="text" style="width: 250px;"/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">企业地址：</label>
														<div class="controls">
															<input id="address" type="text" class="span12">
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">企业介绍:</label>
														<div class="controls">
															<textarea id="companyInfo" rows="6" cols="6"
																class="span12"></textarea>
														</div>
														<div class="control-group">
															<label class="control-label">企业网址:</label>
															<div class="controls">
																<input id="companyURL" type="text" class="span12">
															</div>
														</div>
														<div class="control-group">
														<div class="controls">
															<input id="txtcompanyId" type="text"  name ="cpIdName" class="span12"  style="display: none;">
														</div>
													</div>
												</td>
												<td style="vertical-align: top; width: 220px;">
													<div
														style="width: 150px; height: 280px; margin: 10px 0 0 30px; border: 1px solid #ccc; float: center;">
														<img  
															style="width: 150px; height: 160px;" id="imgCompany"/> <br />
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;<br /> <br /> <br />
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														<button id="uploadButton" class="btn btn-primary"
															style="background: #339999">浏&nbsp;&nbsp;&nbsp;览</button>
													</div>
												</td></tr>
										</table>
						          <br>
						          <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业标签：</h5>
									<hr>				
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
															<div class="control-group" style="height: 68px;">
																<label class="control-label" style="height: 30px;">已选标签：</label>
																<div style="height: 30px;" class="controls" name="" id="choosenLabel" titie="labelstyle"></div>
														</div>
														
		  				<div class="form-actions">
							<button class="btn btn-warning"
							 onclick="updateCompanyInfo()">&nbsp;&nbsp;&nbsp;修改&nbsp;&nbsp;&nbsp;</button>
							<button class="btn btn-warning"
							 onclick="aaa()">&nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;</button>
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
	<script src="${ctx}/js/myself/ajaxupload.js"></script>

	<script src="${ctx}/js/mypage.js"></script>
	<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">
	var listData = [];//每一页的数据
	
	$(function(){
		
		
		// 创建AJAX方式上传文件
	    var $uploadBtn = $("#uploadButton");
	    new AjaxUpload($uploadBtn, {
	        action: '${ctx}/user!uploadImage.action',
	        name: 'upfile',
	        responseType:'json',
	        onSubmit: function(file, ext){
	              //ext 文件后缀
		    },
	        onComplete: function(file, response){
	        	if(response.status == 200){
	        		  $('#imgCompany').attr('src', "${http_img}"+response.rows);
	        	  }
	        	  else{
	        		  alert(response.msg);
	        	  }
	       
	        }
	    });
	    
	    
	    loadData(1);
	    
	});
	
	function loadData(page,size,name) {
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

		pageinfo["name"] = $('#txtName').val();

		$.ajax({
					type : "post",
					url : '${ctx}/user!companyList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];i
						if (msg.status == 200) {
							listData = msg.rows;
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr onclick="lineInfo(' + i+ ')">');
								array.push('<td>' + (i+1) + '</td>');
								array.push('<td>' + data["name"] + '</td>');
								array.push('<td>' + data["address"] + '</td>');
								array.push('<td>' + data["email"] + '</td>');
								array.push('<td>' + data["linkman"] + '</td>');
								array.push('<td>' + data["linkmanTel"]+ '</td>');
								array.push('<td>' + data["operateScope"]+ '</td>');
								array.push('<td>' + data["registDate"]+ '</td>');
								array.push('<td>'+ '<a href="javascript:void(0)" onclick="delCompanyInfo('+ i + ')">' + "删除" + '</a>'+ '</td>');
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
							alert(msg.msg);

						}
					}
				});
	}
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    loadData(pageclickednumber);
	};
	function lineInfo(index) {
		var data = listData[index];
		$('#name').val(data["name"]);
		$('#address').val(data["address"]);
		$('#email').val(data["email"]);
		$('#registDate').val(data["registDate"]);
		$('#logo').val(data["logo"]);
		$('#companyType').val(data["companyType"]);
		$('#operateScope').val(data["operateScope"]);
		$('#linkman').val(data["linkman"]);
		$('#linkmanTel').val(data["linkmanTel"]);
		$('#companyInfo').val(data["companyInfo"]);
		$('#companyURL').val(data["companyURL"]);
		$('#companyInfo').val(data["companyInfo"]);
		$('#txtcompanyId').val(data["companyId"]);
		$('#imgCompany').attr('src',"${http_img}"+data["logo"]);
	}
	function addCompanyInfo() {
		location.href = "addCompany.jsp";
	}
	function delCompanyInfo(i) {
		
		if(confirm("您确认删除此记录吗？")){
			var data = listData[index];
			var index;
			$.ajax({
				type : "post",
				url : '${ctx}/user!delCompanyInfo.action',
				dataType : 'json',
				data : {
					companyId : listData[i]["companyId"],
				},
				success : function(msg, status) {
					if (msg.status == 200) {
						pageinfo["t"]--;
						if (pageinfo["t"] % pageinfo["size"] == 0) {
							pageinfo["tp"] = pageinfo["t"] / pageinfo["size"];
						} else {
							//向上取值
							pageinfo["tp"] = Math.ceil(pageinfo["t"]
									/ pageinfo["size"]);
						}

						loadData(pageinfo["page"]);
					} else {
						alert(msg.msg);
					}

				}
			});
		 }
		}

	function updateCompanyInfo() {
		if($('#txtcompanyId').val()==""){
			alert("请选择企业");
		}else{
			
			 var labelValue = "";
				$("#choosenLabel").find("span").each(function() {
				labelValue = labelValue + $(this).attr("value") + ",";
			});
			$("#thirdCategoryTag").val(labelValue);  
		
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
			companyURL : $('#companyURL').val(),		
		    labelValue: labelValue
		},
		success : function(msg, status) {
			if (msg.status == 200) {
				//location.href="${ctx}/pages/manager/companyList.jsp";
				window.location.reload(true);
			} else {
				alert("修改失败")

			}
		}
	})
			
		}
					
		}
	
	
	 $(function() {
		  //普通2级标签   
		$.ajax({
					type : "post",
					url : '${ctx}/user!findTagSecondList.action',
					dataType : 'json',
					//      data :{tagId:tagid},   
					timeout : 10000,
					success : function(msg,status) {
						
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								array.push('<li class="tag_content"	onclick="choos(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
								array.push(' value="' + msg.rows[i]["tagId"]+ '">' + msg.rows[i]["tagName"]+ '</li>')
								
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
					url : '${ctx}/user!findTagThirdList.action',
					dataType : 'json',
					data : {
						tagId : tagid
					},
					timeout : 10000,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								
								array.push('<li class="tag_content"	onclick="chooseabel(this)" onmouseover="this.id=\'a1\' " onmouseout="this.id=\'this\'"');
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
			arert(labelValue);
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
		
		var currentLabel = $(li).val();//判断是否重复
		var flag=true;
		$("#choosenLabel").find("span").each(function(){
			if($(this).attr("value")==currentLabel){
				alert("标签不可重复");
				flag = false;
			}
		});
		if(flag==true){
			count = count + 1;
			$("#choosenLabel").append("<span  value="+ $(li).attr("value")+ ">"+ $(li).text()+ "</span><a onclick='delLabel(this)'>[X]&nbsp;&nbsp;</a>");

		  }
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
							.push('<td><label><input type="radio"	name="secondArea" checked   onclick="chooseabel(this)" ');
					array.push('	 value="' + 0
							+ '" />' +"开发区全部区域"
							+ '</label></td>');
							for ( var i = 0; i < msg.rows.length; i++) {
								array.push('<td><label><input type="radio" name="secondArea" onclick="chooseabel(this)" ');
								array.push('value="' + msg.rows[i]["areaId"]+ '" />' + msg.rows[i]["areaName"]+ '</label></td>');
							}
							$('#secondAreaId').html(array.join(''));
						} else
							alert(msg.msg);
					}
				});
	}
	
	function aaa(){
		
		$('#name').val("");
		$('#address').val("");
		$('#email').val([ "" ]);
		$('#registDate').val("");
		$('#logo').val("");
		$('#companyType').val("");
		$('#operateScope').val("");
		$('#linkman').val("");
		$('#linkmanTel').val("");
		$('#companyInfo').val("");
		$('#companyURL').val("");
		$('#companyInfo').val("");
		
	}
	
	 function addShop(){
			location.href="${ctx}/pages/company/SaveShopInfo.jsp";
		 }

</script>