<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.javaex.vo.PersonVo" %>
    
<%
	//request 내부 데이터 사용 위한 pList
	List<PersonVo> personList = (List<PersonVo>)request.getAttribute("pList");

	System.out.println("jsp===== 확인용");
	System.out.println("personList");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전화번호 리스트</h1>
	<p>입력한 정보 내역이다.</p>
	
	
	<%
		for(int i=0; i<personList.size(); i++) {
	%>
			<table border="1">
				<tr>
					<td>이름</td>
					<td><%=personList.get(i).getName() %></td>
				</tr>
				<tr>
					<td>핸드폰</td>
					<td><%=personList.get(i).getHp() %></td>
				</tr>
				<tr>
					<td>회사</td>
					<td><%=personList.get(i).getCompany() %></td>
				</tr>
				<tr>
					<td><a href="/phonebook2/pbc?action=uform&id=<%=personList.get(i).getPersonId()%>"></a>수정</td>
					<td><a href="/phonebook2/pbc?action=delete&id=<%=personList.get(i).getPersonId()%>"></a>삭제</td>
					
			</table>
			<br>
	<%
		}
	%>
	
			<a href="/phonebook2/pbc?action=wform">전화번호 등록하기</a>
	
	
</body>
</html>