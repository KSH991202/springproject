<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Login</title>
        <style>
            h1{
                margin-top: 15%;
                margin-bottom: 30px;
                text-align: center;
                font-weight: bold;
                font-size: 50px;
                color: gray;
            }
            .login-container{
                border: 1px solid gray;
                width: 500px;
                margin: 0 auto;
                padding: 10px;
                border-radius: 10px;
                height: 500px;
            }
            .my-button{
                width: 100%;
                height: 50px;
            }
        
            .sub-container{
                width: 500px;
                margin: 0 auto;
            }
            .logo-flex{
                width: 600px;
                display: flex;
                justify-content: space-around;
                margin: 0 auto;
            }
            .img1{
                margin-top: 10%;
            }
            .form-size{
                height: 100px;
            }

            .btn-link{
                text-decoration: none;
                font-size: 1rem;
                color: gray;
            }
        </style>
    </head>

    <body>
    
        <div class="logo-flex">
            <img class="img1" src="https://cdn-icons-png.flaticon.com/128/4038/4038921.png" width="120" height="100">
            <h1>취미상점</h1>
            <img class="img1" src="https://cdn-icons-png.flaticon.com/128/4038/4038921.png" width="120" height="100">
        </div>
        <form action="/login" method="post" id="frmLogin">
            <div class="login-container">
                <div class="form-floating mb-2 form-size">
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="#">
                    <label for="userId">ID</label>
                </div>
                <div class="form-floating mb-2 form-size">
                    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="#">
                    <label for="userPw">Password</label>
                </div>
                <button type="button" id="btnLogin" class="btn btn-outline-secondary my-button">Login</button>
            </div>
        </form>
        <div class="d-flex justify-content-between sub-container">
            <button type="button" id="btnFindPw" class="btn btn-link">비밀번호 찾기</button>
            <button type="button" id="btnFindId" class="btn btn-link">아이디 찾기</button> 
            <button type="button" id="btnJoin" class="btn btn-link">회원가입</button>
        </div>


        <script>
            (() => {

                const $logo = document.querySelector('.logo-flex');
                const $btnLogin = document.querySelector('#btnLogin');
                const $btnJoin = document.querySelector('#btnJoin');
                const $btnFindId = document.querySelector('#btnFindId');
                const $btnFindPw = document.querySelector('#btnFindPw');

                // 이벤트 핸들러


                $logo.addEventListener('click', () => {
                    console.log("메인버튼 클릭");
                    location.href = '/main';
                });

                $btnLogin.addEventListener('click', () => {
                    const $frmLogin = document.querySelector('#frmLogin');
                    $frmLogin.submit();
                });

                $btnJoin.addEventListener('click', () => {
                    location.href = '/join';
                });

                $btnFindId.addEventListener('click', () => {
                    location.href = '/idinquiry';
                });

                $btnFindPw.addEventListener('click', () => {
                    location.href = '/pwinquiry';

                });

            })();
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>

    </html>