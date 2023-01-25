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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
 src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>
<script>

</script>
<link rel="stylesheet" type="text/css" href="css/SignUp.css">
<style>


</style>
</head>
<body>
<jsp:include page="Top.jsp"></jsp:include>

			
			<div class="SignUp_Wrap">
				<h1>회원가입</h1>
			
				<div class=SignUp_box>
					<div class="SignUp_title" ><span class="title_beforespan" id="SignUp_id_bspan">*</span>아이디 <span id="SignUp_id_aspan"></span></div>
						<div>
						<input type="text" name="SignUp_id" id="SignUp_id" placeholder="아이디"/>
						<input type="button" id="SignUp_id_DuplicationCheck" value="중복확인"/>
						</div>
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_pass_bspan">*</span>비밀번호(영,숫,특 2가지이상 혼합)<span id="SignUp_pass_aspan"> </span></div>
						<input type="password" name="SignUp_password" placeholder="비밀번호"/>
						<input type="button" id="SignUp_pass_DuplicationCheck" value="사용가능여부확인"/>
						<div id="SignUp_password_Check"></div>
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_pass2_bspan">*</span>비밀번호확인<span id="SignUp_pass2_aspan"> </span></div>
						<input type="password" name="SignUp_password2" placeholder="비밀번호확인"/>						
						<div id="SignUp_password2_Check"></div>
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_nickname_bspan">*</span>닉네임</div>
						<input type="text" name="SignUp_nickname" placeholder="닉네임"/>
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_name_bspan">*</span>성함</div>
						<input type="text" name="SignUp_name" placeholder="이름"/>
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_rrn_bspan">*</span>주민번호<span id="SignUp_rrn_aspan"> </span></div>
						<div>
						<input type="text" name="SignUp_frrn" placeholder="앞자리" maxlength="6"/>&nbsp;-
						<input type="password" name="SignUp_brrn" placeholder="뒷자리" maxlength="7"/>
						<input type="button" id="SignUp_rrn_DuplicationCheck" value="주민번호인증"/>
						</div>
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_pnum_bspan">*</span>핸드폰 번호</div>
						<div id="SignUp_phonenumbox">
						<input type="text" name="SignUp_first_phonenum" value="010" placeholder="" maxlength="3"/>-
						<input type="text" name="SignUp_second_phonenum" placeholder="앞자리" maxlength="4"/>-
						<input type="text" name="SignUp_third_phonenum" placeholder="뒷자리" maxlength="4"/>
						</div>	
					
					
					<div class="SignUp_title" ><span class="title_beforespan" id="SignUp_email_bspan">*</span>이메일(xxx@xxx.xx형식)</div>
					<div id="SignUp_emailbox">
						<input type="text" name="SignUp_femail" value="${param.Login_email }" placeholder="(카카오계정 입력시, 로그인에 유리합니다.)"/>
						<input type="button" name="SignUp_email_Check" value="인증번호발송">
				    </div>
				    	<input type="text" name="SignUp_email_Code" placeholder="인증번호6자"/>
				    	<input type="button" name="SignUp_emailCode_Check_" value="인증확인">
				   		
				    
					<div class="SignUp_title"><span class="title_beforespan" id="SignUp_address_bspan">*</span>주소</div>
						<div id="SignUp_addressbox">
							<input type="text" id="sample6_postcode" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="sample6_address" placeholder="주소"><br>
							<input type="text" id="sample6_extraAddress" placeholder="참고항목"><br>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						</div>
						<input type="checkbox" id="SuccessTerms" disabled><label for="SuccessTerms"></label>
						<input type="checkbox" id="terms_popup"><label for="terms_popup">약관 동의</label>
					<div>
						<div>
							<label for="terms_popup"></label>
							<h1 style="text-align:center;">이용약관</h1><br><br>
							<p>
							<strong>제 1 조 (목적)</strong><br>
