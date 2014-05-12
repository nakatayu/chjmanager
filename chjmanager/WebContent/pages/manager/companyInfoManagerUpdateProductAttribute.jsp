<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-media.css" />
<link rel="stylesheet" href="css/bootstrap-wysihtml5.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<style type="text/css">
a{cursor: pointer;}
.tag_content {
	margin: 0px;
	padding: 2px 0 2px 0;
	list-style: none;
	line-height: 20px;
	font-size: 15px;
}

.shop_announcement {
	width: 557px;
	high: 57px;
	overflow-x: visible;
	overflow-y: visible;
}

#a1 {
	background-color: skyblue
}

[titie~=labelstyle] {
	font-size: 20px;
}

.tdstyle {
	font-size: 20px;
}
/*  遮罩层 */
.black_overlay {
	display: none;
	position: absolute;
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
	position: absolute;
	top: 30%;
	left: 10%;
	width: 600px;
	height:200px;
	border: 2px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

.white_content_small {
	display: none;
	position: absolute;
	top: 20%;
	left: 30%;
	width: 10%;
	height: 20%;
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

	<div id="content" style="width: 83%;">
	<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a>
					<a href="${ctx}/pages/manager/companyInfoManager.jsp" title="企业列表" class="current">
				 <i class=" icon-fire"></i>企业列表</a> 
				 <a	onclick="returnProductAtt()"  title="商品属性" class="current"></i> 商品属性</a> 
				 <a href="#" class="current">商品更多属性</a>
			</div>
		</div> 
			<!-- 遮罩层  -->
			<div id="dialog_div" class="white_content"
				style="padding: 30px 0px 0px 50px;">
				<div
					style="cursor: default; height: 40px; padding: 0px 20px 0px 0px;">
					<span style="flaot:left;font-size: 16px;">修改价格</span>
					<a href="#"><span style="float:right;font-size: 16px;"
						onclick="CloseDiv('dialog_div','dialog_black')"> <font color="orange">关闭
						</font></span></a>
				</div>
				<table>
					<tr>
						<td><label class="control-label">市场价：</label></td>
						<td><input type="hidden" id="hiddenProductSkuId" />
							<div class="controls">
								<input type="text" id="txtOldPrice" style="width: 250px;" />
							</div></td>
					</tr>
					<tr>
						<td><label class="control-label">售价：</label></td>
						<td>
							<div class="controls">
								<input type="text" id="txtPrice" style="width: 250px;" />
							</div>
						</td>
					</tr>
				</table>
				<br>
				<br>
				<table>
					<tr>
						<td>
							<button class="btn btn-warning" type="button"
								onclick="saveDialogPrice()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<button class="btn btn-warning" type="button"
								onclick="clearDialog()">重&nbsp;&nbsp;&nbsp;&nbsp;置</button>
						</td>
					</tr>
				</table>
			</div>
		<div id="dialog_black" class="black_overlay"></div>
		
			
	<div class="widget-content"  style="margin-left: 40px;width: 100%;">
              <div style="width: 150px;float: left;height: 200px;">
              <h5>选择商品图片:</h5><br>
            <!--   <a class="btn btn-warning" id="addImages" type="button">添&nbsp;&nbsp;&nbsp;加</a><br><br><br>
              <a class="btn btn-warning" id="addTheNewImages" type="button">保&nbsp;&nbsp;&nbsp;存</a> -->
              </div>
              <ul class="thumbnails" id="imageUpdate">	
            </ul>
            </div>
          <br>
        <div style="padding-left: 50px;">
        <h5>商品属性修改:
        </h5>
         </div>
        <div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
        <table class="table table-bordered">
        <thead> <tr><th>属性名称</th><th>属性值</th></tr></thead><!-- <th>操作</th> -->
       <tbody id="attribute">
        </tbody>
        </table>
        </div></div></div>
        <div style="padding-left: 50px;">
        <div id="newAttribute" style="display: none;"><span><font color="red">
        一个属性名称可对应多个属性值，中间用“#”隔开，示例1：属性名称：颜色，属性值：白色#红色#绿色；示例：属性名称：类型，属性值：A型#B型；
        
        </font></span> 
        <br>属性名称：<input id="attributeName" type="text" maxlength="10">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-warning" onclick="addTheNewAttribute()">确定</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-warning" onclick="$('#newAttribute').hide()">取消</a>
        <br/>属&nbsp;性&nbsp;值：<input id="attributeValue" type="text" style="width: 500px;">
        </div>
        <!-- <h5><a class="btn btn-warning" onclick="$('#newAttribute').show();$('#attributeSkued').hide();">新建属性</a>
        <a class="btn btn-warning" onclick="insertTheSku()">添加商品Sku</a> -->
        </h5>
        <div id="attributeSkued" style="display: none;">
        <span><font color="red">如果不同属性对应不同价格，请在上面的商品属性里选择对应属性，再进行下面操作。</font></span> <br>
        Sku名称：<input id="proSkuName" type="text" style="width: 500px;" readonly="readonly"><br>
        原价：<input id="proSkuOPrice" type="text" style="width: 50px;">
        现价：<input id="proSkuPrice" type="text" style="width: 50px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-warning" onclick="addTheProductSku()">确定</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-warning" onclick="$('#attributeSkued').hide()">取消</a>
        </div>
         </div>
          <div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
            <table class="table table-bordered" width="1000px;">
              <thead>
              <tr>              
              <th>序号</th> <th>SKU名称</th> <th>市场价</th>  <th>售价</th> <!--  <th></th> -->
              </tr>
              </thead>
              <tbody id="productSku">
              </tbody>
            </table>
          </div></div></div>
          <div class="form-actions" style="height: 30px;">
          <ul class="thumbnails">
          <li></li>
          <li></li>
          <!-- <li><button class="btn btn-warning" onclick="returnProductAtt()" >返&nbsp;&nbsp;&nbsp;&nbsp;回</button></li> -->
          </ul>		
          </div></div>
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/jquery.ui.custom.js"></script>
		<script src="${ctx}/js/bootstrap.min.js"></script>
		<script src="${ctx}/js/jquery.uniform.js"></script>
		<script src="${ctx}/js/select2.min.js"></script>
		<script src="${ctx}/js/jquery.validate.js"></script>
		<script src="${ctx}/js/matrix.js"></script>
		<script src="${ctx}/js/matrix.form_validation.js"></script>
		<script src="${ctx}/js/bootstrap-datepicker.js"></script>
		<script src="${ctx}/js/wysihtml5-0.3.0.js"></script>
		<script src="${ctx}/js/jquery.peity.min.js"></script>
		<script src="${ctx}/js/bootstrap-wysihtml5.js"></script>
		<script src="${ctx}/js/bootstrap-colorpicker.js"></script>
		<script src="${ctx}/js/masked.js"></script>
		<script src="${ctx}/js/jquery.toggle.buttons.html"></script>
		<script src="${ctx}/js/myself/ajaxupload.js"></script>
		<%--<script src="${ctx}/js/matrix.form_common.js"></script>  --%>
		<script>
			$('.textarea_editor').wysihtml5();
		</script>
<script src="${ctx}/js/jquery.pager.js"></script>
		<jsp:include page="/common/buttom.jsp"></jsp:include>

</body>
</html>
<script type="text/javascript">
productId="${param.productId}";
var maxImage=0;
var s=-1;


$(function() {
	
	$.ajax({
		type:"post",
		url:'${ctx}/product!moreUpdateAttribute.action',
		dataType:'json',
		data:{productId:productId},
		success:function(msg,status){
			if(msg.status==200){
				var images=msg.rows["imglist"];
				var proSku=msg.rows["proSku"];
				var proAttr=msg.rows["proAttr"];
				maxImage=images.length;
				var str='';
				for(var i=0;i<images.length;i++){
					str+='<li id="llii'+images[i]["product_image_id"]+'"><div style="width: 150px;border: 1px solid #ccc; float: center;">'+
					'<img style="width: 150px; height: 160px;" src="${http_img}'+images[i]["file_path"]+'"/>'+
					'<div style="height: 30px;padding: 10px 0 0 50px;"><input type="hidden" id="productImage'+
					images[i]["product_image_id"]+'" value="'+images[i]["file_path"]+'"/>'+
					'</div>'+
					'</div></li>';
					//<a style="font-size: 20px;" onclick="deleteImage('+images[i]["product_image_id"]+')">删除</a>
				}
				
				$('#imageUpdate').html(str);
				str='';
				for(var i=0;i<proAttr.length;i++){
					
					str+='<tr><td id="attr'+proAttr[i]["product_attribute_id"]+'">'+proAttr[i]["name"]+'</td><td>';
					for(var j=0;j<proAttr[i]["attrVal"].length;j++){
						var attrVal=proAttr[i]["attrVal"][j];
						str+='<input id="attrVal'+attrVal["product_attribute_value_id"]+'" type="checkbox" name="attrVal'+proAttr[i]["product_attribute_id"]+
						'" value="'+attrVal["product_attribute_value_id"]+
						'"><span id="pan'+attrVal["product_attribute_value_id"]+'">'+attrVal["name"]+'</span>'+
						'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					}
					//str+='</td><th><a onclick="deleteAttrVal('+proAttr[i]["product_attribute_id"]+')">删除</a></th></tr>';
				}
				
				$('#attribute').append(str);
				str='';				
				for(var i=0;i<proSku.length;i++){
					str+='<tr><td>'+proSku[i]["sku_no"]+'</td><td>'+proSku[i]["sku_kind"]+'</td><td>'
					+proSku[i]["old_price"]+'</td>'+'<td>'+proSku[i]["price"]+
					'</td></tr>';
				}
				//<td><a onclick="deleteProSku('+proSku[i]["product_sku_id"]+')">删除</a>&nbsp;<a onclick="startDiv('+proSku[i]["product_sku_id"]+','+proSku[i]["price"]+','+proSku[i]["old_price"]+')">修改价格</a></td>
				$('#productSku').append(str);
				str='';
				
			}else{
				alert(msg.msg);
			}
		}		
	});
	
	var $uploadBtn = $("#addImages");
    new AjaxUpload($uploadBtn, {
        action: '${ctx}/product!uploadProductImage.action',
        name: 'uploadFile',
        responseType:'json',
        onChange: function (file, extension) {
        	  if($('#imageUpdate li').length>=4){
        		  alert('最多添加4张!');
            	  return false;
              }
        }, 
        onSubmit: function(file, ext){
        	ext=ext. toLowerCase(); //ext 文件后缀     
            if(ext=='bmp'||ext=='jpg'||ext=='jpeg'||ext=='png'){
            	
            }else{
            	alert('图片格式不对');
            	return false;
            }
                
	    },
	    
        onComplete: function(file, response){
        	if(response.status == 200){
        		
        		  $('#imageUpdate').append('<li id="llii'+s+'"><div style="width: 150px;border: 1px solid #ccc; float: center;">'+
      					'<img style="width: 150px; height: 160px;" src="${http_img}'+ response.rows+'"/>'+
    					'<div style="height: 30px;padding: 10px 0 0 50px;"><input type="hidden" id="productImage'+s+'" value="'+response.rows+'"/>'+
    					'</div>'+
    					'</div></li>');
        		  s--;
        		  //<a style="font-size: 20px;" onclick="deleteImage('+s+')">删除</a>
        	}else{
        		  alert(response.msg);
        	  }
        }
    });
        $('#addTheNewImages').click(function(){
    	var str='';
    	
    	$('input[id^="productImage"]').each(function(){
    		str+=$(this).val()+',';
    	});    	
    	
    	$.ajax({
    		type:"post",
    		url:'${ctx}/product!addTheProductImages.action',
    		dataType:'json',
    		data:{productId:productId,imgpath:str},
    		success:function(msg,status){
    			if(msg.status==200){
    				alert('保存成功！');
    				
    			}else{
    				alert(msg.msg);
    			}
    		}
    	}); 	
    });

});


function deleteImage(i){
	//$('#llii'+i).prev().remove();
	$('#llii'+i).remove();
}
/**
 *添加属性 
 */
function addTheNewAttribute(){
	var pam={};
	pam["attribute"]=$.trim($('#attributeName').val());
	pam["attributeValue"]=$.trim($('#attributeValue').val());
	pam["productId"]=productId;
	 
	$.ajax({
		type:"post",
		url:'${ctx}/product!addTheProductAttribute.action',
		dataType:'json',
		data:pam,
		success:function(msg,status){
			if(msg.status==200){
				
				var attrBate=msg.rows;
				var sttr='<tr><td id="attr'+attrBate["attrId"]+'">'+attrBate["attriBute"]+'</td><td>';
				
				for(var j=0;j<attrBate["listVal"].length;j++){
					var attrVal=attrBate["listVal"][j];
					sttr+='<input id="attrVal'+attrVal["valId"]+'" type="checkbox" name="attrVal'+attrBate["attrId"]+
					'" value="'+attrVal["valId"]+
					'"><span id="pan'+attrVal["valId"]+'">'+attrVal["attributeValue"]+'</span>'+
					'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				}
				sttr+='</td><th><a onclick="deleteAttrVal('+attrBate["attrId"]+')">删除</a></th></tr>';
				
				$('#attribute').prepend(sttr);
				$('#newAttribute').hide();
			}else{
				alert(msg.msg);
			}
		}
	});
}

function deleteProSku(i){
	$.ajax({
		type:"post",
		url:'${ctx}/product!updateTheSkuType.action',
		dataType:'json',
		data:{skuId:i},
		success:function(msg,status){
			if(msg.status==200){
				alert("已删除！");
				location.reload();
			}else
				alert(msg.msg);
		}		
	});
}
function deleteAttrVal(i){
	alert(i);
	$.ajax({
		type:"post",
		url:'${ctx}/product!updateTheAttrType.action',
		dataType:'json',
		data:{attributeId:i},
		success:function(msg,status){
			if(msg.status==200){
				alert("已删除！");
				location.reload();
			}else
				alert(msg.msg);
		}		
	});	
}
var productSku=""; 
function insertTheSku(){
	productSku="";
	var text="";	
	$('td[id^="attr"]').each(function(){
		
		var pid=$(this).attr("id").replace("attr","attrVal");
		var pname=$(this).html();		
		$('input:checkbox[name="'+pid+'"]:checked').each(function(){
			if(this.checked){				
				var nid=$(this).val();
				var cname=$('#pan'+nid).html();
				text=text+pname+":"+cname+",";
				productSku=productSku+nid+",";
			}			
		});
		
	});
	$('#proSkuName').val(text);		
	$('#attributeSkued').show();$('#newAttribute').hide();
}

function addTheProductSku(){
	
	var p =/^\d{1,}([.]\d{1,2})?$/;
	
	var skuData={};
	skuData["productId"]=productId;
	skuData["proAValue"]=productSku;
	skuData["skuKind"]=$('#proSkuName').val();
	
	var pricre=$.trim($('#proSkuPrice').val());
	
	if(pricre.length==0){
		alert("售价不能为空！");
		return;
	}else{
	    if(p.test(pricre)==false){
	    	alert("格式不对！");
	    	$('#proSkuPrice').val("");
			return;
	    }else
	    	skuData["price"]=pricre;
	}
	
	
	
	var oldpricre=$.trim($('#proSkuOPrice').val());
	if(oldpricre.length==0){
		skuData["oldPrice"]=pricre;
	}else{		 	   
	    if(p.test(oldpricre)==false){
	    	alert("格式不对！");
	    	$('#proSkuOPrice').val("");
			return;
	    }else
		skuData["oldPrice"]=oldpricre;
	}
	
	$.each(skuData,function(k,v){
		alert(k+"----"+v);
	});
	
	$.ajax({
		type:"post",
		url:'${ctx}/product!addTheProductSku.action',
		dataType:'json',
		data:skuData,
		success:function(msg,status){
			if(msg.status==200){
				alert("添加成功！");
				window.location.reload();
			}else{
				alert(msg.msg);
			}			
		}		
	});	
}
function saveDialogPrice(){
	var p =/^\d{1,}([.]\d{1,3})?$/;
	var oldPrice = $('#txtOldPrice').val();
	var price = $('#txtPrice').val();
	if(oldPrice.length==0){
		alert("不为空!");
		return;
	}
	if(oldPrice.length==0){
		alert("不为空!");
		return;
	}
	if(!p.test(oldPrice)){
		alert("请输入两位小数!");
		return;
	}
	if(!p.test(price)){
		alert("请输入两位小数!");
		return;
	}
	
	$.ajax({
		type:"post",
		url:'${ctx}/product!updateProductSkuPrice.action',
		dataType:'json',
		data:{skuId:$('#hiddenProductSkuId').val(),price:price,oldPrice:oldPrice},
		success:function(msg,status){
			if(msg.status==200){
				alert("修改成功！");
				window.location.reload();
			}else{
				alert(msg.msg);
			}			
		}		
	});	
}
//打开遮罩层
function startDiv(id,price,oldprice) {
	$('#hiddenProductSkuId').val(id);
	$('#txtOldPrice').val(oldprice);
	$('#txtPrice').val(price);
	document.getElementById('dialog_div').style.display = 'block';
    document.getElementById('dialog_black').style.display = 'block';
}
//关闭遮罩层
function CloseDiv(show_div,close_div) {
	document.getElementById(close_div).style.display = 'none';
	document.getElementById(show_div).style.display = 'none';
}
//返回
function returnProductAtt(){
	
	  window.location = "${ctx}/product!updateProductInfo.action?productId="+productId;
	
}
function clearDialog(){
	$('#hiddenProductSkuId').val('');
	$('#txtOldPrice').val('');
	$('#txtPrice').val('');
}
</script>




