<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <style>
        fieldset{
            width: 400px;
        }
    </style>

    <body>

        <form action="">
            <fieldset>
                <legend>사용자 정보</legend>
                <table>
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" name="memberId" id="memberId"></td>
                    </tr>
                    <tr>
                        <td>패스워드</td>
                        <td><input type="text" name="memberPw" id="memberPw"><br></td>
                    </tr>
                    <tr>
                        <td>이 름</td>
                        <td><input type="text" name="name" id="name"><br></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input type="text" name="email" id="email"><br></td>
                    </tr>
                    <tr>
                        <td>썸네일</td>
                        <td><input type="file" name="thumbnail" id="thumbnail" accept="image/*"><br></td>
                    </tr>
                </table>

                <button type="button" id="join">회원가입</button>
            </fieldset>
        </form>

        <script>
            (() => {

                const $memberId = document.getElementById('memberId');
                const $memberPw = document.getElementById('memberPw');
                const $name = document.getElementById('name');
                const $email = document.getElementById('email');
                const $thumbnail = document.getElementById('thumbnail');
                const $join = document.getElementById('join');


                $join.addEventListener('click', ()=>{
                    // 서버에 전달할 데이터를 구성한다
                    let formData = new FormData();

                    formData.append('memberId', $memberId.value);
                    formData.append('memberPw', $memberPw.value);
                    formData.append('name', $name.value);
                    formData.append('email', $email.value);

                    if($thumbnail.files[0] !== undefined)
                    {
                        formData.append('thumbnail', $thumbnail.files[0]);
                    }

                    // 서버에 AJAX로 전송한다
                    let xhr = new XMLHttpRequest();
                    xhr.open('POST', '/join', true);

                    xhr.onreadystatechange = function()
                    {
                        // 수신을 완료했다.
                        if(xhr.readyState === XMLHttpRequest.DONE)
                        
                        {
                            if(xhr.status === 200)
                            {
                                console.log('회원가입 성공');
                                console.log('서버가 전송한 메시지 : ' + xhr.responseText);
                            }
                            else
                            {
                                console.error('실패..');
                                console.log('서버가 전송한 에러코드 : ' + xhr.status);
                            }
                        }
                    }
                    xhr.send(formData);
                });



            })();
        </script>
    </body>

    </html>