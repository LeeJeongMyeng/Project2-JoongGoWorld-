<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
 
   %>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="css/QnA.css?after">
<style>

</style>
<script>

</script>
</head>
<body>
	
	
	<jsp:useBean id="GDao" class="webproject.Gesipan"/>
	<jsp:useBean id="Gsch" class="webproject.GesipanVO"/>
	<jsp:setProperty property="*" name="Gsch"/>
	
	<c:if test="${empty param.gesiid }">${Gsch.setGesiid("")}</c:if>

		<div>
		<h1 id="gesiTitle">문의게시판</h1>
			<table class="gesitb" >
				<thead>
					<tr><th class="gesi_numh">번호</th><th class=gesi_writerh>글쓴이</th><th class="gesi_titleh">제목</th><th class="gesi_dateh">등록날짜</th><th>답변상태</th></tr>
				</thead>	
				<tbody>
				<c:forEach var="gesi" items="${GDao.getGesiAllList(Gsch) }">
				<tr><td class="gesi_numb" onclick="">${gesi.gesiqnano }</td>
				<td class="gesi_writerb">${gesi.gesiid }</td>
				<td class="gesi_titleb">
					<form method="get" action="ViewQnA.jsp" onsubmit="return QnACheckDiv(this)">
						<input type="hidden" name="gesiqnano" value="${gesi.gesiqnano }"/>
						<input type="hidden" name="gesiid" value="${gesi.gesiid }"/>
						<input type="submit" value="${gesi.gesititle }"/>
					</form>
				</td>
				<td class="gesi_dateb">${gesi.gesiregitdate }</td>
				<td class="gesi_status">${gesi.status }</td></tr>
				</c:forEach>
				</tbody>
			</table>	
		</div>
		<div class="pagination_wrap">
			<div class="pagination">
				<i class="fa-solid fa-arrow-left"></i>
				<ol id="numbers">
				<!-- 페이지네이션 번호들이 오는곳 -->
				</ol>
				<i class="fa-solid fa-arrow-right"></i>
			</div>
			
		</div> 
	 	
<script>


function QnACheckDiv(val){
	var LoginUsername = '${Login.username}'
	var QnAUsername = $('input[name=gesiid]').val()
 if(LoginUsername==QnAUsername){
	 alert("ㅇㅇㅇ")
		return false;
	} 
	return true;
}

 


 </script>
</body>

</html>