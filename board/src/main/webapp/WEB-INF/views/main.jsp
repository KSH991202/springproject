<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="reset.css">
        <link rel="stylesheet" href="style.css">

    </head>
    <body>

        <section id="section1">
            <div id="mainpage-logo">
                <img src="../../image/메인아이콘.png" class="main-icon" width="120px" height="100px">
                <h1 id="main-title">취미 상점</h1>
                <img src="../../image/메인아이콘.png" class="main-icon" width="120px" height="100px">
            </div>
                <hr id="main-hr">
            <div class="state">
                <span id="spnWelcome">로그인 해주세요</span>
                <button type="button" id="btnLogin" class="button"></button>
                <button type="button" id="btnJoin" class="button">회원가입</button>
            </div><br>
        </section>

        <section id="section2">
        
            <div class="layout main-container1">
                <div id="menuImg">
                <img src="../../image/카테고리.png" alt="카테고리이미지" width="120px" height="120px" >
                </div>
                <div class="dropdown">
                    <a class="btn" href="./index" >
                        <h1 class="menuList">만남의 광장</h1>
                    </a>
                    <hr>
                </div>

                <div class="dropdown">
                    <a class="btn dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <h1 class="menuList">만남 장소</h1>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="./rc_eat">맛집&술집</a></li>
                        <li><a class="dropdown-item" href="./rc_cafe">카페</a></li>
                        <li><a class="dropdown-item" href="./rc_activity">액티비티</a></li>
                        <li><a class="dropdown-item" href="./rc_study">공부</a></li>
                        <li><a class="dropdown-item" href="./rc_travel">여행</a></li>
                        <li><a class="dropdown-item" href="./rc_shopping">쇼핑</a></li>
                        <li><a class="dropdown-item" href="./rc_preview">관람</a></li>
                        <li><a class="dropdown-item" href="./rc_etc">기타</a></li>
                    </ul>
                    <hr>
                </div>

                <div class="dropdown">
                    <a class="btn" href="./meeting_review" >
                        <h1 class="menuList">만남 후기</h1>
                    </a>
                    <hr>
                </div>

            </div>
            
            <!-- main-container2 : 메인페이지영역 게시판, 장소소개, 후기페이지 누르면 그에 맞는 페이지 뜸-->

            <div class="layout main-container2" >
                <!-- 검색기능 -->
                <div class="input-group mb-3" >
                    <input type="text" class="form-control" aria-label="Text input with checkbox">
                    <div class="input-group-text">
                      <input type="submit" value="검색" aria-label="Checkbox for following text input">
                    </div>
                </div>
            

            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="../../image/한식.jpg" class="d-block w-100 slideImg" alt="..." width="" height="300px">
                  </div>
                  <div class="carousel-item">
                    <img src="../../image/일식.jpg" class="d-block w-100 slideImg" alt="..." width="" height="300px">
                  </div>
                  <div class="carousel-item">
                    <img src="../../image/삼겹살.jpg" class="d-block w-100 slideImg" alt="..." width="" height="300px">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>

            <div id="">
                <table border="1" id="mainTbl">
                    <tr class="tr1">
                        <td class="kategorieElements">
                            <a href="/rc_eat">
                                <img src="../../image/맛집.png" alt="맛집" class="kategorieImg">
                            </a>
                        </td>
                        <td class="kategorieElements">
                            <a href="./rc_cafe">
                                <img src="../../image/카페.png" alt="카페" class="kategorieImg">
                            </a>
                        </td>
                        <td class="kategorieElements">
                            <a href="./rc_activity">
                                <img src="../../image/액티비티.png" alt="액티비티" class="kategorieImg">
                            </a>
                        </td>
                        <td class="kategorieElements">
                            <a href="./rc_study">
                                <img src="../../image/공부.png" alt="공부" class="kategorieImg">
                            </a>
                        </td>
                    </tr>

                    <tr class="tr2">
                        <td class="kategorieElements">
                            <a href="./rc_travel">
                                <img src="../../image/여행.png" alt="여행" class="kategorieImg">
                            </a>
                        </td>
                        <td class="kategorieElements">
                            <a href="./rc_shopping">
                                <img src="../../image/쇼핑.png" alt="쇼핑" class="kategorieImg">
                            </a>
                        </td>
                        <td class="kategorieElements">
                            <a href="./rc_preview">
                                <img src="../../image/관람.png" alt="관람" class="kategorieImg">
                            </a>
                        </td>
                        <td class="kategorieElements">
                            <a href="./rc_etc">
                                <img src="../../image/기타.png" alt="기타" class="kategorieImg">
                            </a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- main-container3 : 개인정보표시 마이페이지 공간 -->
        <!-- <div class="layout main-container3">
            <img src="../../image/빵빵이.jpg" alt="프로필사진" id="userProfile">
            <p id="userName">${vo.name}</p>
            <p></p>

        </div> -->
        </section>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            (()=>{
                
                let sessionState = false;

                const hbst_logo = document.querySelector('#mainpage-logo');
                const btnJoin = document.querySelector('#btnJoin');
                const spnWelcome = document.querySelector('#spnWelcome');
                const btnLogin = document.querySelector('#btnLogin');

                const setSessionState = function () {
                    if ('${vo.userId}' === '') {
                        sessionState = false;
                    }
                    else {
                        sessionState = true;
                    }

                }

                const setWelcomeMsg = function () {
                    if (sessionState === true) {
                        spnWelcome.textContent = '${vo.name}님 반갑습니다.';
                    }
                    else {
                        spnWelcome.textContent = '로그인 해주세요.';
                    }
                }

                const setLoginButton = function () {
                    if (sessionState === true) {
                        btnLogin.textContent = '로그아웃';
                    }
                    else {
                        btnLogin.textContent = '로그인';
                    }

                }

                const setJoinButton = function () {
                    if (sessionState === true) {
                        btnJoin.style.display = 'none';
                    }
                    else {
                        btnJoin.textContent = '회원가입';
                    }

                }

                //////////// 호출부
                btnLogin.addEventListener('click', () => {
                    // 로그인상태
                    if (sessionState === true) {
                        location.href = '/logout';
                    }
                    else {
                        location.href = '/login';
                    }

                });

                btnJoin.addEventListener('click',()=>{
                    location.href = '/join';
                });

                hbst_logo.addEventListener('click',()=>{
                    console.log("메인로고 누르기");
                    location.href = '/hobbyStore';
                });

                setSessionState();
                setWelcomeMsg();        
                setLoginButton();
                setJoinButton();
                
            })();
        </script>
    </body>
</html>