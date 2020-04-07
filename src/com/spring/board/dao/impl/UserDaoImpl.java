package com.spring.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.UserDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVo idCheck(String userId) throws Exception {
		return sqlSession.selectOne("user.idCheck", userId);
	}

	@Override
	public int join(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.join", userVo);
	}

	@Override
	public UserVo login(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.login", userVo);
	}

}
