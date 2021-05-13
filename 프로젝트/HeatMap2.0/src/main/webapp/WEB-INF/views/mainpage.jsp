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
<h3 class="display-4">천안녹색소비자연대</h3>
<p class="lead">비정부, 비정당, 비영리 민간단체 '녹색소비자연대'의 천안 지부로 1997년에 설립되었습니다. 100% 시민의 기부금으로 운영되는 시민단체로서 천안시민의 곁에서 깨끗하고 건강한 지역사회를 만들기 위한 다양한 활동을 하고 잇습니다.</p>
<br><br>
<h3 class="display-4">천안시열지도제작프로젝트</h3>
<p class="lead">2017년에 처음 시작된 조사연구 활동입니다.<br> 천안시 곳곳의 실외기온을 시민이 직접 측정해 만든 '열지도'는 천안시 기후변화의 기록물로 활용됩니다.</p>



</div>

 <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid ">
                   
                        <div class="d-flex align-items-center justify-content-between small">
                            <!--<div class="text-muted">천안녹색소비자연대</div> -->
                            
                            
                            <div>
                            <img src="<%=request.getContextPath() %>/resources/assets/img/소비자연대.jpg" style="float: left; margin-right: 20px; margin-bottom: 1px; width:250px; height:70px;" >
                                
                                
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