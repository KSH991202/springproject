<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>취미 상점</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <link rel="stylesheet" href="reset.css">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <style>
            html {
                overflow: hidden;
            }

            html,
            body {
                display: block;
                width: 100%;
                height: 100%;
                margin: 0;

            }

            .section {
                width: 100%;
                height: 100%;
                position: relative;
            }

            #section1 {
                background-color: rgb(255, 216, 216);
            }

            #section2 {
                background-color: rgb(255, 216, 216);
            }

            #section3 {
                background-color: rgb(255, 216, 216);
            }

            #section4 {
                background-color: rgb(255, 216, 216);
            }

            #section5 {
                background-color: rgb(255, 216, 216);

            }

            #section6 {
                background-color: rgb(255, 216, 216);
            }



            .scroll {
                z-index: 10px;
                position: fixed;
                top: 85%;
                left: 50%;
                width: 80px;
                height: 80px;
            }

            .showImg {
                width: 100%;
                height: 100%;
            }

            a {
                text-decoration: none;
            }

            .fadeTitle {
                font-size: 60px;
                font-weight: bold;
                color: gray;
                display: flex;

                position: fixed;
                top: 15%;
                margin-left: 15%;
                z-index: 10;
            }

            .fadeContent {
                font-size: 50px;
                font-weight: bold;
                color: gray;

                position: absolute;
                top: 50%;
                left: 20%;
            }
        </style>
    </head>

    <body>

        <!-- section 1 -->
        <div class="section" id="section1">
            <div id="section1_detail">

                <a href="./main">
                    <img src="https://cdn-icons-png.flaticon.com/128/4038/4038921.png" alt="메인아이콘" class="main-icon"
                        width="75px" height="70px">
                </a>

                <div class="fadeTitle">
                    <p data-aos="fade-down" data-aos-easing="linear" data-aos-delay="300" data-aod-duration="3000">취</p>
                    <p data-aos="fade-down" data-aos-easing="linear" data-aos-delay="600" data-aod-duration="3000">미</p>
                    <p data-aos="fade-down" data-aos-easing="linear" data-aos-delay="900" data-aod-duration="3000">상</p>
                    <p data-aos="fade-down" data-aos-easing="linear" data-aos-delay="1200" data-aod-duration="3000">점
                    </p>
                </div>
                <p class="fadeContent" data-aos="fade-up" data-aos-easing="linear" data-aos-delay="1500"
                    data-aod-duration="3000">다양한 취미를 가진 사람들이 모여</p>
            </div>
        </div>

        <!-- section 2 -->
        <div class="section" id="section2">
            <img class="showImg" src="../../image/한식.jpg" data-aos="fade-up" data-aos-easing="linear"
                data-aos-delay="500" data-aod-duration="3000">
        </div>

        <!-- section 3 -->
        <div class="section" id="section3">
            <p class="fadeContent" data-aos="zoom-in" data-aos-easing="linear" data-aos-delay="1500"
                data-aod-duration="3000">맛있는 음식과 색다른 경혐을</p>
        </div>

        <!-- section 4 -->
        <div class="section" id="section4">
            <img class="showImg" src="../../image/일식.jpg" data-aos="fade-up" data-aos-easing="linear"
                data-aos-delay="500" data-aod-duration="3000">
        </div>

        <!-- section 5 -->
        <div class="section" id="section5">
            <p class="fadeContent" data-aos="flip-left" data-aos-easing="linear" data-aos-delay="1500"
                data-aod-duration="3000">느낄 수 있는 소중한 공간</p>
        </div>

        <div class="section" id="section6">

            <h1><a href="./main">둘러보기</a></h1>
        </div>



        <img class="scroll" src="https://www.baemin.com/_next/static/media/scroll@2x.abce750c.png">

        <script>
            (() => {
                AOS.init();
                let $html = $("html");

                let page = 1;

                $html.animate({ scrollTop: 0 }, 500);

                $(window).on("wheel", function (e) {
                    if ($html.is(":animated")) return;
                    if (e.originalEvent.deltaY > 0) {
                        if (page == 6) return;
                        page++;
                    } else if (e.originalEvent.deltaY < 0) {
                        if (page == 1) return;
                        page--;
                    }
                    let posTop = (page - 1) * $(window).height();
                    $html.animate({ scrollTop: posTop });
                })



                const body = document.querySelector('body');

                body.addEventListener('click',()=>{
                    location.href = 'main';
                });


            })();
        </script>
    </body>

    </html>