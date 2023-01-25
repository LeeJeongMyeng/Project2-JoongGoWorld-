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
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script>
/*
 
 */
</script>
</head>
<body>
		<c:set var="OutName" value="${Login.username }"/>
		<c:remove var="Login" scope="session"/>
		<c:remove var="Login_profileimage" scope="session"/>

			<%-- <c:set var="OutName" value="${Login_Name }"/>
				<c:remove  var="Login_Id"  scope="session"/>
				<c:remove  var="Login_Div"  scope="session"/>
				<c:remove  var="Login_Name"  scope="session"/>
				<c:remove  var="Login_Nickname"  scope="session"/>
				<c:remove  var="Login_Rrn"  scope="session"/>
				<c:remove  var="Login_Zipcode"  scope="session"/>
				<c:remove  var="Login_Address"  scope="session"/>
				<c:remove  var="Login_Address2"  scope="session"/>
				<c:remove  var="Login_Phonenum"  scope="session"/>
				<c:remove  var="Login_Password"  scope="session"/>
				<c:remove  var="Login_Email"  scope="session"/>
				<c:remove  var="Login_Point"  scope="session"/>
				<c:remove  var="Login_Salecount"  scope="session"/>
				<c:remove  var="Login_Buycount"  scope="session"/>
				<c:remove  var="Login_Reportcount"  scope="session"/>
				<c:remove  var="Login_profile_image"  scope="session"/>
				 --%>



</body>
<script>
alert("${OutName}님 로그아웃되었습니다!")
location.href = "Main.jsp"
</script>
</html>