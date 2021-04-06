<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.DataDao" %>
<%@ page import="java.io.PrintWriter" %>
 <%@ page import="java.io.File" %> 
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("UTF-8"); %>



<!--   나중에 지워야 할것
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
-->




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
	java.util.Date utilDate = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	
	
	
	String directory = application.getRealPath("/upload/"+ sqlDate + "/");
	int maxSize = 1024*1024*100;
	String encoding = "UTF-8";
	
	MultipartRequest multipartRequest
	= new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
	
	String fileName1 = multipartRequest.getOriginalFileName("file1");
	String fileName2 = multipartRequest.getOriginalFileName("file2");
	//String fileRealName = multipartRequest.getOriginalFileName("file2");
	
	//String aa = request.getParameter(data.getPhone());
	System.out.println(directory);  //기존 파일위치
	
	// 빈타입제거후 객체를 하나씩 설정하는 부분
	String flexRadioDefault = multipartRequest.getParameter("flexRadioDefault");
	data.setFlexRadioDefault(flexRadioDefault);
	String assignmentNum = multipartRequest.getParameter("assignmentNum");
	data.setAssignmentNum(Integer.parseInt(assignmentNum));   //multipart특성상 string으로만 받으므로 int형으로 형변환
	String area1 = multipartRequest.getParameter("area1");
	data.setArea1(area1);
	String namefull = multipartRequest.getParameter("namefull");
	data.setNamefull(namefull);
	String phone = multipartRequest.getParameter("phone");
	data.setPhone(phone);
	String temperatures = multipartRequest.getParameter("temperatures");
	data.setTemperatures(Float.parseFloat(temperatures));
	String weather = multipartRequest.getParameter("weather");
	data.setWeather(weather);
	String surface = multipartRequest.getParameter("surface");
	data.setSurface(surface);
	String surface2 = multipartRequest.getParameter("surface2");
	data.setSurface2(surface2);
	String traffic = multipartRequest.getParameter("traffic");
	data.setTraffic(traffic);
	
	data.setFileName1(fileName1);
	data.setFileName2(fileName2);
	//data.setFileRealName(fileRealName);  
	
	//String aa = data.getWeather();
	
	
	
	String beforeFile = directory + fileName1;
	String afterFile = directory + assignmentNum + "/" + fileName1;
	String beforeFile2 = directory + fileName2;
	String afterFile2 = directory + assignmentNum + "/" + fileName2;
	
	File before = new File(beforeFile);
	File after = new File(afterFile);
	File before2 = new File(beforeFile2);
	File after2 = new File(afterFile2);
	
	before.renameTo(after);
	before2.renameTo(after2);
	
	
		if(data.getFlexRadioDefault() == null || data.getAssignmentNum() < 1 || data.getAssignmentNum() > 287 || data.getArea1() == null ||data.getNamefull() == null ||
	            data.getPhone() == null || data.getTemperatures() >= 100 || data.getTemperatures() <= -100 ||data.getWeather() == null ||data.getSurface() == null ||
	            data.getSurface2() == null ||data.getTraffic() == null || data.getPhone().length() > 11 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 잘못된 사항이 있습니다.')");
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
				script.println("alert('입력이 성공적으로 완료되었습니다.')"); //성공시 알람
				script.println("</script>");
				out.write("파일명1:" + fileName1 + "<br>");
				out.write("파일명2:" + fileName2 + "<br>");
				
			}
		}
	
	%>
	
	
	
	


</body>
</html>