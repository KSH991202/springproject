package com.study.board.rvbbs;

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
public class RVbbsController {

    @Autowired
    RVbbsDAO rvbbsDAO;

    @PostMapping("/rvbbs/list")
    @ResponseBody  
    public RVbbsMstVO bbsList(@ModelAttribute("RVbbsTblVO") RVbbsTblVO vo) throws Exception
    {
        RVbbsMstVO rvbbsMstVO = new RVbbsMstVO();

        int rowCount = rvbbsDAO.selectBbsRowCount();

        List<RVbbsTblVO> list = rvbbsDAO.selectBbsList(vo);

        rvbbsMstVO.setRowCount(rowCount);
        rvbbsMstVO.setBbsList(list);

        return rvbbsMstVO;
        
    }
    
    @GetMapping("/rvbbs/content")     
    public String content(@ModelAttribute("RVbbsTblVO") RVbbsTblVO vo, 
                          Model model) throws Exception
    {        
        RVbbsTblVO resultVO = rvbbsDAO.selectBbsContent(vo);

        UserTblVO userTblVO = (UserTblVO) SessionUtil.getAttribute("USER");

        model.addAttribute("vo", resultVO);
        model.addAttribute("session", userTblVO);

        return "rvbbs/content";
    }

    @PostMapping("/rvbbs/content")
    @ResponseBody         
    public String content(@ModelAttribute("RVbbsTblVO") RVbbsTblVO vo) throws Exception
    {
        int updateCount = rvbbsDAO.updateBbsContent(vo);

        if (updateCount == 1) {
            return "OK";
        }
        else {
            return "FAIL";
        }
    }
    
    @GetMapping("/rvbbs/newcontent")
    public String newContent(Model model) throws Exception
    {
        RVbbsTblVO userTblVO = (RVbbsTblVO) SessionUtil.getAttribute("USER");
        model.addAttribute("session", userTblVO);

        return "rvbbs/newcontent";
    }

    @PostMapping("/rvbbs/newcontent")
    @ResponseBody            
    public String newContent(@ModelAttribute("RVbbsTblVO") RVbbsTblVO vo) throws Exception    
    {
        int count = rvbbsDAO.insertBbsContent(vo);

        if (count == 1) {
            return "OK";
        }
        else {
            return "FAIL";
        }
        
    }



}
