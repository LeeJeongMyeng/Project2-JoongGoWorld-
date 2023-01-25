<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  import="java.util.*"  
    import="frontWeb.*"     
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


</style>
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>
<%
String kl = (String)request.getParameter("kl");
%>
<h2><%=kl %></h2>




</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/${VERSION}/kakao.min.js" integrity="${INTEGRITY_VALUE}" crossorigin="anonymous"></script>
<script>

var kl="<%=kl%>";
var id="";
var connected_at="";
var email="";
var gender="";
var name="";
//카카오로그인
console.log(kl)
if(kl=="y"){
	Kakao.init('2a473c69bff1309d2f663ecd4ff2b413'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
    Kakao.Auth.login({
      scope:'profile_nickname,profile_image,account_email,gender,birthday',
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  id = response.id
        	  connected_at = response.connected_at// 접속시간
        	  kakao_account = response.kakao_account
        	  if(typeof kakao_account != 'undefined'){
            	  email = kakao_account.email;
            	  gender = kakao_account.gender; 
            	  name = kakao_account.name;
            	  profile_image = kakao_account.profile.profile_image_url

              }
        	  console.log(id+":"+connected_at+":"+email+":"+gender+":"+name)
        	  console.log(profile_image)
        	 /*  location.href="KakaoLogin.jsp?email="+email;  */
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
if(kl=="n"){
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
</html>