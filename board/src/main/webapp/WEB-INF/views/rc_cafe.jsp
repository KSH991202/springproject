<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>만남 추천</title>

        </head>


        <body>
            <tiles:insertDefinition name="main-layout" />

            <div class="layout main-container2">

                <div id="main-container">
                    <div class="box"> 추천 사진<br>
                        <button class="box-button" type="button" id="openButton">보기</button>
                        <button class="box-button" type="button" id="openButton">편집</button>
                    </div>
                    <div class="box">추천 사진<br>
                        <button class="box-button" type="button" id="openButton">보기</button>
                        <button class="box-button" type="button" id="openButton">편집</button>
                    </div>
                    <div class="box">추천 사진<br>
                        <button class="box-button" type="button" id="openButton">보기</button>
                        <button class="box-button" type="button" id="openButton">편집</button>
                    </div>
                    <div class="box">추천 사진<br>
                        <button class="box-button" type="button" id="openButton">보기</button>
                        <button class="box-button" type="button" id="openButton">편집</button>
                    </div>
                    <div class="box">추천 사진<br>
                        <button class="box-button" type="button" id="openButton">보기</button>
                        <button class="box-button" type="button" id="openButton">편집</button>
                    </div>
                    <div class="box">추천 사진<br>
                        <button class="box-button" type="button" id="openButton">보기</button>
                        <button class="box-button" type="button" id="openButton">편집</button>
                    </div>

                </div>

            </div>

            <!-- 버튼을 클릭하면 새 창으로 열릴 콘텐츠 -->
            <div id="content" style="display: none;">
                <h1>새 창에서 볼 콘텐츠</h1>
                <p>이곳에 내용이 들어갑니다.</p>
            </div>

            <script>
                (() => {

                    // 버튼 클릭 이벤트 리스너 등록
                    document.getElementById("openButton").addEventListener("click", function () {

                        // 새 창으로 열릴 콘텐츠 요소 가져오기
                        var contentElement = document.getElementById("content");

                        // 새 창을 열기 위한 옵션
                        var options = "width=600,height=400,menubar=no,toolbar=no";

                        // 새 창 열기
                        var newWindow = window.open("", "", options);

                        // 새 창에 콘텐츠 추가
                        newWindow.document.write(contentElement.innerHTML);

                        // 새 창 닫기 버튼 추가 (옵션)
                        newWindow.document.write('<button onclick="window.close()">창 닫기</button>');

                        // 스타일 추가 (옵션)
                        newWindow.document.write('<style>body { margin: 20px; }</style>');

                        // 새 창 내용 쓰기 완료
                        newWindow.document.close();
                    });


                })();
            </script>
        </body>

        </html>