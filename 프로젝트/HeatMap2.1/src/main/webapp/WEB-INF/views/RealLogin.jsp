<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>천안시 열지도 프로젝트</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			<a class="navbar-brand" href="mainpage.jsp">천안시 열지도 페이지</a>
		</div>
		<br>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<br>
			
			<div class="btn-group" role="group">
			<a href="mainpage.jsp" class="btn btn-primary " aria-current="page">소개</a>
			 <a href="bbs.jsp" class="btn btn-primary">열지도 보기</a>
			  
			  <div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary active dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
      				<li><a href="join.jsp">회원가입</a></li>
      				<li class=active><a href="RealLogin.jsp">로그인</a></li>
   					 </ul>
  			</div>
			  
			  
			<!-- 로그인 창 jsp -->
			  
  				
				
			</div>
			
			
			
		
		</div>
		
	</nav>
	<!-- 윗부분은 상단 바 담당 -->
	<div class="container">
		<div class="col-lg-15"></div>
		<div class="col-lg-15">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="RealLogin">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20" required>
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
				<br>
				<a href="Password.jsp" class="btn btn-primary form-control" role="button">비밀번호 찾기</a>
			</div>
		</div>
		<div class="col-lg-15"></div>
	</div>
	
	
	
	


		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>
</html>