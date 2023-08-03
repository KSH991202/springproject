package com.study.board.mbbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.common.SessionUtil;
import com.study.board.user.UserTblVO;

@Controller
public class MbbsController {

    @Autowired
    MbbsDAO mbbsDAO;

    @PostMapping("/mbbs/list")
    @ResponseBody  
    public MbbsMstVO mbbsList(@ModelAttribute("MbbsTblVO") MbbsTblVO vo) throws Exception
    {
        MbbsMstVO mbsMstVO = new MbbsMstVO();

        int rowCount = mbbsDAO.selectMbbsRowCount();
        System.out.println(rowCount);

        List<MbbsTblVO> list = mbbsDAO.selectMbbsList(vo);
        
        mbsMstVO.setRowCount(rowCount);
        mbsMstVO.setMbbsList(list);

        return mbsMstVO;
        
    }
    
    @GetMapping("/mbbs/content")     
    public String content(@ModelAttribute("MbbsTblVO") MbbsTblVO vo, 
                          Model model) throws Exception
    {        
        MbbsTblVO resultVO = mbbsDAO.selectMbbsContent(vo);

        UserTblVO userTblVO = (UserTblVO) SessionUtil.getAttribute("USER");

        model.addAttribute("vo", resultVO);
        model.addAttribute("session", userTblVO);

        return "mbbs/content";
    }

    @PostMapping("/mbbs/content")
    @ResponseBody         
    public String content(@ModelAttribute("MbbsTblVO") MbbsTblVO vo) throws Exception
    {
        int updateCount = mbbsDAO.updateMbbsContent(vo);

        if (updateCount == 1) {
            return "OK";
        }
        else {
            return "FAIL";
        }
    }

    @PostMapping("/mbbs/deletecontent")
    @ResponseBody
    public String deleteContent(@ModelAttribute("MbbsTblVO")MbbsTblVO vo) throws Exception
    {
        int deleteCount = mbbsDAO.deleteMbbsContent(vo);

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
    
    @GetMapping("/mbbs/newcontent")
    public String newContent(Model model) throws Exception
    {
        System.out.println("겟트");
        UserTblVO userTblVO = (UserTblVO) SessionUtil.getAttribute("USER");
        model.addAttribute("session", userTblVO);

        return "mbbs/newcontent";
    }

    @PostMapping("/mbbs/newcontent")
    @ResponseBody            
    public String newContent(@ModelAttribute("MbbsTblVO") MbbsTblVO vo) throws Exception    
    {
        System.out.println("포스트트");
        int count = mbbsDAO.insertMbbsContent(vo);

        System.out.println(count);

        if (count == 1) {
            return "OK";
        }
        else {
            return "FAIL";
        }
        
    }



}
