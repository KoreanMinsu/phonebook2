<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.javaex.dao.PhoneDao" %>
    
<%
	//파라미터 꺼내기 - 삭제하기 -  리다이렉트
	PhoneDao phoneDao = new PhoneDao();
	int idNum = Integer.parseInt(request.getParameter("id"));
	
	int count = phoneDao.personDelete(idNum);
	
	response.sendRedirect("/phonebook2test/pbc?action=list");
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>