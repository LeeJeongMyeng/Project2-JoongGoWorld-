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

<jsp:useBean id="al" class="webproject.Alert"/>
<jsp:useBean id="alert" class="webproject.AlertVO"/>
<jsp:setProperty property="*" name="alert"/>

<c:if test="${param.alertval=='call' }">
	<jsp:setProperty property="alerttype" name="alert" value="수락"/>
	<c:set var="success" scope="page" value="${al.getAlert(param.alertno)==1}"/> --%>
</c:if>

<c:if test="${param.alertval=='move' || param.alertval=='del' }">
	<c:set var="success" scope="page" value="${al.DeleteAlert(alert)==1}"/>
</c:if>





<script>

	var success=${success}
	var alertval='${param.alertval}'
	var OriginalPage=document.referrer
	if(success){
		if(alertval=='del'){
		location.href=OriginalPage
		}else if(alertval=="move" || alertval=="call"){
			var moveurl = '${param.moveurl}'
			location.href=moveurl
		}
	}
</script>