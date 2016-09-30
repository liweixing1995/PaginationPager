<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>学生信息</title>
  </head>
  <%
  	//获取请求上下文
  	String context = request.getContextPath();
  %>
  <script type="text/javascript">

	//当前显示第几页数据
	var currentPage = ${result.currentPage};
	//一共多少页数据
	var totalPage = ${result.totalPage};
	function submitForm(actionUrl){
		var formElement = document.getElementById("stuForm");
		formElement.action = actionUrl;
		formElement.submit();
	}
	
	//第一页
	function firstPage(){
		if(currentPage == 1){
			alert("已经是第一页数据");
			return false;
		}else{
			submitForm("<%=context%>/sublistServlet/SublistServlet?pageNum=1");
			return true;
		}
	}

	//下一页
	function nextPage(){
		if(currentPage == totalPage){
			alert("已经是最后一页数据");
			return false;
		}else{
			submitForm("<%=context%>/sublistServlet/SublistServlet?pageNum="+(currentPage+1));
		}
	}

	//上一页
	function previousPage(){
		if(currentPage == 1){
			alert("已经是第一页数据");
			return false;
		}else{
			submitForm("<%=context%>/sublistServlet/SublistServlet?pageNum="+(currentPage-1));
			return true;
		}
	}

	//尾页
	function lastPage(){
		if(currentPage == totalPage){
			alert("已经是最后一页数据");
			return false;
		}else{
			submitForm("<%=context%>/sublistServlet/SublistServlet?pageNum=${result.totalPage}");
			return true;
		}
	}

  </script>
  <body>
  	<div style="margin-left:100px; margin-top:100px;">
		<font color="red">${errorMsg }</font>  	
  		<div>
  			<form action="<%=context%>/sublistServlet/SublistServlet" id="stuForm" method="post">
  			        姓名
  			   <input type="text" name="stu_name" id="stu_name" style="width:120px">
  			        性别
  			   <select name="gender" id="gender" style="width:80px">
  			     <option value="0">全部</option>
  			     <option value="1">男</option>
  			     <option value="2">女</option>
  			   </select>
  			   <input type="submit" value="查询">
  			</form>
  	     </div>
  	     <br>
  	           学生信息列表：<br>
  	     <br>
  	     
  	     <!-- 后台返回结果为空 -->
  	     <c:if test="${fn:length(result.dataList) eq 0 }">
  	     	<span>查询的结果不存在</span>
  	     </c:if>
  	     
  	     <!-- 后台返回结果不为空 -->
  	     <c:if test="${fn:length(result.dataList) gt 0 }">
  	     
  	     <table border="1px" cellspacing="0px" style="border-collapse:collapse">
  	     	<thread>
  	     	  <tr height="30">
  	     	  	<th width="130">姓名</th>
  	     	  	<th width="130">性别</th>
  	     	  	<th width="130">年龄</th>
  	     	  	<th width="130">家庭地址</th>
  	     	  </tr>
  	     	</thread>
  	     	
  	     	<c:forEach items="${result.dataList }" var="student">
  	     		<tr>
  	     			<td><c:out value="${student.stuName }"></c:out></td>
  	     			<td>
  	     				<c:if test="${student.gender eq 1 }">男</c:if>
  	     				<c:if test="${student.gender eq 2 }">女</c:if>
  	     			</td>
  	     			<td><c:out value="${student.age }"></c:out></td>
  	     			<td><c:out value="${student.address }"></c:out></td>
     			</tr>
  	     	</c:forEach>
  	     </table>
  	     <br>共${result.totalRecord}条记录，共${result.totalPage}页&nbsp;&nbsp;当前第${result.currentPage}页&nbsp;&nbsp;
  	     <a href="#" onclick="firstPage();">首页</a>&nbsp;&nbsp;
  	     
  	     <a href="#" onclick="previousPage();">上一页</a>&nbsp;&nbsp;
  	     <a href="#" onclick="nextPage();">下一页</a>&nbsp;&nbsp;
  	     <a href="#" onclick="lastPage();">尾页</a>
  	     </c:if>
  </body>
</html>
