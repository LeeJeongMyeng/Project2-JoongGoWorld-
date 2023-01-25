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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23fbea4a8cc689d8192434226e5baee4&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23fbea4a8cc689d8192434226e5baee4"></script>

<style>
.InsProd_Wrap{
}
.InsProd_Wrap h1{
    text-align: center;
    margin: 30px 0;
}
.InsProd_Wrap .InsProdBox{
	width:100%;
	min-height: 726px;
    /* max-height: 726px; */
}

.InsProd_Wrap .InsProdBox form table{
	margin: 0 auto;
    width: 800px;
    height: 700px;
    border-collapse: separate;
    border-spacing: 0 8px;
    font-size: 16px;
    font-weight: 900;
}


.InsProd_Wrap .InsProdBox form table tr input[type=text],
.InsProd_Wrap .InsProdBox form table tr input[type=number],
.InsProd_Wrap .InsProdBox form table tr select{
 height:40px;
 padding: 5px;
 font-size:14px;
 font-weight:900;
 border: 1px solid #c8c8c8;
}

.InsProd_Wrap .InsProdBox form table tr:first-child,
.InsProd_Wrap .InsProdBox form table tr:nth-child(2),
.InsProd_Wrap .InsProdBox form table tr:nth-child(3),
.InsProd_Wrap .InsProdBox form table tr:nth-child(4),
.InsProd_Wrap .InsProdBox form table tr:nth-child(7){
	height: 50px;
	
}	
.InsProd_Wrap .InsProdBox form table tr:last-child{
	height: 200px;
}	
.InsProd_Wrap .InsProdBox form table tr:last-child img{
	width: 110px;
    height: 110px;
    margin: 10px;
}
	

.InsProd_Wrap .InsProdBox form table tr td{
	padding:10px;
}

.InsProd_Wrap .InsProdBox form table tr td:first-child{
	width: 20%;
}
.InsProd_Wrap .InsProdBox form table input[name=prodname]{
width:100%;
height:50%;

}
.InsProd_Wrap .InsProdBox form table tr td textarea{
width:100%;
height:300px;
padding:15px;
font-size:15px;
font-weight:900;
border: 1px solid #c8c8c8;
}
.InsProd_Wrap .InsProdBox form table input[name=price]{
width:15%;
height:50%;

}

/*-------카카오맵----------------------------------*/
.map_wrap {
    width:100%;
   	height:350px;
   	border:1px solid #c8c8c8;
} 

.InsProd_Wrap .InsProdBox form table tr #bigmapinfo,
.InsProd_Wrap .InsProdBox form table tr #midmapinfo,
.InsProd_Wrap .InsProdBox form table tr #smallmapinfo{
	width: 16%;
    height: 24px;
    
}

.InsProd_Wrap .InsProdBox form table tr #detailmapinfo{
	width: 68%;
    height: 24px;
    margin-top: 10px;
    margin-bottom: 27px;
    
}

.imgs_wrap{
	border: 1px solid #c8c8c8;
    width: 100%;
    height: 100%;
}

.InsProd_Wrap .InsProdBox div:last-child{
	text-align:center;
	margin:1px 0;
}
.InsProd_Wrap .InsProdBox div:last-child #btn{
	width: 300px;
    height: 50px;
    border: none;
    border-radius: 8px;
    background: #A83CA8;
    color: white;
    font-size: 20px;
    font-weight: 900;
    margin-left: 100px;
}




</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
/*
 
 */
