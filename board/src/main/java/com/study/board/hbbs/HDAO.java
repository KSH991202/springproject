package com.study.board.hbbs;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public HTblVO selectBbsContent(HTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBbsContent", vo);
    }
    



}
