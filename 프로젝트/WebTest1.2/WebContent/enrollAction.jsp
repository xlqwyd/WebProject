<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.DataDao" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="data" class="data.Data" scope="page" />
<jsp:setProperty name="data" property="flexRadioDefault" />
<jsp:setProperty name="data" property="assignmentNum" />
<jsp:setProperty name="data" property="area1" />
<jsp:setProperty name="data" property="namefull" />
<jsp:setProperty name="data" property="phone" />
<jsp:setProperty name="data" property="temperatures" />
<jsp:setProperty name="data" property="weather" />
<jsp:setProperty name="data" property="surface" />
<jsp:setProperty name="data" property="surface2" />
<jsp:setProperty name="data" property="traffic" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
	
	
		if(data.getFlexRadioDefault() == null || data.getAssignmentNum() < 1 || data.getAssignmentNum() > 287|| data.getArea1() == null ||data.getNamefull() == null ||
				data.getPhone() == null || data.getTemperatures() >= 100 || data.getTemperatures() <= -100 ||data.getWeather() == null ||data.getSurface() == null ||
				data.getSurface2() == null ||data.getTraffic() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제출할 수 없습니다. 입력 사항을 다시 확인해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
			
		} else{
			DataDao dataDao = new DataDao();
			int result = dataDao.join(data);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 문제발생.')");  //프라이머리키가 있는경우 중복값 발생시 
				script.println("history.back()");
				script.println("</script>");
				
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('제출이 완료되었습니다.')"); //성공시 알람
				script.println("</script>");
				
			}
		}
	
	%>
	


</body>
</html>