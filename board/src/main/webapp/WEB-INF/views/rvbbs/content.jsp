<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>   
    <input type="text" id="txtTitle" value="${vo.title}"> <span id="txtId">${vo.userId}</span>
    <br>
    <textarea name="" id="txtContent" cols="30" rows="10">${vo.content}</textarea>
    <br>
    <button type="button" id="btnList">목록으로</button>
    <button type="button" id="btnUpdate">수정</button>


<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{ 
    let myContent = false;

    const txtTitle = document.querySelector('#txtTitle');
    const txtContent = document.querySelector('#txtContent');
    const btnList = document.querySelector('#btnList');
    const btnUpdate = document.querySelector('#btnUpdate');

    //////////////////////////////////////////////////////////////////
    // 함수
    const checkMyContent = function()
    {
        if ('${session.userId}' === '${vo.userId}') {
            myContent = true;         
        }
        else {
            myContent = false;         
        }

    }

    const setUiObject = function()
    {
        // 내 컨텐츠가 아니라면 읽기만 가능하다.
        if (myContent === false)
        {
            txtTitle.setAttribute('readonly', 'readonly');
            txtContent.setAttribute('readonly', 'readonly');
            btnUpdate.setAttribute('disabled', 'disabled');

        }

    }
    ///////////////////////////////////////////////////////////////////
    // 이벤트 핸들러.
    btnList.addEventListener('click', ()=>{
        location.href='/index';
    });

    btnUpdate.addEventListener('click', ()=>{

        // 던질 데이터를 마련한다. (id, seq, title, content)
        let requestData = {
            userId : '${vo.userId}',
            seq : '${vo.seq}',
            title : txtTitle.value, 
            content : txtContent.value
        };

        $.ajax({
            url: '/bbs/content',
            type: 'POST',
            data: requestData,
            success : function(data) {
                if (data === "OK")
                {
                    alert('수정되었습니다.');                    
                }
                else                 
                {
                    alert('수정에 실패하였습니다.');                    
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