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
<%-- <link rel="stylesheet" type="text/css" href="css/Footer.css?after">--%>
<script type="text/javascript">
/*
 
*/
</script>
<style>


.footer {
	width: 1500px;
    margin: 0 auto;
    /* border: 1px solid orange; */
    display: flex;
    justify-content: center;
}
.Main_foot{
	display: flex;
    margin-right: 310px;
	height: 200px;
}

.Main_foot_right{
margin-right:20px;
}
.Main_foot_right h3{
	text-align:center;
	margin: 15px 0;
}

.Main_foot_right>div>a>img{
width: 164px;
}
.Main_foot_right>div>a:nth-child(2)>img{
margin: 2px;
}

.Main_foot div ul{
margin-right: 55px;
}

.Main_foot div ul li{
	margin-top: 18px;
}


</style>
</head>
<body >
		<hr>
		<footer>
		  
			<div class="box footer">
				<div class=Main_foot>
					<div>
						<ul>
							<li><a href="#">중고거래</a></li>
							<li><a href="#">동네가게</a></li>
							<li><a href="#">중고월드 알바</a></li>
						</ul>
					</div>
					<div>
						<ul>
							<li><a href="#">중고월드 비즈니스</a></li>
							<li><a href="#">채팅하기</a></li>
						</ul>
					</div>
					<div>
						<ul>
							<li><a href="#">자주 묻는 질문</a></li>
							<li><a href="#">회사 소개</a></li>
							<li><a href="#">인재 채용</a></li>
						</ul>
					</div>
				</div> <!-- Main_foot -->
				<div class=Main_foot_right>  
					<h3>중고월드 앱 다운로드</h3>
					<div>
					<a href="#"><img src="img\main\Appstore.png"/></a>
					<a href="#"><img src="img\main\GoogleStore.jpg"/></a>
					</div>
				</div><!-- Main_foot_right -->
			</div> <!-- box -->
		</footer>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>