이 약관은 <strong>{중고나라}</strong>(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.<br><br>

 

<strong>제 2 조 (약관의 효력 및 변경)</strong><br>
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.<br>
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.<br><br>

 

<strong>제 3 조 (용어의 정의)</strong><br>
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.<br>
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.<br>
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.<br>
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.<br>
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.<br>
							
							</p>
						<br><br>
						<h2>동의합니다.<input type="checkbox" name="SignUp_OkTerms"></h2>
						</div>
							<label for="terms_popup"></label>
					</div>
					<br><input type="Button" id="FinalySignBtn" value="중고월드 가입 완료하기">
				</div>	
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
 var CheckIdval = false;
 var CheckPassval = false;
 var CheckPass2val = false;
 var Checkrrnval = false;
 var Checkemailval = false;
 var CheckTermsval = false;
 
 
/*--- 아이디 중복확인 및 입력양식 확인 부분----------------------------------------------------------------*/
 var SignUpId = $('input[name=SignUp_id]')
 var SuccessIdLength = false;
 $(SignUpId).keyup(function(){
	 var SignUpIdLegnth = $(this).val().length;
	 console.log(SignUpIdLegnth)
	 if(SignUpIdLegnth<=6 || SignUpIdLegnth >=17){
	 	$('#SignUp_id_aspan').css({'color':'red','font-size':'10px'})
		$('#SignUp_id_aspan').text("7자리이상 16자리이하여야합니다.")
		SuccessIdLength = false;
	 }else{
		 $('#SignUp_id_aspan').text('')
		 SuccessIdLength = true;
	 }
	 //console.log(SuccessIdLength)
});

 
$('#SignUp_id_DuplicationCheck').click(function(){
	var SignUpIdval = $(SignUpId).val()
	if(SuccessIdLength){
		CallOveChexkId(SignUpIdval)
	}else{
		alert('아이디 입력 조건이 충족되지 않았습니다.')
		$(SignUpId).focus()
	}
})

function CallOveChexkId(val){
	 var xhr = new XMLHttpRequest()
	 //console.log("가져온id"+val)
     xhr.open("get","CheckUser.jsp?SignUpId="+val,true)
     xhr.send()
     xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
          console.log(xhr.responseText)
          
           var data = JSON.parse(xhr.responseText) // JSON객체로 변환
           console.log(data)
           if(data.CheckOverId){
              alert("등록된 아이디가 있습니다.")
              $(SignUpId).focus()
      		  $('#SignUp_id_aspan').css({'color':'red','font-size':'10px'})
			  $('#SignUp_id_aspan').text("다시 시도해주세요")
           }else{
              alert("등록 가능합니다.")
              $('#SignUp_id_bspan').css({'color':'green','font-size':'15px'})
			  $('#SignUp_id_bspan').text("✔");
			  $(SignUpId).attr("readonly",true);
			  CheckIdval = true;
           }
        }
     }
}

/*-----------------비밀번호 양식부분-----------------------------*/



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
	/* console.log("1차:"+SignUpPass.val())
	console.log("2차:"+SignUpPass2.val()) */
	if(SignUpPass.val()==SignUpPass2.val()){
		 $('#SignUp_pass2_aspan').text("")
		 $('#SignUp_pass2_bspan').css({'color':'green','font-size':'15px'})
		 $('#SignUp_pass2_bspan').text("✔");	 
		 $(SignUpPass2).attr("readonly",true);
		 CheckPass2val = true;
	}else{
		$('#SignUp_pass2_aspan').css({'color':'red','font-size':'10px'})
		 $('#SignUp_pass2_aspan').text("비밀번호가 일치하지않습니다.")
	} 
})