</script>
</head>
<body>
<jsp:include page="Top.jsp"/>
			<div class="box InsProd_Wrap">
				<h1>중고물품 판매등록</h1>
				<div class="InsProdBox">
					<form id="frm" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td>글제목</td>
								<td colspan="2"><input type="text" name="prodname" value="" placeholder="판매글 제목"/></td>
							</tr>
							<tr>
								<td>판매상품 카테고리</td>
								<td colspan="2"><select name="classification">
									<option value="수입명품">수입명품</option>
									<option value="패션의류">패션의류</option>
									<option value="패션잡화">패션잡화</option>
									<option value="뷰티">뷰티</option>
									<option value="출산/유아동">출산/유아동</option>
									<option value="모바일/태블릿">모바일/태블릿</option>
									<option value="가전제품">가전제품</option>
									<option value="노트북/PC">노트북/PC</option>
									<option value="카메라/캠코더">카메라/캠코더</option>
									<option value="가구/인테리어">가구/인테리어</option>
									<option value="게임">게임</option>
									<option value="반려동물/취미">반려동물/취미</option>
									<option value="도서/음반/문구">도서/음반/문구</option>
									<option value="스포츠">스포츠</option>
									<option value="레저/여행">레저/여행</option>
									<option value="중고차">중고차</option>
								</select></td>
							</tr>
							<tr>
								<td>거래방식</td>
								<td colspan="2"><select name="dealmethod">
									<option value="직접거래">직접거래</option>
									<option value="택배거래">택배거래</option>
								</select></td>
							</tr>
							<tr>
								<td>판매 가격</td>
								<td colspan="2"><input type="number" name="price" value="0" placeholder="판매가격"/> 원
								<input type="checkbox" name="shareing">나눔
								<input type="checkbox" name="proposal">가격제안받기	
								</td>
							</tr>
							<tr>
								<td>판매내용</td>
								<td colspan="2"><textarea name="prodinfo"></textarea> </td>
							</tr>
							<tr><td>거래희망장소</td>
								<td colspan="2">
									<div class="map_wrap">
									    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>							
									</div><br>
									<input type="text" id="bigmapinfo" name="bigmap" value="" placeholder="시"/>
		 							<input type="text" id="midmapinfo" name="midmap" value="" placeholder="구"/>
									<input type="text" id="smallmapinfo"name="smallmap" value="" placeholder="동"/><br>
									<input type="text" id="detailmapinfo" name="detailmap" value="" placeholder="상세주소"/>
								</td>
							</tr>
							<tr>
								<td>판매상품이미지</td>
								<td>
									<input type="file" name="prodimage" id="Prodimg" multiple>
									<input type="hidden" name="filesname" value=""/>
								</td>			
							</tr>
							<tr><td>등록된 이미지<br>&nbsp;&nbsp;(미리보기)</td>
								<td colspan="2">
									 <div class="imgs_wrap">
	            
	        						</div>
        						</td>
							</tr>
						</table>
						<input type="hidden" name="prodval" value="ins"/>
					</form>
					<div><input type="button" id="btn" value="상품등록하기"/></div>
				</div>
			</div>
			


<br><jsp:include page="Footer.jsp"/>
</body>
<script>
var sel_files = [];
$(document).ready(function() {
    $("#Prodimg").on("change", handleImgsFilesSelect); //input file의상태가 변하면 함수실행
}); 
function handleImgsFilesSelect(e) {
	var filesnameval="";
	$(".imgs_wrap").empty()
	sel_files=[];
    var files = e.target.files; // 해당 파일들을 선택
    var filesArr = Array.prototype.slice.call(files); //파일명을 배열화

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }
        sel_files.push(f.name); // 이미지만 걸러서 다시 배열화

        var reader = new FileReader();
        reader.onload = function(e) {
            var img_html = "<img src=\"" + e.target.result + "\" />";
            $(".imgs_wrap").append(img_html);
        }
        reader.readAsDataURL(f);
    });
    
    
    for(var i=0; i<sel_files.length; i++){
    	if(i==sel_files.length-1){
    	filesnameval+=sel_files[i]
    	}else{
    	filesnameval+=sel_files[i]+","
    	}
    }
    
    
    $("input[name=filesname]").val(filesnameval)
    //console.log(sel_files.length)
    //console.log(sel_files[0])
    //console.log(sel_files[1])
}


/*-카카오맵-----------------------------------------------------------------*/
var container = document.getElementById('map');// 지도를 표시할 div 
var options = {
	center: new kakao.maps.LatLng(33.450701, 126.570667),// 지도의 중심좌표
	level: 3 // 지도의 확대 레벨
};

