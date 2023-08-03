package com.study.board.config;

import org.springframework.context.annotation.Configuration;

import org.springframework.beans.factory.annotation.Value;

@Configuration
public class FileUploaderConfig {

    @Value("${file.upload-dir}")
    private String uploadDir;
    
    public String getUploadDir()
    {
        return uploadDir;
    }
}
