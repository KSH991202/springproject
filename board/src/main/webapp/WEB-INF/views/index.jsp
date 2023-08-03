<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Index</title>
        </head>

        <body>

            <tiles:insertDefinition name="main-layout" />



            <div class="layout main-container2">

                <div id="meetSpace">
                    <h1 id="meetSpaceTitle">만남의 광장</h1>

                    <div class="writeContent">
                        <button type="button" id="btnWrite" class="button">글작성</button>
                    </div>
                </div>


                <table id="tblBBS">
                    <thead id="thead">
                        <th>글번호</th>
                        <th>제  목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <br>
                <div id="indexBtn" class="btn">
                    <button type="button" class="button1" id="btnPrev">이전</button>
                    <button type="button" class="button1" id="btn1">1</button>
                    <button type="button" class="button1" id="btn2">2</button>
                    <button type="button" class="button1" id="btn3">3</button>
                    <button type="button" class="button1" id="btn4">4</button>
                    <button type="button" class="button1" id="btn5">5</button>
                    <button type="button" class="button1" id="btnNext">다음</button>
                </div>
                <br>

                <!-- 검색 -->
                <div class="container">
                    <div class="row">
                        <form method="post" name="search" action="searchbbs.jsp">
                            <table class="pull-right">
                                <tr>
                                    <td><select class="form-control" name="searchField">
                                            <option value="0">선택</option>
                                            <option value="bbsTitle">제목</option>
                                            <option value="userID">작성자</option>
                                        </select></td>
                                    <td><input type="text" class="form-control" placeholder="검색어 입력" name="searchText"
                                            maxlength="100"></td>
                                    <td><button type="submit" class="button">검색</button></td>
                                </tr>

                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <script src="/JS/jquery-3.7.0.min.js"></script>
            <script>
                (() => {


                    let sessionState = false;

                    //row..
                    let rowCount = 0;           // 전체 건수

                    // page..
                    let rowsPerPage = 10;        // 페이지당 건수 (테이블에서 보여지는 최대 건수)    

                    // section..
                    let curSection = 0;         // 현재섹션
                    let pagesPerSection = 5;    // 섹션당 페이지수 (버튼의 개수와 같다.)

                    let count = 0;
                    let remainRow = rowCount;  //남은페이지 전체건수에서 한섹션(25개씩)줄어들게해서 남은건수가 있으면 다음버튼 클릭가능
                    let realPage = 0;


                    const btnPrev = document.querySelector('#btnPrev');
                    const btn1 = document.querySelector('#btn1');
                    const btn2 = document.querySelector('#btn2');
                    const btn3 = document.querySelector('#btn3');
                    const btn4 = document.querySelector('#btn4');
                    const btn5 = document.querySelector('#btn5');
                    const btnNext = document.querySelector('#btnNext');
                    const btnWrite = document.querySelector('#btnWrite');




                    ////////////////////////////////////////////////////////////
                    // 함수

                    const setSessionState = function () {
                        if ('${vo.userId}' === '') {
                            sessionState = false;
                        }
                        else {
                            sessionState = true;
                        }

                    }


                    const setBBS = function (page) {
                        let requestData = {
                            divi: 'BSET',
                            page: page,
                            rowsPerPage: rowsPerPage
                        };

                        $.ajax({
                            url: '/mbbs/list',
                            type: 'POST',
                            data: requestData,
                            success: function (data)    //data :rowCount, bbsList
                            {
                                let bstr = '';
                                const tblBody = document.querySelector('#tblBBS > tbody');


                                // 전체 카운트를 저장.
                                rowCount = data.rowCount;

                                // 테이블 body를 채워준다.
                                tblBody.innerHTML = '';

                                for (let i = 0; i < data.mbbsList.length; i++) {
                                    bstr = '';
                                    bstr += '<tr>';
                                    bstr += '<td>' + data.mbbsList[i].seq + '</td>';
                                    bstr += '<td><a href=\"/mbbs/content?userId=' + data.mbbsList[i].userId + '&seq=' + data.mbbsList[i].seq + '\">' + data.mbbsList[i].title + '</a></td>';
                                    bstr += '<td>' + data.mbbsList[i].userId + '</td>';
                                    bstr += '<td>' + data.mbbsList[i].regDate + '</td>';
                                    bstr += '</tr>';

                                    tblBody.innerHTML += bstr;

                                }
                            }
                        });

                    }

                    // 실제 적용해야할 페이지를 구한다.
                    const getRealPage = function (pageOffset) {
                        return (curSection * pagesPerSection) + pageOffset;

                    }



                    ////////////////////////////////////////////////////////////
                    // 이벤트 핸들러


                    // Prev
                    btnPrev.addEventListener('click', () => {

                        if (curSection <= 0) {
                            alert('이전 내용은 없습니다.');
                            return;
                        }

                        curSection--;

                        //이전페이지의 0번으로 설정한다.
                        let realPage = getRealPage(0);
                        setBBS(realPage);

                        for (let i = 0; i < curSection + 1; i++) {
                            btn1.innerHTML = 1 + (rowsPerPage * curSection);
                            btn2.innerHTML = 2 + (rowsPerPage * curSection);
                            btn3.innerHTML = 3 + (rowsPerPage * curSection);
                            btn4.innerHTML = 4 + (rowsPerPage * curSection);
                            btn5.innerHTML = 5 + (rowsPerPage * curSection);
                        }
                    });

                    //Next
                    btnNext.addEventListener('click', () => {
                        // 남은페이지
                        let rowsPerSection = rowsPerPage * pagesPerSection;
                        remainRow = rowCount - (rowsPerSection * (curSection + 1));

                        if (remainRow > 0) {
                            curSection++;
                            // 페이지 띄워주기
                            let realPage = getRealPage(0);
                            setBBS(realPage);
                            console.log("setbbs(번호) : " + (rowsPerPage * curSection));

                            // 버튼숫자 바꿔주기
                            for (let i = 0; i < curSection; i++) {
                                btn1.innerHTML = 1 + (rowsPerPage * curSection - pagesPerSection);
                                btn2.innerHTML = 2 + (rowsPerPage * curSection - pagesPerSection);
                                btn3.innerHTML = 3 + (rowsPerPage * curSection - pagesPerSection);
                                btn4.innerHTML = 4 + (rowsPerPage * curSection - pagesPerSection);
                                btn5.innerHTML = 5 + (rowsPerPage * curSection - pagesPerSection);
                            }
                            // 데이터 없는 번호 지우기
                            if (remainRow <= 5) {

                            }
                            // 데이터가 잇는지 확인 하고 없다면 버튼을 지워라


                        }
                        else {
                            alert("다음페이지가 없습니다");
                        }

                    });

                    btn2.addEventListener('click', () => {
                        const offset = 1;

                        const realPage = getRealPage(offset);
                        setBBS(realPage);

                    });

                    btn3.addEventListener('click', () => {
                        const offset = 2;

                        const realPage = getRealPage(offset);
                        setBBS(realPage);

                    });

                    btn4.addEventListener('click', () => {
                        const offset = 3;

                        const realPage = getRealPage(offset);
                        setBBS(realPage);

                    });

                    btn5.addEventListener('click', () => {
                        const offset = 4;

                        const realPage = getRealPage(offset);
                        setBBS(realPage);

                    });


                    btnWrite.addEventListener('click', () => {

                        if (sessionState == true) {
                            location.href = "/mbbs/newcontent"
                        }
                        else {
                            alert('로그인을 해야 합니다.');
                        }

                    });

                    ////////////////////////////////////////////////////////////
                    // 호출부.

                    setBBS(0);
                    setSessionState();


                })(); 
            </script>
        </body>

        </html>