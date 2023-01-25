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


#WriteQnATitle{
	    text-align: center;
    margin: 15px 0 0 0;
}

/* #container{
	height : auto;
	min-height: 100%;
} */

#qtab{
	border-collapse: collapse;
    /* border: 1px solid #ddd; */
    width: 60;
    height: 626px;
    position: absolute;
    left: 50%;
    top: 58%;
    transform: translate(-50%,-50%);
}

#InertQnABtn{
	position: absolute;
	left:47%; 
	top:94%;
}
#InertQnABtn [type="button"],
#InertQnABtn [type="submit"]{
	background:rgb(142, 68, 173);
	width:90px;
	height:40px;
	border:none;
	color:white;
}
</style>
<body style="padding-top: 138px;">
	<jsp:include page="Top.jsp"/>
<div id="container">
	<h1 id="WriteQnATitle">문의하기</h1>
		<form method="get" action="CheckQnA.jsp" onsubmit="return Check()">
		<table id="qtab">
			<col width="10%"><col width="40%"><col width="10%"><col width="40%">
			<tr>
				<th height="8%">작성자</th>
				<td><input type="text" style="width:98%; height:70%;" name="gesiid" readOnly value="${Login.username }"></td>
			<tr>
				<th height="8%">문의 제목</th>
				<td colspan="3"><input type="text" name="gesititle" style="width:99%; height:70%;"></td>
			</tr>
			<tr>
				<th>문의 내용</th>
				<td colspan="3"><textarea name="gesiqnacontent" style="width:99%; height:99%;"></textarea></td>
			</tr>
			<tr>
				<th>답변내용</th>
				<td colspan="3"><textarea readOnly name="gesiansercontent" style="width:99%; height:99%;">-</textarea></td>
			</tr>
		</table>
		<input type="hidden" name="qnaval" value="ins"/>
		<input type="hidden" name="alertcontent" value="새로운 문의글이 등록되었습니다."/>
		<input type="hidden" name="moveurl" value="Main.jsp?translate=3"/>
		<input type="hidden" name="sendid" value="${Login.id }"/>
		<input type="hidden" name="alerttype" value="문의등록"/>
		<div id="InertQnABtn">
			<input type="submit" value="등록">
			<input type="button" onclick="location.href='Main.jsp'" value="취소">
		</div>
		</form>
</div>
</body>
<script>
 function Check(){
	 var gesititle = document.querySelector("input[name=gesititle]").value
	 var gesiqnacontent = document.querySelector("textarea[name=gesiqnacontent]").value
	 
	 if(gesititle.length<=5){
		alert("제목은 5자 이상으로 부탁드립니다.")	
		return false;
	 }
	 if(gesiqnacontent.length<=10){
		 alert("내용은 10자 이상으로 부탁드립니다.")
		 return false;
	 }
	 return true;
 }
</script>
</html>