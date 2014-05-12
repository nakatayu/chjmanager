<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "chjservice" + "/";
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
.shopInfoCss {
	color: #99CCFF;
}

.companyPersonnelCss {
	color: #7cfc00;
}

.companyProductCss {
	color: #CC66FF;
}

.companyIdCss {
	color: #FF0000;
}
/*  遮罩层 */
.black_overlay {
	display: none;
	position: fixed;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: fixed;
	top: 20%;
	left: 35%;
	width: 300px;
	height: 200px;
	border: 2px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
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
					class="icon-home"></i> 主页</a> <a href="#" class="current">企业列表</a>
			</div>
		</div>

		<div style="padding: 10px 0 0 20px;">
			<table style="font-size: 14px; font-weight: bold;">
				<tr>
					<td width="100px" align="right">审核状态：</td>
					<td width="150px">
						<div class="controls">
							<select style="height: 25px; width: 150px;" id="status">
								<option value="">全部</option>
								<option value="3">待审核</option>
								<option value="2">审核不通过</option>
								<option value="1">审核通过</option>
								<option value="T">被推荐</option>
							</select>
						</div>
					</td>
					<td><input style="margin: 3px 0px 2px 5px" align="right"
						type="text" id="txtName" placeholder="请输入企业名称"
						onblur="loadData(1)"></td>
					<td><input style="margin: 2px 0px 2px 0px" type="button"
						value="查询" class="btn btn-success" onclick="loadData(1)" /></td>
				</tr>
			</table>
		</div>


		<div class="row-fluid"
			style="background-color: #FFF; padding-left: 20px; padding-bottom: 20px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">
					<table class="table table-bordered table-striped"
					style="margin: 0px; float: right; border: 1px solid #ccc;">
						<thead>
							<tr>
								<th width="10px"><input type="checkbox" /></th>
								<th style="width: 30px;">企业<br />ID
								</th>
								<th style="width: 150px;">企业名称</th>
								<th>企业地址</th>
								<th style="width: 70px;">联系人</th>
								<th style="width: 90px;">联系电话</th>
								<th style="width: 30px;">星级</th>
								<th colspan="3">查看信息</th>
								<th style="width: 110px;">状态</th>
								<th style="width: 50px;">web<br />推荐
								</th>
							</tr>
						</thead>
						<tbody id="table_content">
						</tbody>
					</table>

					<div class="widget-title"
						style="height: 50px; border: 1px solid #ccc; float: right; width: 100%;">

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
					</div>
					<div class="widget-title"
						style="border: 1px solid #ccc; float: right; width: 100%; height: auto;">
						<div class="btn-group" style="float: left;">
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="addCompany()">新增企业</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="delCompany()">删除企业</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="companyStar(this)">企业星级</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="companyPass()">审核通过</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="companyNoPass()">审核不通过</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="companyCloseOrOpen(1,3)">开启企业</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="companyCloseOrOpen(3,1)">关闭企业</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="webCOMPANYExtend(0,1,4)">web推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="webCOMPANYExtend(0,0,0)">取消推荐</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 更改  遮罩层  -->
	<div id="updateOpenWhite" class="white_content" style="padding: 10px;">
		<div
			style="text-align: right; cursor: default; height: 20px; padding: 0px 20px 0px 0px;">
			<a href="#"><span style="font-size: 16px;"
				onclick="CloseUpdateDiv('updateOpenWhite','updateOpenBlack')">
					<font color="orange">关闭 </font>
			</span></a>
		</div>
		<form id="formDivId">
			<input type="hidden" name="companyId" id="companyId" />
			<table width="100%">
				<tr>
					<td style="font-weight: bold; height: 40px; padding-left: 10px;">企业星级数：</td>
				</tr>
				<tr>
					<td style="padding: 5px 0 0 35px;"><input type="text"
						name="starScore" id="companyStar" /></td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 10px 0 10px 50px;">
						<button class="btn btn-warning" type="button"
							onclick="updateCompanyStar()">确认修改</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="updateOpenBlack" class="black_overlay"></div>


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
	var companyId ="${param.companyId}";
	$("#companyId").val(companyId);

	var companyStatus = [ "", "创建待审核", "修改申请", "申请关闭" ]; //企业审核状态 
	var examineResult = [ "", "审核通过", "审核不通过", "未审核", "关闭" ];
	$(function() {
		loadData(1);
	});
	function loadData(page, size) {
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
		
		var serStatus = $('#status').val();
		if (serStatus == 'T') {
			pageinfo["top"] = 1;
			pageinfo["status"] = '';
		} else {
			pageinfo["top"] = 0;
			pageinfo["status"] = serStatus; //状态
		}

		$
				.ajax({
					type : "post",
					url : '${ctx}/companyinfomanager!findCompanyListInfo.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							listData = msg.rows;
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr>');
								array
										.push('<td><input name="companyId" type="checkbox" value="' + data["companyId"]+ '"/></td>');
								array
										.push('<td>'
												+ '<p class="companyIdCss"  href="javascript:void(0)" >'
												+ data["companyId"]
												+ '</p></td>');
								array
										.push('<td>'
												+ '<a href="javascript:void(0)" onclick="findCompanyInfo('
												+ data["companyId"] + ')">'
												+ data["name"] + '</td>');
								array
										.push('<td>'
												+ '<a href="javascript:void(0)" onclick="findCompanyInfo('
												+ data["companyId"] + ')">'
												+ data["address"] + '</td>');
								array.push('<td>' + data["linkman"] + '</td>');
								array.push('<td>' + data["linkmanTel"]
										+ '</td>');

								array
										.push('<td>' + data["starScore"]
												+ '</td>');
								array
										.push('<td width="50px">'
												+ '<a class="companyProductCss"  href="javascript:void(0)" onclick="findCompanyProduct('
												+ data["companyId"] + ',\''
												+ data["name"] + '\')">'
												+ "企业商品" + '</a>' + '</td>');
								array
										.push('<td width="50px">'
												+ '<a  href="javascript:void(0)" class="shopInfoCss" onclick="findShopInfo('
												+ data["companyId"] + ',\''
												+ data["name"] + '\')">'
												+ "企业店铺" + '</a></td>');
								array
										.push('<td width="50px">'
												+ '<a class="companyPersonnelCss"  href="javascript:void(0)" onclick="findCompanyPersonnel('
												+ data["companyId"] + ','
												+ data["type"]
												+ ')">企业人员</a></td>');
								array.push('<td>'
										+ companyStatus[data["status"]] + ":"
										+ examineResult[data["examineResult"]]
										+ '</td>');
								if (data["orderField"] > 0) {
									array
											.push('<td style="text-align:center;">web推荐<br /><span style="color:red;">第'
													+ data["orderField"]
													+ '位<span></td>');
								} else {
									array.push('<td></td>');
								}
								array.push('</tr>');
							}
							$('#table_content').html(array.join(''));

							if (msg.total > pageinfo["size"]) {
								if (msg.total % pageinfo["size"] == 0)
									pageinfo["tp"] = msg.total
											/ pageinfo["size"];
								else
									pageinfo["tp"] = Math.ceil(msg.total
											/ pageinfo["size"]);
								$("#pager").pager({
									pagenumber : pageinfo["page"],
									pagecount : pageinfo["tp"],
									buttonClickCallback : PageClick
								});

							} else {
								$('#pager').html('');
							}

						} else {
							$('#pager').html('');
							$('#table_content').html(
									'<tr><td colspan="4">' + msg.msg
											+ '</td></tr>');
						}
					}
				});
	}

	PageClick = function(pageclickednumber) {
		$("#pager").pager({
			pagenumber : pageclickednumber,
			pagecount : pageinfo["tp"],
			buttonClickCallback : PageClick
		});
		loadData(pageclickednumber);
	};

	//企业星级数
	function companyStar(parm) {
		var checkedCount = $("input[type=checkbox]:checked").size();
		if (checkedCount > 1) {
			alert("每次只能选择一条数据");
		} else if (checkedCount == 0) {
			alert("请选择数据");
		} else {
			$("#companyId").val(
					$("input[type=checkbox]:checked").parents("tr").find(
							"td:eq(0)>input[type=checkbox]").val());
			$("#companyStar").val(
					$("input[type=checkbox]:checked").parents("tr").find(
							"td:eq(6)").html());
			document.getElementById('updateOpenWhite').style.display = 'block';
			document.getElementById('updateOpenBlack').style.display = 'block';
		}
	}
	//企业星级数的修改
	function updateCompanyStar() {
		var reg = new RegExp("^[0-9]*$");
		var companyStar = $.trim($("#companyStar").val());
		if (companyStar > 5) {
			alert("企业星级数最高为5");
		} else if (!reg.test(companyStar)) {
			alert("只能为数字");
		} else if (companyStar != "") {
			var data = $("#formDivId").serialize();
			$.ajax({
				type : "post",
				url : '${ctx}/companyinfomanager!updateCompanyStar.action',
				dataType : 'json',
				data : data,
				timeout : 10000,
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("更新成功！");
						loadData(1);
					} else {
						alert("更新失败！");
					}
				}
			});
		} else {
			alert("企业星级数为空!");
		}
	}

	//关闭星级数的DIV 
	function CloseUpdateDiv(show_div, bg_div) {
		document.getElementById(show_div).style.display = 'none';
		document.getElementById(bg_div).style.display = 'none';
	};

	//查看企业人员
	function findCompanyPersonnel(companyId, type) {
		location.href = "${ctx}/pages/manager/comapnyInfoManagerPersonnelList.jsp?companyId="
				+ companyId + "&type=" + type;
	}

	//查看店铺
	function findShopInfo(companyId, name) {
		location.href = "${ctx}/pages/manager/companyInfoManagerShopList.jsp?companyId="
				+ companyId + "&name=" + name;
	}
	//查看商品 
	function findCompanyProduct(companyId, name) {
		location.href = "${ctx}/pages/manager/companyInfoManagerProductList.jsp?companyId="
				+ companyId;
	}
	//新增企业
	function addCompany() {
		location.href = "${ctx}/pages/manager/comapnyInfoManagerAddCompay.jsp";
	}
	//查询企业信息
	function findCompanyInfo(companyId) {
		location.href = "${ctx}/companyinfomanager!findCompanyInfo.action?companyId="
				+ companyId;
	}
	//删除企业 
	function delCompany() {
		if (confirm("您确认删除此记录吗？")) {
			if ($("#table_content").find("input[type=checkbox]:checked").size() == 0) {
				alert("请选择需要删除的记录！");
			} else {
				var label = "";
				$("#table_content").find("input[type=checkbox]:checked").each(
						function() {
							label = label + $(this).attr("value") + ",";
						});
				$
						.ajax({
							type : "post",
							data : {
								selectedCompanyId : label
							},
							url : '${ctx}/companyinfomanager!deleteCompanyListInfo.action',
							dataType : 'json',
							success : function(msg, status) {
								if (msg.status == 200) {
									alert("删除成功！");
									loadData(1);
								} else if (msg.status == 400) {
									alert("删除失败！");
								}
							}
						});
			}
		}
	}

	//审核通过
	function companyPass() {

		var checkedCount = $("input[type=checkbox]:checked").size();
		if (checkedCount > 1) {
			alert("每次只能选择一条数据");
		} else if (checkedCount == 0) {
			alert("请选择数据");
		} else {
			var companyPass = $("input[type=checkbox]:checked").parents("tr")
					.find("td:eq(8)").find("p").html();
			if (companyPass == "审核通过") {
				alert("不可重复审核");
			} else {
				var label = "";
				$("#table_content").find("input[type=checkbox]:checked").each(
						function() {
							label = label + $(this).attr("value") + ",";
						});
				$.ajax({
					type : "post",
					data : {
						selectedCompanyId : label
					},
					url : '${ctx}/companyinfomanager!companyAuditPass.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("企业审核成功，审核状态更改为审核通过！");
							loadData(1);
						} else if (msg.status == 400) {
							alert("系统繁忙，请稍后再试！");
							window.location.reload();
						}
					}
				});
			}
		}
	}

	//审核不通过
	function companyNoPass() {
		var checkedCount = $("input[type=checkbox]:checked").size();
		if (checkedCount > 1) {
			alert("每次只能选择一条数据");
		} else if (checkedCount == 0) {
			alert("请选择数据");
		} else {
			var companyNoPass = $("input[type=checkbox]:checked").parents("tr")
					.find("td:eq(8)").find("p").html();
			if (companyNoPass == "审核不通过") {
				alert("不可重复审核");
			} else {
				var label = "";
				$("#table_content").find("input[type=checkbox]:checked").each(
						function() {
							label = label + $(this).attr("value") + ",";
						});
				$
						.ajax({
							type : "post",
							data : {
								selectedCompanyId : label
							},
							url : '${ctx}/companyinfomanager!companyAuditNoPass.action',
							dataType : 'json',
							success : function(msg, status) {
								if (msg.status == 200) {
									alert("企业审核成功，审核状态更改为审核不通过！");
									loadData(1);
								} else if (msg.status == 400) {
									alert("系统繁忙，请稍后再试！");
									window.location.reload();
								}
							}
						});
			}
		}
	}
	//企业审核  关闭或开启 
	function companyCloseOrOpen(status, examineResult) {
		var checkedCount = $("input[type=checkbox]:checked").size();
		if (checkedCount > 1) {
			alert("每次只能选择一条数据");
		} else if (checkedCount == 0) {
			alert("请选择数据");
		} else {
			var label = $("#table_content")
					.find("input[type=checkbox]:checked").val();
			$.ajax({
				type : "post",
				data : {
					companyId : label,
					status : status,
					examineResult : examineResult
				},
				url : '${ctx}/companyinfomanager!companyCloseOrOpen.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("审核成功!");
						loadData(1);
					} else if (msg.status == 400) {
						alert("审核失败!");
					}
				}
			});
		}
	}
	
	function webCOMPANYExtend(filName, filValue, filnum) {
		var str = [];
		$('input[name="companyId"]:checked').each(
				function(k, v) {
					str.push($(this).val());
				});
		if (str.length == 0) {
			alert('请选择对象！');
			return;
		} else if (filnum != 0 && str.length > filnum) {
			alert('设定数量超出' + filnum + '个范围！');
			return;
		}

		if (filnum > 0) {
			filValue = prompt('请输入推荐顺序(范围：1-' + filnum + ')，最多可推荐' + filnum
					+ '个', '1');
			if (filValue == '' || filValue == null) {
				return;
			} else if (isNaN(filValue)) {
				alert('请输入数字！');
				return;
			}
		}

		var setData = {};
		setData["filValue"] = filValue;
		setData["companyIdlist"] = str.join(',');
		setData["filName"] = filName;
		setData["filnum"] = filnum;

		$.ajax({
			type : "post",
			data : setData,
			url : '${ctx}/company!companyWebExtend.action',
			dataType : 'json',
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("设置成功！");
					loadData(1);
				} else {
					alert(msg.msg);
				}
			}
		});
	}
</script>