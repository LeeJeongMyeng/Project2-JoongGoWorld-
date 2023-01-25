<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webproject.*" 
    %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>        
<%@page import = "java.util.Enumeration"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<jsp:useBean id="PDao" class="webproject.Prod"/>
<jsp:useBean id="pd" class="webproject.ProdVO"/>
<jsp:setProperty name="pd" property="*"/>

<jsp:useBean id="al" class="webproject.Alert"/>
<jsp:useBean id="alert" class="webproject.AlertVO"/>
<jsp:setProperty property="*" name="alert"/>


<c:if test="${param.prodval=='ins'}">
	<%
		String loc="C:/Users/aoddl/git/JoongGo/JoongGo/src/main/webapp/2WebProject/img/saleProd";
		int maxSize=1024*1024*5; // 키로바이트*메가바이트*기가바이트
		MultipartRequest multi = new MultipartRequest(
		         request,
		         loc,
		         maxSize, 
		         "utf-8",
		         new DefaultFileRenamePolicy()
		);
	%>
	<c:set var="prodsuccess" scope="page" value="${PDao.insertProd(pd)}"/> 
	<c:if test="${prodsuccess!=0}">
			<c:set var="imgsuccess" scope="page" value="${PDao.insertimage(pd,prodsuccess)==1}"/>
			<script type="text/javascript">
				var imgsuccess = ${imgsuccess}; //처리된 리턴값 true/false
				if(imgsuccess){
					alert("판매등록 완료되었습니다.감사합니다.")
					location.href="ProdSearch.jsp"
				}
				else if(imgsuccess==false){
					alert("판매등록 실패되었습니다. 다시 시도부탁드립니다.")
					location.href="ProdSearch.jsp"
				}
			</script>
	</c:if>
</c:if>

<c:if test="${param.prodval=='upt'}">
	<%
		request.setCharacterEncoding("utf-8");
		String productname= request.getParameter("prodname"); 
		String kind= request.getParameter("classification"); 
		String dealmethod= request.getParameter("dealmethod"); 
		String priceS= request.getParameter("price"); 
		int price =0;
		if(priceS!=null&&!priceS.equals("")){
			price = Integer.parseInt(priceS);
		}		
		String sharewhether="X";
		String priceoffer="X";
		String sharewhetherS= request.getParameter("shareing");
		String priceofferS= request.getParameter("proposal");
		if(sharewhetherS!=null && !sharewhetherS.equals("")){
			if(sharewhetherS.equals("on")){sharewhether="O";}
		}
		if(priceofferS!=null && !priceofferS.equals("")){
			if(priceofferS.equals("on")){priceoffer="O";}
		}
		
		String information= request.getParameter("prodinfo"); 
		String faddressval= request.getParameter("bigmap"); 
		String saddressval= request.getParameter("midmap"); 
		String caddressval= request.getParameter("smallmap"); 
		String daddressval= request.getParameter("detailmap"); 
		String productnoS=request.getParameter("productno");
		int productno=0;
		if(productnoS!=null && !productnoS.equals("")){
			productno=Integer.parseInt(productnoS);
		}
		boolean isInsert=false;
		if(productname!=null&& !productname.equals("")){
			Prod prod = new Prod();
			ProdVO pv = new ProdVO(productname,kind,dealmethod,price,sharewhether,priceoffer,information,faddressval,
					saddressval,caddressval,daddressval,productno);
			prod.updateProd(pv);
		}		
		isInsert=true;
	%>
	<script>
		var success = <%=isInsert%>
		if(success){
			alert("수정이 완료 되었습니다. 조회페이지로 이동합니다.")
			location.href="ProdSearch.jsp"
		}else{
			alert("수정이 실패 되었습니다 다시 시도부탁드립니다.")
			location.href="ProdSearch.jsp"
		}
	
	</script>
</c:if>

<c:if test="${param.prodval=='uptStatus'}">
	${PDao.updatedealStatus(pd)} 
</c:if>
<c:if test="${param.prodval=='likeinsert'}">
	${PDao.likeinsert(pd)}
</c:if>
<c:if test="${param.prodval=='likedelete'}">
	${PDao.likedelete(pd)} 
</c:if>
<c:if test="${param.prodval=='proddelete'}">
	${PDao.DeleteProd(pd)} 
</c:if>
<c:if test="${param.prodval=='time'}">
<jsp:setProperty property="id" name="alert" value="${param.witerid}"/>
	<c:if test="${PDao.insertRes(param.resdate, param.id, param.productno)==1}">
		${al.insertAlert(alert)}
	</c:if>
</c:if>








