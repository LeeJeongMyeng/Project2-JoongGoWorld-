<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  import="java.util.*"  
  import="jspexp.vo.*"  
    import="jspexp.a13_database.*"    
    import="jspexp.a13_database.vo.*" 
      
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>

<ul>
	<li onclick="kakaoLogin('y');">
      <a href="javascript:void(0)">
          <span>카카오 로그인</span>
      </a>
	 </li>
	<li onclick="kakaoLogin('n');">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>

</body>
<script type="text/javascript">
function kakaoLogin(val){
	location.href="exp.jsp?kl="+val
}
</script>
</html>