/*-----------주민번호 양식체크-----------------------------------------------------------------*/
 
 $('#SignUp_rrn_DuplicationCheck').click(function ssnCheck(){
    var frrn    = SignUpFrrn.val(),
    	//frrn    = $('[name=SignUp_frrn]').val(),
        brrn    = SignUpBrrn.val(),
        //brrn    = $('[name=SignUp_brrn]').val(),
        rrn     = frrn+''+brrn,
        arr_rrn = [],
        compare = [2,3,4,5,6,7,8,9,2,3,4,5],
        sum     = 0;
    var fullrrn=SignUpFrrn.val()+"-"+SignUpBrrn.val()
 
    // 입력여부 체크
    if (frrn == ''){alert('주민등록번호를 기입해주세요.');return false;}
    if (brrn == ''){alert('주민등록번호를 기입해주세요.');return false;}    
    // 입력값 체크
    if (frrn.match('[^0-9]')){alert("주민등록번호는 숫자만 입력하셔야 합니다."); return false; }
    if (brrn.match('[^0-9]')){alert("주민등록번호는 숫자만 입력하셔야 합니다."); return false; }
    // 자리수 체크
    if (rrn.length != 13){alert("올바른 주민등록 번호를 입력하여 주세요.");return false;}    
    
    for (var i = 0; i<13; i++) { arr_rrn[i] = rrn.substring(i,i+1); }
    for (var i = 0; i<12; i++){sum = sum + (arr_rrn[i] * compare[i]);}
 
    sum = (11 - (sum % 11)) % 10;  
    if (sum != arr_rrn[12]){ 
        alert("올바른 주민등록 번호를 입력하여 주세요.");
        return false; 
    }
    
    SignUpCheckRrn(fullrrn)
    
})

function SignUpCheckRrn(val){
	var xhr = new XMLHttpRequest()
	 console.log("가져온rrn"+val)
    xhr.open("get","CheckUser.jsp?fullrrn="+val,true)
    xhr.send()
    xhr.onreadystatechange=function(){
       if(xhr.readyState==4&&xhr.status==200){
          console.log("false가 정상:"+xhr.responseText)
          var data = JSON.parse(xhr.responseText) // JSON객체로 변환
          if(data.CheckOverRrn){
             alert("이미 등록된 주민번호입니다.")
             $(SignUpId).focus()
     		  $('#SignUp_rrn_aspan').css({'color':'red','font-size':'10px'})
			  $('#SignUp_rrn_aspan').text("다시 시도해주세요")
          }else{
             alert("정상 확인되었습니다.")
             $('#SignUp_rrn_aspan').text("")
             $('#SignUp_rrn_bspan').css({'color':'green','font-size':'15px'})
			  $('#SignUp_rrn_bspan').text("✔");
             SignUpFrrn.attr("readonly",true);
             SignUpBrrn.attr("readonly",true);
             Checkrrnval = true;
          }
       }
    }
 	} 

/*---이메일 인증 체크--------------------------------------------------------------------------*/
		emailjs.init("mzN3R1G0GZQBRs8hh");
