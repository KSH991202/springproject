package com.study.board.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
// 쿼리를 가져다가 다시 결과를 받아오는 역할
public class UserDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public UserTblVO selectOneUser(UserTblVO vo)throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUser", vo);

      
    }

    public UserTblVO selectOneUserExist(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUserExist", vo);

    }

    public UserTblVO selectOneUserEmail(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUserEmail", vo);

    }
    public int insertOneUser(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("insertOneUser", vo);
    }
}
