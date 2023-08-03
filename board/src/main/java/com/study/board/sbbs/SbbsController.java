package com.study.board.sbbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.common.SessionUtil;
import com.study.board.file.FileService;
import com.study.board.file.FileVO;
import com.study.board.user.UserTblVO;

@Controller
public class SbbsController {

    @Value("${file.upload-dir}")
    private String uploadDir;

    @Autowired
    SbbsDAO sbbsDAO;

    @Autowired
    FileService fileService;


    @PostMapping("/sbbs/list")
    @ResponseBody  
    public SbbsMstVO sbbsList(@ModelAttribute("SbbsTblVO") SbbsTblVO vo) throws Exception
    {
        SbbsMstVO sbbsMstVO = new SbbsMstVO();

        int rowCount = sbbsDAO.selectSbbsRowCount();
        System.out.println(rowCount);

        List<SbbsTblVO> list = sbbsDAO.selectSbbsList(vo);
        
        sbbsMstVO.setRowCount(rowCount);
        sbbsMstVO.setSbbsList(list);

        return sbbsMstVO;
        
    }
    
    @GetMapping("/sbbs/content")     
    public String content(@ModelAttribute("SbbsTblVO") SbbsTblVO vo, 
                          Model model) throws Exception
    {        
        SbbsTblVO resultVO = sbbsDAO.selectSbbsContent(vo);

        UserTblVO userTblVO = (UserTblVO) SessionUtil.getAttribute("USER");

        model.addAttribute("vo", resultVO);
        model.addAttribute("session", userTblVO);

        return "sbbs/content";
    }

    @PostMapping("/sbbs/content")
    @ResponseBody         
    public String content(@ModelAttribute("SbbsTblVO") SbbsTblVO vo) throws Exception
    {
        int updateCount = sbbsDAO.updateSbbsContent(vo);

        if (updateCount == 1) {
            return "OK";
        }
        else {
            return "FAIL";
        }
    }

    @PostMapping("/sbbs/deletecontent")
    @ResponseBody
    public String deleteContent(@ModelAttribute("SbbsTblVO")SbbsTblVO vo) throws Exception
    {
        int deleteCount = sbbsDAO.deleteSbbsContent(vo);

        System.out.println("tqtq");
        if (deleteCount == 1)
        {
            System.out.println("tqd");
            return "OK";
        }
        else
        {
            System.out.println(deleteCount);
            return "FAIL";
        }
    }
    
    @GetMapping("/sbbs/newcontent")
    public String newContent(Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO) SessionUtil.getAttribute("USER");
        model.addAttribute("session", userTblVO);

        return "sbbs/newcontent";
    }

    @PostMapping("/sbbs/newcontent")
    @ResponseBody            
    public ResponseEntity<String> newContent(@ModelAttribute("SbbsTblVO") SbbsTblVO vo) throws Exception    
    {
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

        sbbsDAO.insertSbbsContent(vo);
        System.out.println(fileVO.getStoredName());
        System.out.println(vo);

        return new ResponseEntity<String>("JOIN_SUCESS", HttpStatus.OK);

    }
        
}


