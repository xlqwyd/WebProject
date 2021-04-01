<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Page Title - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
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
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-10">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <form method="post" action=enrollAction.jsp>
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">온도 체크 설문지</h3></div>
                                    <div class="card-body">
                                        
                                            
                                        
                                            

                                            

                                            <div class="form-group">
                                                <label class="Extra Extra large mb-1">0. 참가자 유형</label><!--
                                                <input class="form-control py-4" id="inputEmailAddress" type="email" placeholder="Enter email address" />-->
                                                
                                                    
                                                        
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="Existing" value='기존'/>
                                                            <label class="form-check-label" for="Existing">
                                                              기존 참가자
                                                            </label>
                                                          </div>
                                                          <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="Newperson" value='신규'/>
                                                            <label class="form-check-label" for="Newperson">
                                                              신규 참가자
                                                            </label>
                                                          </div>
                                                    
                                                   
                                                
                                                
                                            </div>

                                            <label for="AssignmentNum" class="form-label">1. 배정번호</label>
                                                <input type="number" id="AssignmentNum" class="form-control" name="assignmentNum" >
                                                <div id="passwordHelpBlock" class="form-text">
                                            
                                                </div>
                                            

                                            <div class="mb-3">
                                                <label for="area1" class="form-label">2. 측정지</label>
                                                <input type="text" id="area1" class="form-control" name="area1" placeholder="예) 동남구 신부동 신세계 백화점 앞 ">
                                              </div>

                                              <div class="mb-3">
                                                <label for="namefull" class="form-label">3. 측정자 성명</label>
                                                <input type="text" id="namefull" class="form-control" name="namefull" placeholder="예) 홍길동 ">
                                              </div>

                                              <div class="mb-3">
                                                <label for="phone" class="form-label">4. 측정자 연락처 (숫자만 입력해주세요.)</label>
                                                <input type="text" id="phone" class="form-control" name="phone" placeholder="예) 01012xx34xx ">
                                              </div>

                                              <div class="mb-3">
                                                <label for="Temperatures" class="form-label">5. 기온</label>
                                                <input type="number" step ="0.1" id="Temperatures" class="form-control" name="temperatures"  placeholder="예) 30 " required>
                                              </div>

                                              <div class="form-group">
                                              
                                                <label class="Extra Extra large mb-1">6. 측정 당시 기상상태</label>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" id="Sunny" name="weather" value="맑음">
                                                <label class="form-check-label" for="Sunny">
                                                  맑음
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" id="cloudandblur" name="weather" value="구름많고 흐림">
                                                <label class="form-check-label" for="cloudandblur">
                                                  구름 많고 흐림
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" id="weakrain" name="weather" value="약한비">
                                                <label class="form-check-label" for="weakrain">
                                                  약한 비
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" id="strong rain" name="weather" value="강한비">
                                                <label class="form-check-label" for="strong rain">
                                                  강한비
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" id="rainsandstops" name="weather" value="비가 오다 그친 상태">
                                                <label class="form-check-label" for="rainsandstops">
                                                  비가 오다 그친 상태
                                                </label>
                                              </div>
                                            
                                            </div>

                                            <div class="form-group">
                                            <label class="Extra Extra large mb-1">7-1. 측정 장소 지면 상태1</label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="surface" id="concrete" value="콘크리트">
                                                <label class="form-check-label" for="concrete">
                                                 콘크리트 바닥
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" name="surface" id="soil" value="흙/모래">
                                                <label class="form-check-label" for="soil">
                                                  흙/모래
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" name="surface" id="grass" value="잔디">
                                                <label class="form-check-label" for="grass">
                                                  잔디
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" name="surface" id="asphalt" value="아스팔트">
                                                <label class="form-check-label" for="asphalt">
                                                  아스팔트
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" name="surface" id="uletin" value="우레틴 및 고무">
                                                <label class="form-check-label" for="uletin">
                                                  우레틴 및 고무바닥
                                                </label>
                                              </div>
                                              </div>

                                            
                                              <div class="form-group">
                                              <label class="Extra Extra large mb-1">7-2. 측정 장소 지면 상태2</label>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" name="surface2" id="rainy" value="비나 물에 젖음">
                                                <label class="form-check-label" for="rainy">
                                                  비 혹은 물에 젖은 상태
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" name="surface2" id="nothing" value="해당없음">
                                                <label class="form-check-label" for="nothing">
                                                  해당사항 없음
                                                </label>
                                              </div>
                                            </div>

                                            <div class="form-group">
                                              <label class="Extra Extra large mb-1">8. 측정당시 주변 교통사항</label>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" name="traffic" id="few" value="한산">
                                                <label class="form-check-label" for="few">
                                                  한산
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" name="traffic" id="normal" value="보통" >
                                                <label class="form-check-label" for="normal">
                                                  보통
                                                </label>
                                              </div><div class="form-check">
                                                <input class="form-check-input" type="radio" name="traffic" id="busy" value="혼잡">
                                                <label class="form-check-label" for="busy">
                                                  혼잡
                                                </label>
                                              </div>
                                              <div class="form-check">
                                                <input class="form-check-input" type="radio" name="traffic" id="noroad" value="도로없음">
                                                <label class="form-check-label" for="noroad">
                                                  주변에 도로 없음
                                                </label>
                                              </div>
                                            </div>
                                            <br>
                                            
                                            <div class="mb-3">
                                              <label for="input_img" class="form-label">9-1. 측정 사진 첨부 - 온도계 사진</label>
                                              <br>
                                              <img src="https://form.office.naver.com/form/getStreamImg.cmd?docId=NjcyYTBhYWYtZDNmMC00ZjM1LTkxZTMtYzE4NDZjODU4MWY0&filename=0a1ab5e2-c625-42b9-b431-346e5e8511b9.jpeg"
                                               class="img-fluid" alt="페이지에 이미지 삽입 불가">
                                               <br><br>
                                              <input class="form-control" type="file" id="input_img">

                                            </div>
                                              <div class="img_wrap">
                                                <img id="img">
                                              </div>
                                            
                                            <br>

                                            <div class="mb-3">
                                              <label for="input_img2" class="form-label">9-2. 측정사진 첨부 - 얼굴 사진</label>
                                              <br>
                                              <img src="https://form.office.naver.com/form/getStreamImg.cmd?docId=NjcyYTBhYWYtZDNmMC00ZjM1LTkxZTMtYzE4NDZjODU4MWY0&filename=e96e853c-76c1-453a-b330-f2d52750224f"
                                               class="img-fluid" alt="페이지에 이미지 삽입 불가">
                                               <br><br>
                                              <input class="form-control" type="file" id="input_img2">
                                            </div>

                                              <div>
                                                <div class="img_wrap">
                                                  <img id="img2">
                                              </div>
                                              </div>

                                              

                                              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                <input type="submit" class="btn btn-primary form-control"  value="제출">
                                              </div>
                                            



                                            



                                            
                                            </div>
                                        </form>




                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="register.html">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="js/image.js"></script>
        <script src="js/image2.js"></script>
    </body>
</html>