var id="";
var connected_at="";
var email="";
var gender="";
//카카오로그인
Kakao.init('2a473c69bff1309d2f663ecd4ff2b413'); //발급받은 키 중 javascript키를 사용해준다.
function kakaoLogin(){
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
    Kakao.Auth.login({
      scope:'profile_nickname,profile_image,account_email,gender,birthday',
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  id = response.id
        	  connected_at = response.connected_at
        	  kakao_account = response.kakao_account
        	  if(typeof kakao_account != 'undefined'){
            	  email = kakao_account.email;
            	  gender = kakao_account.gender; 
            	  profile_image = kakao_account.profile.profile_image_url;
              }
        	  console.log(id+":"+connected_at+":"+email+":"+gender+":"+profile_image)
        	  location.href="CheckUser.jsp?CheckUser=KakaoLogin&Login_email="+email+"&profile_image="+profile_image; 
        	  
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
  
 function kakaoLogOut(){
	
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
    location.href="CheckUser.jsp?CheckUser=Logout"
  }  