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
			 <a href="/heatmap/mapCheck" class="btn btn-primary active">열지도 보기</a>
			  
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
    			<button type="button" class="btn btn-primary  dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
    				<li ><a href="/heatmap/surveyform">측정자료 올리기</a></li>
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
<form method="post" action="MapC">
<div class="jumbotron jumbotron-fluid">
<div style="text-align:center">

        <select name="year">
                <option value="year1">2021년</option>
                <option value="year2">2022년</option>
                <option value="year3">2023년</option>
                <option value="year4">2024년</option>
                <option value="year5">2025년</option>
                <option value="year6">2026년</option>
                <option value="year7">2027년</option>
                <option value="year8">2028년</option>
                <option value="year9">2029년</option>
                <option value="year10">2030년</option>
        </select>
        <select name="month">
                <option value="month">1월</option>
                <option value="month">2월</option>
                <option value="month">3월</option>
                <option value="month">4월</option>
                <option value="month">5월</option>
                <option value="month">6월</option>
                <option value="month">7월</option>
                <option value="month">8월</option>
                <option value="month">9월</option>
                <option value="month">10월</option>
                <option value="month">11월</option>
                <option value="month">12월</option>
        </select>
        <select name="hour">
                <option value="hour">오전 9시</option>
                <option value="hour">오후 3시</option>
                <option value="hour">오후 9시</option>
        </select>

      <button class="btn btn-primary" type="submit">검색</button>
      </div>
       
                



   <div id="map" style="width:100%;height:350px;"></div>
   
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e27ccf00f1a03975beba4aef431af12b"></script>
   <script>
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = { 
           center: new kakao.maps.LatLng(36.815086193292956, 127.11360940007485), // 지도의 중심좌표
           level: 8 // 지도의 확대 레벨
       };
   
   // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
   var map = new kakao.maps.Map(mapContainer, mapOption);
   </script>
   <br>
   <br>
   <div style="text-align:center">
   <p class="lead">측정 평균 온도 []ºC</p>
   <p class="lead">측정 최고 온도 []ºC</p>
   <p class="lead">측정 최저 온도 []ºC</p>
   </div>
   
</div>
</form>


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