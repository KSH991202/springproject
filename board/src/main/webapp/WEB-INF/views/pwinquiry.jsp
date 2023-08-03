<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
</head>

<h1>비밀번호 찾기</h1>
    <hr>
    아이디 <input type="text" name="userId" id="txtUserId">
    <button type="button" id="btnSubmit">확인</button>
    <hr>
    <div id="getId"></div>
    <hr>
    <button type="button" id="btnLogin">로그인</button>


<body>
    <script src="/JS/jquery-3.7.0.min.js"></script>

    <script>
        (() => {

        const btnSubmit = document.querySelector('#btnSubmit');
        const txtUserId = document.querySelector('#txtUserId');
        const $btnLogin = document.querySelector('#btnLogin');
        const $getId = document.querySelector('#getId');


        $btnLogin.addEventListener('click', ()=>{
            location.href = '/login';
        });

        btnSubmit.addEventListener('click', ()=>{


            if(txtUserId.value.length === 0)
            {
                alert('아이디를 입력하세요');
                return ;
            }

            let requestData = {
                userId : txtUserId.value
            };

            $.ajax({
            url: '/checkPw',
            type : 'POST',
            data : requestData,
            success : function(data)
            {
                let res = '';
                if(data == '$NOID')
                {
                    alert('입력하신 정보가 없습니다');
                    console.log(data);
                    location.href = '/pwinquiry';
                }
                else
                {
                    res = '입력한 아이디의 비밀번호를 가입했을때 입력했던 메일 주소로 보냈습니다.';
                    $getId.innerHTML = res;
                }
                
            }
        })
        });

            
        })(); 
    </script>
</body>