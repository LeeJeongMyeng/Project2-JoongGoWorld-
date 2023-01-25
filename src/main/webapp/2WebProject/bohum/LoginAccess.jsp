<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.vo.*" 
       import="jspexp.a13_database.*"
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
<script src="http://code.jquery.com/jquery-latest.js"></script> 
</head>
<body>
<jsp:useBean id="JGUdao" class="webproject.JGUser"/>
<jsp:useBean id="sch2" class="webproject.JGUserVO"/>
<%-- <jsp:setProperty property="*" name="sch"/> --%>
<jsp:setProperty name="sch2" property="id" value="${param.Login_id }"/>
<jsp:setProperty name="sch2" property="password" value="${param.Login_password }"/>
<jsp:setProperty name="sch2" property="email" value="${param.Login_email }"/>



<c:if test="${not empty param.Login_id && not empty param.Login_password}">
 <c:if test="${not empty JGUdao.login(sch2)}">
      <c:set var="Login" scope="session" value="${JGUdao.login(sch)}"/>   
  </c:if>
  
  
</c:if>
<c:if test="${not empty param.Login_email && not empty param.profile_image}">
 <c:if test="${not empty JGUdao.loginE(sch2)}">
      <c:set var="Login" scope="session" value="${JGUdao.loginE(sch2)}"/>   
      <c:set var="Login_profileimage" scope="session" value="${param.profile_image }"/>
  </c:if>
</c:if>

<form id="kakaoEForm" method="post" action="SignUp.jsp">
	<input type="hidden" name="Login_email"
	       value="${param.Login_email }"/>
</form>

</body>
<script>
var OriginalPage=document.referrer
var isFail='${Login.id}'
		console.log(isFail)
	   if(isFail==''){
	      if(confirm("일치하는 정보가 없습니다. 회원가입 화면으로 이동하시겠습니까?")){
	    	  $('#kakaoEForm').submit();
	      }else{
	      history.back();
	      }
	   }else if(isFail!=''){
	      alert("로그인성공 \n${Login.username}님 반갑습니다.")
	      location.href=OriginalPage
	   }
 
</script>
</html>