<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
 
    import="webproject.*"
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
 src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>
<script>

</script>
<link rel="stylesheet" type="text/css" href="css/SignUp.css">
<style>
#UpdateInfo_Frm{
	width:100%;
}

</style>
</head>
<body>
<jsp:include page="Top.jsp"></jsp:include>
<%
				boolean isUpdate = false;
				boolean loginalert=false;
				JGUserVO Login = (JGUserVO)session.getAttribute("Login");
				
					String []PhonenumArr = Login.getPhonenumber().split("-");
					String PhonenumArr1 = PhonenumArr[0];
					String PhonenumArr2 = PhonenumArr[1];
					String PhonenumArr3 = PhonenumArr[2];
					
					String []addressArr = Login.getAddress().split("\\(");
					String addressArr1 = addressArr[0];
					String addressArr2 ="";
					int aa = addressArr.length;
					if(addressArr.length==2){
					addressArr2 = "("+addressArr[1];
					}
					
					
					
					
				
%>
			
			<div class="SignUp_Wrap">
				<h1>회원정보 및 수정</h1>
				<form id="UpdateInfo_Frm" action="CheckUser.jsp">
					<input type="hidden" name="CheckUser" value="UpdateUser"/>
				<div class="SignUp_box Infoupdate">
					<div class="SignUp_title" ><span class="title_beforespan" id="SignUp_id_bspan">*</span>아이디 <span id="SignUp_id_aspan"></span></div>
						<div>
						<input type="text" name="SignUp_id" id="SignUp_id" value="<%=Login.getId() %>" placeholder="아이디" readOnly/>
						</div>
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_pass_bspan">*
						</span>비밀번호(영,숫,특 2가지이상 혼합)<span id="SignUp_pass_aspan"> </span></div>
						<input type="password" name="SignUp_password" value="<%=Login.getPassword() %>"  placeholder="비밀번호"/>
						<input type="hidden" id="SignUp_pass_DuplicationCheck" value="사용가능여부확인"/>
						<div id="SignUp_password_Check"></div>
					<div class="SignUp_title"><span id="SignUp_pass2_aspan"> </span></div>
						<input type="hidden" name="SignUp_password2" value="<%=Login.getPassword() %>" placeholder="비밀번호확인"/>						
						<div id="SignUp_password2_Check"></div>
					<div class="SignUp_title"><span class="title_beforespan"  id="SignUp_nickname_bspan">*</span>닉네임</div>
						<input type="text" name="SignUp_nickname" value="<%=Login.getNickname()%>"/>
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_name_bspan">*</span>성함</div>
						<input type="text" name="SignUp_name" value="<%=Login.getUsername() %>"  placeholder="이름" readOnly/>
					
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_pnum_bspan">*</span>핸드폰번호</div>
						<div id="SignUp_phonenumbox">
						<input type="text" name="SignUp_first_phonenum" value="010"  maxlength="3"/>-
						<input type="text" name="SignUp_second_phonenum" value="<%=PhonenumArr2 %>" maxlength="4"/>-
						<input type="text" name="SignUp_third_phonenum" value="<%=PhonenumArr3 %>" maxlength="4"/>
						</div>	
					
					
					<div class="SignUp_title" ><span class="title_beforespan" id="SignUp_email_bspan">*</span>이메일(xxx@xxx.xx형식)</div>
					<div id="SignUp_emailbox">
						<input type="text" name="SignUp_femail" value="<%=Login.getEmail() %>" placeholder="(카카오계정 입력시, 로그인에 유리합니다.)"/>
						<input type="hidden" name="SignUp_email_Check" value="인증번호발송">
				    </div>
				    	<input type="hidden" name="SignUp_email_Code" placeholder="인증번호6자"/>
				    	<input type="hidden" name="SignUp_emailCode_Check_" value="인증확인">
				   		
				    
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_address_bspan">*</span>주소</div>
						<div id="SignUp_addressbox">
							<input type="text" name="SignUp_Zipcode"id="sample6_postcode" value="<%=Login.getZipcode() %>">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" name="SignUp_address" id="sample6_address" value="<%=addressArr1 %>"><br>
							<input type="text" name="SignUp_extraAddress" id="sample6_extraAddress" value="<%=addressArr2 %>" ><br>
							<input type="text" name="SignUp_detailAddress" id="sample6_detailAddress" value="<%=Login.getDetailaddress() %>">
						</div>
					
					
					<br><input type="Button" id="FinalyUpdateBtn" value="수정완료">
					<inpug type="button" onclick="history.go(-1)"/>
				</div>
				</form>
			</div>
