package com.study.board.sbbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class SbbsDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int selectSbbsRowCount() throws Exception
    {
        return sqlSessionTemplate.selectOne("selectSbbsRowCount");
    }

    public List<SbbsTblVO> selectSbbsList(SbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectSbbsList", vo);

    }

    public SbbsTblVO selectSbbsContent(SbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectSbbsContent", vo);
    }
    

    public int updateSbbsContent(SbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateSbbsContent", vo);
    }

    public int insertSbbsContent(SbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertSbbsContent", vo);
    }

    public int deleteSbbsContent(SbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.delete("deleteSbbsContent", vo);
    }


}
