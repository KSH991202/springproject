package com.study.board.sbbs;

import java.util.List;

import lombok.Data;

@Data
public class SbbsMstVO {
    private int rowCount;               // 게시물의 전체 개수
    private List<SbbsTblVO> sbbsList;     // 게시물의 리스트.
    
}
