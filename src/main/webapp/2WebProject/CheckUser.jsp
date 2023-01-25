<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="webproject.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <script src="http://code.jquery.com/jquery-latest.js"></script> --%>

<jsp:useBean id="JGUDad" class="webproject.JGUser"/>
<c:if test="${not empty param.SignUpId  }">
	{"CheckOverId":${JGUDad.checkId(param.SignUpId)}}
</c:if>
<c:if test="${not empty param.fullrrn  }">
	{"CheckOverRrn":${JGUDad.checkRrn(param.fullrrn)}}
</c:if>


<jsp:useBean id="sch2" class="webproject.JGUserVO"/>
<jsp:setProperty name="sch2" property="id" value="${param.Login_id }"/>
<jsp:setProperty name="sch2" property="password" value="${param.Login_password }"/>
<jsp:setProperty name="sch2" property="email" value="${param.Login_email }"/>

<%--일반 로그인 처리 --%>
<c:if test="${param.CheckUser=='NormalLogin'}">
<%--일반로그인 정보가 있으면 --%>
 <c:if test="${not empty JGUDad.login(sch2)}">
      <c:set var="Login" scope="session" value="${JGUDad.getUserInfoAllMap(sch2)}"/>  
       <script>
        var OriginalPage=document.referrer
      	  alert("로그인성공 \n${Login.username}님 반갑습니다.")
	      location.href=OriginalPage
      </script>
  </c:if>
  <%--일반로그인 정보가 없으면 --%>
  <c:if test="${empty JGUDad.login(sch2)}">
	  <body>
	   	<form id="kakaoEForm" method="post" action="SignUp.jsp">
			<input type="hidden" name="Login_email"value="${param.Login_email }"/>
		</form>
	  </body>
   	  <script> 
		 if(confirm("일치하는 정보가 없습니다. 회원가입 화면으로 이동하시겠습니까?")){
			 document.querySelector("#kakaoEForm").submit();
		 }else{
			history.back();
			}

		</script>
   </c:if>
</c:if>


<%--카카오 로그인 처리 --%>
<c:if test="${param.CheckUser=='KakaoLogin'}">
  <c:if test="${not empty JGUDad.loginE(sch2)}">
      <c:set var="Login" scope="session" value="${JGUDad.loginE(sch2)}"/>   
      <c:set var="Login_profileimage" scope="session" value="${param.profile_image }"/>
      <script>
        var OriginalPage=document.referrer
      	  alert("로그인성공 \n${Login.username}님 반갑습니다.")
	      location.href=OriginalPage
      </script>
  </c:if>
  
  <c:if test="${empty JGUDad.loginE(sch2)}">
	  <body>
	   	<form id="kakaoEForm" method="post" action="SignUp.jsp">
			<input type="hidden" name="Login_email"value="${param.Login_email }"/>
		</form>
	  </body>
   	  <script> 
		 if(confirm("일치하는 정보가 없습니다. 회원가입 화면으로 이동하시겠습니까?")){
			document.querySelector("#kakaoEForm").submit();
		 }else{
			history.back();
			}

		</script>
   </c:if>
</c:if>

<c:if test="${param.CheckUser=='Logout'}">
<c:set var="OutName" value="${Login.username }"/>
		<c:remove var="Login" scope="session"/>
		<c:remove var="Login_profileimage" scope="session"/>
		<script>
		 	alert("${OutName}님 로그아웃되었습니다!")
			location.href = "Main.jsp"
		</script>
</c:if>



<%--회원가입완료 처리 --%>
<c:if test="${param.CheckUser=='SignUp'}">
	<jsp:useBean id="sch" class="webproject.JGUserVO"/>
	<jsp:setProperty property="*" name="sch"/>
	${JGUDad.insertJGUser(sch)}
</c:if>



<%--회원정보 수정 처리 --%>
<c:if test="${param.CheckUser=='UpdateUser'}">
	<%
	request.setCharacterEncoding("utf-8");
	JGUserVO Login = (JGUserVO)session.getAttribute("Login");
	String id = request.getParameter("SignUp_id"); // 기본값+readOnly이기떄문에 ifnull설정 x
	String password = request.getParameter("SignUp_password"); // 수정페이지에서 유효성검사를 마치고 readOnly로오기에 if설정x
	String nickname = request.getParameter("SignUp_nickname"); if(nickname==null) nickname=Login.getNickname();
	String pnum1 = request.getParameter("SignUp_first_phonenum"); if(pnum1==null) pnum1="";
	String pnum2 = request.getParameter("SignUp_second_phonenum"); if(pnum2==null) pnum2="";
	String pnum3 = request.getParameter("SignUp_third_phonenum"); if(pnum3==null) pnum3="";
	String phonenumber = pnum1 +"-"+pnum2+"-"+pnum3;
	if(phonenumber.length()<14){ // 3개의 칸으로 받기떄문에 각각 null을 주면 코드가 길어져서 length로 확인
		phonenumber=Login.getPhonenumber();
	}
	String email = request.getParameter("SignUp_femail"); // 수정페이지에서 유효성검사를 하고 오기떄문에 if설정x
	String zipcode = request.getParameter("SignUp_Zipcode"); if(zipcode==null) zipcode=Login.getZipcode();
	String address1 = request.getParameter("SignUp_address"); 
	String address2 = request.getParameter("SignUp_extraAddress"); 
	String adrress = address1+address2; if(adrress==null) adrress=Login.getAddress();
	String detailaddress = request.getParameter("SignUp_detailAddress"); if(adrress==null) detailaddress=Login.getDetailaddress();
	
	JGUser dao = new JGUser();
	JGUserVO upt = new JGUserVO(id,password,nickname,phonenumber,zipcode,adrress,detailaddress,email);
	int uptsuccess = dao.updateJGUser(upt);	
	if(uptsuccess==1){
		session.setMaxInactiveInterval(0); // 세션 유효시간을 0으로설정
		JGUserVO UpdateLogin = new JGUserVO(id,password);
		session.setAttribute("Login",dao.login(UpdateLogin));		
	}
%>
<script>
var uptsuccess = <%=uptsuccess%>
if(uptsuccess==1){
	alert("수정이 완료되었습니다.")
	location.href="Main.jsp"
	
}else{
	alert(uptsuccess)
}	
</script>
</c:if>








