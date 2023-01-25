/*-----------------------------------------------------------------------------------------------------*/
var gesiid=document.querySelector("[name=gesiid]")
var gesiidBtn=document.querySelector("[name=gesiidBtn]")

 var gesiselectnum=document.querySelector("[name=gesiselectnum]") 
var GesiidStr = "" //게시글 조건검색문
gesiid.onkeyup=function(){	
	 if(event.keyCode==13){
		 loadGesiDate() 	
		}
}
gesiidBtn.onclick=  loadGesiDate() //검색버튼 클릭시

function loadGesiDate(){
	var gesiidVal= gesiid.value
	GesiidStr = "?gesiid="+gesiidVal
 	console.log(GesiidStr)
	 var xhr = new XMLHttpRequest()
	 xhr.open("get","QnA.jsp"+GesiidStr,true) //비동기 방식으로 화면
 	xhr.send() 
 xhr.onreadystatechange=function(){
		if(xhr.readyState==4&&xhr.status==200){
			document.body.querySelector(".gesipan").innerHTML=xhr.responseText
			callPageSelector()
		}
	}
 }

 

/*----게시판 페이징처리-----------------------------------------------------------------------------*/
 

function callPageSelector(){
	const rowsPerPage =10; // 10개 씩 끊겟다.
	const rows = document.querySelectorAll('.gesitb tbody tr');// 게시글 row를 전체 선택
	const rowsCount = rows.length //게시글 전체의 갯수
	console.log("gd"+rowsCount);
	const PageCount = Math.ceil(rowsCount/rowsPerPage); // 전체글개수/한페이지에 보여질 갯수를 올림처리 = 페이지 갯수
	//console.log(PageCount)
	const numbers = document.querySelector('#numbers'); //클릭할 페이지 버튼번호가 생성될 ol
	//변수 추가 이전다음버튼
	const prevPageBtn= document.querySelector(".pagination .fa-arrow-left");
	const nextPageBtn= document.querySelector(".pagination .fa-arrow-right");
	let pageActiveIdx = 0;//현재 보고있는 페이지그룹 번호
	let currentPageNum = 0; //현재 보고있는 페이지네이션 번호
	let maxPageNum=5;//페이지그룹 최대 갯수
	
	//페이지네이션 생성
	for(let i=1; i<=PageCount;i++){
		numbers.innerHTML +='<li><a href="">'+i+'</a></li>' //생성될 페이지 갯수만큼 버튼li 생성
	}
	const numberBtn = numbers.querySelectorAll('a'); //페이지버튼 a를 모두 선택
	//console.log(numberBtn);
	
	
	//페이지네이션 감추기
	for(nb of numberBtn){
		nb.style.display='none';
	}
	
	/* numberBtn.forEach(function(item,idx){}) */
	numberBtn.forEach((item,idx)=>{ //item(numbersBtn의 각각), idx(인덱스번호)
		item.addEventListener('click',(e)=>{ //해당 번호버튼을 클릭하면
			e.preventDefault();
			// 테이블 출력함수
			//console.log(idx)
			displayRow(idx);
		});
	});
	
	
	function displayRow(idx){
		let start= idx*rowsPerPage; // 공식으로 페이지를 클릭했을떄 해당 시작번째 게시글 index번호
		let end= start+rowsPerPage;//  공식으로 페이지를 클릭했을 떄 해당 마지막번째 게시글 index번호
		let rowsArray =Array.from(rows) //게시글(모든 tr row)을 전부 배열로 바꾼다.
		//let rowsArray =[...rows]
		//console.log(rowsArray)
		
		 for(ra of rowsArray){
			ra.style.display='none'; // 전체 게시글을 일단 안보이게처리
		} 
		  let newRows = rowsArray.slice(start,end);
		for(nr of newRows){
			nr.style.display='';
		}   
		for(let nb of numberBtn){
			nb.classList.remove('active'); //지정해놓은 active시 효과를 제거
		}
		numberBtn[idx].classList.add('active'); //지정해놓은 active를 해당 target만 활성화
		 
	} //displayRow 
	
	displayRow(0); // 시작하자마자 해당 갯수만큼ㅁ만 페이지보이도록 실행함
	
	//페이지네이션 버튼 그룹표시
	function displayPage(num){
		//페이지네이션 감추기
		for(nb of numberBtn){
			nb.style.display='none'; // 일단 전체 버튼클릭을 보이지않도록 함
		}
		let totalPageCount = Math.ceil(PageCount/maxPageNum);
		let pageArray =[...numberBtn]; // 페이지버튼들을 유사배열에서 일반배열로 바꿔줌
		let start = num*maxPageNum; //0*5이므로 0 , 1*5=5
		let end = start+maxPageNum; // 0+5이므로 5+5,=10 
		let pageListArr = pageArray.slice(start,end); //0,5가 들어오면 0~4까지 출력 , 5,10이면 5~9까지출력
		
		for(let item of pageListArr){
			item.style.display=''; //배열.slice를 통해 나온 페이지번호들만 display=none를 취소하여 보이도록함
		}
		if(pageActiveIdx==0){
			prevPageBtn.style.display='none'; //가장 앞자리의 번호면 이전버튼이 안보이도록 설정
		}else{
			prevPageBtn.style.display='';
		}
		if(pageActiveIdx==totalPageCount-1){
			nextPageBtn.style.display='none'; //가장 앞자리의 번호면 이전버튼이 안보이도록 설정
		}else{
			nextPageBtn.style.display='';
		}
	}
	displayPage(0); //시작하자마자 보여줘야하니까 실행되도록 함
	
	// -> 버튼 
	nextPageBtn.addEventListener('click',()=>{
		let nextPageNum = pageActiveIdx*maxPageNum+maxPageNum;
		displayRow(nextPageNum)
		++pageActiveIdx
		displayPage(pageActiveIdx);
		
	});
	// <-버튼
	prevPageBtn.addEventListener('click',()=>{
		let nextPageNum = pageActiveIdx*maxPageNum-maxPageNum;
		displayRow(nextPageNum)
		--pageActiveIdx
		displayPage(pageActiveIdx);
		
	});

}

