<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../reset.css">
        <link rel="stylesheet" href="../style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <title></title>
    </head>

    <body>
        <div id="content">
            <input type="text" id="txtTitle" value="${vo.title}"> <span id="txtId">${vo.userId}</span>
            <br><br>
            <textarea name="" id="txtContent">${vo.content}</textarea>
            <br>
        </div>

        <div id="comment">
            <table border="1" id="contentBBS" class=" table-hover">
                <thead id="thead">
                    <th id="comment-seq">순번</th>
                    <th id="comment-contents">내용</th>
                    <th id="comment-id">아이디</th>
                    <th id="comment-date">날짜</th>
                </thead>
                <tbody>
                </tbody>
            </table>
            댓글 작성 : <input type="text" width="500px">
            <button type="button">댓글 등록</button>
            <br><br>
        </div>
        <div id="contentBtn">
            <button type="button" id="btnParticipation" class="button">참여하기</button>
            <button type="button" id="btnList" class="button">목록으로</button>
            <button type="button" id="btnUpdate" class="button">수정</button>
            <button type="button" id="btnDelete">삭제</button>

        </div>


        <script src="/JS/jquery-3.7.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            (() => {
                let myContent = false;    // 내 컨텐츠 인지
                let partCount = 0;        // 참여 인원
                let partCheck = false;    // 참여가능 여부

                const btnParticipation = document.querySelector('#btnParticipation');
                const txtTitle = document.querySelector('#txtTitle');
                const txtContent = document.querySelector('#txtContent');
                const btnList = document.querySelector('#btnList');
                const btnUpdate = document.querySelector('#btnUpdate');
                const btnDelete = document.querySelector('#btnDelete');


                //////////////////////////////////////////////////////////////////
                // 함수
                const checkMyContent = function () {
                    if ('${session.userId}' === '${vo.userId}') {
                        myContent = true;
                    }
                    else {
                        myContent = false;
                    }

                }

                const setUiObject = function () {
                    // 내 컨텐츠가 아니라면 읽기만 가능하다.
                    if (myContent === false) {
                        txtTitle.setAttribute('readonly', 'readonly');
                        txtContent.setAttribute('readonly', 'readonly');
                        btnUpdate.setAttribute('disabled', 'disabled');

                    }

                }
                ///////////////////////////////////////////////////////////////////
                // 이벤트 핸들러.

                btnParticipation.addEventListener('click', () => {
                    console.log("참여하기버튼 클릭");
                });


                btnList.addEventListener('click', () => {
                    location.href = '/index';
                });

                btnUpdate.addEventListener('click', () => {

                    // 던질 데이터를 마련한다. (id, seq, title, content)
                    let requestData = {
                        userId: '${vo.userId}',
                        seq: '${vo.seq}',
                        title: txtTitle.value,
                        content: txtContent.value
                    };

                    $.ajax({
                        url: '/mbbs/content',
                        type: 'POST',
                        data: requestData,
                        success: function (data) {
                            if (data === "OK") {
                                alert('수정되었습니다.');
                                location.href = "/index";
                            }
                            else {
                                alert('수정에 실패하였습니다.');
                            }
                        }

                    });

                });


                btnDelete.addEventListener('click', () => {

                    let reqData = {
                        userId: '${vo.userId}',
                        seq: '${vo.seq}'
                    };

                    console.log(reqData);
                    $.ajax({
                        url: '/mbbs/deletecontent',
                        type: 'POST',
                        data: reqData,
                        success: function (data) {

                            if (data === "OK") {

                                alert('삭제.');
                                location.href = "/index";

                            }
                            else {
                                alert('실패.');
                            }
                        }
                    });
                });
                ///////////////////////////////////////////////////////////////////
                // 호출부
                checkMyContent();       // 내 컨텐츠인지를 체크.내 컨텐츠 인 경우 myContent => true
                setUiObject();          // UI 설정을 해준다. (readonly 등등)

            })(); 
        </script>

    </body>