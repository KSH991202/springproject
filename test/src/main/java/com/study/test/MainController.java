package com.study.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.study.test.file.FileService;
import com.study.test.file.FileVO;
import com.study.test.member.MemberDAO;
import com.study.test.member.MemberVO;

@Controller
public class MainController {
    
    @Value("${file.upload-dir}")
    private String uploadDir;

    @Autowired
    FileService fileService;

    @Autowired
    MemberDAO memberDAO;

    @GetMapping("/join")
    public String join()
    {
        return "join";
    }

    @PostMapping("/join")
    public ResponseEntity<String> join(@ModelAttribute("MemberVO") MemberVO vo) throws Exception
    {
        // 받은 파일 데이터를 원하는 위치에 파일로 저장

        FileVO fileVO = null;

        if(vo.getThumbnail() != null)
        {
            // fileVO 설정
            fileVO = new FileVO();
            fileVO.setMultiFile(vo.getThumbnail());
            fileVO.setFilePath(uploadDir + "member/thumbnail");

            // 파일에 저장하고 FILE_TBL에 해당 정보를 저장한다
            fileVO = fileService.createFile(fileVO);
            fileService.insertFileTbl(fileVO);

            // MemberVO filecode를 설정해준다
            vo.setFileCode(fileVO.getFileCode());
        }

        // 회원가입 쿼리를 실행한다
        memberDAO.insertMemberTbl(vo);
        
        return new ResponseEntity<String>("JOIN_SUCESS", HttpStatus.OK);

    }

}
