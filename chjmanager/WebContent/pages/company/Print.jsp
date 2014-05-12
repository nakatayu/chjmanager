<style type="text/css" media=print>
.noprint......{display : none }
</style>
然后使用样式就可以：
<p class="noprint">不需要打印的地方</p>

代码如下:

<script language="javascript"> 
function printsetup()......{ 
// 打印页面设置 
wb.execwb(8,1); 
} 
function printpreview()......{ 
// 打印页面预览 

wb.execwb(7,1); 

} 

function printit() 
....{ 
if (confirm('确定打印吗？')) ......{ 
wb.execwb(6,6) 
} 
} 
</script> 

<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height=0 id=wb name=wb width=0></OBJECT> 
<input type=button name=button_print value="打印" class="noprint" onclick="javascript:printit()"> 
<input type=button name=button_setup value="打印页面设置" class="noprint" onclick="javascript:printsetup();"> 
<input type=button name=button_show value="打印预览" class="noprint" onclick="javascript:printpreview();"> 


<object ID='WebBrowser' WIDTH=0 HEIGHT=0 CLASSID='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2'></object>


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
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />

<!-- 打印机 -->
<meta http-equiv="Content-Type" content="text/html;   charset=utf-8">
<!-- 打印文件 -->
<style>
@media screen {
	.onlyPrint {
		display: none
	}
}

@media print {
	.onlyShow {
		display: none
	}
	.onlyPrint {
		page-break-before: always
	}
}
</style>
<SCRIPT LANGUAGE="JavaScript">
<!--
	//   这里定义每页能打印多少行   
	//模拟数据   
	function prepare() {
		var ar = new Array()
		for ( var i = parseInt(linesPerPage.value); i < (show.children.length - 1); i += parseInt(linesPerPage.value)) {
			var tr = show.insertBefore(show.firstChild.cloneNode(true),
					show.children[i]);
			tr.className = "onlyPrint"
			ar[ar.length] = tr;
		}
		preView();
		for ( var i = ar.length - 1; i > -1; i--)
			show.deleteRow(ar[i].rowIndex)
	}
//-->
</SCRIPT>
<object id="WebBrowser"
	classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height="0" width="0"></object>


