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
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/KakaoLogin.js" ></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/Top.css?after">
<link rel="stylesheet" type="text/css" href="css/sidebar.css">
<link rel="stylesheet" type="text/css" href="css/LoginForm.css">
<style>
.help-tip{
	position: absolute;
    bottom: 2px;
    right: 51px;
    text-align: center;
    /* background-color: #BCDBEA; */
    background-image: url(img/main/bforAlram.jpg); 
    background-size: cover;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    font-size: 14px;
    line-height: 26px;
    cursor: default;
}
#tipalam{
	position: absolute;
    width: 31px;
    bottom: 5px;
    right: -27px;
}

.help-tip:before{
}

.help-tip:hover .tips{
	display:block;
	transform-origin: 0% 0%;
	-webkit-animation: fadeIn 0.3s ease-in-out;
	animation: fadeIn 0.3s ease-in-out;
}

.help-tip .tips{
	display: none;
    text-align: left;
    background-color: #FDF5E6;
    padding: 20px;
    width: 300px;
    border: 1px solid black;
 
    border-radius: 3px;
    box-shadow: 1px 1px 1px rgb(0 0 0 / 20%);
    right: 100;
   
    color: black;
    font-size: 13px;
    margin-top: 40px;
    margin-left: -127px;
    line-height: 1.4;
}
.help-tip>.tips .tip{
 background-color:white;
 padding:5px;
 margin-bottom:15px;
 border:1px solid #c8c8c8;
}
.help-tip>.tips .tip ul li{
     margin-bottom: 5px;
     text-align:center;
}
.help-tip>.tips .tip ul li button{
   margin: 6px;
    background: #A83CA8;
    color: white;
    font-size: 16px;
    width: 75px;
    height: 32px;
    border-radius: 5px;
    border: none;
}

.help-tip .tips:before{
	position: absolute;
    content: '';
    width: 0;
    height: 0;
    border: 6px solid transparent;
    border-bottom-color: #1E2021;
    right: 10px;
    top: 40px;
}

.help-tip .tips:after{
	width:100%;
	height:40px;
	content:'';
	position: absolute;
	top:-40px;
	left:0;
}

@-webkit-keyframes fadeIn {
	0% { 
		opacity:0; 
		transform: scale(0.6);
	}
	100% {
		opacity:100%;
		transform: scale(1);
	}
}

@keyframes fadeIn {
	0% { opacity:0; }
	100% { opacity:100%; }
}​ 



</style> 
<script>


</script>
</head>
<body>

