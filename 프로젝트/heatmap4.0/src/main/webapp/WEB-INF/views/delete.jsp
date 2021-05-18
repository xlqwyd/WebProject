<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
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
    			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
    				<li><a href="/heatmap/surveyform">측정자료 올리기</a></li>
      				<li><a href="/heatmap/surveyform">나의 측정 기록</a></li>
      				<li><a href="/heatmap/surveyform">나의 정보</a></li>
      				<li><a href="/heatmap/logout">로그아웃</a></li>
      				
      				
   					 </ul>
  			</div>
  			<div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary active dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 나의 정보
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
    				<li ><a href="/heatmap/ChangePassword">비밀번호 변경</a></li>
      				<li class=active><a href="/heatmap/delete">탈퇴하기</a></li>
      				
      				
      				
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
		<div class="col-lg-15"></div>
		<div class="col-lg-15">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="DeleteControl">
					<h3 style="text-align: center;">탈퇴하기</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20" required>
					</div>
					
					<input type="submit" class="btn btn-primary form-control" value="탈퇴하기">
				</form>
				<br>
				<a href="/heatmap/" class="btn btn-primary form-control" role="button">뒤로</a>
			</div>
		</div>
		<div class="col-lg-15"></div>
	</div>
	
	
	
	


		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>
</html>