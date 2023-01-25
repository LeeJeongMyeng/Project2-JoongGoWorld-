<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"

    import="java.util.*"
    import="webproject.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고월드 회원탈퇴</title>
<style>
	.button{
		color:rgb(243, 156, 18);
		background:white;
		border:3px solid rgb(243, 156, 18);
		width:200px;
		height:50px;
		font-size:17pt;
		font-weight:bord;
	}
	input[type=submit]:hover{
		color:red;
		border:3px solid red;
	}
	input[type=submit]:active{
		color:white;
		border:3px solid red;
		background:red;
	}
	input[type=button]:hover{
		color:green;
		border:3px solid green;
	}
	input[type=button]:active{
		color:white;
		border:3px solid green;
		background:green;
	}
</style>
<script type="text/javascript">
	function cancel(){
		window.close();
	} 

</script>
</head>
<body>
	
	<form method="get">
		<input type="hidden" name="id" value="${Login.id }" />
		<input type="hidden" name="password" value="${Login.password }" />
		<table>
			<tr><th colspan="2"><h2>* 정말로 회원탈퇴를 하시려면<br>비밀번호를 입력해주세요.</h2></th></tr>	
			<tr><td><input class="button" type="submit" value="확인" /></td>
			<td><input class="button" type="button" value="취소" onclick="cancel()"/></td></tr>
		</table>
	</form>
	<%
		
		String id = request.getParameter("id");  if(id==null) id="";
		String password = request.getParameter("password"); if(password==null) password="";
		boolean isInsert = false;
		if(id!=""&&password!=""){
			JGUser dao = new JGUser();
			dao.userdel(new JGUserVO(id,password));
			session.invalidate(); //세션 초기화처리
			isInsert = true;
		}
	%>
</body>
<script type="text/javascript">
	var isInsert = <%=isInsert%>; 
	if( isInsert ){
		alert("[안내메시지]회원탈퇴가 완료되었습니다. \n메인 화면으로 이동합니다.")
		go();
	}
	function go(){
		window.open('Main.jsp')
	}
		
</script>
</html>