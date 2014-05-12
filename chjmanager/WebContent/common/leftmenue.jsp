<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
</head>
<body>

	<!--sidebar-menu-->

	<div id="sidebar">
		<c:choose>
			<%-- 漕河泾开发区侧列表 --%>
			<c:when test="${(sessionScope.user.type=='1')}">
				<ul>
					<li class="submenu"><a href="#"><i class="icon icon-list"></i>
							<span>系统管理</span> </a>
						<ul>
							<li><a href="${ctx}/pages/manager/addCode.jsp">生成邀请码</a></li>
							<li><a
								href="${ctx}/pages/manager/comapnyInfoManagerPersonnelManagerList.jsp">管理员</a></li>
							<li><a href="${ctx}/pages/manager/UserDaily.jsp">日志管理</a></li>
							<li><a href="${ctx}/pages/manager/PublicOpinionControl.jsp">舆情控制</a></li>
							<li><a href="${ctx}/pages/manager/WebAdvertisement.jsp">WEB广告设置</a></li>
							<li><a href="${ctx}/advertisement!advertisementList.action">APP广告设置</a></li>
							<li><a href="${ctx}/sethotamount!findHotSet.action">热门维度设定</a></li>
							<li><a href="${ctx}/pages/manager/app_version.jsp">版本管理</a></li>
						</ul></li>
					<li class="submenu"><a href="#"><i class="icon icon-th"></i>
							<span>数据维护</span></a>
						<ul>
							<li><a href="${ctx}/pages/manager/LocationManage.jsp">位置管理</a></li>
							<li><a href="${ctx}/pages/manager/manger_tag_list.jsp">标签设置</a></li>
							<li><a href="${ctx}/pages/manager/CircleLevel.jsp">菁汇级别设置</a></li>
							<li><a href="${ctx}/pages/manager/CompanyType.jsp">企业类型设置</a></li>
							<li><a href="${ctx}/pages/manager/ShopType.jsp">店铺类型设置</a></li>
							<li><a href="${ctx}/pages/manager/webShopStatus.jsp">店铺网页状态提示语</a></li>
							<li><a href="${ctx}/pages/manager/manger_category_list.jsp">商品类目管理</a></li>
							<li><a href="${ctx}/pages/manager/PayType.jsp">支付方式设置</a></li>							
						</ul></li>

					<li class="submenu"><a href="#"><i class="icon icon-th"></i>
							<span>企业管理</span><span id="comcop" style="margin-left: 20px; color: red;"></span></a>
						<ul>
							<li><a href="${ctx}/pages/manager/companyInfoManager.jsp">企业信息维护<span
									id="company" style="margin-left: 20px; color: red;"></span>
							</a></li>
							<li><a
								href="${ctx}/pages/manager/companyInfoManagerShopList.jsp">店铺信息维护
									<span id="shop" style="margin-left: 20px; color: red;"></span>
							</a></li>
							<li><a href="${ctx}/pages/manager/companyInfoManagerProductList.jsp?companyId=0">企业下商品</a></li>
							<li><a href="${ctx}/pages/manager/companyInfoManagerProductList.jsp?companyId=0&companyShopId=0">店铺下商品</a></li>
							
						</ul></li>
						
						<li class="submenu"><a href="#"><i class="icon icon-home"></i>
							<span>信息管理</span><span id="infcop" style="margin-left: 20px; color: red;"></span></a>
						<ul>
						<li><a href="${ctx}/pages/manager/ServiceList.jsp"><span>共享漕河泾维护</span> <span
							id="service" style="margin-left: 20px; color: red;"></span> </a></li>

					<li><a href="${ctx}/pages/manager/TopicList.jsp"><span>瞩目漕河泾维护</span><span id="topic"
							style="margin-left: 20px; color: red;"></span> </a></li>

					<li><a href="${ctx}/pages/manager/ActivityList.jsp">菁彩维护 <span
							id="activity" style="margin-left: 20px; color: red;"></span> </a></li>

					<li><a href="${ctx}/pages/manager/CircleList.jsp">菁汇维护<span id="circle"
							style="margin-left: 20px; color: red;"></span> </a></li>

					<li><a href="${ctx}/pages/manager/TopicListJingdian.jsp">菁典维护</a></li>

					<li><a href="${ctx}/pages/manager/PushList.jsp">信息推送维护<span
							id="push" style="margin-left: 20px; color: red;"></span></a></li>						
						</ul></li>	
					<li><a href="${ctx}/pages/manager/MemberManager.jsp"><i
							class="icon icon-star"></i> <span>用户会员管理</span></a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li><a href="${ctx}/company!findCompanyInfo.action"><i
							class="icon icon-home"></i> <span>企业信息</span></a></li>

					<c:if
						test="${sessionScope.user.type=='2'||sessionScope.user.type=='3'}">
						<li><a href="${ctx}/pages/company/ProductList.jsp"><i
								class="icon icon-th"></i> <span>商品维护</span></a></li>
					</c:if>

					<c:if
						test="${sessionScope.user.type=='4'||sessionScope.user.type=='5'}">
						<li><a href="${ctx}/pages/starbucks/ProductList.jsp"> <i
								class="icon icon-list"></i><span>商品维护</span></a>
						<li><a href="${ctx}/pages/starbucks/CustomizeFlavors.jsp"><i
								class="icon icon-list"></i><span>商品附加属性</span></a></li>
					</c:if>

					<li><a href="${ctx}/pages/company/ShopList.jsp"><i
							class="icon icon-signal"></i> <span>店铺维护</span></a></li>

					<li><a href="${ctx}/pages/company/ServicecompanyList.jsp"><i
							class="icon icon-inbox"></i> <span>共享漕河泾维护</span> </a></li>

					<li><a
						href="${ctx}/pages/company/CompanyManagerAccountSet.jsp"><i
							class="icon icon-fullscreen"></i> <span>人员维护</span></a></li>

					<li><a href="${ctx}/pages/company/OrderList.jsp"><i
							class="icon icon-tint"></i> <span>订单维护</span></a></li>

					<li><a href="${ctx}/pages/company/c_activityList.jsp"><i
							class="icon icon-signal"></i> <span>菁彩维护</span></a></li>

					<li><a href="${ctx}/pages/company/c_topicList.jsp"><i
							class="icon icon-home"></i><span>瞩目漕河泾维护</span></a></li>

					<li><a href="${ctx}/pages/company/c_circleList.jsp"><i
							class="icon icon-pencil"></i> <span>菁汇维护</span></a></li>

					<li><a href="${ctx}/pages/company/PushList.jsp"><i
							class="icon icon-volume-down"></i><span>推送管理</span></a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		if ($.trim('${user.type}') == '1') {
			selectData();
			setInterval("selectData()", 600000);
		}
	});

