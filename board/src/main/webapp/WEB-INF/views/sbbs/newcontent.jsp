<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>

    <style>
        body{
            margin-left: 30%;
        }
    </style>

    <body>

        <h1>장소 추천</h1>

        <div class="tbl">
            <tr>
                <td>제목 : <input type="text" id="txtTitle" maxlength="150"></td>
                <td><select id="selDivi">
                        <option value="BEST">맛집</option>
                        <option value="CAFE">카페</option>
                        <option value="ACT">액티비티</option>
                        <option value="STUDY">공부</option>
                        <option value="TRIP">여행</option>
                        <option value="SHOP">쇼핑</option>
                        <option value="PV">관람</option>
                        <option value="ETC">기타</option>
                    </select></td>
            </tr>
        </div><br>
        <textarea id="txtContent" cols="70" rows="30"></textarea><br><br>
        <div class="tbl">
            <tr>
                <input type="file" name="thumbnail" id="thumbnail" accept="image/*"><br><br>
            </tr>
            <tr>
                <td><button type="button" id="btnList">목록으로</button></td>
                <td><button type="button" id="btnInsert">저장</button></td>
            </tr>
        </div>
            


        <script src="/JS/jquery-3.7.0.min.js"></script>
        <script>
            (() => {
                const txtTitle = document.querySelector('#txtTitle');
                const selDivi = document.querySelector('#selDivi');
                const txtContent = document.querySelector('#txtContent');
                const btnList = document.querySelector('#btnList');
                const btnInsert = document.querySelector('#btnInsert');
                const $thumbnail = document.getElementById('thumbnail');



                //////////////////////////////////////////////////////////////////////
                // 함수
                const checkValues = function () {
                    if ((txtTitle.value.length == 0) ||
                        (txtContent.value.length == 0)) {
                        return false;
                    }

                    return true;

                }



                //////////////////////////////////////////////////////////////////////
                // 이벤트 핸들러
                btnList.addEventListener('click', () => {
                    location.href = '/index';

                });


                btnInsert.addEventListener('click', () => {

                    // 서버에 전달할 데이터를 만든다.
                    if (false === checkValues()) {
                        alert('제목이나 내용이 없거나 문제가 있습니다.');
                        return;
                    }

                    let formData = new FormData();

                    formData.append('userId', '${session.userId}');
                    formData.append('title', txtTitle.value);
                    formData.append('content', txtContent.value);
                    formData.append('divi', selDivi.options[selDivi.selectedIndex].value);

                    if($thumbnail.files[0] !== undefined)
                    {
                        formData.append('thumbnail', $thumbnail.files[0]);
                    }

                    let xhr = new XMLHttpRequest();
                    xhr.open('POST', '/sbbs/newcontent', true);

                    xhr.onreadystatechange = function()
                    {
                        if(xhr.readyState === XMLHttpRequest.DONE)
                        {
                            if(xhr.status === 200)
                            {
                                location.href = '/main';
                            }
                            else
                            {
                                console.log('실패');
                            }
                        }
                    }
                    xhr.send(formData);

                });

            })(); 
        </script>

    </body>