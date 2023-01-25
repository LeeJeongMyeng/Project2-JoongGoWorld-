<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="webproject.*"
    import="java.util.*"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고월드 마이페이지</title>
<style>
	
.mypage{
	width: 1000px;
    height: 650px;
    position: relative;
    bottom: 25%;
    margin: auto auto;
}
.mypage hr{
	width:100%;
	position:absolute;
	top:20%;
}
.mypage	#userInfo{
	width: 100%;
    position: absolute;
    top: 2%;
}
.mypage	#userMenu{
	border:3px solid lightgrey;
	border-radius:5px;
	width:30%;
	height:75%;
	position:absolute;
	bottom:0%;
	left:2%;
}
.mypage	#dealMenu{
	border:3px solid lightgrey;
	border-radius:5px;
	width:30%;
	height:75%;
	position:absolute;
	bottom:0%;
	left:35%;
}
.mypage	#etcMenu{
	border:3px solid lightgrey;
	border-radius:5px;
	width:30%;
	height:75%;
	position:absolute;
	bottom:0%;
	left:68%;
}
.mypage	#userInfo #userInfoTab td{
	font-size: 20pt;
    height: 154px;
}
.mypage	#alert{
	width:260px;
	height:50px;
	background:rgb(142, 68, 173);
	color:white;
	font-size:15pt;
	border:1px solid rgb(142, 68, 173);
	border-radius:5px;
	font-weight: bold;
}
.mypage	#userInfo #loginguide{
	font-size:30pt;
	text-align:center;
}
.mypage	div .menuTitle{
	font-size:22pt;
	position:absolute;
	left:5%;
}
.mypage	div ul{
	position:absolute;
	left:5%;
	top:25%;
	/* line-height:60px; */
	}
.mypage	li{
	font-size:18pt;
	letter-spacing:2px;
	/* word-spacing:5px; */
	line-height:50px;
}
.mypage	li:hover{
	color:blue;
}
.mypage	.hiperlink{
	text-decoration: none;
	color : black;
}
.mypage	.hiperlink:hover{
	color:blue;
}
	
</style>

</head>
<body>
	<%@include file="Top.jsp" %>
	<div class="mypage" >
		<div id="userInfo">
			<%
					JGUserVO Login = (JGUserVO)session.getAttribute("Login");
					boolean hasSess = Login!=null; // 로그인한계정정보가 null아니면 true
					if(hasSess){
			%>
			<table id="userInfoTab">
				<tr><td width="5%"><img src="img\main\UnknownUser2.png"></td>
					<td width="25%"><%=Login.getUsername() %>님의 MyPage</td>
					<td width="15%"><input id="alert" type="button" value="나에게 온 알람보기" onclick="alerthistory()"/></td>
					<td width="10%"></td>
					<td width="15%">Point:<%=Login.getPoint() %>P</td></tr>
			</table>
			<%}else{%>
				<h2 id="loginguide">로그인을 해주세요.</h2>
			<%} %>
		</div>
		<hr>
		<div id="userMenu">
			<h2 class="menuTitle">사용자 설정: </h2>
			<ul>
				<li><a class="hiperlink" href="userInfoUpdate.jsp">나의 계정 정보보기</a>
				<li><a class="hiperlink" href="cutoutView.jsp">차단한 회원보기</a>
				<li><a class="hiperlink" href="collectView.jsp">모아보기 회원보기</a>
				<li onclick="count('declaration')">나의 신고횟수 보기
				<li onclick="count('buy')">나의 구매횟수 보기
				<li onclick="count('sale')">나의 판매횟수 보기
			</ul>
		</div>
		<div id="dealMenu">
			<h2 class="menuTitle">나의 거래: </h2>
			<ul>
				<li><a class="hiperlink" href="#">판매내역</a>
				<li><a class="hiperlink" href="#">구매내역</a>
				<li><a class="hiperlink" href="cartlistView.jsp">찜(♥)목록</a>
				<li><a class="hiperlink" href="#">예약중인 상품조회</a>
				<li><a class="hiperlink" href="Main.jsp?translate=2">거래왕 조회하기</a>
			</ul>
		</div>
		<div id="etcMenu">
			<h2 class="menuTitle">기타: </h2>
			<ul>
				<li>문의하기
				<li>자주 묻는 질문
				<li>공지사항
				<li>버전정보
				<li>캐시데이터 삭제하기
				<li>언어설정
			</ul>
		</div>
	</div>
	<br>
<%@include file="Footer.jsp" %>	
</body>
<script type="text/javascript">
	function alerthistory(){
		alert("알람기능넣기")
	}
//---------------------------------신고/구매/판매 횟수출력 기능메서드------------------------------
	function count(whatcnt){ // 로그인하라는 알림창 기능넣기
		if(whatcnt=='declaration'){
			alert("나의 신고횟수: "+<%=Login.getDeclarationcount()%>
					+"회\n[안내메시지]신고를 30회이상 당하시면 거래왕이 되실 수 없습니다.");
		}else if(whatcnt=='buy'){
			alert("나의 구매횟수: "+<%=Login.getBuycount()%>
					+"회\n[안내메시지]거래왕이 되시면 소정의 선물을 드립니다.\n거래왕에 도전하세요!");
		}else{
			alert("나의 판매횟수: "+<%=Login.getSalecount()%>
				+"회\n[안내메시지]거래왕이 되시면 소정의 선물을 드립니다.\n거래왕에 도전하세요!");
		}
	}
</script>
</html>