<br><jsp:include page="Footer.jsp"></jsp:include>
</body>
<script>
/*--- 우편번호 및 주소 생성----------------------------------------------------------------*/
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
/*------입력정보-------------------------------------------------------------------------*/
 var SignUpId = $('input[name=SignUp_id]')
 var SignUpPass = $('input[name=SignUp_password]')
 var SignUpPass2 = $('input[name=SignUp_password2]')
 var SignUpNickname = $('input[name=SignUp_nickname]')
 var SignUpName = $('input[name=SignUp_name]')
 var SignUpFrrn = $('[name=SignUp_frrn]')
 var SignUpBrrn = $('[name=SignUp_brrn]')
 var SignUpFphonenum = $('[name=SignUp_first_phonenum]')
 var SignUpSphonenum = $('[name=SignUp_second_phonenum]')
 var SignUpTphonenum = $('[name=SignUp_third_phonenum]')
 var SignUpGender = $('[name=SignUp_gender]')
 var SignUpEmail = $('[name=SignUp_femail]')
 var SignUpEmailCode = $('[name=SignUp_email_Code]')
 var SignUpPostcode = $('#sample6_postcode')
 var SignUpAddress = $('#sample6_address')
 var SignUpAxtraAddress = $('#sample6_extraAddress')
 var SignUpDetailAddress = $('#sample6_detailAddress')
 
 
 
 
 
 
 
/*--- 회원가입 버튼 완료 조건들----------------------------------------------------------------*/
 var CheckPassval = true;
 var CheckPass2val = true;
 var Checkemailval = true;
 
/*-----------------비밀번호 양식부분-----------------------------*/

// 기본적으로 패스워드칸은 Login.getPassword()로 기본정보 처리
//        패스워드확인칸역시 Login.getPassword()로 기본처리하는데, + type=hidden으로 해놓음
// 이후, 비밀번호를 수정하지않고 놔두면 상관 없음
// 만약 비밀번호 수정을 위해서 건드리면 아래 function실행
$(SignUpPass).keyup(function(){ //패스워드칸을 onkeyup으로 확인
	var Originalpass = '${Login.password}' //세션처리된 비밀번호
	var pass = SignUpPass.val() //현재입력된 비밀번호

	if(Originalpass!= pass){ 
		$('#SignUp_pass_DuplicationCheck').prop("type", "button"); 
		SignUpPass2.prop("type", "password");
		SignUpPass2.val('')
		CheckPassval = false;
		CheckPass2val =false;
	}
	if(Originalpass == pass){
		$('#SignUp_pass_DuplicationCheck').prop("type", "hidden");
		SignUpPass2.prop("type", "hidden");
		SignUpPass2.val(Originalpass)
		CheckPassval = true;
		CheckPass2val =true;	
		$('#SignUp_pass2_aspan').text("");
	}
})

$('#SignUp_pass_DuplicationCheck').click(function chkPW(){
	 var pw = $(SignUpPass).val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi);
		 if(pw.length < 10 || pw.length > 20){
			 console.log(pw);
			 $('#SignUp_pass_aspan').css({'color':'red','font-size':'10px'})
			 $('#SignUp_pass_aspan').text("10자리 ~ 20자리 이내로 입력해주세요.")
			 SignUpPass.val('');
			 SignUpPass.focus();
		  return false;
		 }else if(pw.search(/\s/) != -1){
			$('#SignUp_pass_aspan').css({'color':'red','font-size':'10px'})
			$('#SignUp_pass_aspan').text("비밀번호는 공백 없이 입력해주세요.")
		  return false;
		 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			 $('#SignUp_pass_aspan').css({'color':'red','font-size':'10px'})
			 $('#SignUp_pass_aspan').text("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.")
		  return false;
		 }else {
			 alert("확인되었습니다.")
			 $('#SignUp_pass_aspan').text("")
			 $('#SignUp_pass_bspan').css({'color':'green','font-size':'15px'})
			 $('#SignUp_pass_bspan').text("✔");	 
			 $(SignUpPass).attr("readonly",true);
			 CheckPassval = true;
		 }

		})

