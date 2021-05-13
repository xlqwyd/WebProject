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
<style type="text/css">
          .img_wrap {
              width: 400px;
              margin-top: 50px;
          }
          .img_wrap img {
              max-width: 100%;
          }
   
      </style>
</head>
<body>
	<%
		// 메인페이지 jsp -> 세션을 통해 id를 받아서 누가로그인 한지 확인
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
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
			
			<a class="navbar-brand" href="mainpage.jsp">천안시 열지도 페이지</a>
		</div>
		<br>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<br>
			
			<div class="btn-group" role="group">
			<a href="mainpage.jsp" class="btn btn-primary active" aria-current="page">소개</a>
			 <a href="bbs.jsp" class="btn btn-primary ">열지도 보기</a>
			  
			  <%
			  	if(id == null){ //미로그인시
			  %>
			  <div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
      				<li><a href="join.jsp">회원가입</a></li>
      				<li><a href="RealLogin.jsp">로그인</a></li>
   					 </ul>
  			</div>
			  <%
			  	} else{ //로그인 및 회원가입으로 인하여 로그인 된 경우
			  	%>
			  	 <div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
      				<li><a href="logoutAction.jsp">로그아웃</a></li>
      				<li><a href="login.jsp">등록하기</a></li>
      				
   					 </ul>
  			</div>
			  <%	
			  	}
			  %>
			  
			 
			  
			  
			</div>
			
			
			
		
		</div>
		
	</nav>
	
	<!-- 윗부분은 상단 바 담당 -->
	
	
	
	
<div class="container">
<div class="jumbotron jumbotron-fluid">
<form method="post" action=surveyformUpload enctype="multipart/form-data">
	측정날짜: ${data.date}<br>
	<input  type="date" name="date" value="${data.date }" hidden>
	1. 배정번호: [${data.assignmentNum }]<br>
	<input type="number" id="assignmentNum" name="assignmentNum" value ="${data.assignmentNum }" hidden>
	
	2. 이름: [${data.namefull }]<br>
	<input type="text" id="namefull" name="namefull" value="${data.namefull }" hidden>
	
	3. 측정지: [${data.area1}]<br>
	<input type="text" id="area1" name="area1" value="${data.area1}" hidden>
	
	4. 측정 기온:[${data.temperatures }]<br>
	<input type="number" id="temperatures" name="temperatures" value="${data.temperatures }" hidden>
	5. 기상상태: [${data.weather }]<br>
	<input class="form-check-input" type="text" id="Sunny" name="weather" value="${data.weather }" hidden>
	
	측정시간: ${data.time }<br>
	<input  type="time" name="time" step="2" value="${data.time }" hidden>
	
	
	6. 사진이름: ${data.filename1 }<br> 
	<input type="text" name=filename1 value="${data.filename1 }" hidden>
	<div class="img_wrap">
	<img src="data:image/jpg;base64,${data.encfile1 }" alt="${data.filename1 }" /><br>
	</div>
	<input type="text" name="encfile1" value="${data.encfile1 }" hidden>
	
	<input type="submit" value="제출">
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
</body>
</html>