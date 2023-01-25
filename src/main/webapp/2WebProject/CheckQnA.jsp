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

<jsp:useBean id="qna" class="webproject.Gesipan"/>
<jsp:useBean id="sch" class="webproject.GesipanVO"/>
<jsp:setProperty property="*" name="sch"/>
<jsp:useBean id="al" class="webproject.Alert"/>
<jsp:useBean id="alert" class="webproject.AlertVO"/>
<jsp:setProperty property="*" name="alert"/>


	<c:if test="${param.qnaval=='ins'}">
			<%--<c:set var="qnasuccess" scope="page" value="${qna.insertQnA(sch)==1}"/> --%> 
			 <jsp:setProperty property="qnano" name="alert" value="${qna.insertQnA(sch)}"/>
			 <jsp:setProperty property="id" name="alert" value="관리자"/>
			 <c:set var="qnasuccess" scope="page" value="${al.insertAlert(alert)==1}"/>	 		
			 <%-- </c:if> --%>
	</c:if>
	
	<c:if test="${param.qnaval=='upt'}">
	<%--관리자인지 여부확인을 위해서 Login.userdiv를 넣어줌 --%>
	<%--Dao에서는 관리자/회원 여부에따라 수정되는 컬럼을 다르게 함 --%>
		<c:set var="qnasuccess" scope="page" value="${qna.UpdateQnA(sch,Login.userdiv)==1}"/> 
	</c:if>
	
	<c:if test="${param.qnaval=='del'}">
		<c:set var="qnasuccess" scope="page" value="${qna.DeleteQnA(sch)==1}"/>
	</c:if>
<script>
var qnasuccess = ${qnasuccess}; //처리된 리턴값

var qnaval = '${param.qnaval}'
var name = "";
if(qnaval=='ins'){name="등록"}
if(qnaval=='upt'){name="수정"}
if(qnaval=='del'){name="삭제"}


if(qnasuccess){
	alert(name+" 완료되었습니다.감사합니다.")
	location.href="Main.jsp?translate=3"
}
else if(qnasuccess==false){
	alert(name+" 실패되었습니다. 다시 시도부탁드립니다.")
	location.href="Main.jsp?translate=3"
}

</script>