var SixRanNum = ""; 
        $('[name=SignUp_email_Check]').click(function(){
        	SixRanNum=""
        	for(let i = 0; i < 6; i++) {
        		SixRanNum += Math.floor(Math.random() * 10)
        	  }
        	console.log(SixRanNum);
        	
        	
          var templateParams = {
          //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
                to_name: SignUpName.val(),
                to_email : SignUpEmail.val(),
                message : SixRanNum
                
          }
          console.log(SignUpName.val())
          console.log(SignUpEmail.val())
          console.log(SixRanNum)
         emailjs.send('service_1dpjdyd', 'template_2oesbfe', templateParams)
         //emailjs.send('service ID', 'template ID > emailjs 페이지에서 만든 템플릿에서 확인이 가능하다', 보낼 내용이 담긴 객체)
         	    .then(function(response) {
         	       alert('입력하신 메일을 확인하시고, 인증번호를 입력부탁드립니다.')
         	       
         	    }, function(error) {
         	       alert('정상적인 제출이 이루어지지 않았습니다. 다시 시도해주세요!')
         	    });
        });

	
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
/*---약관 동의 체크--------------------------------------------------------------------------*/

 	$("[name=SignUp_OkTerms]").change(function(){
        if($("[name=SignUp_OkTerms]").is(":checked")){
        	$("#SuccessTerms").prop("checked", true);
        		alert("동의해주셔서 감사합니다 *^^*")
        		CheckTermsval = true;
        	  $('input[id="terms_popup"] + label + div').css('display', 'none');
        }
 	})
 
 /*--최종 회원가입 체크-----------------------------------------------------------------------------------*/
 
 $('#FinalySignBtn').click(function(){
	 
	 //인증처리하는 애들은 true,false로 분류
	if(CheckIdval==false){alert("아이디 중복처리를 완료해주세요."); return false; }
	if(CheckPassval==false){alert("비밀번호 사용가능 여부를 확인해주세요"); return false;}
	if(CheckPass2val==false){alert("비밀번호가 일치하지않습니다. 다시 입력해주세요"); return false;}
	if(Checkrrnval==false){alert("주민번호인증 확인을 완료해주세요."); return false;}
	if(Checkemailval==false){alert("이메일 인증이 이루어 지지않았습니다. 확인 부탁드립니다."); return false;}
	if(CheckTermsval==false){alert("이용약관 동의 후, 다시 한번 진행 부탁드립니다."); return false;}
	//그외는 빈칸처리로 분류
	var Phonenum=String(SignUpFphonenum.val())+"-"+String(SignUpSphonenum.val())+"-"+String(SignUpTphonenum.val())
	var userdiv = "회원"
	var fullrrn=SignUpFrrn.val()+"-"+SignUpBrrn.val()
	var address = SignUpAddress.val()+SignUpAxtraAddress.val()
	console.log(SignUpFphonenum.val())
	console.log(SignUpSphonenum.val())
	console.log(SignUpTphonenum.val())
	console.log(Phonenum)
	if(SignUpNickname.val()=='' || Phonenum.length!=13 
			||address=='' 
			|| SignUpDetailAddress.val()==''){
		alert("빈칸을 모두 채워주신 후, 다시 한번 진행 부탁드립니다.")}
		
	console.log(typeof(SignUpId.val()))
	console.log(typeof(userdiv))
	console.log(typeof(SignUpName.val()))
	console.log(SignUpNickname.val())
	console.log(typeof(fullrrn))
	console.log(typeof(SignUpPostcode.val()))
	console.log(typeof(address))
	console.log(typeof(SignUpDetailAddress.val()))
	console.log(typeof(Phonenum))
	console.log(typeof(SignUpPass.val()))
	console.log(typeof(SignUpEmail.val()))
	
	
	var SignUpStr = "?CheckUser=SignUp&id="+SignUpId.val()+"&div="+userdiv+"&username="+SignUpName.val()
					+"&nickname="+SignUpNickname.val()+"&rrn="+fullrrn
					+"&zipcode="+SignUpPostcode.val()+"&address="+address+"&detailaddress="+SignUpDetailAddress.val()
					+"&phonenumber="+Phonenum+"&password="+SignUpPass.val()
					+"&email="+SignUpEmail.val();
	
	SignUpSendData(SignUpStr);
 }); 
 
 	function SignUpSendData(Str){
 		var xhr = new XMLHttpRequest()
 	      xhr.open("get","CheckUser.jsp"+Str,true)
 	      xhr.send()
 	      xhr.onreadystatechange=function(){
 	         if(xhr.readyState==4&&xhr.status==200){
 	            console.log(xhr.responseText)
 	            var SuccessSignUpNumber = xhr.responseText // JSON객체로 변환
 	            // {"hasMember":false}
 	            if(SuccessSignUpNumber==1){
 	               alert("가입이 완료되었습니다. 메인페이지로 이동합니다.")
 	               location.href="Main.jsp"
 	               
 	            }else{
 	               alert("등록에 실패하였습니다.")
 	            }
 	         }
 	      }
 	} 
 
</script>
</html>