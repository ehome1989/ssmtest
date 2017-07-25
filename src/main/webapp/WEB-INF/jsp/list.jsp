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
<span>${username}</span>&nbsp;
<c:if test="${username!=null}">  
        <a href="#" onclick="logout(${username})">退出</a>  
    </c:if>  
<br/>
输入书籍名称进行搜索<form action="#" method="get">
<input id="bookname" name="name" type="text" />
<input type="button" value="搜 索" onclick="listBooks()"/>
</form>
<table id="book" width="70%" border=1>
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
  <td id=${book.bookId }>${book.number }</td>
  <td><a href="#" onclick="requestByJson(${ username},${book.bookId })">订 阅</a></td>
 
</tr>
</c:forEach>
</table>
</body> 
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js" type="text/javascript"></script>
<script type="text/javascript">
	function requestByJson(stid, bid) {
		//alert(bid);
		//var stid=12345678918;
		var p = {'studentId':stid};
		$.ajax({
			type : 'post',
			url : "${pageContext.request.contextPath }/book/"+bid+"/appoint",
			//设置contentType类型为json
			//contentType : 'application/json;charset=utf-8',//错误写法
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//缺省值
			//json数据
			data: {'bookId':1004,'studentId':stid},//必传参数必须填写，位置任意。增加参数，不影响执行
			dataType: "json", //告诉服务器期待返回何种类型的数据
			//请求成功后的回调函数
			success : function(data) {
				//alert(JSON.stringify(data));
				var res = JSON.stringify(data);
				var res2 = eval("("+res+")");//转换成json对象
				alert(res2.data["stateInfo"]);//提示预约结果
				if(res2.data["state"]==1){//预约成功需要更新库存数
					var book = JSON.stringify(res2.data["appointment"]);
					var appointment = eval("("+book+")");
					$('td[id='+bid+']').html(appointment.book["number"]);
				}
			}
		});
	}
	function listBooks(){
		var name = $('input[id="bookname"]').val();
		alert(name);
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath }/book/list?name="+name
			//data: {'name':name}
		});
	}
	function logout(username){
		alert(username+"退出登录");
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/logout",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",	
			data : {"username":username},
			dataType : "json",
			success : function(data){}
		});
	}
</script>
</html>