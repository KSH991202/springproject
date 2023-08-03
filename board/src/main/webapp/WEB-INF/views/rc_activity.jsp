<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>만남 추천</title>

        </head>

        <style>
            img{
                width: 70px;
                height: 70px;
            }
        </style>

        <body>
            <tiles:insertDefinition name="main-layout" />

            <div class="layout main-container2">

                <div id="main-container" class="main-tbl">

                </div>
                <div id="btnWrite">
                    <button type="button" id="btw" class="button">글작성</button>
                </div>

            </div>

            <!-- 버튼을 클릭하면 새 창으로 열릴 콘텐츠 -->
            <div id="content" style="display: none;">

                <div id="contentBtn">
                    <button type="button" id="btnUpdate" class="button">수정</button>
                    <button type="button" id="btnDelete">삭제</button>

                </div>
            </div>

            <script src="/JS/jquery-3.7.0.min.js"></script>
            <script>
                (() => {


                    let sessionState = false;

                    let rowCount = 0;           

                    let rowsPerPage = 10;           

                    let curSection = 0;         
                    let pagesPerSection = 5;   

                    let count = 0;
                    let remainRow = rowCount;  
                    let realPage = 0;

                    const setBBS = function (page) {
                        let requestData = {
                            divi: 'BSET',
                            page: page,
                            rowsPerPage: rowsPerPage
                        };

                        $.ajax({
                            url: '/sbbs/list',
                            type: 'POST',
                            data: requestData,
                            success: function (data)    //data :rowCount, bbsList
                            {
                                let bstr = '';
                                const maintbl = document.querySelector('.main-tbl');

                                console.log(data);

                                // 전체 카운트를 저장.
                                rowCount = data.rowCount;

                                // 테이블 body를 채워준다.
                                maintbl.innerHTML = '';

                                for (let i = 0; i < data.sbbsList.length; i++) {
                                    bstr = '';
                                    bstr += '<div class="box">';
                                    bstr += '<img src=\"imgs/member/thumbnail/' + data.sbbsList[i].fileCode + '\">';
                                    bstr += '</div>';

                                    maintbl.innerHTML += bstr;

                                }
                            }
                        });

                    }






                    const setSessionState = function () {
                        if ('${vo.userId}' === '') {
                            sessionState = false;
                        }
                        else {
                            sessionState = true;
                        }

                    }

                    const $btw = document.getElementById('btw');

                    $btw.addEventListener('click', () => {
                        if (sessionState == true) 
                        {
                            location.href = "/sbbs/newcontent"
                        }
                        else 
                        {
                            alert('로그인을 해야 합니다.');
                        }

                    });

                    setBBS(0);
                    setSessionState();


                })();
            </script>
        </body>

        </html>