</head>
<body>

	<button class="btn btn-info" type="button" onclick="a()">a</button>
	<button class="btn btn-info" type="button" onclick="b()">b</button>
	<button class="btn btn-info" type="button" onclick="c()">c</button>


	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href=".${ctx}/pages/company/index.jsp" title="主页"
					class="tip-bottom"><i class="icon-home"></i> 主页</a> <a
					href="${ctx}/pages/company/OrderList.jsp" title="订单浏览"
					class="tip-bottom"><i class="icon-home"></i> 订单浏览</a> <a href="#"
					class="current">订单详情</a>
			</div>
			<h1>订单维护</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>订单信息</h5>
						</div>
						<div class="container-fluid">
							<div class="widget-content nopadding">
								<form class="form-horizontal" method="post" action="#"
									name="basic_validate" id="basic_validate"
									novalidate="novalidate">
									<input type="hidden" id="orderId" name="orderId" /> <input
										type="hidden" id="orderItemId" name="orderItemId" /> <br>
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单详情：</h5>
									<hr>
									<table>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">店铺名称：</label>
														<div class="controls">
															<input id="name" name="name"
																value="${orderInfo.shopName}" type="text"
																style="width: 254px;" readonly />
														</div>
													</div>
											</td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">订单编号：</label>
														<div class="controls">
															<input id="flowNo" name="flowNo"
																value="${orderInfo.flow_no}" type="text"
																style="width: 254px;" readonly />
														</div>
													</div>
											</td>
										</tr>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">订单时间：</label>
														<div class="controls">
															<input id="orderTime" name="orderTime"
																value="${orderInfo.order_time}" type="text"
																style="width: 254px;" readonly />
														</div>
													</div>
											</td>
										</tr>
										<tr>
											<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">付款状态：</label>
														<div class="controls">
															<c:if test="${orderInfo.pay_status=='1'}">
															<input id="payStatus" name="payStatus" type="text"
																	value="未付款" style="width: 254px;" readonly />
														</c:if>
														<c:if test="${orderInfo.pay_status=='2'}">
															<input id="payStatus" name="payStatus" type="text"
																	value="已付款" style="width: 254px;" readonly />
														</c:if>
														</div>
													</div>
											
											</td>
										</tr>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">取货方式：</label>
														<div class="controls">
															<c:if test="${orderInfo.send_type=='1'}">
																<input id="sendType" name="sendType" readonly value="配送"
																	type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.send_type=='2'}">
																<input id="sendType" name="sendType" readonly value="自取"
																	type="text" style="width: 254px;" />
														</c:if>
														</div>
													</div>
											
											</td>
										</tr>
									</table>
									<br>
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单状态：</h5>
									<hr>
									<table>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">状态更改：</label>
														<div class="controls">
													<!--		订单状态： 1未处理2已接受3拒绝4配送中5交易完成6已取消 -->
														<c:if test="${orderInfo.status=='1'}">
																<input id="status" name="status" readonly value="未处理"
																	type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='2'}">
																<input id="status" name="status" readonly value="已接受"
																	type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='3'}">
																<input id="status" name="status" readonly value="拒绝"
																	type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='4'}">
																<input id="status" name="status" readonly value="配送中"
																	type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='5'}">
																<input id="status" name="status" readonly value="交易完成"
																	type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='6'}">
																<input id="status" name="status" readonly value="已取消"
																	type="text" style="width: 254px;" />
														</c:if>
															
														</div>
													</div>
											
											</td>
										</tr>
									</table>
									<br>
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收货人信息：</h5>
									<hr>
									<table>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">联系人：</label>
														<div class="controls">
															<input id="name" name="name" value="${orderInfo.name}"
																type="text" style="width: 254px;" readonly />
														</div>
													</div>
											
											</td>
										</tr>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">联系电话：</label>
														<div class="controls">
															<input id="phone" name="phone" value="${orderInfo.phone}"
																type="text" style="width: 254px;" readonly />
														</div>
													</div>
											
											</td>
										</tr>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">送货地址：</label>
														<div class="controls">
															<input id="address" name="address"
																value="${orderInfo.address}" type="text"
																style="width: 254px;" readonly />
														</div>
													</div>
											
											</td>
										</tr>
									</table>
									<br>
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;支付信息：</h5>
									<hr>
									<table>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">付款方式：</label>
														<div class="controls">
															<c:if test="${orderInfo.pay_type=='1'}">
																<input id="payType" name="payType" readonly value="到店支付"
																	type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='2'}">
																<input id="payType" name="payType" readonly
																	value="货到付款(现金)" type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='3'}">
																<input id="payType" name="payType" readonly
																	value="货到付款(一卡通)" type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='4'}">
																<input id="payType" name="payType" readonly
																	value="货到付款(银行卡)" type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='5'}">
																<input id="payType" name="payType" readonly
																	value="线上支付(一卡通)" type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='6'}">
																<input id="payType" name="payType" readonly
																	value="线上支付(银行卡)" type="text" style="width: 254px;" />
														</c:if>
															
														</div>
													</div>
											
											</td>
										</tr>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">付款金额：</label>
														<div class="controls">
															<input id="money" name="money" value="${orderInfo.money}"
																type="text" style="width: 254px;" readonly />
														</div>
													</div>
											
											</td>
										</tr>
										<%-- <tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">发票抬头：</label>
														<div class="controls">
															<input id="invoiceTitle" name="invoiceTitle"
															  type="text"
																style="width: 254px;" readonly />
														</div>
													</div>
											</td>
										</tr>
										<tr>
											<td>
												<div id="form-wizard-1" class="step">
													<div class="control-group">
														<label class="control-label">发票类型：</label>
														<div class="controls">
															<input id="invoiceType" name="invoiceType"
																value="${orderInfo.invoice_type}" type="text"
																style="width: 254px;" readonly />
														</div>
													</div>
											</td>
										</tr> --%>
									</table>
									<br>
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品清单：</h5>
									<hr>
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
										    	<th>序号</th>
												<th>商品名称</th>
												<th>单价</th>
												<th>数量</th>
												<th>小计</th>
											</tr>
									</thead>
									<tbody id="orderInfoProductInventory">
									</tbody>
							 </table>
							 <div class="widget-title"
										style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
									<div class="btn-group" style="margin-top: 6px; float: right;">
										<button class="btn" id="pagesize">10</button>
										<button data-toggle="dropdown" class="btn dropdown-toggle">
											<span class="caret" style="height: 6px;"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="javascript:void(0)"
													onclick="loadData(1,10)">10</a></li>
											<li class="divider"></li>
											<li><a href="javascript:void(0)"
													onclick="loadData(1,20)">20</a></li>
											<li class="divider"></li>
											<li><a href="javascript:void(0)"
													onclick="loadData(1,50)">50</a></li>
											<li class="divider"></li>
											<li><a href="javascript:void(0)"
													onclick="loadData(1,100)">100</a></li>
										</ul>
									</div>
									<div class="pagination alternate"
											style="margin-left: 30px; margin-top: 8px; float: right;">
										<ul id="ul-page">
										</ul>
									</div>
								</div>
							 
							
							</div>
						</div>
					</div>
				</div>
				<table>
				   <tr>
				   		<td>
				   				<button class="btn btn-warning" type="button"
								onclick="trade()">交易完成</button>
				   		</td>
				   		<td>
				   				<button class="btn btn-warning" type="button"
								onclick="receive()">&nbsp;&nbsp;接&nbsp;&nbsp;&nbsp;&nbsp;收&nbsp;&nbsp;</button>
				   		</td>
				   		<td>
				   				<button class="btn btn-warning" type="button"
								onclick="distribution()">&nbsp;&nbsp;配&nbsp;&nbsp;&nbsp;&nbsp;送&nbsp;&nbsp;</button>
				   		</td>
				   		<td>
				   				<button class="btn btn-warning" type="button"
								onclick="cancel()">取消订单</button>
				   		</td>
				   		<td>
				   				<button class="btn btn-warning" type="button"
								onclick="window.focus();window.print()">打印订单</button>
				   		</td>
				   		<td>
				   				<button class="btn btn-info" type="button"
								onclick="sendOrderList()">返回</button>
				   		</td>
				   </tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	</div>
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
</body>
<jsp:include page="/common/buttom.jsp"></jsp:include>
</html>
<script type="text/javascript">
	var orderId =