//지도를 생성합니다    
var map = new kakao.maps.Map(container, options);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커
	 infowindow = new kakao.maps.InfoWindow({zindex:1}); 


function searchDetailAddrFromCoords(coords, callback) {// 좌표로 법정동 상세 주소 정보를 요청합니다
   geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
   
}


 
/* function serar */
geocoder.addressSearch('${Login.address}', function(result, status) {


    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="min-width:180px; min-height:30px;text-align:center;padding:6px 0;">현재 지정 위치</div>'});
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    }
     kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
    	        if (status === kakao.maps.services.Status.OK) {
    	            var detailAddr2 = !!result[0].road_address ? result[0].road_address.address_name : '도로명주소 없음';
    	            var	detailAddr3 = result[0].address.address_name;
    	            
    	            var content = '<div class="bAddr" style="width:300px; min-height:60px;text-align:center;">' +   	                            
    	                            '<span class="title"><strong><행정동 주소정보><br>  </strong></span>' + detailAddr3 + "<br>" +  	                            
    	                        '</div>';

    	            // 마커를 클릭한 위치에 표시합니다 
    	            marker.setPosition(mouseEvent.latLng);
    	            marker.setMap(map);
    	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
    	            infowindow.setContent(content);
    	            infowindow.open(map, marker);
    	            infoDiv=detailAddr2;		
    	            //console.log(result[0].address.region_1depth_name) //시
    	           	//console.log(result[0].address.region_2depth_name) //구
    	           	//console.log(result[0].address.region_3depth_name) //동
    	          	//console.log(result[0])
    	           $("input[name=bigmap]").val(result[0].address.region_1depth_name);
    	           	$("input[name=midmap]").val(result[0].address.region_2depth_name)
    	           	$("input[name=smallmap]").val(result[0].address.region_3depth_name)
    	           	
    	           	
    	            
    	        }   
    	    });
    	});
});    

/*-------등록을위한 액션 전송값---------------------------------------------------------*/
 
 $("[name=shareing]").change(function(){
        if($("[name=shareing]").is(":checked")){
        	$("input[name=price]").val(0)
        	$("input[name=price]").attr("readonly",true);
        	$("input:checkbox[name=proposal]").prop("checked",false);
        	$()
        	  
        }else{
        	$("input[name=price]").attr("readonly",false);
        }
 	})
 
 

 
 
 
 $("#btn").click(function(){
	var prodname = $("input[name=prodname]").val()
	var classification = $("select[name=classification]").val()
	var dealmethod =$("select[name=dealmethod]").val()
	var price = $("input[name=price]").val()
	var shareing = $("input[name=shareing]").prop("checked")
	var shareingval;
	var proposal = $("input[name=shareing]").prop("checked")
	var proposalval;
	var prodinfo = $("textarea[name=prodinfo]").val()
	var bigmap = $("input[name=bigmap]").val()
	var midmap = $("input[name=midmap]").val()
	var smallmap = $("input[name=smallmap]").val()
	var detailmap = $("input[name=detailmap]").val()
	var filesname = $("input[name=filesname]").val()
	var prodval = $("input[name=prodval]").val()
	
	if(shareing==true){shareingval="O"}else{shareingval="X"}
	if(proposal==true){proposalval="O"}else{proposalval="X"}
	
	var str = "?productname="+prodname+
			  "&kind="+classification+
			  "&dealmethod="+dealmethod+
			  "&price="+price+
			  "&sharewhether="+shareingval+
			  "&priceoffer="+proposalval+
			  "&information="+prodinfo+
			  "&faddressval="+bigmap+
			  "&saddressval="+midmap+
			  "&caddressval="+smallmap+
			  "&daddressval="+detailmap+
			  "&writerid=${Login.id}&imgname="+filesname+
			  "&prodval="+prodval
			
	  console.log(str)
	$("#frm").attr("action", "CheckProd.jsp"+str);
	$("#frm").submit();
 
 })
 



 
 
 
</script>
</html>