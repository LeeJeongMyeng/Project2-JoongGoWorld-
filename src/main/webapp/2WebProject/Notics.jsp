<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
 	import="JoongGo.*"
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
<script>

</script>
<style>
.Notic_Wrap{
	height:791px;
	display: flex;
}
.Notic_Wrap .Notic_Event{
	background: #fffbc9;
    width: 1000px;
}
.Notic_Wrap h1{
	text-align: center;
    margin: 30px 0;
    font-size: 337%;
}
.Notic_Wrap .Notic_Event div{
}
.Notic_Wrap .Notic_Event div>img{
width:100%;
height:100%;
}


</style>
</head>
<body>

<%@include file="Top.jsp" %>
		<div class="Notic_Wrap">
			
			<div class="Notic_Event">
			<h1>이 벤 트</h1>
			<div><img src="img\main\Banner1.jpg"/></div>
			<div><img src="img\main\Banner2.jpg"/></div>
			</div>
		</div>

<%@include file="Footer.jsp" %>	
</body>
<script>
/*

 */
</script>
</html>