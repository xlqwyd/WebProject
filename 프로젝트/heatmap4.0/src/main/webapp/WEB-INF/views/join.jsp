<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>천안시 열지도 프로젝트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
			
			<a class="navbar-brand" href="/heatmap/">천안시 열지도 페이지</a>
		</div>
		<br>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<br>
			
			<div class="btn-group" role="group">
			<a href="/heatmap/" class="btn btn-primary " >소개</a>
			 <a href="/heatmap/mapCheck" class="btn btn-primary " >열지도 보기</a>
			  
			  <div class="btn-group" role="group">
    			<button type="button" class="btn btn-primary active dropdown-toggle" data-toggle="dropdown" aria-expanded="false" aria-current="page">
     					 열지도 만들기
      					<span class="caret"></span>
    			</button>
    				<ul class="dropdown-menu" role="menu">
      				<li class=active><a href="/heatmap/join">회원가입</a></li>
      				<li ><a href="/heatmap/RealLogin">로그인</a></li>
   					 </ul>
  			</div>
			  
			  
			
			 <!-- 회원가입 창 부분 jsp --> 
  				
				
			</div>
			
			
			
		
		</div>
		
	</nav>
	<!-- 윗부분은 상단 바 담당 -->
	
	<div class="container">
		<div class="col-lg-20"></div>
		<div class="col-lg-20">
			<div class="jumbotron" style="padding-top: 20px;">
				
					<h3 style="text-align: left;"><b>개인정보 취급 방침</b></h3>
					<br><br>
					
					<p>
					
					<font size="4.5em"><b>* 수집하는 개인정보 항목</b> 	</font>
					<br>
					<font size="2em">   &emsp;- 수집항목 : 아이디, 비밀번호, 이메일</font>
					<br>
					<font size="4.5em"><b>* 개인정보의 이용</b>	</font>
					<br>
					<font size="2em">  &emsp;- 사이트 이용</font>
					<br>
					<font size="4.5em"><b>* 개인정보의 보유기간</b> 	</font>
					<br>
					<font size="2em">   &emsp;- 회원 탈퇴시까지 보유 후 탈퇴 즉시 폐기</font>
					<br>
					<font size="4.5em"><b>* 개인정보의 제공</b>	</font>
					<br>
					<font size="2em">   &emsp;이용자의 개인정보나 활동내역은 어떤 경우에도 외부에 제공하지 않습니다</font>
					<br>
				
					</p>
					
					<form method="post" action="JoinControl">
					<div class="form-check">
  					<input class="form-check-input" style='zoom:1.5;'  type="checkbox" value="agree" id="flexCheckDefault" required>
  					<label class="form-check-label" for="flexCheckDefault">
    				<font size="4.5em" ><b>약관을 모두 읽었으며 동의합니다.</b>	</font>
  					</label>
					</div>
					<br>
					
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" id="id" name="id" maxlength="20" required>
					
					<td width="50%"> <input class="btn btn-primary"
                                    type="button" value="ID중복확인"
                                    onClick="idCheck(this.form.id.value)"></td>
                                    <div class="check_font" id="id_check"></div>
                                    </div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인" name="password2" maxlength="20" required>
					</div>
					<!-- 비밀번호 확인 기능은 아직 미구현!!!!!!!!!!!!!!!!!!!!!!!!!! -->
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일(비밀번호 찾기)" name="email" maxlength="35" required>
					</div>
					
					
					
					
					
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
				
			</div>
		</div>
		<div class="col-lg-20"></div>
	</div>
	

	
	
	


		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>


<script>
function check(){
	id = $("#user_id").val();
	
	$.ajax({
	    url: 'ID_Check',
	    type: 'POST',
	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
	    contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
	    data: id ,

	    success: function(data){
	         if(data == 0){
	         console.log("아이디 없음");
	         alert("사용하실 수 있는 아이디입니다.");
	         }else{
	         	console.log("아이디 있음");
	         	alert("중복된 아이디가 존재합니다.");
	         }
	    },
	    error: function (){        
	                      
	    }
	  });


}
</script>


</html>