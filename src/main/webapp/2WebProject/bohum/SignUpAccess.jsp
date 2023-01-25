<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.vo.*" 
       import="jspexp.a13_database.*"
   %>


<jsp:useBean id="JGUdao" class="webproject.JGUser"/>
<jsp:useBean id="sch" class="webproject.JGUserVO"/>
<jsp:setProperty property="*" name="sch"/>
${JGUdao.insertJGUser(sch)}

