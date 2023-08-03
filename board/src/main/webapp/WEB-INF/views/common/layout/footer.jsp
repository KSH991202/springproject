<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <a href="../../main"><img src="../../image/메인아이콘.png" alt="메인아이콘" class="main-icon" width="120px"
                        height="100px"></a>
                <h1 id="main-title">취미 상점</h1>
                <img src="../../image/메인아이콘.png" alt="메인아이콘" class="main-icon" width="120px" height="100px">
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
                    <img src="../../image/카테고리.png" alt="카테고리이미지" width="120px" height="120px">
                </div>
                <div class="dropdown">
                    <a class="btn" href="./index">
                        <h1 class="menuList">만남의 광장</h1>
                    </a>
                    <hr>
                </div>

                <div class="dropdown">
                    <a class="btn dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
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
                    <a class="btn" href="./meeting_review">
                        <h1 class="menuList">만남 후기</h1>
                    </a>
                    <hr>
                </div>

            </div>

            



            <!-- main-container3 : 개인정보표시 마이페이지 공간 -->
            <!-- <div class="layout main-container3">
                <img id="userProfile">
                <p id="userName">${vo.name}박지은</p>
                <p></p>

            </div> -->
        </section>



        <script>
            (() => {

                let sessionState = false;

                const spnWelcome = document.querySelector('#spnWelcome');
                const btnLogin = document.querySelector('#btnLogin');


                // 현재 세션이 있는지 없는지 설정해준다.
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



                // 이벤트 핸들러

                btnLogin.addEventListener('click', () => {
                    if (sessionState === true) {
                        location.href = '/logout';
                    }
                    else {
                        location.href = '/login';
                    }

                });



                // 호출부.
                setSessionState();
                setWelcomeMsg();
                setLoginButton();
                setJoinButton();
            })();
        </script>
    </body>

    </html>