package com.study.test.file;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {

    @Autowired
    FileDAO fileDAO;
    
    public FileVO createFile(FileVO vo) throws Exception
    {
        UUID uuid;          // UUID
        String fileCode;    // file Code
        String fileExt;
        String orgFileName;

        // 1. 파일을 저장한다.
        
        // 파일이 존재한다.
        if(false == vo.getMultiFile().isEmpty())
        {
            // fileCode를 만든다
            uuid = UUID.randomUUID();
            fileCode = uuid.toString().replaceAll("-", "");
            
            // storedName를 만든다
            orgFileName = vo.getMultiFile().getOriginalFilename();
            fileExt = orgFileName.substring(orgFileName.lastIndexOf("."), orgFileName.length());

            // FileVO를 설정한다
            vo.setFileCode(fileCode);
            vo.setStoredName(fileCode + fileExt);
            vo.setOriginName(orgFileName);

            // 파일을 vo에 맞에 저장한다
            FileUtil.saveFile(vo);
        
        }

        return vo;
    }

    public int insertFileTbl(FileVO vo) throws Exception
    {
        return fileDAO.insertFileTbl(vo);
    }



}
