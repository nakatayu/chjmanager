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
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<style type="text/css">
.oederNumCss{color:#FF0000;}
</style>
</head>
<body>

<jsp:include page="/common/head.jsp"></jsp:include>
<jsp:include page="/common/leftmenue.jsp"></jsp:include>

<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">订单列表</a>
			</div>
		</div>
   <div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box" style="margin-bottom: 0px;">
					<div  align="left" class="widget-title">
						<div class="btn-group"  style="margin: 3px 0px 2px 5px" >
						 <button data-toggle="dropdown" class="btn btn-warning dropdown-toggle"  >查看订单 <span class="caret"></span></button>
			           <ul class="dropdown-menu">
			           	  <!-- 1未处理2已接受3拒绝4配送中5交易完成6已取消 -->
			           	  <li><a href="javascript:void()" onclick="checkAllOrder()">全部订单</a></li>
			              <li><a href="javascript:void()" onclick="orderFinish()">已完成的订单</a></li>
			              <li><a href="javascript:void()" onclick="orderUnFinish()">未完成的订单</a></li>   
			              <li><a href="javascript:void()" onclick="orderStatus2()">已接受</a></li>
			              <li><a href="javascript:void()" onclick="orderStatus3()">拒绝</a></li>
			              <li><a href="javascript:void()" onclick="orderStatus4()">配送中</a></li>
			              <li><a href="javascript:void()" onclick="orderStatus6()">已取消的订单</a></li>
		              </ul> 
					 </div>	
						<input style="margin: 3px 0px 2px 5px" align="right" type="text" id="txtName" placeholder="年-月-日 时:分:秒"  onblur="loadData(1)">
						<input style="margin: 2px 0px 2px 5px"  type="button" value="查询" class="btn btn-success" onclick="loadData(1)">
					</div>
								<table class="table table-bordered table-striped">
									<div class="widget-content nopadding">
										<div class="container-fluid">
									<thead>
										<tr>
											<th>序号</th>
											<th>订单编号</th>
											<th>店铺名称</th>
											<th>订单时间</th>
											<th>支付方式</th>
											<th>取货方式</th>
											<th>订单金额</th>
											<th>用户姓名</th>
											<th>联系电话</th>
											<th>送货地址</th>
											<th>付款状态</th>
											<th>订单状态</th>
										</tr>
									</thead>
									<tbody id="orderList">
									</tbody>
								</table>
<input type="hidden"  name="orderId" id="orderId" />
<input type="hidden"  name="payStatus" id="payStatus" />
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
										<div id="pager">
										</div>
									</div>
								</div>
							</div>
						</div>
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


<script type="text/javascript">
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
		pageinfo["status"]=status;
		pageinfo["name"] = $('#txtName').val();
		 $.ajax({
					type : "post",
					url : '${ctx}/order!findOrderList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr>');
								array.push('<td>' + (i + 1) + '</td>');
								array.push("<td><a href='javascript:void(0)' class='oederNumCss' onclick='orderInfo("+data["orderId"]+","+data["status"]+")'>" +data["flowNo"]+ "</a></td>");
								array.push('<td>' + data["shopName"] + '</td>');
								array.push('<td>' + data["orderTime"] + '</td>');
							
								if(data["payType"]==1){ array.push('<td>到店支付</td>');} 
								if(data["payType"]==2){ array.push('<td>货到付款(现金)</td>');}
								if(data["payType"]==3){ array.push('<td>货到付款(一卡通)</td>');}
								if(data["payType"]==4){ array.push('<td>货到付款(银行卡)</td>');}
								if(data["payType"]==5){array.push('<td>线上支付(一卡通)</td>');}
								if (data["payType"]==6){array.push('<td>线上支付(银行卡)</td>');}
								
								if(data["sendType"]==1){array.push('<td>配送</td>');}
								if(data["sendType"]==2){array.push('<td>自取</td>');}
								
								array.push('<td>' + data["money"]+ '</td>');
								array.push('<td>' + data["name"] + '</td>');
								array.push('<td>' + data["phone"] + '</td>');
								array.push('<td>' + data["address"] + '</td>');
								if(data["payStatus"]==1){
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle'> 未付款<span class='caret'></span></button>"
								 			+"<ul class='dropdown-menu'>"
								 			+"<li><a href='javascript:void()' onclick='updatePayStatus(2,"+data["orderId"]+")'>已付款</a></li>"
								 			+"</ul></div>" 
											+ "</td>"); 
								}else {
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle'>已付款 <span class='caret'></span></button>"
								 			+"</div>" 
											+ "</td>"); 
								}
								if(data["status"]==1){
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle' style=''>未处理<span class='caret'></span></button>"
								 			+"<ul class='dropdown-menu'>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(2,"+data["orderId"]+")'>已接受</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(3,"+data["orderId"]+")'>拒绝</a></li>"
								 			+"<li><a href='javascript:void()'  onclick='distribution(4,"+data["orderId"]+")'>配送中</a></li>"
								 			+"<li><a href='javascript:void()' onclick='trade(5,"+data["orderId"]+")'>交易完成</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(6,"+data["orderId"]+")'>已取消</a></li>"
								 			+"</ul></div>" 
											+ "</td>"); 
								}else if(data["status"]==2){
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle'>已接受<span class='caret'></span></button>"
								 			+"<ul class='dropdown-menu'>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(1,"+data["orderId"]+")'>未处理</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(3,"+data["orderId"]+")'>拒绝</a></li>"
								 			+"<li><a href='javascript:void()'  onclick='distribution(4,"+data["orderId"]+")'>配送中</a></li>"
								 			+"<li><a href='javascript:void()' onclick='trade(5,"+data["orderId"]+")'>交易完成</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(6,"+data["orderId"]+")'>已取消</a></li>"
								 			+"</ul></div>" 
											+ "</td>"); 
								}else if(data["status"]==3){
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle'>拒绝<span class='caret'></span></button>"
								 			+"<ul class='dropdown-menu'>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(1,"+data["orderId"]+")'>未处理</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(2,"+data["orderId"]+")'>已接受</a></li>"
								 			+"<li><a href='javascript:void()'  onclick='distribution(4,"+data["orderId"]+")'>配送中</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(5,"+data["orderId"]+")'>交易完成</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(6,"+data["orderId"]+")'>已取消</a></li>"
								 			+"</ul></div>" 
											+ "</td>"); 
								}else if(data["status"]==4){
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle'>配送中<span class='caret'></span></button>"
								 			+"<ul class='dropdown-menu'>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(1,"+data["orderId"]+")'>未处理</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(2,"+data["orderId"]+")'>已接受</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(3,"+data["orderId"]+")'>拒绝</a></li>"
								 			+"<li><a href='javascript:void()' onclick='trade(5,"+data["orderId"]+")'>交易完成</a></li>"
								 			+"<li><a href='javascript:void()' onclick='updateOrderStatus(6,"+data["orderId"]+")'>已取消</a></li>"
								 			+"</ul></div>" 
											+ "</td>"); 
								}else if(data["status"]==5){
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle'>交易完成<span class='caret'></span></button>"
											+"</div>" 
											+ "</td>"); 
								}else {
									array.push("<td>"
								 			+"<div class='btn-group'>"
								 			+"<button data-toggle='dropdown' class='btn btn-warning dropdown-toggle'>已取消<span class='caret'></span></button>"
								 			+"</div>" 
											+ "</td>"); 
								}
								 array.push('</tr>'); 
							}
							$('#orderList').html(array.join(''));
					 
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
							$('#pager').html('');	
							$('#orderList').html('<tr><td colspan="5">'+msg.msg+'</td></tr>');
						}
					}
				});
	}
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    loadData(pageclickednumber);
	}
	
	//付款状态 
	 function updatePayStatus(paystatus,orderId){
			 var ps = paystatus;
			var od = orderId;		
			$("#payStatus").val(ps);
			$("#orderId").val(od); 
			$.ajax({
				type : "post",
				url : '${ctx}/order!updateOrderPayStatus.action',
				dataType : 'json',
				data : {
					payStatus : ps,
					orderId:od
				},
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("付款状态修改成功！");
						window.location.reload(true);
					}
				}
			})
	 }
	//订单状态 
	function updateOrderStatus(status,orderId){
		 var  st = status;
		 var od = orderId;		
		$.ajax({
			type : "post",
			url : '${ctx}/order!updateOrderStatus.action',
			dataType : 'json',
			data : {
				status : st,
				orderId:od
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("订单状态修改成功！");
					window.location.reload(true);
				}
			}
		})
	}
	var status='';
	//跳转 订单详细信息页面 
	function orderInfo(orderId,status){
		location.href = "${ctx}/order!findOrderInfo.action?orderId="+orderId+"&status="+status;
	}
	
	/**
	 * 订单状态 1未处理2已接受3拒绝4配送中5交易完成6已取消
	 */
	//全部订单
	function checkAllOrder(){
		window.location.reload(true);
	}
	//交易完成
	function orderFinish(){
		status=5;
		loadData(1);
	}
	//未完成的 
	function orderUnFinish(){
		status=-1;
		loadData(1);
	}
	//配送中
	function orderStatus4(){
		status=4;
		loadData(1);
	}
	//拒绝
	function orderStatus3(){
		status=3;
		loadData(1);
	}
	//已接受
	function orderStatus2(){
		status=2;
		loadData(1);
	}
	//已取消
	function orderStatus6(){
		status=6;
		loadData(1);
	}
	
	// 配送前查订单是否已被接收
	function distribution(status,orderId){
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
	
	// 交易完成
	function trade(status,orderId){
		$.ajax({
			type : "post",
			url : '${ctx}/order!OrderCloseTheDealStatusPayment.action',
			dataType : 'json',
		    data : {
		    	status:status,
		    	orderId:orderId,
			}, 
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("订单状态修改成功！");
					window.location.reload(true);
				}
			}
		})
	}
</script>	
</body>
</html>