<div class="top_wrap">
				<div class="Logo"><a href="Main.jsp"><img src="img\main\Logo.png"></a></div>
					<div class="Top">
						<div class="Menubox">
						<div id="horizon_underLine"></div>
							<ul>
								<li><button type="button" class="MCBtn2" value="0">메인화면</button></li>
								<li><button type="button" class="MCBtn2" value="1">중고월드소개</button></li>
								<li><button type="button" class="MCBtn2" value="2">거래왕TOP3</button></li>
								<li><button type="button" class="MCBtn2" value="3">문의게시판</button></li>
							</ul>
						</div>
						<div>
						   <form class="SearchProdForm" action="ProdSearch.jsp">
							<input id="Top_Searchbox" name="productname" type="text" placeholder="단어 혹은 장소 입력"/>
							<input id="Top_Submit" type="submit" />
						   </form>
						</div>
						<div class="Top_UserInfo">
						  <c:choose>
						    <c:when test="${Login.id eq null}">
							    <div id="Top_SignUp"><a href="SignUp.jsp" >회원가입</a></div>
								<input type="checkbox" id="popup">
								<label for="popup">로그인</label>
								<div>
									<div>
										<label for="popup"><div>X</div></label> <!-- 닫기 -->
										<div>	
											<div> 
											<div id="New_MainText2" style="text-align:center;">로그인</div>
											<div id="Login_form">
											<!-- <form id="Login_form2" action="Login/LoginAccess.jsp"> -->										
											 <form id="Login_form2" action="CheckUser.jsp"> 									
													<input type="text" name="Login_id" placeholder=" 아이디 입력" ><br>
													<input type="password" name="Login_password" placeholder=" 패스워드 입력" ><br>
													<input type="hidden" name="CheckUser" value="NormalLogin"/>
													<div id="Login_find">아이디 | 비밀번호찾기 
													<a href="Market_signUp.jsp" style="color:purple;">&nbsp;&nbsp;&nbsp;회원가입</a></div><br>
													<ul>
														<li onclick="kakaoLogin();"><a href="javascript:void(0)"><img src="img\main\KakaoLoginLogo.png"></a></li>
													</ul>
												<input type="submit" value="로그인">
											</form>		
											</div>
											<c:set var="alamcount" scope="page" value="0"/> <%--스크립트 에러방지용 --%>
											</div>
										</div>
									</div>
									<label for="popup"></label><!-- 바깥눌러도 닫기 -->
								</div>
								    </c:when>
								    <c:when test="${Login.id ne null }">
								    	<c:choose> 
								    		<c:when test="${Login_profileimage ne null }">
								    			<div id="User_Profile_image"><img src="${Login_profileimage}"></div>
								    		</c:when>
								    		<c:otherwise>
								    		   <div id="User_Profile_image2"><img src="img\main\UnknownUser2.png"></div>
								    	</c:otherwise>
								    </c:choose>
								    
								    <jsp:useBean id="al" class="webproject.Alert"/>
								    <jsp:useBean id="alert" class="webproject.AlertVO"/>
								    	<jsp:setProperty property="id" name="alert" value="${Login.id }"/>
								    	<jsp:setProperty property="name" name="alert" value="${Login.username }"/>
								    <c:if test="${Login.userdiv=='관리자'}">
								  	 	<jsp:setProperty property="id" name="alert" value="${Login.userdiv}"/>
								    </c:if>
								    <c:set var="alamcount" scope="page" value="${al.countMAlert(alert) }"/>
								    
								    
								    <div class="help-tip"> <img id="tipalam" src="img/main/alam.png"/>
								    	<div class="tips">
								    	  <c:forEach var="pd" items="${al.getAlertList(alert)}">
								    		<div class="tip">
									    		<ul>
										    		
										    		<c:choose>
										    			<c:when test="${pd.alerttype=='약속신청' }">
										    			<li>${pd.sendid}${pd.alertcontent }<br>
											    			<li>요청날짜: ${pd.resdate }<br>
											    			<li>판매번호: ${pd.productno}번<br>	
											    			<li><button type="button" onclick="deletealert('call','${pd.alertno}',
											    			'${pd.moveurl}','${pd.id}')">수락</button>
										    			</c:when>
										    			<c:when test="${pd.alerttype=='수락' }">
											    			<li>${pd.sendid}${pd.alertcontent }<br>
											    			<li>판매번호: ${pd.productno}번<br>	
											    			<li><button type="button" onclick="deletealert('move','${pd.alertno}',
											    			'${pd.moveurl}')">이동하기</button>
										    			</c:when>
											    		<c:otherwise>
											    			<li>${pd.alertcontent }<br>
											    			<li>문의번호: ${pd.qnano}번<br>	
											    			<li><button type="button" onclick="deletealert('move','${pd.alertno}',
											    			'${pd.moveurl}')">이동하기</button>
											    		</c:otherwise>
										    		</c:choose>
										    		<button type="button" onclick="deletealert('del','${pd.alertno}')">삭제</button> 
									    		</ul>
								    		</div>
								    		</c:forEach>
								
								    		
								    		
								    	
								    	</div>
								    	
								    </div>
						    	<div id="User_Information">
							    	<ul>
								    	<li><strong>회원명:</strong>${Login.username }</li>
								    	<li><strong>회원ID:</strong>${Login.nickname }</li>
								    	<li><strong>포인트:</strong>${Login.point }</li>
							    	</ul>
						    	</div>
						    	<div id="User_Count_Info">
							    	<ul>							    	
							    	<li><strong>판매횟수:</strong>${Login.salecount }회</li>
							    	<li><strong>구매횟수:</strong>${Login.buycount }회</li>
							    	<li><strong>신고횟수:</strong>${Login.declarationcount }회</li>
							    	
							    	</ul>
						    	</div>
						    	<div id="LogoutBtn" onclick="Insert('Logout')"><a href="#">로그아웃</a></div>
						    	<div id="MyPegeBtn"><a href="MyPage.jsp">마이페이지</a></div>
						    </c:when>
						  </c:choose>
						  
						  
						</div>
						<div id="checkbox_wrap">
							<input type="checkbox" id="menuicon"> 
							<label for="menuicon">
								<span></span>
								<span></span>
								<span></span>
								<div>메뉴</div>
							</label>
							<div class="sidebar">
								
								<div class="UserMenu"> 회원 메뉴
								<div id="vertical_nuderline"></div>
									<nav>
										<a href="#" onclick="Insert('userInfoUpdate')">회원정보수정</a>
										<a href="#" onclick="Insert('Logout')">로그아웃</a>
										<a href="#" onclick="Insert('MyPage')">마이페이지</a>
										<a href="#" onclick="Insert('userDelete')">회원탈퇴</a>
									</nav>						
								</div>
								<div class="OtherMenu"> 기타메뉴
								<!-- <div class="vertical_nuderline"></div> -->
									<nav>
										<a href="ProdSearch.jsp">구경하기</a>
										<a href="#" onclick="Insert('Insertprod')">판매등록</a>
										<a href="#">공지사항</a>
										<a href="#" onclick="Insert('InsertQnA')">문의하기</a>
									</nav>						
								</div>
							</div>
						</div>
					</div>
			</div>	
