<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    
</head>

<body>
    <h1>ID 찾기</h1>
    <hr>
    이메일 <input type="email" name="email" id="txtEmail">
    <button type="button" id="btnSubmit">확인</button>
    <hr>
    <div id="getId"></div>
    <hr>
    <button type="button" id="btnfirst">로그인</button>


    <script src="/JS/jquery-3.7.0.min.js"></script>

    <script>
        (() => {

        const btnSubmit = document.querySelector('#btnSubmit');
        const txtEmail = document.querySelector('#txtEmail');
        const $btnfirst = document.querySelector('#btnfirst');
        const $getId = document.querySelector('#getId');

        let idChecking = false;         // 중복확인을 통과하면 true로 변경.
        let checkedId = '';             // 체크가 완료된 아이디


        $btnfirst.addEventListener('click', ()=>{
            location.href = '/login';
        });

        btnSubmit.addEventListener('click', ()=>{


            if(txtEmail.value.length === 0)
            {
                alert('이메일을 입력하세요');
                return ;
            }

            let requestData = {
                email : txtEmail.value
            };

            $.ajax({
            url: '/checkEmail',
            type : 'POST',
            data : requestData,
            success : function(data)
            {
                let res = '';
                if(data == '$NOUSER')
                {
                    alert('입력하신 정보가 없습니다');
                    console.log(data);
                    location.href = '/idinquiry';
                }
                else
                {
                    res = '찾으시는 ID는 '+'<b>'+ data +'</b>' + ' 입니다';
                    $getId.innerHTML = res;
                }
                
            }
        })

        });

        
            
        })(); 
    </script>
</body>