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


#qtab{

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

<jsp:useBean id="qna" class="webproject.Gesipan"/>
<jsp:useBean id="sch" class="webproject.GesipanVO"/>
<jsp:setProperty property="*" name="sch"/>


<c:set var="qna" scope="page" value="${qna.getQnAView(sch)}"/>


<body style="padding-top: 138px;">
	<jsp:include page="Top.jsp"/>
<div id="container">
	<h1 id="WriteQnATitle">문의하기</h1>
	<form id="QnAfrm" method="get" action="CheckQnA.jsp">
		<table id="qtab">
			<col width="10%"><col width="40%"><col width="10%"><col width="40%">
			<tr><th height="8%">작성자</th><td><input type="text" style="width:98%; height:70%;" name="gesiid" readOnly value="${qna.gesiid }">
			<tr><th height="8%">문의 제목</th><td colspan="3"><input type="text" name="gesititle" style="width:99%; height:70%;" value="${qna.gesititle }"></td></tr>
			<tr><th>문의 내용</th><td colspan="3"><textarea name="gesiqnacontent" style="width:99%; height:99%;">${qna.gesiqnacontent }</textarea></td></tr>
			<tr><th>답변내용</th><td colspan="3"><textarea name="gesiansercontent" style="width:99%; height:99%;">${qna.gesiansercontent }</textarea></td></tr>
		</table>
		<input type="hidden" name="gesiqnano" value="${qna.gesiqnano }"/>
		<input type="hidden" name="qnaval" value="upt"/>
		<div id="InertQnABtn">
			<input type="button" onclick="DeleteQnA('upt')"  value="수정">
			<input type="button" onclick="DeleteQnA('del')"  value="삭제">
			<input type="button" onclick="location.href='Main.jsp'" value="취소">
		</div>
	</form>
</div>
</body>

<script type="text/javascript">


$(document).ready(function(){ // 관리자 or 작성자아니면 접근불가
	    var username = '${Login.username}'
		var gesiname = '${param.gesiid}'
		var divd = '${Login.userdiv}'
	var OriginalPage=document.referrer
	 if(username==gesiname || divd=="관리자"){
		
	}else{
		alert("작성자만 접근가능합니다. 이전페이지로 이동합니다.")
	      location.href=OriginalPage
	}

	
})

function DeleteQnA(val){ //삭제처리시, 답변완료일 상태글이면 관리자만 삭제가능
	var hidden = document.querySelector("input[name=qnaval]")
	var QnAfrm = document.querySelector("#QnAfrm")
	var status = '${qna.status}'
	var valuename="";
	if(val=='del'){valuename="삭제"}
	else if(val=='upt'){valuename="수정"}
	if(val=='del' || val=='upt'){
		 if(${Login.userdiv!='관리자'}){
			if(status=='답변완료'){
				alert("답변완료된 글은 "+valuename+" 처리가 불가합니다.")
				return false;
			}
		}
	}
	hidden.value = val
	QnAfrm.submit(); 
}

// 답변칸 작성시 관리자 아니면 작성 불가.
$('textarea[name="gesiansercontent"]').keyup(function(){
	var divd = '${Login.userdiv}'
	if(divd!="관리자"){
		alert("관리자만 작성 가능합니다.")
		$('textarea[name="gesiansercontent"]').val('-')
	}
})



</script>





</html>