<%=request.getParameter("orderId")%>
	var orderItemId =
<%=request.getParameter("orderItemId")%>
	$("#orderId").val(orderId);
	$("#orderItemId").val(orderItemId);
	var listData = [];//每一页的数据
	$(function() {
		loadData(1);
	});
	function loadData(page, size, name) {
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
		$
				.ajax({
					type : "post",
					url : '${ctx}/order!findOrderInfoProductInventory.action?orderId='
							+ orderId + '&orderItemId=' + orderItemId,
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr>');
								array.push('<td>' + (i + 1) + '</td>');
								array.push('<td>' + data["productName"]
										+ '&nbsp;&nbsp;&nbsp;&nbsp;'
										+ data["sku_kind"] + '</td>');
								array
										.push('<td>' + data["itemPrice"]
												+ '</td>');
								array.push('<td>' + data["qty"] + '</td>');
								array.push('<td>' + data["total"] + '</td>');
								/* array.push('<td>' + data["orderItemId"]+ '</td>'); */

								/* array.push('<td><a href="javascript:void(0)" onclick="delete(' + data["order_item_id"]+')"> 删除</a></td>'); */
								array.push('</tr>');
							}
							$('#orderInfoProductInventory')
									.html(array.join(''));

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
											.push('<li class="active"> <a href="javascript:void(0)" onclick="loadData('
													+ i
													+ ')">'
													+ i
													+ '</a></li>');
								} else {
									arrayPage
											.push('<li> <a href="javascript:void(0)" onclick="loadData('
													+ i
													+ ')">'
													+ i
													+ '</a> </li>');
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

	/**
	 * 订单状态： 1未处理2已接受3拒绝4配送中5交易完成6已取消
	 */
	// 交易完成
	function trade() {
		$.ajax({
			type : "post",
			url : '${ctx}/order!updateOrderStatus.action?status=' + 5,
			dataType : 'json',
			data : {
				orderId : orderId,
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("订单状态修改成功！");
					window.location.reload(true);
				}
			}
		})
	}
	// 接收 
	function receive() {
		$.ajax({
			type : "post",
			url : '${ctx}/order!updateOrderStatus.action?status=' + 2,
			dataType : 'json',
			data : {
				orderId : orderId,
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("订单状态修改成功！");
					window.location.reload(true);
				}
			}
		})
	}
	// 配送 
	function distribution() {
		$.ajax({
			type : "post",
			url : '${ctx}/order!updateOrderStatus.action?status=' + 4,
			dataType : 'json',
			data : {
				orderId : orderId,
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("订单状态修改成功！");
					window.location.reload(true);
				}
			}
		})
	}
	// 取消 
	function cancel() {
		$.ajax({
			type : "post",
			url : '${ctx}/order!updateOrderStatus.action?status=' + 6,
			dataType : 'json',
			data : {
				orderId : orderId,
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("订单状态修改成功！");
					window.location.reload(true);
				}
			}
		})
	}
	//返回订单列表页面 
	function sendOrderList() {
		location.href = "${ctx}/pages/company/OrderList.jsp";
	}

	function d() {
		location.href = "${ctx}/pages/company/Print.jsp";
	}

	function a() {
		try {
			WB.ExecWB(8, 1)
		} catch (e) {
			alert("您的浏览器不支持此功能")
		}
	}
	<!-- //页面设置 -->
	function b() {
		try {
			WB.ExecWB(7, 1)
		} catch (e) {
			alert("您的浏览器不支持此功能")
		}
	}
	<!--// 打印预览 -->
	function c() {
		try {
			WB.ExecWB(6, 6)
		} catch (e) {
			alert("您的浏览器不支持此功能")
		}
	}
	<!-- //直接打印 -->

	window.print = printFrame;

	// main stuff 

	function printFrame(frame, onfinish) {
		if (!frame)
			frame = window;
		function execOnFinish() {
			switch (typeof (onfinish)) {
			case "string":
				execScript(onfinish);
				break;
			case "function":
				onfinish();
			}
			if (focused && !focused.disabled)
				focused.focus();
		}
		if ((frame.document.readyState !== "complete")
				&& (!frame.document
						.confirm("The document to print is not downloaded yet! Continue with printing?"))) {
			execOnFinish();
			return;
		}
		var eventScope = printGetEventScope(frame);

		var focused = document.activeElement;

		window.printHelper = function() {

			execScript("on error resume next: printWB.ExecWB 6, 1", "VBScript");

			printFireEvent(frame, eventScope, "onafterprint");

			printWB.outerHTML = "";

			execOnFinish();

			window.printHelper = null;

		}

		document.body

				.insertAdjacentHTML(
						"beforeEnd",

						"<object id=\"printWB\" width=0 height=0 \ 

 

classid=\"clsid:8856F961-340A-11D0-A96B-00C04FD705A2\">");

		printFireEvent(frame, eventScope, "onbeforeprint");

		frame.focus();

		window.printHelper = printHelper;
		setTimeout("window.printHelper()", 0);
	}
	// helpers 
	function printIsNativeSupport() {
		var agent = window.navigator.userAgent;
		var i = agent.indexOf("MSIE ") + 5;
		return parseInt(agent.substr(i)) >= 5 && agent.indexOf("5.0b1") < 0;
	}
	function printFireEvent(frame, obj, name) {
		var handler = obj[name];
		switch (typeof (handler)) {
		case "string":
			frame.execScript(handler);
			break;
		case "function":
			handler();
		}
	}
	function printGetEventScope(frame) {
		var frameset = frame.document.all.tags("FRAMESET");
		if (frameset.length)
			return frameset[0];
		return frame.document.body;
	}
</script>
