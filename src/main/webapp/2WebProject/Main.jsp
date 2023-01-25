<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
   
   %>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<link rel="stylesheet" type="text/css" href="css/Main.css?after"> <%--메인창 css --%>
<style>
.Top3{
	position: absolute;
	background: white;
	border: 10px solid gray;
    text-align: center;
}

#Top1{
	top: 75%;
	left: 44%;
    width: 266px;
    border: 10px solid #444444;
    height: 121px;
}
#Top2{
	top: 72%;
    left: 35%;
    width: 164px;
    height: 96px;
    border: 7px solid #444444;
}
#Top3{
	top: 72%;
    left: 1225px;
    width: 164px;
    height: 96px;
    border: 7px solid #444444;
}
#Top1 ul{
	font-size: 20px;
    font-weight: 900;
    margin: 5px 0 0 0;
}

#Top2 ul,#Top3 ul{
	font-size: 15px;
    font-weight: 900;
    margin: 7px 0 0 0;
}
#Top1 ul li:first-child{
	font-size: 26px;
}

#Top2 ul li:first-child,#Top3 ul li:first-child{
	font-size: 20px;
}




</style>


<script>



</script>
</head>
<body>
		<%@include file="Top.jsp" %>	
		<div style="overflow:hidden">
		
			<div class="Main_Container_Wrap">			
				<div class="Main_Container Main1_wrap" id="MC1">
					<div class="Main">				
						<div class="GoProd">
							<a href="#"><img src="img\main\showPord.jpg"></a>
							<input id="Main_toProd" type="button" onclick="GoToPage('ProdSearch')" value="중고월드이용하기">
						</div>
					<c:choose>
						<c:when test="${Login.id eq null}">
							<div class="GoJoin">
								<a href="#"><img src="img\main\Join.jpg"></a>
								<input id="Main_SignUp" type="button" onclick="GoToPage('SignUp')" value="회원가입">
								<!-- <input  id="Main_Login" type="button" onclick="GoToPage('Login');" value="로그인"> -->
								<label id="Main_Login" for="popup"><div>로그인</div></label>
							</div>
						</c:when>
						<c:when test="${Login.id ne null}">
								<div class="WelCome" ><h2>저희 중고월드를 이용해주셔서<br>감사합니다.♥</h2></div>
						</c:when>
					</c:choose>
						
						
						<div class="GoNotice">
							<a href="#"><img src="img\main\Notics.jpg">
							<input id="Main_notice" type="button" onclick="" value="공지사항 확인하기"></a>
						</div>					
					</div>		
				</div><%--Main_Container--%>
				
				<div class="Main_Container Main2_wrap" id="MC2">
						<%--여기에 중고월드 소개 사진들어감 --%>
				</div><%--Main2_wrap--%>
				
				<div class="Main_Container Main3_wrap" id="MC3">
					<jsp:useBean id="JGUDao" class="webproject.JGUser"/>
					
					<c:forEach var="top" items="${JGUDao.getTop3User() }" varStatus="status">
						<div class="Top3" id="Top${status.count}">
							<ul>
								<li>${top.nickname }</li>
								<li>구매횟수:${top.buycount }회</li>
								<li>판매횟수:${top.salecount }회</li>
							</ul>
						</div>
					</c:forEach>
						
				</div><%--Main3_wrap--%>
					
				<div class="Main_Container Main4_wrap" id="MC4">
					<div class="gesipan"></div>
					<div class="pagination_wrap">
						<div class="gesiBtnWrap">
							<input type="text" name="gesiid" value="" placeholder="글쓴이 혹은 제목으로 검색"/>
							<input name="gesiidBtn" type="submit" value="검색">
							<button type="button" id="InsertQnA" onclick="InsertQnA()">등록</button>
							
						</div>	
					</div>		
				</div><%--Main4_wrap--%>
				
			</div><%--Main_Container_Wrap  --%>
			
		</div>
		
		
			
			
				
				
<%@include file="Footer.jsp" %>			
</body>

<script type="text/javascript" src="js/paging.js"></script> <%--게시판 조회 및 페이징 처리 --%>
<script>	
/*------메인페이지로 온 뒤, 구역이동처리-----------------------------------------------------------------*/
$(document).ready(function(){ 
	var MCW = document.querySelector('.Main_Container_Wrap')
	var translateval = ${param.translate}
	console.log(translateval)
	if(translateval==1 || translateval==2 || translateval==3){
		var valueM= -(translateval*100)
		MCW.style.transform = 'translate('+valueM+'vw)';
	}
  })

/*---------------------------------------------------------------------------------------------------*/
function GoToPage(pagestr){
	location.href=pagestr+".jsp"
}
/*--------------------------------------------------------------------------------------------------*/

loadGesiDate();
/*--------------------------------------------------------------------------------------------------*/
function InsertQnA(){
	if(${Login.id==null}){
		alert("로그인 후 이용가능합니다.")
		return false;
	}else{
		location.href="InsertQnA.jsp"
	}
}
/*----------------------------------------------------------------------------*/


</script>
</html>