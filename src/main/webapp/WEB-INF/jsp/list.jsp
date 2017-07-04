<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath }/book/list" rel="external nofollow" >查询书单</a>
<table width="70%" border=1>
<tr>
  <td>书籍编号</td>
  <td>名称</td>
  <td>藏书量</td>
  <td>操作</td>
</tr>
<c:forEach items="${list}" var="book">
<tr>
  <td>${book.bookId }</td>
  <td>${book.name }</td>
  <td>${book.number }</td>
  <td><form id='form1' action='${pageContext.request.contextPath }/book/${book.bookId }/appoint' method='post'>     
    <input type='hidden' name='studentId' value='12345678911'/>   
    <input type="submit" value="订阅"></form></td>
 
</tr>
</c:forEach>
</body> 
</html>