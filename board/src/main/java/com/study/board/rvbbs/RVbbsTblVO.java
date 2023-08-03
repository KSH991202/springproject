package com.study.board.rvbbs;

import lombok.Data;

@Data
public class RVbbsTblVO {    
    // 설계속성
    private int page;
    private int rowsPerPage;
    
    // 기본속성
    private int rowNum;
    private String userId;
    private String seq;
    private String title;
    private String content;
    private String score;
    private String regDate;
    private String divi;

}
