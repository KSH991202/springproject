package com.study.board.rvbbs;

import java.util.List;

import lombok.Data;

@Data
public class RVbbsMstVO {
    private int rowCount;               // 게시물의 전체 개수
    private List<RVbbsTblVO> bbsList;     // 게시물의 리스트.
    
}
