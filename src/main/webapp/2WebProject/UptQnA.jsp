<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  	import="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성</title>
</head>
<style>
html, body{
	height:100%;
	width:100%;
}

#container{
	height : auto;
	min-height: 100%;
}

#qtab{
	border-collapse: collapse;
	border: 1px solid #ddd;
	width:80%;
	height:800px;
	position: absolute;
	left:50%;
	top:54%;
	transform: translate(-50%,-50%);
}

#btn{
	position: absolute;
	left:75.5%;
	top:96.5%;
}
#btn [type="button"]{
	background:rgb(142, 68, 173);
	width:90px;
	height:40px;
	border:none;
	color:white;
}
</style>
<body>

<div id="container">
<h2>문의하기</h2>
<hr>
	<table id="qtab">
		<col width="10%"><col width="40%"><col width="10%"><col width="40%">
		<tr><th height="8%">작성자</th><td><input type="text" style="width:98%; height:70%;" name="id" value="admin"></td><th>공개여부</th><td><input type="radio" name="pub" value="y" checked/>공개 <input type="radio" name="pub" value="n"/>비공개</td></tr>
		<tr><th height="8%">문의 제목</th><td colspan="3"><input type="text" name="qtitle" style="width:99%; height:70%;"></td></tr>
		<tr><th>문의 내용</th><td colspan="3"><textarea name="qcont" style="width:99%; height:97%;"></textarea></td></tr>
	</table>
	
	<div id="btn">
		<input type="button" value="수정">
		<input type="button" value="삭제">
		<input type="button" value="취소">
	</div>
</div>


</body>
</html>