function selectData(){	
	$.ajax({
		type : "post",
		dataType : 'json',
		data : {},
		url : '${ctx}/user!checkfullInfo.action',
		success : function(msg, status) {
			if (msg.status == 200) {
				var data = msg.rows;				
				var comcop=false;
				var comcopval=0;
				var infcop=false;
				var infcopval=0;
				if (data["companyNum"] != ''
						&& data["companyNum"] != '0') {
					$('#company').html(data["companyNum"]);
					comcopval+=parseInt(data["companyNum"]);
					comcop=true;
				}else{
					$('#company').html('');
				}
				if (data["shopNum"] != ''
						&& data["shopNum"] != '0') {
					$('#shop').html(data["shopNum"]);
					comcopval+=parseInt(data["shopNum"]);
					comcop=true;
				}else{
					$('#shop').html('');
				}
				if (data["serviceNum"] != ''
						&& data["serviceNum"] != '0') {
					$('#service').html(data["serviceNum"]);
					infcopval+=parseInt(data["serviceNum"]);
					infcop=true;
				}else{
					$('#service').html('');
				}
				if (data["topicNum"] != ''
						&& data["topicNum"] != '0') {
					$('#topic').html(data["topicNum"]);
					infcopval+=parseInt(data["topicNum"]);
					infcop=true;
				}else{
					$('#topic').html('');
				}
				if (data["activityNum"] != ''
						&& data["activityNum"] != '0') {
					$('#activity').html(data["activityNum"]);
					infcopval+=parseInt(data["activityNum"]);
					infcop=true;
				}else{
					$('#activity').html('');
				}
				if (data["circleNum"] != ''
						&& data["circleNum"] != '0') {
					$('#circle').html(data["circleNum"]);
					infcopval+=parseInt(data["circleNum"]);
					infcop=true;
				}else{
					$('#circle').html('');
				}
				if (data["pushNum"] != ''
						&& data["pushNum"] != '0') {
					$('#push').html(data["pushNum"]);
					infcopval+=parseInt(data["pushNum"]);
					infcop=true;
				}else{
					$('#push').html('');
				}
				if(comcop){
					$('#comcop').html(comcopval);
				}
				if(infcop){
					$('#infcop').html(infcopval);
				}				
			}
		}
	});
}
	
</script>
