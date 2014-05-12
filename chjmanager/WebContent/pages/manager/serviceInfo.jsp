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
</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> 
			</div>
		</div>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box" style="margin-bottom: 0px;">
						<div class="widget-title">
							<span class="icon"><i class=></i></span>
							<h3>服务信息</h3>
						</div>
						<div class="widget-content nopadding">

							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>序号</th>
										<th>信息标题</th>
										<th>目标栏目</th>
										<th>推送方式</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>发布人</th>
										<th>发布时间</th>
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
							<ul id="ul-page">

							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 0px; margin-top: 8px; float: left;">
							<button class="btn btn-primary" style="background: #FF6600"
								onclick="addServiceInfo()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新增&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
						</div>
					</div>
					<button id="uploadButton"></button></div>
										
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
	
	function loadData(page,size) {
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
					url : '${ctx}/user!companyList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
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
							array = null;

							var arrayPage = [];
							pageinfo["t"] = msg.total;
							if (msg.total % pageinfo["size"] == 0) {
								pageinfo["tp"] = msg.total / pageinfo["size"];
							} else {
								//向上取值
								pageinfo["tp"] = Math.ceil(msg.total
										/ pageinfo["size"]);
							}

							//如果最大页或当前页是1 上一页变灰不能点
							if (pageinfo["tp"] == 1 || pageinfo["page"] == 1
									|| pageinfo["tp"] == 0) {
								arrayPage
										.push('<li class="disabled"><a href="javascript:void(0)">上页</a></li>');
							} else {
								//变手型 （href="javascript:void(0)"）
								arrayPage
										.push('<li><a href="javascript:void(0)" onclick="loadData(-1)">上页</a></li>');
							}

							for ( var i = 1; i <= pageinfo["tp"]; i++) {
								if (i == pageinfo["page"]) {
									arrayPage
											.push('<li class="active"> <a href="javascript:void(0)" onclick="loadData('+ i+ ')">'+ i+ '</a></li>');
								} else {
									arrayPage.push('<li> <a href="javascript:void(0)" onclick="loadData('+ i+ ')">'+ i+ '</a> </li>');
								}

							}
							if (pageinfo["tp"] == pageinfo["page"]
									|| pageinfo["tp"] == 0) {
								arrayPage
										.push('<li class="disabled"><a href="javascript:void(0)">下页</a></li>');
							} else {
								arrayPage
										.push('<li><a href="javascript:void(0)" onclick="loadData(-2)">下页</a></li>');
							}

							$('#ul-page').html(arrayPage.join(''));
							arrayPage = null;

						} else {
							alert(msg.msg);

						}
					}
				});
	}

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
		location.href = "addCompanyInfo.jsp";
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
	
	function addServiceInfo(){
		location.href="${ctx}/pages/manager/serviceInfoTag.jsp";
	}
</script>