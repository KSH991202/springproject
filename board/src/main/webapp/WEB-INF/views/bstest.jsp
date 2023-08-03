<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>bootstrap test</title>


        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Email address</label>
            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
        </div>
        <button type="button" id="btnPopup">이메일 메세지박스 출력</button>


    </head>
    <body>

        <script>
            (()=>{
                const btnPopup = document.querySelector('#btnPopup');

                btnPopup.addEventListener('click', ()=>{
                    alert(document.querySelector('#exampleFormControlInput1').value);

                });

                
            })();
        </script>
    </body>
</html>