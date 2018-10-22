<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page isELIgnored="false" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./statics/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./statics/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="./statics/css/demo.css">
	<style>
		a{text-decoration: none;}
	</style>
	<script type="text/javascript" src="./statics/js/jquery.min.js"></script>
	<script type="text/javascript" src="./statics/js/jquery.easyui.min.js"></script>
	<script>
		function openWin(id){
			$('#w').window('open');
			document.getElementById("userFrame").src="userEdit?id="+id;
		}
		function closeWin(){
			$('#w').window('close');
		}
		function delUser(id){
			if(confirm("确定删除此用户吗?")){
				location.href="delUser?id="+id;
			}
		}
	</script>
</head>
<body>
	<h2>用户管理</h2>
	<p>增删改按钮区</p>
	<div style="margin:20px 0;"><!--  ${fn:length(userList) } --></div>
	
	<table class="easyui-datagrid" title="用户列表" style="width:780px;height:250px"
			data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80">编号</th>
				<th data-options="field:'productid',width:150">电子邮箱</th>
				<th data-options="field:'listprice',width:80,align:'right'">昵称</th>
				<th data-options="field:'unitcost',width:80,align:'right'">性别</th>
				<th data-options="field:'attr1',width:200">加入日期</th>
				<th data-options="field:'status',width:60,align:'center'">状态</th>
				<th data-options="field:'edit',width:120,align:'center'">编辑</th>
			</tr>
		</thead>
		<c:forEach items="${requestScope.userList }" var="users">
			<tr>
				<td>${users.id }</td>
				<td>${users.email }</td>
				<td>${users.nickName }</td>
				<td>${users.sex }</td>
				<td>${users.addDate }</td>
				<td>${users.flag }</td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-ok" onclick="openWin(${users.id })"></a>
					<a href="javascript:delUser(${users.id })" class="easyui-linkbutton" icon="icon-cancel"></a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div id="w" class="easyui-window" title="用户编辑" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:400px;height:500px;padding:10px;">
		<iframe id="userFrame" name="userFrame" frameborder="0" width="100%" height="100%"></iframe>
	</div>
</body>
</html>