$(SignUpPass2).keyup(function(){
	if(SignUpPass.val()==SignUpPass2.val()){
		 $('#SignUp_pass2_aspan').css({'color':'green','font-size':'15px'})
		 $('#SignUp_pass2_aspan').text("일치 확인되었습니다.");	 
		 $(SignUpPass2).attr("readonly",true);
		 CheckPass2val = true;
	}else{
		$('#SignUp_pass2_aspan').css({'color':'red','font-size':'10px'})
		 $('#SignUp_pass2_aspan').text("비밀번호가 일치하지않습니다.")
	} 
})


/*---이메일 인증 체크--------------------------------------------------------------------------*/
emailjs.init("mzN3R1G0GZQBRs8hh");
var SixRanNum = ""; 
        $('[name=SignUp_email_Check]').click(function(){
        	SixRanNum=""
        	for(let i = 0; i < 6; i++) {
        		SixRanNum += Math.floor(Math.random() * 10)
        	  }    	
          var templateParams = {
                to_name: SignUpName.val(),
                to_email : SignUpEmail.val(),
                message : SixRanNum      
          }
         emailjs.send('service_1dpjdyd', 'template_2oesbfe', templateParams)
         //emailjs.send('service ID', 'template ID > emailjs 페이지에서 만든 템플릿에서 확인이 가능하다', 보낼 내용이 담긴 객체)
         	    .then(function(response) {
         	       alert('입력하신 메일을 확인하시고, 인증번호를 입력부탁드립니다.')
         	       
         	    }, function(error) {
         	       alert('정상적인 제출이 이루어지지 않았습니다. 다시 시도해주세요!')
         	    });
        });
// 기존 emile과 다를경우 인증발송/코드입력/코드확인칸 활성화
 $(SignUpEmail).keyup(function(){
	 var Originalemail = '${Login.email}' //세션처리된 비밀번호
	 var email = SignUpEmail.val() //현재입력된 비밀번호
	 if(Originalemail!= email){
		 $('[name=SignUp_email_Check]').prop("type", "button");
		 $('[name=SignUp_email_Code]').prop("type", "text");
		 $('[name=SignUp_emailCode_Check_]').prop("type", "button");
		 Checkemailval=false;
	 }
	 if(Originalemail == email){
		 $('[name=SignUp_email_Check]').prop("type", "hidden");
		 $('[name=SignUp_email_Code]').prop("type", "hidden");
		 $('[name=SignUp_emailCode_Check_]').prop("type", "hidden");
		 Checkemailval=true;
	 }
 })
      
        
//이메일인증 코드 확인부분	
      $('[name=SignUp_emailCode_Check_]').click(function(){
    	 var EmailCodeval = SignUpEmailCode.val()
    	 console.log(EmailCodeval+":"+SixRanNum)
    	 if(EmailCodeval==SixRanNum){
    		 alert("확인되었습니다. 감사합니다.")
    		 SignUpEmail.attr("readonly",true);
    		 SignUpEmailCode.attr("readonly",true);
    		 $('#SignUp_email_bspan').css({'color':'green','font-size':'15px'})
    		 $('#SignUp_email_bspan').text("✔");
    		 Checkemailval = true;
    	 }else{
    		 alert("일치하지않습니다.다시입력 바랍니다.")
    		 EmailCode.val('')
    		 EmailCode.focus()
    	 }
      });
 
 /*--최종 회원가입 체크-----------------------------------------------------------------------------------*/
 
 $('#FinalyUpdateBtn').click(function(){
	 //인증처리하는 애들은 true,false로 분류
	if(CheckPassval==false){alert("비밀번호 사용가능 여부를 확인해주세요"); return false;}
	if(CheckPass2val==false){alert("비밀번호가 일치하지않습니다. 다시 입력해주세요"); return false;}
	if(Checkemailval==false){alert("이메일 인증이 이루어 지지않았습니다. 확인 부탁드립니다."); return false;}
	$('#UpdateInfo_Frm').submit();
 }); 
 

 
</script>
</html>