package com.study.board.mbbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MbbsDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int selectMbbsRowCount() throws Exception
    {
        return sqlSessionTemplate.selectOne("selectMbbsRowCount");
    }

    public List<MbbsTblVO> selectMbbsList(MbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectMbbsList", vo);

    }

    public MbbsTblVO selectMbbsContent(MbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectMbbsContent", vo);
    }
    

    public int updateMbbsContent(MbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateMbbsContent", vo);
    }

    public int insertMbbsContent(MbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertMbbsContent", vo);
    }

    public int deleteMbbsContent(MbbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.delete("deleteMbbsContent", vo);
    }


}
