<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <h1>New Content</h1>
    <input type="text" id="txtTitle" maxlength="150">
    <select id="selDivi">
        <option value="C">C-일반</option>
        <option value="N">N-공지사항</option>
        <option value="R">R-필독</option>
    </select>
    <br>
    <textarea name="" id="txtContent" cols="30" rows="10" maxlength="1000"></textarea>
    <br>
    <button type="button" id="btnList">목록으로</button>
    <button type="button" id="btnInsert">저장</button>
    
<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   
    const txtTitle = document.querySelector('#txtTitle'); 
    const selDivi = document.querySelector('#selDivi');
    const txtContent = document.querySelector('#txtContent'); 
    const btnList = document.querySelector('#btnList');
    const btnInsert = document.querySelector('#btnInsert');

    //////////////////////////////////////////////////////////////////////
    // 함수
    const checkValues = function()
    {
        if ((txtTitle.value.length == 0) ||
            (txtContent.value.length == 0)) 
        {
            return false;
        }

        return true;

    }
    

    //////////////////////////////////////////////////////////////////////
    // 이벤트 핸들러
    btnList.addEventListener('click', ()=>{
        location.href = '/index';

    });


    btnInsert.addEventListener('click', ()=>{

        // 서버에 전달할 데이터를 만든다.
        if (false === checkValues())  {
            alert('제목이나 내용이 없거나 문제가 있습니다.');
            return;
        }

        let requestData = {
            userId : '${session.userId}',
            title : txtTitle.value,
            content : txtContent.value,
            divi : selDivi.options[selDivi.selectedIndex].value

        }

        $.ajax({
            url : '/bbs/newcontent',
            type : 'POST',
            data : requestData,
            success : function(data)
            {
                if (data === 'OK') {
                    alert('저장되었습니다.');
                    location.href = '/index';
                }
                else{
                    alert('저장에 실패하였습니다.');
                }
            }
        });
        
    });
        
})(); 
</script>
        
</body>