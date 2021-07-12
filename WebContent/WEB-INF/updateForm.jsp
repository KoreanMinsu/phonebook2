<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.javaex.dao.PhoneDao" %>   
<%@page import="com.javaex.vo.PersonVo" %>
<%
	//update: 파라미터 가져오기(idNum)/ 해당 person정보 가져오기
	//int idNum = Integer.parseInt(request.getParameter("id"));

	//PhoneDao phoneDao = new PhoneDao();
	//PersonVo personVo = phoneDao.getPerson(idNum);
//->>컨트롤러가 수행.
	
	//request 내부 데이터 사용위한 pVo 
	PersonVo personVo =  (PersonVo)request.getAttribute("pVo");
	
	System.out.println("jsp===== 확인용");
	System.out.println("personVo");


	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전화번호 수정</h1>
	<p>수정화면  아래 항목을 수정하고 "수정" 버튼을 클릭하세요</p>
	
	<form action="/phonebook2/pbc" method="get">
		이름: <input type="text" name="name" value="<%=personVo.getName() %>"> <br>
		핸드폰: <input type="text" name="hp" value="<%=personVo.getHp() %>"> <br>
		회사: <input type="text" name="company" value="<%=personVo.getCompany()%>"> <br>
		<input type="text" name="id" value="<%=personVo.getPersonId()%>">
		<input type="text" name = "action" value="update"><br>
		<br>
		<button type="submit">수정</button>
	</form>
</body>
</html>