package com.study.board.mbbs;

import java.util.List;

import lombok.Data;

@Data
public class MbbsMstVO {
    private int rowCount;               // 게시물의 전체 개수
    private List<MbbsTblVO> mbbsList;     // 게시물의 리스트.
    
}
