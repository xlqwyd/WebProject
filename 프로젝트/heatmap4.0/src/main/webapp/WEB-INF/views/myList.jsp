<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="kr.or.connect.heatmap.dto.HeatMapFormData" %>
    <%@ page import="kr.or.connect.heatmap.dao.HeatMapFormDao" %>
    <%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@ page import ="org.springframework.stereotype.Controller"%>
<%@ page import= "org.springframework.web.bind.annotation.GetMapping" %>
<%@ page import ="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ page  import= "org.springframework.web.bind.annotation.PostMapping"%>
<%@ page  import=" org.springframework.web.bind.annotation.RequestMapping"%>
<%@ page import= "org.springframework.web.servlet.ModelAndView"%>

<%@ page import= "kr.or.connect.heatmap.config.ApplicationConfig"%>
<%@ page import= "kr.or.connect.heatmap.dao.MemberDao"%>
<%@ page import= "kr.or.connect.heatmap.dao.HeatMapFormDao"%>
<%@ page import= " kr.or.connect.heatmap.dto.Member"%>
<%@ page import= " kr.or.connect.heatmap.dto.HeatMapFormData"%>
<%@ page import= " java.util.List"%>
    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>천안시 열지도 프로젝트</title>
</head>
<body>
	<%
		// 메인페이지 jsp -> 세션을 통해 id를 받아서 누가로그인 한지 확인
		String id = null;
		String mtype = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
			mtype = (String)session.getAttribute("mtype");
		}
	%>



	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			<a class="navbar-brand" href="/heatmap/">천안시 열지도 페이지</a>
		</div>
		<br>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<br>
			
			<div class="btn-group" role="group">
			<a href="/heatmap/" class="btn btn-primary " aria-current="page">소개</a>
			 <a href="/heatmap/mapCheck" class="btn btn-primary">열지도 보기</a>
			  
			  <%
			  	if(id == null){ //미로그인시
			  %>
			  <div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
      				<li><a href="/heatmap/join">회원가입</a></li>
      				<li><a href="/heatmap/RealLogin">로그인</a></li>
   					 </ul>
  			</div>
			  <%
			  	} else{ //로그인 및 회원가입으로 인하여 로그인 된 경우
			  		if(mtype.equals("admin")){ //관리자가 로그인한 경우
			  	%>
			  	
			  	 <div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
    				
      				<li><a href="/heatmap/result">전체 측정 기록</a></li>      <!-- 관리자가 전체 측정보는곳 -->
      				
      				<li><a href="/heatmap/logout">로그아웃</a></li>
      				
      				
   					 </ul>
  			</div>
			  <%	
			  	} else{//회원이 로그인한 경우
			  %>
			  <div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary active dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
    				<li><a href="/heatmap/surveyform">측정자료 올리기</a></li>
      				<li class=active><a href="/heatmap/myList">나의 측정 기록</a></li>
      				
      				<li><a href="/heatmap/logout">로그아웃</a></li>
      				
      				
   					 </ul>
  			</div>
  			<div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 나의 정보
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
    				<li><a href="/heatmap/ChangePassword">비밀번호 변경</a></li>
      				<li><a href="/heatmap/delete">탈퇴하기</a></li>
      				
      				
      				
   					 </ul>
  			</div>
			  <%	
			  	} 
			  	}
			  %>
			 
			  
			  
			</div>
			
			
			
		
		</div>
		
	</nav>
	
	<!-- 윗부분은 상단 바 담당 -->
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">측정날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">측정시간</th>
						<th style="background-color: #eeeeee; text-align: center;">측정지</th>
						<th style="background-color: #eeeeee; text-align: center;">배정번호</th>
						<th style="background-color: #eeeeee; text-align: center;">온도</th>
						<th style="background-color: #eeeeee; text-align: center;">기상상태</th>
						<th style="background-color: #eeeeee; text-align: center;">사진</th>
						
					</tr>
				</thead>
				<tbody>
				<%
				ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
				HeatMapFormDao formdao3 = ac.getBean(HeatMapFormDao.class);
				List<HeatMapFormData> list = formdao3.selectAll();
				int i=0;
				for(HeatMapFormData data : list) {
					i++;
					
					if(data.getId().equals(id)){
				
				%>
				<tr> 
					<td><%= i %></td>
					<td><%= data.getDate() %></td>
					<td><%= data.getTime() %></td>
					<td><%= data.getArea1() %></td>
					<td><%= data.getAssignmentNum() %></td>
					<td><%= data.getTemperatures() %></td>
					<td><%= data.getWeather() %></td>
					<td><img src="resources/img/Picture/<%= data.getDate() %>/<%= data.getAssignmentNum() %>/<%= data.getFilename1() %>"  width="20%"></td>
				</tr>
				
				<%
					
					}
				}
				%>
				
				</tbody>
				
			</table>
		</div>
	
	</div>
	
	
	


 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!--<script src="https://code.jquery.com/jquery-3.1.1,min.js"></script>
<srcipt scr="js/bootstrap.js"></srcipt>-->
</body>
</html>