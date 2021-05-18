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
    			<button type="button" class="btn btn-primary active dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
    				<li class=active><a href="/heatmap/surveyform">측정자료 올리기</a></li>
      				<li><a href="/heatmap/surveyform">나의 측정 기록</a></li>
      				<li><a href="/heatmap/surveyform">나의 정보</a></li>
      				<li><a href="/heatmap/logout">로그아웃</a></li>
      				
      				
   					 </ul>
  			</div>
  			<div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary  dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 나의 정보
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
    				<li ><a href="/heatmap/ChangePassword">비밀번호 변경</a></li>
      				<li ><a href="/heatmap/delete">탈퇴하기</a></li>
      				
      				
      				
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
<div class="jumbotron jumbotron-fluid">
<form method="post" action=surveyformCheck enctype="multipart/form-data">
	<div class="card-header"><h3 class="text-center font-weight-light my-4">온도 체크 설문지</h3></div>
	<div class="card-body">
                                        
    <div class="form-group">
	</div>
	<label for="assignmentNum" class="form-label">1. 배정번호</label>
	<input type="number" id="assignmentNum" class="form-control" name="assignmentNum" required>
	<div class="mb-3">
	<label for="namefull" class="form-label">2. 측정자 성명</label>
	<input type="text" id="namefull" class="form-control" name="namefull" placeholder="예) 홍길동 " required>
	</div>

	<div class="mb-3">
	<label for="area1" class="form-label">3. 측정지</label>
	<input type="text" id="area1" class="form-control" name="area1" placeholder="예) 동남구 신부동 신세계 백화점 앞 " required>
	</div>

	<div class="mb-3">
	<label for="Temperatures" class="form-label">4. 측정 기온</label>
	<input type="number" step ="0.1" id="temperatures" class="form-control" name="temperatures"  placeholder="예) 30 " required>
	</div>

	<div class="form-group">
	<label class="Extra Extra large mb-1">5. 측정 당시 기상상태 </label>
	<select name="weather" id="weather">
		<option value='sunny'>맑음</option>
		<option value='blur'>흐림</option>
		<option value='rain'>비</option>
		<option value='snow'>눈</option>
	</select>
	</div>
	<div class="mb-3">
	<label for="input_img" class="form-label">6. 측정 사진 첨부</label>
    <br>
    <img src="resources/img/9-2.jpeg" class="img-fluid" alt="페이지에 이미지 삽입 불가">
    <br><br>
	<input class="form-control" type="file" name="file1" id="input_img">
    </div>
    <div class="img_wrap">
    <img id="img">
    </div>
    <br>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<input type="submit" class="btn btn-primary form-control"  value="다음">
	</div>
	</div>
</form>


</div>

 <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid ">
                   
                        <div class="d-flex align-items-center justify-content-between small">
                            <!--<div class="text-muted">천안녹색소비자연대</div> -->
                            
                            
                            <div>
                            <img src="resources/img/소비자연대.jpg" style="float: left; margin-right: 20px; margin-bottom: 1px; width:250px; height:70px;" >
                                
                                
                                <p style="text-align:right;">
                               
                                충남 천안시 서북구 개목5길 30 2층 (31140)<br>
                                TEL : 041)578-9897~8<br>
                                E-mail : gragenda9897@daum.net<br>
                                후원 농협 467-01-236533 천안녹색소비자연대</p>
                             
                           
                            </div>
                            <div style="font-size: 30px; margin-left: 100px;">
            <a href="https://www.facebook.com/chgcn"><i class="fab fa-facebook"></i></a>
            <a href=https://www.instagram.com/green_9897/><i class="fab fa-instagram"></i></a>
            </div>

                        </div>
                    </div>
                </footer>
            </div>


</div>

 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!--<script src="https://code.jquery.com/jquery-3.1.1,min.js"></script>
<srcipt scr="js/bootstrap.js"></srcipt>-->
<script src="js/image.js"></script>
</body>
</html>