</body>


<script>
/*마우스 올리면 메뉴에 bar 나타내기*/
var verticalnuderline = document.querySelector("#vertical_nuderline")
var verticalMenu = document.querySelectorAll(".sidebar nav a")
verticalMenu.forEach((menu)=>
	menu.addEventListener('mouseover',(e) => verticalLineEvent(e))
);

var horizonunderLine = document.querySelector("#horizon_underLine")
var horizonMenus = document.querySelectorAll (".MCBtn")
horizonMenus.forEach((menu)=>
	menu.addEventListener('mouseover',(e) => horizonLineEvent(e))
);
horizonMenus.forEach((menu)=>
menu.addEventListener('mouseout',(e) => horizonLineOutEvent(e))
);

function verticalLineEvent(e){
	verticalnuderline.style.right = e.currentTarget.offsetRight +"px";
	verticalnuderline.style.width = e.currentTarget.offsetWidth +"px";
	verticalnuderline.style.top = e.currentTarget.offsetTop+e.currentTarget.offsetHeight +"px";	
}
function horizonLineEvent(e){
	horizonunderLine.style.left = e.currentTarget.offsetLeft +"px";
	horizonunderLine.style.width = e.currentTarget.offsetWidth +"px";
	//horizonunderLine.style.top = e.currentTarget.offsetTop+e.currentTarget.offsetHeight +"px";
}
function horizonLineOutEvent(e){
	horizonunderLine.style.left = "0px";
	horizonunderLine.style.width = "0px";
	//horizonunderLine.style.top = e.currentTarget.offsetTop+e.currentTarget.offsetHeight +"px";
}
/*-----메인화면 이동처리---------------------------------------------------------------------------------*/

/* $(document).ready(function(){ 
	$(".MCBtn").click(function(){
		var MCW = document.querySelector('.Main_Container_Wrap')
		if($(this).val() == 0){
			location.href="Main.jsp";
		}
		else{
		var value=$(this).val(); //해당 버튼의 value를 가져옴
		//console.log(value)
		var valueM= -(value*100) // 버튼value를 필요한 숫자로맞게 변환
		//console.log(valueM)
		// 움직이도록 translate에 변환한 변수를 넣음
		
		MCW.style.transform = 'translate('+valueM+'vw)';
		}
	})  
})
 */
 $(document).ready(function(){	
		$(".MCBtn2").click(function(){	
				location.href="Main.jsp?translate="+$(this).val();
		})
		
		
	})

	
	
function Insert(val){
	if(${Login.id==null}){
		alert("로그인 후 이용가능합니다.")
		return false;
	}else{
		if(val=='userDelete'){
			var a = prompt("탈퇴를 위해 회원의 비밀번호를 입력해주세요", "");
			
			if(a=='${Login.password}'){
			var winX = (document.body.offsetWidth / 2) - (400 / 2);
			var winY= (window.screen.height / 2) - (300 / 2);
			window.open("userRemove.jsp", "탈퇴확인하기",
			"width=500, height=210,left="+ winX + ", top="+ winY+", toolbar=no,menubar=no, scrollbars=no, resizable=yes" );
			}
		}else if(val=='Logout'){
			kakaoLogOut()
		}
		else{
		location.href=val+".jsp"
		}
	}
}

//알람표시처리
var alamcount = ${alamcount};

		if(alamcount>0){
			$("#tipalam").css("display","block")
		}else{
			$("#tipalam").css("display","none")
		}

function deletealert(act,alertno,url){
	location.href="CheckAlert.jsp?alertval="+act+"&alertno="+alertno+
			      "&moveurl="+url
	
}



</script>
</html>