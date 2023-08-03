package com.study.board.rvbbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RVbbsDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int selectBbsRowCount() throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBbsRowCount");
    }

    public List<RVbbsTblVO> selectBbsList(RVbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectBbsList", vo);

    }

    public RVbbsTblVO selectBbsContent(RVbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBbsContent", vo);
    }
    

    public int updateBbsContent(RVbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateBbsContent", vo);
    }

    public int insertBbsContent(RVbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertBbsContent", vo);
    }


}
