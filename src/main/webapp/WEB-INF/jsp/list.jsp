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
  <td><input type="buttom" value="订阅" onclick="requestByJson(${book.bookId })"></td>
 
</tr>
</c:forEach>
</body> 
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js" type="text/javascript"></script>
<script type="text/javascript">

	function requestByJson(bid) {
		//alert(bid);
		var stid=12345678911;
		var p = {'studentId':stid};
		$.ajax({
			type : 'post',
			url : "${pageContext.request.contextPath }/book/"+bid+"/appoint",
			//设置contentType类型为json
			//contentType : 'application/json;charset=utf-8',
			//json数据
			data: {'studentId':stid},
			dataType: "json",
			//请求成功后的回调函数
			success : function(data) {
				alert(data);
			}
		});
	}
	

</script>
</html>