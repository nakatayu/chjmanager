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

</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页"
					class="tip-bottom"><i class="icon-home"></i> 主页</a>
				<a href="${ctx}/pages/company/OrderList.jsp" title="订单列表"
					class="current"><i class="  icon-pencil"></i>订单列表</a> <a href="#"
					class="current">订单详情</a>
			</div>
		</div>
	<div id="myPrintArea" ><!-- style="display:none;"  打印区域-->
		<div class="container-fluid">
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
									<input type="hidden" id="orderId" name="orderId"  /> 
									<input type="hidden" id="orderItemId" name="orderItemId"  /> 
									<br>
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
															<input id="payStatus" name="payStatus" type="text" value="未付款" style="width: 254px;" readonly />
														</c:if>
														<c:if test="${orderInfo.pay_status=='2'}">
															<input id="payStatus" name="payStatus" type="text" value="已付款" style="width: 254px;" readonly />
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
															<c:if test="${orderInfo.send_type=='1'}"   >
																<input id="sendType" name="sendType"  readonly value="配送"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.send_type=='2'}"   >
																<input id="sendType" name="sendType"  readonly value="自取"  type="text" style="width: 254px;" />
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
														<c:if test="${orderInfo.status=='1'}"   >
																<input id="status" name="status"  readonly value="未处理"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='2'}"   >
																<input id="status" name="status"  readonly value="已接受"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='3'}"   >
																<input id="status" name="status"  readonly value="拒绝"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='4'}"   >
																<input id="status" name="status"  readonly value="配送中"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='5'}"   >
																<input id="status" name="status"  readonly value="交易完成"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.status=='6'}"   >
																<input id="status" name="status"  readonly value="已取消"  type="text" style="width: 254px;" />
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
															<c:if test="${orderInfo.pay_type=='1'}"   >
																<input id="payType" name="payType"  readonly value="到店支付"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='2'}"   >
																<input id="payType" name="payType"  readonly value="货到付款(现金)"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='3'}"   >
																<input id="payType" name="payType"  readonly value="货到付款(一卡通)"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='4'}"   >
																<input id="payType" name="payType"  readonly value="货到付款(银行卡)"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='5'}"   >
																<input id="payType" name="payType"  readonly value="线上支付(一卡通)"  type="text" style="width: 254px;" />
														</c:if>
														<c:if test="${orderInfo.pay_type=='6'}"   >
																<input id="payType" name="payType"  readonly value="线上支付(银行卡)"  type="text" style="width: 254px;" />
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
									</table>
									<br>
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品清单：</h5>
									<hr>
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
										    	<th>序号</th>
												<th>商品名称</th>
												<th>附加属性</th>
												<th>单价</th>
												<th>数量</th>
												<th>小计</th>
											</tr>
									</thead>
									<tbody id="orderInfoProductInventory" >
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
				   				<button class="btn btn-warning" type="button" onclick="trade()">交易完成</button>
				   		</td>
				   		<td>
				   				<button class="btn btn-warning" type="button"onclick="receive()">&nbsp;&nbsp;接&nbsp;&nbsp;&nbsp;&nbsp;收&nbsp;&nbsp;</button>
				   		</td>
				   		<td>
				   				<button class="btn btn-warning" type="button" onclick="distribution()">&nbsp;&nbsp;配&nbsp;&nbsp;&nbsp;&nbsp;送&nbsp;&nbsp;</button>
				   		</td>
				   		<td>
				   				<button class="btn btn-warning" type="button" onclick="cancel()">取消订单</button>
				   		</td>
				   		<td>
				   				<button class="btn btn-warning" type="button"  onclick="jquery_print()">打印订单</button>
				   		</td>
				   		<!-- <td>
				   				<button class="btn btn-info" type="button" onclick="sendOrderList()">返回</button>
				   		</td> -->
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
		<script type="text/javascript" src="${ctx}/js/myself/JqueryPrint.js"></script>  
</body>
<jsp:include page="/common/buttom.jsp"></jsp:include>
</html>
<script type="text/javascript">
var orderId = <%=request.getParameter("orderId")%>
var orderItemId = <%=request.getParameter("orderItemId")%>
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
			 $.ajax({ 
					type : "post",
					url : '${ctx}/order!findOrderInfoProductInventory.action?orderId='+orderId+'&orderItemId='+orderItemId,
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
							 	array.push('<tr>');
								array.push('<td>' + (i + 1) + '</td>');
								array.push('<td>' + data["productName"] + '&nbsp;&nbsp;&nbsp;&nbsp;' + data["skuKind"] + '</td>');
								array.push('<td>'+data["appendInfo"]["multiSelDetails"]+"<br/>"+data["appendInfo"]["SingleSelDetails"]+'</td>');
								array.push('<td>' + data["price"] + '</td>');
								array.push('<td>' + data["qty"]+ '</td>');
								array.push('<td>' + data["total"]+ '</td>');
								/* array.push('<td>' + data["orderItemId"]+ '</td>'); */
								
								/* array.push('<td><a href="javascript:void(0)" onclick="delete(' + data["order_item_id"]+')"> 删除</a></td>'); */
								array.push('</tr>');  
							}
							$('#orderInfoProductInventory').html(array.join(''));
							
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
			function trade(){
				$.ajax({
					type : "post",
					url : '${ctx}/order!OrderCloseTheDealStatusPayment.action?status='+5,
					dataType : 'json',
				    data : {
				    	orderId:orderId,
					}, 
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("订单交易完成！");
							window.location.reload(true);
						}else if(msg.status == 500){
							alert("当前订单已经处于交易完成状态！");
						}else if(msg.status == 600){
							alert("当前订单已被取消，无法交易，请核实！");
						}else{
				    		alert("系统繁忙,请稍后再试！");
				    	}
					}
				})
			}
			// 接收 
			function receive(){
				$.ajax({
					type : "post",
					url : '${ctx}/order!updateOrderStatus.action?status='+2,
					dataType : 'json',
				    data : {
				    	orderId:orderId,
					}, 
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("订单接收成功！");
							window.location.reload(true);
						}else if(msg.status == 600){
				    		alert("当前订单已被取消，无法接收！");
				    	}else if(msg.status == 500){
				    		alert("当前订单交易已完成，无法接收！");
				    	}else{
				    		alert("系统繁忙,请稍后再试！");
				    	}	
					}
				})
			}
			// 配送 
			function distribution(){
				$.ajax({
					type : "post",
					url : '${ctx}/order!updateOrderStatusAfter.action?status='+4,
					dataType : 'json',
				    data : {
				    	orderId:orderId,
					}, 
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("当前订单配送成功！");
							window.location.reload(true);
						}else if(msg.status == 400){
							alert("配送订单前，请先接收订单！");
				    	}else{
				    		alert("系统繁忙,请稍后再试！");
				    	}
					}
				});
			}	
			// 取消 
			function cancel(){
				$.ajax({
					type : "post",
					url : '${ctx}/order!updateOrderStatus.action?status='+6,
					dataType : 'json',
				    data : {
				    	orderId:orderId,
					}, 
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("订单已被取消！");
							window.location.reload(true);
						}else if(msg.status == 600){
							alert("当前订单已经处于被取消状态！");
						}else if(msg.status == 500){
							alert("当前订单交易已完成，无法取消！");
						}else{
				    		alert("系统繁忙,请稍后再试！");
				    	}
					}
				})
			}
		/* 	//  返回订单列表页面 
			function sendOrderList(){
				location.href = "${ctx}/pages/company/OrderList.jsp";
			} */
			//打印订单 
			function jquery_print(){
				$("#myPrintArea").printArea();  
			}
</script>
