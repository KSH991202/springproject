package com.study.test.file;

import java.io.File;
import java.io.IOException;

public class FileUtil {
    public static void saveFile(FileVO vo)
    {
        // vo에 storedName을 가지고오고
        // vo에 path를 가지고와서 
        // 파일을 만들어준다
        File dirFile = new File(vo.getFilePath());
        
        if(false == dirFile.exists())
        {
            dirFile.mkdirs();
        }
        File file = new File(vo.getFilePath(), vo.getStoredName());

        try{
            System.out.println(file.getAbsolutePath());
            vo.getMultiFile().transferTo(file);
        }
        catch(IllegalStateException e)
        {   
            e.printStackTrace();
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

    }
    
}
