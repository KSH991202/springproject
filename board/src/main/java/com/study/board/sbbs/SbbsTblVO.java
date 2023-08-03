package com.study.board.sbbs;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class SbbsTblVO {    
    // 설계속성
    private int page;
    private int rowsPerPage;
    
    // 기본속성
    private int rowNum;
    private String userId;
    private String seq;
    private String title;
    private String content;
    private String divi;
    private String regDate;
    private String fileCode;

    @JsonIgnore     
    private MultipartFile thumbnail;

}
